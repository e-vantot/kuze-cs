using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kuze
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        public List<CartItem> CartItems { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            CartItems = (List<CartItem>)Session["CartItems"];

            if (CartItems == null || CartItems.Count == 0)
            {
                // Redirect to the product page if the cart is empty.
                Response.Redirect("ProductPage.aspx");
            }
        }

        protected void Checkout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
    }
}