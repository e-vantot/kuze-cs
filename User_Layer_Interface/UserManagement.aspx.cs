using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;

namespace kuze
{
    public partial class UserManagement : System.Web.UI.Page
    {
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\KuzeDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            var url = FriendlyUrl.Href("~/UserManagement");

            if (!IsPostBack)
            {
                // Check if the admin is not logged in
                if (Session["AdminID"] == null)
                {
                    // Redirect to the admin login page or another unauthorized page
                    Response.Redirect("AdminLogin.aspx");
                }

                BindUserGrid();
                if (Session["AddedUsername"] != null)
                {
                    username.Text = Session["AddedUsername"].ToString();
                }

                if (Session["AddedEmail"] != null)
                {
                    email.Text = Session["AddedEmail"].ToString();
                }

                if (Session["AddedAddress"] != null)
                {
                    address.Text = Session["AddedAddress"].ToString();
                }

                if (Session["AddedStatus"] != null)
                {
                    status.SelectedValue = Session["AddedStatus"].ToString();
                }

                if (Session["EditedUsername"] != null)
                {
                    editUsername.Text = Session["EditedUsername"].ToString();
                }

                if (Session["EditedEmail"] != null)
                {
                    editEmail.Text = Session["EditedEmail"].ToString();
                }

            }

        }

