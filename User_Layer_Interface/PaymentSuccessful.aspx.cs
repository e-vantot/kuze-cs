using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using kuze;

namespace kuze
{
    public partial class PaymentSuccessful : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPaymentDetails();
            }
        }

        private void LoadPaymentDetails()
        {
            // Setting the current date
            lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy");

            // Retrieving payment ID from session and setting it to the Order label
            if (Session["PaymentID"] != null)
            {
                lblPaymentID.Text = Session["PaymentID"].ToString();
            }
            else
            {
                // Handle the case where PaymentID is not available in the session.
                // You might redirect the user to an error page or display an appropriate message.
                // For example:
                lblPaymentID.Text = "Not Available";
            }
        }
    }
}
