<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paymentUnsuccessful.aspx.cs" Inherits="kuze.paymentUnsuccessful" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Unsuccessful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        
        #header {
            color: #393E4E;
            font-size: 36px;
            text-align: center;
            padding: 20px;
        }

        #line {
            border-bottom: 1px solid #393E4E;
            width: 75%;
            margin: 20px auto;
        }

        #container {
            background-color: #F5F5F5;
            padding: 40px 20px;
            width: 72%;
            margin: 0 auto;
            border-radius: 10px;
        }

        #payment-failed-image {
            max-width: 200px;
            display: block;
            margin: 0 auto 20px auto;
        }

        #message-container {
            background-color: #FFFFFF;
            padding: 40px 20px;
            text-align: center;
            width: 90%;
            margin: 20px auto;
            border-radius: 10px;
        }

        #payment-failed-text {
            font-size: 24px;
            font-weight: bold;
            color: #808080;
        }

        #instruction-text, #or-text, #save-text {
            font-size: 18px;
            color: #808080;
            margin: 10px 0;
        }

        #buttons {
            text-align: center;
            margin: 20px 0;
        }

        #try-again-button {
            background-color: #626262;
            color: #FFFFFF;
            padding: 12px 24px;
            margin: 10px;
            border-radius: 5px;
            font-size: 16px;
        }

        #save-to-cart-button {
            padding: 12px 24px;
            margin: 10px;
            border-radius: 5px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">kuzé by ekoism</div>
        <div id="line"></div>
        <div id="container">
            <img id="payment-failed-image" src="images/unsucessfulpayment.png" alt="Image">
            <div id="message-container">
                <div id="payment-failed-text">Payment Failed</div>
                <div id="instruction-text">Please select another payment method</div>
                <div id="or-text">or</div>
                <div id="save-text">save your product to the cart</div>
                <div id="buttons">
                    <button id="try-again-button">Try again</button>
                    <button id="save-to-cart-button">Save to cart</button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
