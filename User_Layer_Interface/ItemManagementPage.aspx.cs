using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kuze
{
    public partial class ItemManagementPage : System.Web.UI.Page
    {
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KuzeDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

            // Check if the page is loaded for the first time (not a postback)
            if (!IsPostBack)
            {

                // Check if the admin is not logged in
                if (Session["AdminID"] == null)
                {
                    // Redirect to the admin login page or another unauthorized page
                    Response.Redirect("AdminLogin.aspx");
                }
                // Other page initialization code
                BindCategories();
                BindProductGrid();

                // Retrieve the session data
                string editedProductName = Session["EditedProductName"] as string;
                string editedProductDescription = Session["EditedProductDescription"] as string;
                string editedProductPrice = Session["EditedProductPrice"] as string;


                string addedProductName = Session["AddedProductName"] as string;
                string addedProductDescription = Session["AddedProductDescription"] as string;
                string addedProductPrice = Session["AddedProductPrice"] as string;


                // Check if the session data exists and fill the text fields accordingly
                if (!string.IsNullOrEmpty(editedProductName))
                {
                    productName.Text = editedProductName;
                }


                if (!string.IsNullOrEmpty(editedProductDescription))
                {
                    productDescription.Text = editedProductDescription;
                }


                if (!string.IsNullOrEmpty(editedProductPrice))
                {
                    productPrice.Text = editedProductPrice;
                }



                if (!string.IsNullOrEmpty(addedProductName))
                    tbAddName.Text = addedProductName;

                if (!string.IsNullOrEmpty(addedProductDescription))
                    tbAddDescription.Text = addedProductDescription;

                if (!string.IsNullOrEmpty(addedProductPrice))
                    tbAddPrice.Text = addedProductPrice;
            }
        }

        private void BindCategories()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT Category FROM Product", con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    categoryRepeater.DataSource = reader;
                    categoryRepeater.DataBind();
                }
            }
        }

        protected void categoryRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                string selectedCategory = e.CommandArgument.ToString();
                title.InnerText = selectedCategory;
                DataTable productsByCategory = GetProductsByCategory(selectedCategory);

                productGridView.DataSource = productsByCategory;
                productGridView.DataBind();
            }
        }

        private DataTable GetAllProductsFromDatabase()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM Product";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);
                        return dataTable;
                    }
                }
            }
        }

        protected void allLinkButton_Click(object sender, EventArgs e)
        {
            DataTable allProducts = GetAllProductsFromDatabase();

            productGridView.DataSource = allProducts;
            productGridView.DataBind();
        }


        private DataTable GetProductsByCategory(string category)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT * FROM Product WHERE Category = @Category";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Category", category);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);
                        return dataTable;
                    }
                }
            }
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            // Register JavaScript code on the client side
            string script = @"
                document.querySelector('.hamburger-container').addEventListener('click', function () {
                    document.querySelector('.menu').classList.toggle('active');
                });
            ";

            ScriptManager.RegisterStartupScript(this, GetType(), "ItemManagementScript", script, true);
        }

        protected void BindProductGrid()
        {
            string query = "SELECT ProductID, Name, Description, Price, Size, Colour, QuantityInStock, ImageUrl,Category FROM [dbo].[Product]";
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    dt.Load(reader);
                    reader.Close();
                }
            }

            productGridView.DataSource = dt;
            productGridView.DataBind();
        }

        private int GetProductIDFromSender(object sender)
        {
            if (sender is Button btn)
            {
                GridViewRow row = btn.NamingContainer as GridViewRow;
                if (row != null)
                {
                    // Check if the CommandArgument is a valid integer before parsing
                    if (int.TryParse(productGridView.DataKeys[row.RowIndex].Value.ToString(), out int productID))
                    {
                        return productID;
                    }
                }
            }

            return 0; // Return a default value or handle error as per your requirement
        }


        private void PopulateEditModalFields(int productID)
        {
            // Retrieve the product information from the database based on the ProductID
            // Query the database using a parameterized query to prevent SQL injection
            string query = "SELECT ProductID, Name, Description, Price, Size, Colour, QuantityInStock, ImageUrl,Category FROM [dbo].[Product] WHERE ProductID=@ProductID";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Populate the edit modal fields with the retrieved data
                        productName.Text = reader["Name"].ToString();
                        productDescription.Text = reader["Description"].ToString();
                        productPrice.Text = reader["Price"].ToString();
                        productSize.Text = reader["Size"].ToString();
                        productColour.Text = reader["Colour"].ToString();
                        productQuantity.Text = reader["QuantityInStock"].ToString();
                        productCategory.Text = reader["Category"].ToString();

                        // Set the product image URL
                        string imageUrl = reader["ImageUrl"].ToString();
                        editImage.ImageUrl = string.IsNullOrEmpty(imageUrl) ? "~/Images/cloth.jpg" : imageUrl;
                    }

                    reader.Close();
                }
            }
        }

        protected void productGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditProduct" || e.CommandName == "DeleteProduct")
            {
                if (int.TryParse(e.CommandArgument.ToString(), out int productID))
                {
                    if (e.CommandName == "EditProduct")
                    {
                        hfEditedProductID.Value = productID.ToString();
                        PopulateEditModalFields(productID);
                        editModal.Style.Add("display", "flex");
                    }
                    else if (e.CommandName == "DeleteProduct")
                    {
                        using (SqlConnection con = new SqlConnection(connectionString))
                        {
                            try
                            {
                                con.Open();
                                Console.WriteLine(productID);

                                // Delete the product from the database using a parameterized query to prevent SQL injection
                                string query = "DELETE FROM Product WHERE ProductID=@ProductID";
                                SqlCommand cmd = new SqlCommand(query, con);
                                cmd.Parameters.AddWithValue("@ProductID", productID);

                                int rowsAffected = cmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    // Product deleted successfully, refresh the GridView
                                    BindProductGrid();
                                }
                                else
                                {
                                    // No rows were affected, handle this case (e.g., display a message or log the error).

                                }
                            }
                            catch (Exception ex)
                            {

                                Console.WriteLine(ex.Message);
                            }
                        }
                    }
                }
            }
        }

        protected void closeDeleteModal(object sender, EventArgs e)
        {
            deleteModal.Style.Add("display", "none");
        }

        protected void openDeleteModal(object sender, EventArgs e)
        {
            deleteModal.Style.Add("display", "block");
        }

        protected void deleteProduct_Click(object sender, EventArgs e)
        {
            int productID = GetProductIDFromSender(sender);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("DeleteProductById", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ProductID", productID);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Product deleted successfully, refresh the GridView
                            BindProductGrid();
                        }
                        else
                        {
                        }
                    }
                }
                catch (SqlException ex)
                {
                    Console.WriteLine(ex.Message);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }
        protected void saveButton_Click(object sender, EventArgs e)
        {
            // Get the ProductID from the hidden field
            if (int.TryParse(hfEditedProductID.Value, out int productID))
            {
                string editedProductName = productName.Text;
                string editedProductDescription = productDescription.Text;
                string editedProductPrice = productPrice.Text;
                string editedProductSize = productSize.Text;
                string editedProductColour = productColour.Text;
                int editedProductQuantity = 0; // Default value of 0 for quantity in stock
                string editedProductCategory = productCategory.Text;

                // Validate the Price field
                if (!decimal.TryParse(editedProductPrice, out decimal price))
                {
                    // Show an error message or handle the invalid price input.
                    // errorMessage.Text = "Invalid price format.";
                    return;
                }

                // Validate the Quantity field
                if (!int.TryParse(productQuantity.Text, out editedProductQuantity) || editedProductQuantity < 0)
                {
                    // Show an error message or handle the invalid quantity input.
                    // errorMessage.Text = "Invalid quantity format.";
                    return;
                }

                // Check if a new image is uploaded
                string imageUrl = editImage.ImageUrl;
                if (productImage.HasFile)
                {
                    // Save the uploaded image
                    string uploadFolder = Server.MapPath("~/Images/");
                    string imageName = Guid.NewGuid().ToString() + Path.GetExtension(productImage.FileName);
                    string imagePath = Path.Combine(uploadFolder, imageName);
                    productImage.SaveAs(imagePath);

                    // Update the image URL
                    imageUrl = "~/Images/" + imageName;
                }

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    try
                    {
                        con.Open();

                        // Create a SqlCommand object for the stored procedure
                        using (SqlCommand cmd = new SqlCommand("UpdateProductById", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;

                            // Add parameters for the stored procedure
                            cmd.Parameters.AddWithValue("@ProductID", productID);
                            cmd.Parameters.AddWithValue("@Name", editedProductName);
                            cmd.Parameters.AddWithValue("@Description", editedProductDescription);
                            cmd.Parameters.AddWithValue("@Price", price); // Use the parsed price value
                            cmd.Parameters.AddWithValue("@Size", editedProductSize);
                            cmd.Parameters.AddWithValue("@Colour", editedProductColour);
                            cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);
                            cmd.Parameters.AddWithValue("@QuantityInStock", editedProductQuantity);
                            cmd.Parameters.AddWithValue("@Category", editedProductCategory);

                            // Execute the stored procedure
                            cmd.ExecuteNonQuery();

                            // Redirect to the same page after updating
                            Response.Redirect(Request.RawUrl);
                        }
                    }
                    catch (SqlException ex)
                    {
                        // Handle SQL Server exceptions
                        // Display the SQL exception message for debugging purposes.
                        Console.WriteLine(ex.Message);
                        // errorMessage.Text = "An error occurred while executing the database operation: " + ex.Message;
                    }
                    catch (Exception ex)
                    {
                        // Handle other exceptions
                        // For simplicity, you can display an error message on the page.
                        // errorMessage.Text = "An error occurred while updating the product: " + ex.Message;
                        Console.WriteLine(ex.Message);
                    }
                }

                // Close the modal (optional)
                editModal.Style["display"] = "none";
            }
            else
            {
                // Handle the case when the ProductID is not a valid integer
            }
        }

        protected void openEditModal(object sender, EventArgs e)
        {
            // Get the ProductID from the selected row
            int productID = GetProductIDFromSender(sender);

            // Store the ProductID in a hidden field or session variable to access it in the saveButton_Click method
            hfEditedProductID.Value = productID.ToString();

            // Retrieve the product information based on the ProductID and populate the edit modal fields
            PopulateEditModalFields(productID);

            editModal.Style.Add("display", "flex");
        }


        protected void closeEditModal(object sender, EventArgs e)
        {
            // Retrieve the values entered by the user
            string name = productName.Text;
            string description = productDescription.Text;
            string price = productPrice.Text;
            string size = productSize.Text; // Assuming the size field ID is productSize
            string colour = productColour.Text; // Assuming the colour field ID is productColour
            int quantityInStock = 0; // Initialize the quantityInStock
            string category = productCategory.Text;

            // Validate and parse the quantity in stock field
            if (int.TryParse(productQuantity.Text, out int parsedQuantityInStock))
            {
                quantityInStock = parsedQuantityInStock;
            }
            else
            {
                // If the quantity in stock is not a valid integer, handle the error as needed
                // For example, you can display an error message on the page.
                // errorMessage.Text = "Invalid quantity in stock format.";
                return;
            }

            // Store the values in session variables
            Session["EditedProductName"] = name;
            Session["EditedProductDescription"] = description;
            Session["EditedProductPrice"] = price;
            Session["EditedProductSize"] = size;
            Session["EditedProductColour"] = colour;
            Session["EditedProductQuantityInStock"] = quantityInStock;
            Session["EditedProductCategory"] = category;

            // Close the edit modal
            editModal.Style.Add("display", "none");
        }
        protected void closeAddModal(object sender, EventArgs e)
        {
            // Retrieve the values entered by the user
            string name = tbAddName.Text;
            string description = tbAddDescription.Text;
            string price = tbAddPrice.Text;
            string size = tbAddSize.Text; // Assuming the size field ID is tbAddSize
            string colour = tbAddColour.Text; // Assuming the colour field ID is tbAddColour
            string quantityInStock = tbAddQuantity.Text; // Assuming the quantity in stock field ID is tbAddQuantityInStock
            string category = tbAddCategory.Text;

            // Validate the Price field
            if (!decimal.TryParse(price, out decimal parsedPrice))
            {
                // Show an error message or handle the invalid price input.
                // errorMessage.Text = "Invalid price format.";
                return;
            }

            // Validate and parse the quantity in stock field
            if (!int.TryParse(quantityInStock, out int parsedQuantityInStock))
            {
                // Show an error message or handle the invalid quantity in stock input.
                // errorMessage.Text = "Invalid quantity in stock format.";
                return;
            }

            // Save the uploaded image file to the server (optional)
            string imageUrl = "";
            if (tbAddImage.HasFile)
            {
                string fileName = Path.GetFileName(tbAddImage.FileName);
                string imagePath = Server.MapPath("~/images/" + fileName);
                tbAddImage.SaveAs(imagePath);
                imageUrl = "~/images/" + fileName;
            }

            // Store the values in session variables
            Session["AddedProductName"] = name;
            Session["AddedProductDescription"] = description;
            Session["AddedProductPrice"] = parsedPrice;
            Session["AddedProductSize"] = size;
            Session["AddedProductColour"] = colour;
            Session["AddedProductQuantityInStock"] = parsedQuantityInStock;
            Session["AddedProductImageUrl"] = imageUrl; // Save the image URL in session
            Session["AddedProductCategory"] = category;

            // Close the modal (optional)
            addModal.Style["display"] = "none";
        }


        protected void openAddModal_Click(object sender, EventArgs e)
        {
            addModal.Style.Add("display", "flex");
        }
        protected void addButton_Click(object sender, EventArgs e)
        {
            // Code to handle add button click event and insert the new product into the database
            string addedProductName = tbAddName.Text;
            string addedProductDescription = tbAddDescription.Text;
            string addedProductPrice = tbAddPrice.Text;
            string addedProductSize = tbAddSize.Text;
            string addedProductColour = tbAddColour.Text;
            string addedProductQuantityInStock = tbAddQuantity.Text;
            string addedProductCategory = tbAddCategory.Text;

            // Validate the Price field
            if (!decimal.TryParse(addedProductPrice, out decimal price))
            {
                // Show an error message or handle the invalid price input.
                // errorMessage.Text = "Invalid price format.";
                return;
            }

            // Validate and parse the quantity in stock field
            if (!int.TryParse(addedProductQuantityInStock, out int parsedQuantityInStock))
            {
                // Show an error message or handle the invalid quantity in stock input.
                // errorMessage.Text = "Invalid quantity in stock format.";
                return;
            }

            // Save the uploaded image file to the server (optional)
            string imageUrl = "";
            if (tbAddImage.HasFile)
            {
                string fileName = Path.GetFileName(tbAddImage.FileName);
                string imagePath = Server.MapPath("~/Images/" + fileName);
                tbAddImage.SaveAs(imagePath);
                imageUrl = "~/Images/" + fileName;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    // Create a SqlCommand object for the stored procedure
                    using (SqlCommand cmd = new SqlCommand("InsertProduct", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Add parameters for the stored procedure
                        cmd.Parameters.AddWithValue("@Name", addedProductName);
                        cmd.Parameters.AddWithValue("@Description", addedProductDescription);
                        cmd.Parameters.AddWithValue("@Price", price); // Use the parsed price value
                        cmd.Parameters.AddWithValue("@Size", addedProductSize);
                        cmd.Parameters.AddWithValue("@Colour", addedProductColour);
                        cmd.Parameters.AddWithValue("@ImageUrl", imageUrl); // Save the image URL in the database
                        cmd.Parameters.AddWithValue("@QuantityInStock", parsedQuantityInStock);
                        cmd.Parameters.AddWithValue("@Category", addedProductCategory);

                        // Execute the stored procedure
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected != 0)
                        {
                            // Clear the session variables after adding the product
                            Session["AddedProductName"] = null;
                            Session["AddedProductDescription"] = null;
                            Session["AddedProductPrice"] = null;
                            Session["AddedProductSize"] = null;
                            Session["AddedProductColour"] = null;
                            Session["AddedProductQuantityInStock"] = null;
                            Session["AddedProductCategory"] = null;

                            Response.Redirect(Request.Url.AbsoluteUri);
                        }

                        // Rest of the code remains the same from the previous version

                        // ...
                    }
                }
                catch (SqlException ex)
                {
                    // Handle SQL Server exceptions
                    // Display the SQL exception message for debugging purposes.
                    Console.WriteLine(ex.Message);
                    // errorMessage.Text = "An error occurred while executing the database operation: " + ex.Message;
                }
                catch (Exception ex)
                {
                    // Handle other exceptions
                    // For simplicity, you can display an error message on the page.
                    // errorMessage.Text = "An error occurred while adding the new product: " + ex.Message;
                    Console.WriteLine(ex.Message);
                }
            }

            // Close the modal (optional)
            addModal.Style["display"] = "none";
        }
    }
}