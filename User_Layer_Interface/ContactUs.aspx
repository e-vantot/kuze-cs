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
        <form runat="server" method="Post">
            <div class="form-group">
                <!-- layout input for Name & Email side by side-->
                <div class="form-itemleft">
                    <label for="txtUsername">NAME</label>
                    <asp:TextBox id="txtUsername" runat="server" ></asp:TextBox>
                    <!--Validation for Name Input-->
                    <asp:RequiredFieldValidator id="rfvUsername" runat="server" ControlToValidate="txtUsername"
                        ErrorMessage="Please enter your name." Text="*This field is required." ForeColor="Red" ValidationGroup="FormValidation" />
                </div>
                <div class="form-itemright">
                    <label for="txtEmail">EMAIL</label>
                    <asp:TextBox id="txtEmail" runat="server" type="email"></asp:TextBox>
                    <!-- Validation for Email Input-->
                    <asp:RequiredFieldValidator id="rfvEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Please enter your email address." Text="*This field is required." ForeColor="Red" ValidationGroup="FormValidation" />
                    <asp:RegularExpressionValidator id="revEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Please enter a valid email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        Text="*Please enter a valid email address." ForeColor="Red" ValidationGroup="FormValidation" />
                </div>

                <div class="form-itembottom">
                    <!-- Input for Message-->
                    <label for="txtMessage">MESSAGE</label>
                    <asp:TextBox id="txtMessage" runat="server" type="text"></asp:TextBox>
                    <!-- Validation for Message Input-->
                    <asp:RequiredFieldValidator id="rfvMessage" runat="server" ControlToValidate="txtMessage"
                        ErrorMessage="Please enter your message." Text="*This field is required." ForeColor="Red" ValidationGroup="FormValidation" />
                </div>

            </div>
            <!-- Form Button-->
            <div class="button">
                <asp:Button id="btnSubmit" type="submit" text="SUBMIT" runat="server" OnClick="BtnSend_Click" ValidationGroup="FormValidation"/>
            </div>

            <div id="successMessage" class="success-message" runat="server" visible="false">Message sent! We will reach out to you soon.</div>
        </form>
        <!--Footer--> 
        <footer class="footer">
            <p>© 2023 KUZE by ekoism. All rights reserved.</p>
        </footer>
    </div>

</body>


</html>