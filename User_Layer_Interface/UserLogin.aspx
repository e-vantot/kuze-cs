<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="kuze.UserLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Login</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="Entry.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="logInContainer">
                <div class="textContainer">
                    <h3 class="logInTitle">User Login</h3>
                    <p class="welcomeText">Welcome back!</p>
                    <div>
                        <div class="labelContainer">
                            <p for="txtEmail" class="label">Email:</p>
                        </div>
                        <asp:TextBox ID="txtEmail" CssClass="textBoxStyle" runat="server" style="height: 25px;"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="errorMessage" ID="emailFormatValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format." Display="Dynamic" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ValidationGroup="signInGroup"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator CssClass="errorMessage" ID="emailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." Display="Dynamic" ValidationGroup="signInGroup"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <div class="labelContainer">
                            <p for="txtPassword" class="label">Password:</p>
                            <a href="about" class="label" style="font-size: 12px; margin: 0px;">Forgot Password</a>
                        </div>
                        <asp:TextBox ID="txtPassword" CssClass="textBoxStyle" runat="server" TextMode="Password" style="height: 25px;"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="errorMessage" ID="passwordValidator" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." ValidationGroup="signInGroup"></asp:RequiredFieldValidator>
                    </div>
                    <div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
                        <asp:Button ID="signInButton" runat="server" Text="SIGN IN" CssClass="signInButton" BackColor="#9D786F" ForeColor="White" Height="45px" OnClick="SignInButtonClick" ValidationGroup="signInGroup" />
                        <asp:Label ID="lblErrorMessage" runat="server" CssClass="finalErrorMessage" Visible="false"></asp:Label>                        
                        <span class="spanContainer">
                            <p>Don't have an account?</p>
                            <a style="margin-left: 5px;" href="UserRegistration.aspx">Sign Up</a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
