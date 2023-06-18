<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="kuze.ContactUs" %>

<!DOCTYPE html>
<html>
<head>
    <title>Contact Us</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="ContactUsStyles.css"/>
</head>

<body>

    <div class="container">
     <!--Navigation Bar -->
    <nav class="navbar">
        <div class="navbar-logo">
            <p>KUZE</p>
        </div>
        <div class="navbar-links">
            <ul class="navbar-list">
                <li><a href="MainPage.aspx">Home</a></li>
                <li><a href="AboutUs.aspx">About</a></li>
                <li><a href="ProductPage.aspx">Products</a></li>
                <li><a href="ContactUs.aspx">Contact</a></li>
                <li><a href="UserLogin.aspx">Account</a></li>
                <li><a href="ShoppingCart.aspx">Your Cart</a></li>
            </ul>
        </div>
    </nav>
        <h5>kuze by ekoism</h5>
        <h2>Contact Us</h2>
        <img class="contact-image" src="/Images/kuze-contact.png" alt="Page Image" />

        <p>Want to get in touch with team KUZÉ? Send your query to us directly using the form below or:
            For customer care and general enquiries: <a href="mailto:hello@kuze.com">hello@kuze.com</a></p><!-- Email address as a link -->
        &nbsp;
        <form runat="server">
            <div class="form-group">
                <!-- layout input for Name & Email side by side-->
                <div class="form-itemleft">
                    <label for="txtUsername">NAME</label>
                    <input type="email" id="txtUsername" runat="server" />
                    <!--Validation for Name Input-->
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
                        ErrorMessage="Please enter your name." Text="*This field is required." ForeColor="Red" ValidationGroup="FormValidation" />
                </div>
                <div class="form-itemright">
                    <label for="txtEmail">EMAIL</label>
                    <input type="email" id="txtEmail" runat="server" />
                    <!-- Validation for Email Input-->
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Please enter your email address." Text="*This field is required." ForeColor="Red" ValidationGroup="FormValidation" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Please enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        Text="*Please enter a valid email address." ForeColor="Red" ValidationGroup="FormValidation" />
                </div>
                <!-- Input for Message-->
                <label for="txtMessage">MESSAGE</label>
                <input type="text" id="txtMessage" runat="server" />
                <!-- Validation for Message Input-->
                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage"
                    ErrorMessage="Please enter your message." Text="*This field is required." ForeColor="Red" ValidationGroup="FormValidation" />
            </div>
            <!-- Form Button-->
            <div class="button">
                <input type="submit" value="SEND" runat="server" OnClick="btnSend_Click" ValidationGroup="FormValidation"/>
            </div>
        </form>
        <!--Footer--> 
        <footer class="footer">
            <p>© 2023 KUZE by ekoism. All rights reserved.</p>
        </footer>
    </div>

</body>


</html>
