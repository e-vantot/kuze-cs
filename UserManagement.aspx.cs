using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kuze
{
    public partial class UserManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                    editStatus.SelectedValue = Session["AddedAccountType"].ToString();
                }

                if (Session["EditedUsername"] != null)
                {
                    editUsername.Text = Session["EditedUsername"].ToString();
                }

                if (Session["EditedEmail"] != null)
                {
                    editEmail.Text = Session["EditedEmail"].ToString();
                }

                if (Session["EditedAddress"] != null)
                {
                    editAddress.Text = Session["EditedAddress"].ToString();
                }

                if (Session["EditedStatus"] != null)
                {
                    editStatus.SelectedValue = Session["EditedStatus"].ToString();
                }

                if (Session["EditedAccountType"] != null)
                {
                    editStatus.SelectedValue = Session["EditedAccountType"].ToString();
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

            addUserModal.Style.Add("display", "none");
            addUserModal.Visible = false;
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

            if (Session["EditedAddress"] != null)
            {
                editAddress.Text = Session["EditedAddress"].ToString();
            }

            if (Session["EditedStatus"] != null)
            {
                editStatus.SelectedValue = Session["EditedStatus"].ToString();
            }

            if (Session["EditedAccountType"] != null)
            {
                editAccountType.SelectedValue = Session["EditedAccountType"].ToString();
            }

            editUserModal.Style.Add("display", "block");
            editUserModal.Visible = true;
        }

        protected void closeEditUserModal(object sender, EventArgs e)
        {
            // Retrieve the values entered by the user
            string username = editUsername.Text;
            string email = editEmail.Text;
            string address = editAddress.Text;
            string status = editStatus.SelectedValue;
            string accountType = editAccountType.SelectedValue;

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
            //Perform update 
        }


        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            deleteUserModal.Style.Add("display", "block");
            deleteUserModal.Visible = true;
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            deleteUserModal.Style.Add("display", "none");
            deleteUserModal.Visible = false;
        }

        protected void ConfirmButton_Click(object sender, EventArgs e)
        {
            // Confirm button click logic
        }
    }
}
