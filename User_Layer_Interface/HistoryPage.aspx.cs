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
                BindOrderHistory();
            }
        }

        private void BindOrderHistory()
        {
            DataTable dt = GetDataFromDatabase(); // Replace with actual data retrieval code

            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
        private DataTable GetDataFromDatabase()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT OrderID, [Date], [Status] FROM [Order] ORDER BY [OrderDate] DESC";

                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();

                    connection.Open();
                    adapter.Fill(dt);
                    connection.Close();

                    return dt; // Return the DataTable
                }
            }
            catch (Exception )
            {
                // Log or display the exception message
                // ex.Message will give you more information about the error
                return null; // Or handle the situation based on your application's logic
            }
        }
    }
}