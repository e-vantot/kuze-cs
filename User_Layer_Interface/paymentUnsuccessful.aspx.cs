using INFT3050.PaymentSystem;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kuze
{
    public partial class PaymentUnsuccessful : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string reason = Request.QueryString["reason"];
                if (!string.IsNullOrEmpty(reason))
                {
                    switch (reason)
                    {
                        case nameof(TransactionResult.InvalidCard):
                            lblErrorMessage.Text = "The provided card details are invalid.";
                            break;

                        case nameof(TransactionResult.Declined):
                            lblErrorMessage.Text = "The transaction was declined. Please ensure you have sufficient funds.";
                            break;

                        case nameof(TransactionResult.ConnectionFailure):
                            lblErrorMessage.Text = "There was a connection failure. Please try again later.";
                            break;

                        case nameof(TransactionResult.InvalidExpiry):
                            lblErrorMessage.Text = "The card has an invalid expiry date.";
                            break;

                        default:
                            lblErrorMessage.Text = "An unknown error occurred.";
                            break;
                    }
                }
                else
                {
                    lblErrorMessage.Text = "Payment was unsuccessful.";
                }
            }
        }
    }
}