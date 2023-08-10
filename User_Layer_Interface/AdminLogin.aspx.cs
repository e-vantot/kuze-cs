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


        protected void SignInButton_Click(object sender, EventArgs e)
        {
            int AdminID = 0;
            // string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection("Server=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\incen\\source\\repos\\kuze-ass2product\\App_Data\\KuzeDB.mdf;Trusted_Connection=True;"))
            {
                using (SqlCommand cmd = new SqlCommand("Validate_Admin"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    cmd.Connection = con;
                    con.Open();
                    AdminID = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
                switch (AdminID)
                {
                    case -1:
                        lblErrorMessage.Text = "Incorrect password";
                        lblErrorMessage.Visible = true;
                        break;
                    case -2:
                        lblErrorMessage.Text = "User does not exist. Please register.";
                        lblErrorMessage.Visible = true;
                        break;
                    default:
                        Session["AdminID"] = AdminID; // Store the admin ID in a session variable for future use
                        Response.Redirect("ItemManagementPage.aspx");
                        break;
                }
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
        }*/
    }
}
