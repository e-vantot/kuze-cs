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
            <asp:GridView ID="userGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="userGridView_RowCommand">
    <Columns>
        <asp:BoundField DataField="UserID" HeaderText="No" />
        <asp:BoundField DataField="UserName" HeaderText="User Name" />
        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
        <asp:BoundField DataField="Email" HeaderText="Email" />
        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
        <asp:BoundField DataField="CreatedDate" HeaderText="Date Applied" DataFormatString="{0:MMM dd, yyyy}" />
        <asp:BoundField DataField="LastLoginDate" HeaderText="Last Login" DataFormatString="{0:MMM dd, yyyy}" />
        <asp:BoundField DataField="isEmailVerified" HeaderText="Email Verified" DataFormatString="{0:Yes;No}" />
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:Button ID="editButton" runat="server" CssClass="edit-button" Text="Edit" CommandName="EditUser" CommandArgument='<%# Eval("UserID") %>' />
                <asp:Button ID="deleteButton" runat="server" CssClass="delete-button" Text="Delete" CommandName="DeleteUser" CommandArgument='<%# Eval("UserID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

            <asp:HiddenField ID="hfEditedUserID" runat="server" />


           <!-- <asp:Button ID="addUserButton" runat="server" CssClass="add-user-button" Text="Add User" OnClick="AddUserButton_Click" /> -->
        </div>

        <!-- Add User Modal -->
        <asp:Panel ID="addUserModal" runat="server" CssClass="modal" Visible="false">
            <div class="modal-content">
                <asp:Button class="edit-close" onClick="closeAddButton_Click" Text="&times;" UseSubmitBehavior="false" runat="server" type="button" CausesValidation="false" ValidateRequestMode="Disabled"></asp:Button>
                <h2>Add User</h2>

                <asp:Label ID="lblUsername" runat="server" AssociatedControlID="username" Text="Username:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="username" runat="server" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="usernameValidator" runat="server" ControlToValidate="username" CssClass="error-message" ErrorMessage="Username is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="firstName" Text="First Name:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="firstName" runat="server" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="firstNameValidator" runat="server" ControlToValidate="firstName" CssClass="error-message" ErrorMessage="First name is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Label ID="lblLastName" runat="server" AssociatedControlID="lastName" Text="Last Name:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="lastName" runat="server" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="lastNameValidator" runat="server" ControlToValidate="lastName" CssClass="error-message" ErrorMessage="Last name is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Label ID="lblEmail" runat="server" AssociatedControlID="email" Text="Email Address:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="email" runat="server" CssClass="modal-input"></asp:TextBox>
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

                <asp:Label ID="lblPassword" runat="server" AssociatedControlID="password" Text="Password:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ControlToValidate="password" CssClass="error-message" ErrorMessage="Password is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Label ID="lblPhoneNumber" runat="server" AssociatedControlID="phoneNumber" Text="Phone Number:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="phoneNumber" runat="server" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="phoneNumberValidator" runat="server" ControlToValidate="phoneNumber" CssClass="error-message" ErrorMessage="Phone number is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Button ID="addButton" runat="server" Text="Add" OnClick="AddButton_Click" CssClass="margin-button" />
            </div>
        </asp:Panel>



        <!-- Edit User Modal -->
        <asp:Panel ID="editUserModal" runat="server" CssClass="modal" Visible="false">
            <div class="modal-content">
                <asp:Button class="edit-close" onClick="closeEditUserModal" Text="&times;" UseSubmitBehavior="false" runat="server" type="button" CausesValidation="false" ValidateRequestMode="Disabled"></asp:Button>
                <h2>Edit User</h2>

                <asp:Label ID="lblEditUsername" runat="server" AssociatedControlID="editUsername" Text="Username:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="editUsername" runat="server" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="editUsernameValidator" runat="server" ControlToValidate="editUsername" CssClass="error-message" ErrorMessage="Username is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>

                <!-- New Fields -->
                <asp:Label ID="lblEditFirstName" runat="server" AssociatedControlID="editFirstName" Text="First Name:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="editFirstName" runat="server" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="editFirstNameValidator" runat="server" ControlToValidate="editFirstName" CssClass="error-message" ErrorMessage="First Name is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>

                <asp:Label ID="lblEditLastName" runat="server" AssociatedControlID="editLastName" Text="Last Name:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="editLastName" runat="server" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="editLastNameValidator" runat="server" ControlToValidate="editLastName" CssClass="error-message" ErrorMessage="Last Name is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>
                <!-- End of New Fields -->

                <asp:Label ID="lblEditEmail" runat="server" AssociatedControlID="editEmail" Text="Email Address:" CssClass="modal-label"> </asp:Label>
                <asp:TextBox ID="editEmail" runat="server" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="editEmailValidator" runat="server" ControlToValidate="editEmail" CssClass="error-message" ErrorMessage="Email address is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="editEmailFormatValidator" runat="server" ControlToValidate="editEmail" CssClass="error-message" ErrorMessage="Invalid email address format." Font-Size="12px" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>


                <!-- New PhoneNumber Field -->
                <asp:Label ID="lblEditPhoneNumber" runat="server" AssociatedControlID="editPhoneNumber" Text="Phone Number:" CssClass="modal-label"></asp:Label>
                <asp:TextBox ID="editPhoneNumber" runat="server" CssClass="modal-input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="editPhoneNumberValidator" runat="server" ControlToValidate="editPhoneNumber" CssClass="error-message" ErrorMessage="Phone Number is required." Display="Dynamic" Font-Size="12px" ForeColor="Red"></asp:RequiredFieldValidator>
                <!-- End of New PhoneNumber Field -->


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