using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace kuze
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        private string connectionString = "Server=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\CST\\Source\\Repos\\kuzebyekoism\\App_Data\\KuzeDB.mdf;Trusted_Connection=True;"; // Replace with your actual connection string
        public decimal TotalCartPrice { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateShoppingCart();
            }
        }

        private void PopulateShoppingCart()
        {
            string cartID = GetOrCreateCartID();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Fetch cart data
                string cartQuery = "SELECT * FROM Cart WHERE CartID = @CartID";
                using (SqlCommand cartCommand = new SqlCommand(cartQuery, connection))
                {
                    cartCommand.Parameters.AddWithValue("@CartID", cartID);

                    SqlDataReader cartReader = cartCommand.ExecuteReader();
                    if (cartReader.Read())
                    {
                        // Populate cart data to your UI controls, e.g., total price
                        decimal totalPrice = Convert.ToDecimal(cartReader["TotalPrice"]);
                        // Populate the total price label or other UI elements
                    }
                    cartReader.Close();
                }

                // Fetch cart items data
                string cartItemsQuery = "SELECT ci.*, p.Name AS ProductName, p.Price, p.ImageURL FROM CartItem ci INNER JOIN Product p ON ci.ProductID = p.ProductID WHERE ci.CartID = @CartID";
                using (SqlCommand cartItemsCommand = new SqlCommand(cartItemsQuery, connection))
                {
                    cartItemsCommand.Parameters.AddWithValue("@CartID", cartID);

                    SqlDataReader cartItemsReader = cartItemsCommand.ExecuteReader();
                    if (cartItemsReader.HasRows)
                    {
                        List<CartItem> cartItems = new List<CartItem>();

                        while (cartItemsReader.Read())
                        {
                            string productName = cartItemsReader["ProductName"].ToString();
                            decimal productPrice = Convert.ToDecimal(cartItemsReader["Price"]);
                            int quantity = Convert.ToInt32(cartItemsReader["Quantity"]);
                            string imageURL = cartItemsReader["ImageURL"].ToString();
                            decimal totalPrice = productPrice * quantity;

                            // Create a CartItem instance and add it to the list
                            CartItem cartItem = new CartItem(productName, productPrice, quantity, imageURL, totalPrice);
                            cartItems.Add(cartItem);
                        }

                        // Calculate the total price from cart items
                        decimal totalCartPrice = cartItems.Sum(item => item.TotalPrice);

                        // Update the total price in the Cart table
                        UpdateCartTotalPrice(cartID, totalCartPrice);

                        TotalCartPrice = totalCartPrice;

                        // Bind cart items to the Repeater
                        cartRepeater.DataSource = cartItems;
                        cartRepeater.DataBind();
                    }
                    cartItemsReader.Close();
                }

                connection.Close();
            }
        }

        private void UpdateCartTotalPrice(string cartID, decimal totalCartPrice)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string updateQuery = "UPDATE Cart SET TotalPrice = @TotalPrice WHERE CartID = @CartID";
                using (SqlCommand updateCommand = new SqlCommand(updateQuery, connection))
                {
                    updateCommand.Parameters.AddWithValue("@TotalPrice", totalCartPrice);
                    updateCommand.Parameters.AddWithValue("@CartID", cartID);

                    updateCommand.ExecuteNonQuery();
                }

                connection.Close();
            }
        }

        private string GetOrCreateCartID()
        {
            string cartID = "";

            if (Session["CartID"] != null)
            {
                cartID = Session["CartID"].ToString();
            }
            else
            {
                // Insert a new row into the Cart table to get the auto-generated cartID
                cartID = InsertNewCartAndGetID();

                // Store the cart ID in the session for future reference
                Session["CartID"] = cartID;
            }

            return cartID;
        }

        private string InsertNewCartAndGetID()
        {
            string newCartID = "";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Cart (TotalPrice) VALUES (0); SELECT SCOPE_IDENTITY()";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    newCartID = command.ExecuteScalar().ToString();
                }
            }

            return newCartID;
        }

        protected void btnStartShopping_Click(object sender, EventArgs e)
        {
            // Redirect the user to the ProductPage.aspx
            Response.Redirect("ProductPage.aspx");
        }


        // ... Other methods related to shopping cart functionality ...
    }
}