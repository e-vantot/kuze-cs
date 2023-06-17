using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kuze
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the admin is already logged in
                if (Session["AdminID"] != null)
                {
                    // Redirect to the admin dashboard or desired page
                    Response.Redirect("ItemManagementPage.aspx");
                }
            }
        }

        protected void signInButtonClick(object sender, EventArgs e)
        {
            // Perform admin authentication here
            string emailText = email.Text;
            string passwordText = password.Text;

            if (emailText != "" && passwordText != "")
            {
                // Set the admin ID in the session
                Session["AdminID"] = 123;

                // Show the admin mode modal
                adminModeModal.Visible = true;
                adminModeModal.Style.Add("display", "block");
            }
            else
            {
                // Display an error message or perform other actions for failed login
            }
        }

        protected void okayButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemManagementPage.aspx");
        }
    }
}
