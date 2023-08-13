using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


namespace kuze
{
    public partial class HistoryPage : System.Web.UI.Page
    {
        private string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KuzeDB.mdf;Integrated Security=True";

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
                    lblMessage.Visible = true; // Display a message indicating the user is not logged in
                    rptOrders.Visible = false; // Hide the Repeater control when the user is not logged in
                    lblNoOrdersFound.Visible = false; // Hide the "No orders found" message label
                }
            }
        }

        private DataTable GetOrdersByUserID(int userID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Fetch orders data
                string ordersQuery = "SELECT * FROM [Order] WHERE UserID = @UserID";
                using (SqlCommand ordersCommand = new SqlCommand(ordersQuery, connection))
                {
                    ordersCommand.Parameters.AddWithValue("@UserID", userID);

                    SqlDataAdapter adapter = new SqlDataAdapter(ordersCommand);
                    DataTable ordersTable = new DataTable();
                    adapter.Fill(ordersTable);

                    return ordersTable;
                }
            }
        }
    }
}