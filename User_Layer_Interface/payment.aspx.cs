using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using INFT3050.PaymentSystem;
using kuze;

namespace kuze
{
    public partial class Payment : System.Web.UI.Page
    {

        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KuzeDB.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TotalCartPrice"] == null || Session["TotalCartItems"] == null)
            {
                // Handle the case when the session data is not available.
                // Perhaps redirect back to the cart page or show an error message.
                Response.Redirect("ShoppingCart.aspx", false);
            }
            else
            {
                lblTotalItems.Text = $"{Session["TotalCartItems"]} items";
                decimal totalAmount = (decimal)Session["TotalCartPrice"];
                lblProductTotal.Text = $"${totalAmount}";
                lblTotalPrice.Text = $"${totalAmount}";
            }
        }

        protected void btnSubmitPayment_Click(object sender, EventArgs e)
        {
            try
            {
                // Form validation
                if (string.IsNullOrEmpty(nameInput.Text) || string.IsNullOrEmpty(addressInput.Text) ||
                    string.IsNullOrEmpty(zipcodeInput.Text) || string.IsNullOrEmpty(cardholderNameInput.Text) ||
                    string.IsNullOrEmpty(cardNumberInput.Text) || string.IsNullOrEmpty(expiryDateInput.Text) ||
                    string.IsNullOrEmpty(cvvInput.Text) || string.IsNullOrEmpty(shippingInput.SelectedValue))
                {
                    lblErrorMessage.Text = "Please fill in all fields.";
                    lblErrorMessage.Visible = true;
                    return;
                }

                int userId = (int)Session["UserID"];
                string customerName = nameInput.Text;
                string address = addressInput.Text;
                string zipCode = zipcodeInput.Text;
                string shipping = shippingInput.SelectedValue;

                // Retrieve total amount and number of items from session
                decimal totalAmount = (decimal)Session["TotalCartPrice"];
                string items = $"{Session["TotalCartItems"]} items"; // You can format this string as per your requirements


                // Retrieve form input using FindControl method to get the controls by their ID
                string cardName = (FindControl("cardholderNameInput") as TextBox)?.Text;
                string cardNumber = (FindControl("cardNumberInput") as TextBox)?.Text;
                string expiryDate = (FindControl("expiryDateInput") as TextBox)?.Text;

                int cvc;
                if (!int.TryParse((FindControl("cvvInput") as TextBox)?.Text, out cvc))
                {
                    // Handle cvc parsing error
                    Response.Redirect("errorPage.aspx?msg=Failed to parse CVC.", false);
                    return;
                }

                //decimal amount;
                //if (!decimal.TryParse((FindControl("amount-hidden-input") as TextBox)?.Text, out amount))
                //{
                //    // Handle amount parsing error
                //    Response.Redirect("errorPage.aspx?msg=Failed to parse payment amount.", false);
                //    return;
                //}

                DateTime expiry;
                if (!DateTime.TryParseExact(expiryDate, "MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out expiry))
                {
                    // Handle date parsing error
                    Response.Redirect("errorPage.aspx?msg=Failed to parse expiry date.", false);
                    return;
                }

                // Assume you have CartID in session, similar to your ShoppingCart page
                string cartID = Session["CartID"].ToString();

                ShoppingCart shoppingCart = new ShoppingCart();
                System.Diagnostics.Debug.WriteLine($"Total Amount: {totalAmount}");


                // Create payment system and request
                IPaymentSystem paymentSystem = INFT3050PaymentFactory.Create();
                PaymentRequest payment = new PaymentRequest
                {
                    CardName = cardName,
                    CardNumber = cardNumber,
                    CVC = cvc,
                    Expiry = expiry,
                    Amount = totalAmount,
                    Description = "Order Payment"
                };
                lblErrorMessage.Visible = false;
                // Make payment
                var task = paymentSystem.MakePayment(payment);
                task.Wait();

                // Check payment result

                if (task.Result.TransactionResult == TransactionResult.Approved)
                {
                    int? paymentID = SavePaymentToDatabase(customerName, address, zipCode, shipping, totalAmount, items);
                    SaveOrderToDatabase(userId, shipping, totalAmount, items, "Delivering");
                    if (paymentID.HasValue)
                    {
                        Session["PaymentID"] = paymentID.Value;
                    }
                    else
                    {
                        // Handle error: Failed to retrieve PaymentID.
                        Response.Redirect($"errorPage.aspx?msg=Failed to retrieve PaymentID.", false);
                        return;
                    }

                    // Redirect to success page
                    Response.Redirect("paymentSuccessful.aspx", false);

                    ClearShoppingCartSession();
                }
                else
                {
                    // Redirect to unsuccessful page with reason
                    Response.Redirect($"paymentUnsuccessful.aspx?reason={task.Result.TransactionResult}", false);

                    SaveOrderToDatabase(userId, shipping, totalAmount, items, "Cancelled");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                Response.Redirect($"errorPage.aspx?msg={HttpUtility.UrlEncode(ex.Message)}", false);
            }
        }

        private void ClearShoppingCartSession()
        {
            Session.Remove("CartID");
            Session.Remove("TotalCartPrice");
            Session.Remove("TotalCartItems");
        }
        private int? SavePaymentToDatabase(string name, string address, string zip, string shipping, decimal total, string items)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("INSERT INTO payment (CustomerName, Address, ZipCode, Shipping, TotalAmount, OrderDate, Items) OUTPUT INSERTED.PaymentID VALUES (@name, @address, @zip, @shipping, @total, @date, @items)", connection))
                {
                    command.Parameters.AddWithValue("@name", name);
                    command.Parameters.AddWithValue("@address", address);
                    command.Parameters.AddWithValue("@zip", zip);
                    command.Parameters.AddWithValue("@shipping", shipping);
                    command.Parameters.AddWithValue("@total", total);
                    command.Parameters.AddWithValue("@date", DateTime.Now);
                    command.Parameters.AddWithValue("@items", items);

                    object result = command.ExecuteScalar();
                    if (result != null && int.TryParse(result.ToString(), out int paymentID))
                    {
                        return paymentID;
                    }
                    else
                    {
                        return null;
                    }
                }
            }
        }

        private void SaveOrderToDatabase(int userId, string shipping, decimal total, string items, string status)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("INSERT INTO [Order] (UserID, Shipping, TotalAmount, Items, Status, Date) OUTPUT INSERTED.OrderID VALUES (@userId, @shipping, @total, @items, @status, @date)", connection))
                {
                    command.Parameters.AddWithValue("@userId", userId);
                    command.Parameters.AddWithValue("@shipping", shipping);
                    command.Parameters.AddWithValue("@total", total);
                    command.Parameters.AddWithValue("@status", status);
                    command.Parameters.AddWithValue("@date", DateTime.Now);
                    command.Parameters.AddWithValue("@items", items);

                    int orderId = (int)command.ExecuteScalar();
                    // You can use the orderId as needed
                }
            }
        }

    }
}
