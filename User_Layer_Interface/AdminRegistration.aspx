<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRegistration.aspx.cs" Inherits="kuze.AdminRegistration" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Registration</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="Entry.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="signUpContainer">
                <div class="textContainer">
                    <h3 class="logInTitle">Admin Registration</h3>
                    <div>
                        <div class="labelContainer">
                            <p for="txtUsername" class="label">Username:</p>
                        </div>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="textBoxStyle" Style="height: 25px;"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="usernameValidator" runat="server" ControlToValidate="txtUsername" CssClass="errorMessage" ErrorMessage="Username is required." Text="Username is required."></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" ID="usernameLengthValidator" runat="server" ControlToValidate="txtUsername" CssClass="errorMessage" ErrorMessage="Username must be between 1 and 20 characters long." ValidationExpression="^.{1,20}$" Text="Username must be between 1 and 20 characters long."></asp:RegularExpressionValidator>
                    </div>
                    <div>
                        <div class="labelContainer">
                            <p for="txtEmail" class="label">Email:</p>
                        </div>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="textBoxStyle" Style="height: 25px;"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="emailValidator" runat="server" ControlToValidate="txtEmail" CssClass="errorMessage" ErrorMessage="Email is required." Text="Email is required."></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" ID="emailFormatValidator" runat="server" ControlToValidate="txtEmail" CssClass="errorMessage" ErrorMessage="Invalid email format." ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" Text="Invalid email format."></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" ID="emailLengthValidator" runat="server" ControlToValidate="txtEmail" CssClass="errorMessage" ErrorMessage="Email must be between 1 and 255 characters long." ValidationExpression="^.{1,255}$" Text="Email must be between 1 and 255 characters long."></asp:RegularExpressionValidator>
                    </div>
                    <div>
                        <div class="labelContainer">
                            <p for="txtPassword" class="label">Password:</p>
                        </div>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="textBoxStyle" Style="height: 25px;"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="passwordValidator" runat="server" ControlToValidate="txtPassword" CssClass="errorMessage" ErrorMessage="Password is required." Text="Password is required."></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <div class="labelContainer">
                            <p for="txtConfirmPassword" class="label">Confirm Password:</p>
                        </div>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="textBoxStyle" Style="height: 25px;"></asp:TextBox>
                        <asp:CompareValidator Display="Dynamic" ID="confirmPasswordValidator" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" CssClass="errorMessage" ErrorMessage="Passwords do not match." Text="Passwords do not match."></asp:CompareValidator>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="confirmPasswordRequiredValidator" runat="server" ControlToValidate="txtConfirmPassword" CssClass="errorMessage" ErrorMessage="Confirm Password is required." Text="Confirm Password is required."></asp:RequiredFieldValidator>
                    </div>
                    <div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                        <asp:Button ID="signUpButton" runat="server" Text="SIGN UP" CssClass="signInButton" BackColor="#9D786F" ForeColor="White" Height="45px" OnClick="SignUpButton_Click" />
                        <span class="spanContainer">
                            <p>Have an account?</p>
                            <a style="margin-left: 5px;" href="AdminLogin.aspx">Sign In</a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
