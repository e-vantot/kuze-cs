using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Security;
using System.Security.Cryptography;
using System.Text;

namespace kuze
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        int UserID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (!IsPostBack)
            {
                // Retrieve the "RegistrationData_Name" cookie
                HttpCookie nameCookie = Request.Cookies["RegistrationData_Name"];
                // Retrieve the "RegistrationData_Email" cookie
                HttpCookie emailCookie = Request.Cookies["RegistrationData_Email"];

                // Populate the name TextBox with the value from the cookie, if it exists
                txtUsername.Text = nameCookie?.Value;
                // Populate the email TextBox with the value from the cookie, if it exists
                txtEmail.Text = emailCookie?.Value;
            }*/
        }

        /*protected void signUpButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Set the expiry time for the cookies (5 minutes from now)
                DateTime expiry = DateTime.Now.AddMinutes(5);
                // Set the "RegistrationData_Name" cookie with the value from the name TextBox
                SetCookie("RegistrationData_Name", username.Text, expiry);
                // Set the "RegistrationData_Email" cookie with the value from the email TextBox
                SetCookie("RegistrationData_Email", email.Text, expiry);
            }
            // Redirect to the VerificationPage.aspx
            Response.Redirect("VerificationPage.aspx");
        }*/

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            UserID = 0;
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KuzeDB.mdf;Integrated Security=True"))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_User"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", encryption(txtPassword.Text.Trim()));
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@PhoneNumber", txtContact.Text.Trim());
                        cmd.Connection = con;
                        con.Open();
                        UserID = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                }
                string message = string.Empty;
                switch (UserID)
                {
                    case -1:
                        message = "Username already exists.\\nPlease choose a different username.";
                        break;
                    case -2:
                        message = "Supplied email address has already been used.";
                        break;
                    case -3:
                        message = "Supplied phone number has already been used.";
                        break;
                    default:
                        message = "Registration successful. Please log-in.";
                        Response.Redirect("UserLogin.aspx");
                        // SendActivationEmail(userId);
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
            }
        }

        public string encryption(String password)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] encrypt;
            UTF8Encoding encode = new UTF8Encoding();
            //encrypt the given password string into Encrypted data  
            encrypt = md5.ComputeHash(encode.GetBytes(password));
            StringBuilder encryptdata = new StringBuilder();
            //Create a new string by using the encrypted data  
            for (int i = 0; i < encrypt.Length; i++)
            {
                encryptdata.Append(encrypt[i].ToString());
            }
            return encryptdata.ToString();
        }
        /*private void SetCookie(string name, string value, DateTime expiry)
        {
            // Create a new HttpCookie instance with the specified name and value
            HttpCookie cookie = new HttpCookie(name, value);
            // Set the expiry time for the cookie
            cookie.Expires = expiry;
            // Add the cookie to the response
            Response.Cookies.Add(cookie);
        }*/
    }
}