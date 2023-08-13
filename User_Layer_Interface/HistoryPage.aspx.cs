using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


namespace kuze
{
    public partial class HistoryPage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    int userID = Convert.ToInt32(Session["UserID"]);

                    // Query the database to retrieve orders for the current user
                    DataTable ordersTable = GetOrdersByUserID(userID);

                    if (ordersTable.Rows.Count > 0)
                    {
                        rptOrders.DataSource = ordersTable; // rptOrders is the ID of your Repeater control
                        rptOrders.DataBind();
                        lblNoOrdersFound.Visible = false; // Hide the "No orders found" message label
                    }
                    else
                    {
                        rptOrders.Visible = false; // Hide the Repeater control when no orders are found
                        lblNoOrdersFound.Visible = true; // Show the "No orders found" message label
                    }
                }
                else
                {
                    lblMessage.Text = "Please log in to view your orders."; // Display a message indicating the user is not logged in
                    rptOrders.Visible = false; // Hide the Repeater control when the user is not logged in
                    lblNoOrdersFound.Visible = false; // Hide the "No orders found" message label
                }
            }
        }

        private DataTable GetOrdersByUserID(int userID)
        {
            DataTable ordersTable = new DataTable();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Order] WHERE UserID = @UserID", con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    con.Open();

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ordersTable);
                    }
                }
            }

            return ordersTable;
        }
    }
}