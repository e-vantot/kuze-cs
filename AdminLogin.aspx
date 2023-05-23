<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="kuze.AdminLogin" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            background-color: #fff;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            max-width: 400px;
            padding: 80px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            background-color: #fff;
        }

        .container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group input[type="submit"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: none;
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
            border-radius: 4px;
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }

        .logo-container {
            display:flex;
            justify-content:center;
            align-items:center;
            margin:auto;
            margin-bottom: 20px;
        }

        .logo-container img {
            max-width: 200px;
            height: auto;
            width: 300px;
            justify-content:center;
            align-items:center;
            text-align:center;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="logo-container">
            <img src="Images/kuze-final.png" alt="Logo" />
        </div>
        <h2>Admin Login</h2>
        <form runat="server">
            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <input type="text" id="txtUsername" runat="server" />
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                    ErrorMessage="Username is required." Text="*Username is required." ForeColor="Red" ValidationGroup="LoginValidation" />
            </div>
            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <input type="password" id="txtPassword" runat="server" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="Password is required." Text="*Password is required." ForeColor="Red" ValidationGroup="LoginValidation" />
            </div>
            <div class="form-group">
                <input type="submit" value="Login" runat="server" ValidationGroup="LoginValidation" />
            </div>
        </form>
    </div>
</body>
</html>
