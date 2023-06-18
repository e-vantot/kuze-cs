using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kuze
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the admin is already logged in
                if (Session["UserID"] != null)
                {
                    // Redirect to the admin dashboard or desired page
                    Response.Redirect("IMainPage.aspx");
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
                Session["UserID"] = 123;

                // Show the admin mode modal
                userModeModal.Visible = true;
                userModeModal.Style.Add("display", "block");
            }
            else
            {
                // Display an error message or perform other actions for failed login
            }
        }

        protected void okayButton_Click(object sender, EventArgs e)
        {
            // Redirect to the admin dashboard or desired page
            Response.Redirect("MainPage.aspx");
        }
    }
}