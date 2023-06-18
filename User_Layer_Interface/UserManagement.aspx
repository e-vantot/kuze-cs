<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="kuze.UserManagement" %>

<!DOCTYPE html>
<html lang="en" runat="server">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Management Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" /> 
    <link rel="stylesheet" href="UserManagementStyles.css"/>
</head>

<body>
   <nav class="navbar">
        <div class="navbar-logo">
            <p>KUZE</p>
            <span> admin</span>
        </div>
        <div class="navbar-links">
            <ul class="navbar-list">
                <li><a href="ItemManagementPage.aspx">Item Management</a></li>
                <li><a href="UserManagement.aspx">User Management</a></li>
            </ul>
        </div>
    </nav>
    <form id="form2" runat="server">
        <header>
            <div class="banner-title">
                <p>kuzé by ekoism</p>
                <h1>User Management Page</h1>
            </div>
            <div class="circle"></div>
        </header>
        <div class="container">
            <h1 class="title">Users</h1>
            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>User Name</th>
                        <th>Date Applied</th>
                        <th>Status</th>
                        <th>Account Type</th> <!-- New column for account type -->
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>
                            <div class="profile-picture">
                                <img src="https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Image.png" alt="Profile Picture" />
                                John Doe
                            </div>
                        </td>
                        <td>Jan 10, 2020</td>
                        <td>Approved</td>
                        <td>User</td> <!-- Account type for user -->
                        <td>
                            <asp:Button ID="editButton1" runat="server" CssClass="edit-button" Text="Edit" OnClick="EditButton_Click" />
                            <asp:Button ID="deleteButton1" runat="server" CssClass="delete-button" Text="Delete" OnClick="DeleteButton_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>
                            <div class="profile-picture">
                                <img src="https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Image.png" alt="Profile Picture" />
                                Jane Smith
                            </div>
                        </td>
                        <td>Feb 15, 2020</td>
                        <td>Pending</td>
                        <td>Admin</td> <!-- Account type for admin -->
                        <td>
                            <asp:Button ID="editButton2" runat="server" CssClass="edit-button" Text="Edit" OnClick="EditButton_Click" />
                            <asp:Button ID="deleteButton2" runat="server" CssClass="delete-button" Text="Delete" OnClick="DeleteButton_Click" />
                        </td>
                    </tr>
                    <!-- Add more rows for additional users -->
                </tbody>

            </table>
            <asp:Button ID="addUserButton" runat="server" CssClass="add-user-button" Text="Add User" OnClick="AddUserButton_Click" />
        </div>

        <!-- Add User Modal -->
        <asp:Panel ID="addUserModal" runat="server" CssClass="modal" Visible="false">
            <div class="modal-content">
                <asp:Button class="edit-close" onClick="closeAddButton_Click" Text="&times;" UseSubmitBehavior="false" runat="server" type="button" CausesValidation="false" ValidateRequestMode="Disabled"></asp:Button>
                <h2>Add User</h2>

                <asp:Label ID="lblUsername" runat="server" AssociatedControlID="username" Text="Username:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="username" runat="server" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="usernameValidator" runat="server" ControlToValidate="username" CssClass="error-message" ErrorMessage="Username is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Label ID="lblEmail" runat="server" AssociatedControlID="email" Text="Email Address:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="email" runat="server"  CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="emailValidator" runat="server" ControlToValidate="email" CssClass="error-message" ErrorMessage="Email address is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="emailFormatValidator" runat="server" ControlToValidate="email" CssClass="error-message" ErrorMessage="Invalid email address format." Font-Size="12px" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>

                <asp:Label ID="lblAddress" runat="server" AssociatedControlID="address" Text="Address:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="address" runat="server" CssClass="modal-input"></asp:TextBox>

                <asp:Label ID="lblStatus" runat="server" AssociatedControlID="status" Text="Status:" CssClass="modal-label"></asp:Label>
                <asp:DropDownList ID="status" runat="server">
                    <asp:ListItem Text="Pending" Value="pending"></asp:ListItem>
                    <asp:ListItem Text="Approved" Value="approved"></asp:ListItem>
                    <asp:ListItem Text="Denied" Value="denied"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="statusValidator" runat="server" ControlToValidate="status" CssClass="error-message" ErrorMessage="Status is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Label ID="lblAccountType" runat="server" AssociatedControlID="accountType" Text="Account Type:" CssClass="modal-label"></asp:Label>
                <asp:DropDownList ID="accountType" runat="server" CssClass="modal-input">
                    <asp:ListItem Text="User" Value="user" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="admin"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="accountTypeValidator" runat="server" ControlToValidate="accountType" CssClass="error-message" ErrorMessage="Account type is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Button ID="addButton" runat="server" Text="Add" OnClick="AddButton_Click" CssClass="margin-button"  />
            </div>
        </asp:Panel>


        <!-- Edit User Modal -->
        <asp:Panel ID="editUserModal" runat="server" CssClass="modal" Visible="false">
            <div class="modal-content">
                <asp:Button class="edit-close" onClick="closeEditUserModal" Text="&times;" UseSubmitBehavior="false" runat="server" type="button" CausesValidation="false" ValidateRequestMode="Disabled"></asp:Button>
                <h2>Edit User</h2>

                <asp:Label ID="lblEditUsername" runat="server" AssociatedControlID="editUsername" Text="Username:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="editUsername" runat="server" Text="Sample" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="editUsernameValidator" runat="server" ControlToValidate="editUsername" CssClass="error-message" ErrorMessage="Username is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Label ID="lblEditEmail" runat="server" AssociatedControlID="editEmail" Text="Email Address:" CssClass="modal-label"> </asp:Label>
                <asp:TextBox ID="editEmail" runat="server" Text="Sample" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="editEmailValidator" runat="server" ControlToValidate="editEmail"  CssClass="error-message" ErrorMessage="Email address is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="editEmailFormatValidator" runat="server" ControlToValidate="editEmail"  CssClass="error-message" ErrorMessage="Invalid email address format." Font-Size="12px" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>

                <asp:Label ID="lblEditAddress" runat="server" AssociatedControlID="editAddress" Text="Address:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="editAddress" runat="server" Text="Sample" CssClass="modal-input"></asp:TextBox>

                <asp:Label ID="lblEditStatus" runat="server" AssociatedControlID="editStatus" Text="Status:" CssClass="modal-label"></asp:Label>
                <asp:DropDownList ID="editStatus" runat="server">
                    <asp:ListItem Text="Pending" Value="pending"></asp:ListItem>
                    <asp:ListItem Text="Approved" Value="approved"></asp:ListItem>
                    <asp:ListItem Text="Denied" Value="denied"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="editStatusValidator" runat="server"  CssClass="error-message" ControlToValidate="editStatus" Font-Size="12px" ForeColor="Red" ErrorMessage="Status is required." Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:Label ID="Label1" runat="server" AssociatedControlID="accountType" Text="Account Type:" CssClass="modal-label"></asp:Label>
                <asp:DropDownList ID="editAccountType" runat="server" CssClass="modal-input">
                    <asp:ListItem Text="User" Value="user" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="admin"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="accountType" CssClass="error-message" ErrorMessage="Account type is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Button ID="updateButton" runat="server" Text="Update" OnClick="UpdateButton_Click" CssClass="margin-button" />
            </div>
        </asp:Panel>


       <!-- Delete User Modal -->
        <asp:Panel ID="deleteUserModal" runat="server" CssClass="modal" Visible="false">
            <div class="modal-content">
                <asp:Button class="edit-close" onClick="CancelButton_Click" Text=&times; runat='server'></asp:Button>
                <h2>Confirm User Deletion</h2>
                <p>Are you sure you want to delete this user?</p>
                <div class="modal-buttons">
                    <asp:Button ID="cancelButton" runat="server" CssClass="cancel-button" Text="Cancel" OnClick="CancelButton_Click" />
                    <asp:Button ID="confirmButton" runat="server" CssClass="confirm-button" Text="Confirm" OnClick="ConfirmButton_Click" />
                </div>
            </div>
        </asp:Panel>
    </form>
    <!--Footer--> 
        <footer class="footer">
            <p>© 2023 KUZE by ekoism. All rights reserved.</p>
        </footer>
</body>
</html>
