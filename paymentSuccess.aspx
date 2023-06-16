<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paymentSuccess.aspx.cs" Inherits="kuze.paymentSuccess" %>

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
            <!-- Review text -->
            <div id="review-text">Review your order information below</div>
            <div id="message-container">
                <!-- Order details -->
                <div class="order-details">
                    <div id="order-date">20/03/2023</div>
                    <div id="order-number">Order: 1728492</div>
                </div>
                <!-- Horizontal line -->
                <div id="horizontal-line"></div>
                <!-- Items -->
                <div id="items">Items</div>
                <div id="status">Status: Shipping soon</div>
                <!-- Horizontal line -->
                <div id="horizontal-line2"></div>
                <!-- Product details -->
                <img class="product-image" src="images/tshirt.jpg" alt="Product Image">
                <div class="product-info">
                    <div>T-Shirt</div>
                    <div>Size: M</div>
                    <div>Qty: 1</div>
                </div>
                <div class="product-price">$20</div>
            </div>
        </div>
    </form>
</body>
</html>
