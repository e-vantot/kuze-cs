using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace kuze
{
    public partial class ProductPage : System.Web.UI.Page
    {
        private string connectionString = "Server=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\62895\\Source\\Repos\\kuzefinal\\App_Data\\KuzeDB.mdf;Trusted_Connection=True;";

        protected decimal totalPrice = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string selectedCategory = Request.QueryString["category"]; // Get selected category from query string
                BindProductData(selectedCategory);
            }
        }

        protected void BindProductData(string category)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Product";

                if (!string.IsNullOrEmpty(category))
                {
                    query += " WHERE Category = @Category";
                }

                SqlDataAdapter adapter = new SqlDataAdapter(query, connection);

                if (!string.IsNullOrEmpty(category))
                {
                    adapter.SelectCommand.Parameters.AddWithValue("@Category", category);
                }

                DataTable productTable = new DataTable();
                adapter.Fill(productTable);

                productRepeater.DataSource = productTable;
                productRepeater.DataBind();
            }
        }

        protected void productRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView rowView = e.Item.DataItem as DataRowView;
                if (rowView != null)
                {
                    string productName = rowView["Name"].ToString();
                    decimal productPrice = Convert.ToDecimal(rowView["Price"]);

                    // Find controls in the Repeater item
                    Label nameLabel = e.Item.FindControl("product-name-label") as Label;
                    Label priceLabel = e.Item.FindControl("product-price-label") as Label;

                    // Check if the controls were found
                    if (nameLabel != null && priceLabel != null)
                    {
                        // Set the values of the labels
                        nameLabel.Text = productName;
                        priceLabel.Text = productPrice.ToString("C");
                    }
                }
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
                cartID = InsertNewCartAndGetID(); // You need to implement this method

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

        protected void addToCartButton_Click(object sender, EventArgs e)
        {
            Button addButton = (Button)sender;
            int productID = Convert.ToInt32(addButton.CommandArgument);

            // Find the corresponding quantity dropdown in the Repeater item
            RepeaterItem repeaterItem = (RepeaterItem)addButton.NamingContainer;
            DropDownList quantityDropdown = repeaterItem.FindControl("quantityDropdown") as DropDownList;
            int quantity = Convert.ToInt32(quantityDropdown.SelectedValue);

            // Add the item to the cart in the database
            AddToCart(productID, quantity);

            // Optionally, you can redirect to the shopping cart page after adding to cart
            Response.Redirect("ShoppingCart.aspx");
        }

        private void AddToCart(int productID, int quantity)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string cartID = GetOrCreateCartID(); // Get or create the cart ID

                string query = "INSERT INTO CartItem (ProductID, Quantity, CartID) VALUES (@ProductID, @Quantity, @CartID)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ProductID", productID);
                    command.Parameters.AddWithValue("@Quantity", quantity);
                    command.Parameters.AddWithValue("@CartID", cartID);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}