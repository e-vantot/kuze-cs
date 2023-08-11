using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kuze
{
    public partial class ContactUs : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Request.QueryString["submitted"] == "true")
            {
                // Display a success message if redirected from a successful submission
                successMessage.Visible = true; // Assumes you have an HTML element for displaying success message
            }
        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            if (IsValid) // Check if the form is valid
            {
                // Get the user input
                string Name = txtUsername.Text;
                string Email = txtEmail.Text;
                string Message = txtMessage.Text;

                // Save the contact form data to the database
                SaveContactFormToDatabase(Name, Email, Message);

                // Redirect to the same page with a success parameter
                Response.Redirect("ContactUs.aspx?submitted=true",false);
            }
        }

        private void SaveContactFormToDatabase(string Name, string Email, string Message)
        {
            using (SqlConnection con = new SqlConnection("Server=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\CST\\Source\\Repos\\kuzebyekoism\\App_Data\\KuzeDB.mdf;Trusted_Connection=True;"))
            {
                string insertQuery = "INSERT INTO Contact (Name, Email, Message) VALUES (@Name, @Email, @Message)";
                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Email", Email);
                    cmd.Parameters.AddWithValue("@Message", Message);

                    con.Open();

                    // Debug: Print out the values before executing the query
                    Response.Write($"Name: {Name}, Email: {Email}, Message: {Message}<br>");
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        // Generate the mailto URL with pre-filled email content
        //string emailTo = "hellokuze@kuze.com";
        //string emailSubject = $"Contact Form Submission from {name}";
        //string mailtoUrl = $"mailto:{emailTo}?subject={HttpUtility.UrlEncode(emailSubject)}&body={HttpUtility.UrlEncode(message)}";

        // Use JavaScript to open the email client with the pre-filled email
        //ClientScript.RegisterStartupScript(this.GetType(), "mailto", $"window.location.href = '{mailtoUrl}';", true);
    }

}