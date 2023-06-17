using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kuze
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the "RegistrationData_Name" cookie
                HttpCookie nameCookie = Request.Cookies["RegistrationData_Name"];
                // Retrieve the "RegistrationData_Email" cookie
                HttpCookie emailCookie = Request.Cookies["RegistrationData_Email"];

                // Populate the name TextBox with the value from the cookie, if it exists
                username.Text = nameCookie?.Value;
                // Populate the email TextBox with the value from the cookie, if it exists
                email.Text = emailCookie?.Value;
            }
        }

        protected void signUpButton_Click(object sender, EventArgs e)
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
        }

        private void SetCookie(string name, string value, DateTime expiry)
        {
            // Create a new HttpCookie instance with the specified name and value
            HttpCookie cookie = new HttpCookie(name, value);
            // Set the expiry time for the cookie
            cookie.Expires = expiry;
            // Add the cookie to the response
            Response.Cookies.Add(cookie);
        }
    }
}