        protected void BindUserGrid()
        {
            string query = "SELECT UserID, Username, FirstName, LastName, Email, PhoneNumber, CreatedDate, LastLoginDate, isEmailVerified FROM Users";
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    dt.Load(reader);
                    reader.Close();
                }
            }

            userGridView.DataSource = dt;
            userGridView.DataBind();
        }



        private void PopulateEditModalFields(int userID)
        {
            // Replace "connectionString" with your actual database connection string
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Username, FirstName, LastName, Email, PhoneNumber FROM Users WHERE UserID = @UserID", con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            editUsername.Text = reader["Username"].ToString();
                            editFirstName.Text = reader["FirstName"].ToString();
                            editLastName.Text = reader["LastName"].ToString();
                            editEmail.Text = reader["Email"].ToString();
                            editPhoneNumber.Text = reader["PhoneNumber"].ToString();
                        }
                        else
                        {
                            Response.Write("User not found.");
                        }

                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error retrieving user data: " + ex.Message);
                    }
                }
            }
        }


        private int GetUserIDFromSender(object sender)
        {
            if (sender is Button btn)
            {
                GridViewRow row = btn.NamingContainer as GridViewRow;
                if (row != null)
                {
                    // Check if the CommandArgument is a valid integer before parsing
                    if (int.TryParse(userGridView.DataKeys[row.RowIndex].Value.ToString(), out int userID))
                    {
                        return userID;
                    }
                }
            }

            return 0;
        }


        protected void userGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditUser" || e.CommandName == "DeleteUser")
            {
                if (int.TryParse(e.CommandArgument.ToString(), out int userID))
                {
                    if (e.CommandName == "EditUser")
                    {
                        hfEditedUserID.Value = userID.ToString();
                        PopulateEditModalFields(userID);
                        editUserModal.Style.Add("display", "block");
                        editUserModal.Visible = true;
                    }
                    else if (e.CommandName == "DeleteUser")
                    {
                        using (SqlConnection con = new SqlConnection(connectionString))
                        {
                            try
                            {
                                con.Open();
                                Console.WriteLine(userID);

                                // Delete the user from the database using a parameterized query to prevent SQL injection
                                string query = "DELETE FROM Users WHERE UserID=@UserID";
                                SqlCommand cmd = new SqlCommand(query, con);
                                cmd.Parameters.AddWithValue("@UserID", userID);

                                int rowsAffected = cmd.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    BindUserGrid();
                                }

                            }
                            catch (Exception ex)
                            {
                                Response.Write(ex.Message);
                            }
                        }
                    }
                }
            }
        }



        protected void AddUserButton_Click(object sender, EventArgs e)
        {
            if (Session["AddedUsername"] != null)
            {
                username.Text = Session["AddedUsername"].ToString();
            }

            if (Session["AddedEmail"] != null)
            {
                email.Text = Session["AddedEmail"].ToString();
            }

            if (Session["AddedAddress"] != null)
            {
                address.Text = Session["AddedAddress"].ToString();
            }

            if (Session["AddedStatus"] != null)
            {
                status.SelectedValue = Session["AddedStatus"].ToString();
            }

            if (Session["AddedAccountType"] != null)
            {
                accountType.SelectedValue = Session["AddedAccountType"].ToString();
            }

            addUserModal.Style.Add("display", "block");
            addUserModal.Visible = true;
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            // Get the values from the input fields
            string username = this.username.Text;
            string firstName = this.firstName.Text;
            string lastName = this.lastName.Text;
            string email = this.email.Text;
            string password = "SomePassword";
            string phoneNumber = this.phoneNumber.Text;
            DateTime createdDate = DateTime.Now;
            DateTime lastLoginDate = DateTime.Now;
            bool isEmailVerified = false;


            int rowsAffected = 0;

            // Call the stored procedure to add the user
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("dbo.AddUser", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@FirstName", firstName);
                    command.Parameters.AddWithValue("@LastName", lastName);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    command.Parameters.AddWithValue("@CreatedDate", createdDate);
                    command.Parameters.AddWithValue("@LastLoginDate", lastLoginDate);
                    command.Parameters.AddWithValue("@IsEmailVerified", isEmailVerified);

                    // Execute the query
                    rowsAffected = command.ExecuteNonQuery();
                }
            }

            // Check if the user was successfully added before clearing the session variables and refreshing the page
            if (rowsAffected > 0)
            {
                // Clear the session variables used for prefilling the modal fields
                Session["AddedUsername"] = null;
                Session["AddedEmail"] = null;
                Session["AddedAddress"] = null;
                Session["AddedStatus"] = null;
                Session["AddedAccountType"] = null;
            }

            // Close the modal after adding the user
            addUserModal.Style.Add("display", "none");
            // Refresh the page
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void closeAddButton_Click(object sender, EventArgs e)
        {
            // Retrieve the values entered by the user
            string usernameTemp = username.Text;
            string emailTemp = email.Text;
            string addressTemp = address.Text;
            string statusTemp = status.SelectedValue;
            string accountTypeTemp = accountType.SelectedValue;

            // Store the values in session variables
            Session["AddedUsername"] = usernameTemp;
            Session["AddedEmail"] = emailTemp;
            Session["AddedAddress"] = addressTemp;
            Session["AddedStatus"] = statusTemp;
            Session["AddedAccountType"] = accountTypeTemp;

            // Close the modal (optional)
            addUserModal.Visible = false;
            addUserModal.Style.Add("display", "none");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            if (Session["EditedUsername"] != null)
            {
                editUsername.Text = Session["EditedUsername"].ToString();
            }

            if (Session["EditedEmail"] != null)
            {
                editEmail.Text = Session["EditedEmail"].ToString();
            }

            // Get the UserID from the sender button
            int userID = GetUserIDFromSender(sender);

            hfEditedUserID.Value = userID.ToString();

            // Populate the fields in the edit modal based on the UserID
            PopulateEditModalFields(userID);


            editUserModal.Style.Add("display", "block");
            editUserModal.Visible = true;
        }

        protected void closeEditUserModal(object sender, EventArgs e)
        {
            // Retrieve the values entered by the user
            string username = editUsername.Text;
            string email = editEmail.Text;

            // Store the values in session variables
            Session["EditedUsername"] = username;
            Session["EditedEmail"] = email;
            Session["EditedAddress"] = address;
            Session["EditedStatus"] = status;
            Session["EditedAccountType"] = accountType;

            // Close the modal (optional)
            editUserModal.Visible = false;
            editUserModal.Style.Add("display", "none");
        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            // Get the UserID from the hidden field
            if (int.TryParse(hfEditedUserID.Value, out int userID))
            {
                string editedUsername = editUsername.Text;
                string editedFirstName = editFirstName.Text;
                string editedLastName = editLastName.Text;
                string editedEmail = editEmail.Text;
                string editedPhoneNumber = editPhoneNumber.Text;


                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();

                        // Create a SqlCommand object for the stored procedure
                        using (SqlCommand cmd = new SqlCommand("dbo.EditUser", connection))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;

                            // Add parameters for the stored procedure
                            cmd.Parameters.AddWithValue("@UserID", userID);
                            cmd.Parameters.AddWithValue("@Username", editedUsername);
                            cmd.Parameters.AddWithValue("@FirstName", editedFirstName);
                            cmd.Parameters.AddWithValue("@LastName", editedLastName);
                            cmd.Parameters.AddWithValue("@Email", editedEmail);
                            cmd.Parameters.AddWithValue("@PhoneNumber", editedPhoneNumber);

                            // Execute the stored procedure
                            cmd.ExecuteNonQuery();

                            // Redirect to the same page after updating
                            Response.Redirect(Request.RawUrl);
                        }
                    }
                    catch (SqlException ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }

                // Close the modal (optional)
                editUserModal.Style.Add("display", "none");
                editUserModal.Visible = false;
            }
        }


        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            // Get the UserID from the DataKey of the GridView
            if (userGridView.SelectedDataKey != null && int.TryParse(userGridView.SelectedDataKey.Value.ToString(), out int userID))
            {
                // Store the UserID in a session variable to use it later for the confirmation
                Session["UserIDToDelete"] = userID;

                // Show the delete user modal
                deleteUserModal.Style.Add("display", "block");
                deleteUserModal.Visible = true;
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            deleteUserModal.Style.Add("display", "none");
            deleteUserModal.Visible = false;
        }

        protected void ConfirmButton_Click(object sender, EventArgs e)
        {
            if (Session["UserIDToDelete"] != null && int.TryParse(Session["UserIDToDelete"].ToString(), out int userID))
            {
                // Perform the delete operation for the user with the given UserID
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand("DELETE FROM Users WHERE UserID = @UserID", connection))
                    {
                        command.Parameters.AddWithValue("@UserID", userID);
                        command.ExecuteNonQuery();
                    }
                }

                // Close the delete user modal
                deleteUserModal.Style.Add("display", "none");
                deleteUserModal.Visible = false;

                // Refresh the gridview with updated data after deletion
                BindUserGrid();
            }
        }


    }
}