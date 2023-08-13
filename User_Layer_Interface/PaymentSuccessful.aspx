<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSuccessful.aspx.cs" Inherits="kuze.PaymentSuccessful" %>

<!-- This page displays the order confirmation after a successful payment -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Confirmation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* CSS styles for the page layout and design */

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
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

        #thank-you-text, #review-text {
            color: #808080;
            text-align: center;
            padding-bottom:20px;
        }

        #thank-you-text {
            font-size: 24px;
            font-weight: bold;
        }

        #review-text {
            font-size: 18px;
            margin-bottom: 20px;
        }

        #message-container {
            background-color: #FFFFFF;
            padding: 40px 20px;
            border-radius: 10px;
            position: relative;
        }

        #order-date, #order-number, #items, #status {
            color: #808080;
            font-size: 18px;
        }

        #order-date {
            position: absolute;
            top: 30px;
            left: 20px;
        }

        #order-number {
            position: absolute;
            top: 30px;
            right: 20px;
        }

        #items {
            margin-left: 2%;
            display: inline-block;
        }

        #status {
            margin-right: 2%;
            float: right;
        }

        #horizontal-line {
            border-bottom: 1px solid #808080;
            margin: 20px 0;
            width: calc(100% + 40px);
            position: relative;
            left: -20px;
        }

        #horizontal-line2 {
            border-bottom: 1px solid #808080;
            margin: 20px 0;
            width: 96%;
            margin-left: 2%;
        }

        .product-image {
            max-width: 100px;
            display: inline-block;
            vertical-align: top;
            margin-left: 2%;
        }

        .product-info {
            display: inline-block;
            margin-left: 20px;
            color: #808080;
            line-height: 2.5em;
        }

        .product-price {
            display: inline-block;
            float: right;
            color: #808080;
            line-height: 12.5em;
            margin-right: 2%;
        }

        .order-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        #payment-failed-image {
            max-width: 200px;
            display: block;
            margin: 0 auto 20px auto;
        }

        #payment-failed-text {
            font-size: 24px;
            font-weight: bold;
            color: #808080;
            text-align:center;
        }

        #buttons {
            text-align: center;
            margin: 20px 0;
        }

        #save-to-cart-button {
            padding: 12px 24px;
            margin: 10px;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Media query for mobile */
        @media screen and (max-width: 768px) {
            #container {
                width: 100%;
                padding: 20px;
            }

            #header {
                font-size: 28px;
                padding: 15px;
            }

            #thank-you-text {
                font-size: 20px;
            }

            #review-text, #order-date, #order-number, #items, #status {
                font-size: 16px;
            }

            .product-image {
                max-width: 80px;
            }

            .product-info, .product-price {
                font-size: 14px;
            }

            #order-date, #order-number {
                position: static;
                width: auto;
                margin: 0;
            }

            #horizontal-line {
                width: 100%;
                left: 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Page header -->
        <div id="header">kuzé by ekoism</div>
        <div id="line"></div>
        <div id="container">
            <!-- Thank you message -->
            <div id="thank-you-text">Thank you for your order!</div>
            <div id="message-container">
                <!-- Order details -->
                <div class="order-details">
                    <div id="order-date">
                        Order Date:
                        <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
                    </div>
                    <div id="order-number">
                        Order Number:
                        <asp:Label ID="lblPaymentID" runat="server" Text="PaymentID"></asp:Label>
                    </div>
                </div>
                <img id="payment-failed-image" src="../images/order-processed.png" alt="Image">
                <div id="payment-failed-text">Your order is being processed</div>
                <div id="buttons">
                    <!-- Save to cart button -->
                    <button id="save-to-cart-button" type="button" onclick="redirecttoproductpage()">Continue Shopping</button>
                </div>
            </div>
        </div>
    </form>
    <script>
        function redirecttoproductpage() {
            window.location.href = "productpage.aspx";
        }
    </script>
</body>
</html>
