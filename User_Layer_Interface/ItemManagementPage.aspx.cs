using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kuze
{
    public partial class ItemManagementPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the session data
                string editedProductName = Session["EditedProductName"] as string;
                string editedProductDescription = Session["EditedProductDescription"] as string;
                string editedProductPrice = Session["EditedProductPrice"] as string;
                string editedProductPostage = Session["EditedProductPostage"] as string;

                string addedProductName = Session["AddedProductName"] as string;
                string addedProductDescription = Session["AddedProductDescription"] as string;
                string addedProductPrice = Session["AddedProductPrice"] as string;
                string addedProductPostage = Session["AddedProductPostage"] as string;

                // Check if the session data exists and fill the text fields accordingly
                if (!string.IsNullOrEmpty(editedProductName))
                {
                    productName.Text = editedProductName;
                }
                else
                {
                    // Set sample data for productName
                    productName.Text = "Sample Product Name";
                }

                if (!string.IsNullOrEmpty(editedProductDescription))
                {
                    productDescription.Text = editedProductDescription;
                }
                else
                {
                    // Set sample data for productDescription
                    productDescription.Text = "Sample Product Description";
                }

                if (!string.IsNullOrEmpty(editedProductPrice))
                {
                    productPrice.Text = editedProductPrice;
                }
                else
                {
                    // Set sample data for productPrice
                    productPrice.Text = "100";
                }

                if (!string.IsNullOrEmpty(editedProductPostage))
                {
                    productPostage.SelectedValue = editedProductPostage;
                }
                else
                {
                    // Set sample data for productPostage
                    productPostage.SelectedValue = "standard";
                }


                if (!string.IsNullOrEmpty(addedProductName))
                    tbAddName.Text = addedProductName;

                if (!string.IsNullOrEmpty(addedProductDescription))
                    tbAddDescription.Text = addedProductDescription;

                if (!string.IsNullOrEmpty(addedProductPrice))
                    tbAddPrice.Text = addedProductPrice;

                if (!string.IsNullOrEmpty(addedProductPostage))
                    DropDownList1.SelectedValue = addedProductPostage;


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

        protected void openAddModal_Click(object sender, EventArgs e)
        {
            addModal.Style.Add("display", "flex");

        }

        protected void deleteProduct_Click(object sender, EventArgs e)
        {
            // Delete the product

            Console.WriteLine("Product deleted!");
        }

        protected void closeDeleteModal(object sender, EventArgs e)
        {
            // Close the delete modal
            deleteModal.Style.Add("display", "none");
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            // Code to handle save button click event

        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            // Code to handle save button click event

        }

        protected void openDeleteModal(object sender, EventArgs e)
        {
            // Open the delete modal
            deleteModal.Style.Add("display", "block");
        }

        protected void openEditModal(object sender, EventArgs e)
        {
            editModal.Style.Add("display", "flex");

        }

        protected void closeEditModal(object sender, EventArgs e)
        {
            // Retrieve the values entered by the user
            string name = productName.Text;
            string description = productDescription.Text;
            string price = productPrice.Text;
            string postage = productPostage.SelectedValue;

            // Store the values in session variables
            Session["EditedProductName"] = name;
            Session["EditedProductDescription"] = description;
            Session["EditedProductPrice"] = price;
            Session["EditedProductPostage"] = postage;


            // Close the edit modal
            editModal.Style.Add("display", "none");
        }

        protected void closeAddModal(object sender, EventArgs e)
        {

            // Retrieve the values entered by the user
            string name = tbAddName.Text;
            string description = tbAddDescription.Text;
            string price = tbAddPrice.Text;
            string postage = DropDownList1.SelectedValue;

            // Store the values in session variables
            Session["AddedProductName"] = name;
            Session["AddedProductDescription"] = description;
            Session["AddedProductPrice"] = price;
            Session["AddedProductPostage"] = postage;

            // Close the modal (optional)
            addModal.Style["display"] = "none";
        }
    }
}