using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

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

        protected void SignInButtonClick(object sender, EventArgs e)
        {
            int UserID = 0;
            // string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection("Server=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\incen\\source\\repos\\kuze-ass1\\App_Data\\KuzeDB.mdf;Trusted_Connection=True;"))
            {
                using (SqlCommand cmd = new SqlCommand("Validate_User"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    cmd.Connection = con;
                    con.Open();
                    UserID = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
                string message = string.Empty;
                switch (UserID)
                {
                    case -1:
                        message = "Incorrect password.";
                        break;
                    case -2:
                        message = "User does not exist. Please register.";
                        break;
                    default:
                        Session["UserID"] = UserID; // Store the user ID in a session variable for future use
                        Response.Redirect("MainPage.aspx"); // Replace "HomePage.aspx" with the actual URL of your home page
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
            }
        }

        /*protected void signInButtonClick(object sender, EventArgs e)
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
        }*/
    }
}