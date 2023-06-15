<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="kuze.payment" %>

<!DOCTYPE html>
<html>
<head>
    <title>Payment Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            padding: 20px;
            color: #808080;
        }

        .left-content {
            flex: 2;
            padding-right: 50px;
        }

        .right-content {
            flex: 1;
            padding-left: 50px;
        }

        .header {
            font-size: 20px;
            font-weight: bold;
        }

        .text-input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }

        .payment-option {
            display: inline-block;
            width: 100px;
            text-align: center;
            vertical-align: top;
            cursor: pointer;
            border: 1px solid #808080;
            padding: 10px;
        }

            .payment-option.selected {
                background-color: #d3d3d3;
            }

        .payment-icon {
            width: 40px;
            height: 40px;
        }

        .summary-box {
            background-color: #F5F5F5;
            padding: 20px;
            margin-bottom: 20px;
        }

        .summary-header {
            font-size: 20px;
            margin-bottom: 20px;
        }

        .summary-line {
            border-bottom: 1px solid #000;
            margin: 20px 0;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
        }

        .icon {
            margin-right: 10px;
            width: 24px;
            height: 24px;
        }

        .features {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            margin-top: 20px;
        }

        #title {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        #place-order-button {
            background-color: #626262;
            color: white;
            border: none;
            padding: 15px 30px;
            text-align: center;
            display: inline-block;
            font-size: 16px;
            margin: 10px 0;
            cursor: pointer;
        }

        @media screen and (max-width: 768px) {

            .container {
                flex-direction: column;
            }

            .left-content,
            .right-content {
                padding: 20px;
                flex: none;
            }

            .right-content {
                order: -1; /* Move the right content to the top */
            }

            #title {
                font-size: 24px;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <h1 id="title">kuzé by ekoism</h1>

    <div class="container">
        <!-- Left Content -->
        <div class="left-content">
            <h2 class="header">Payment</h2>
            <div class="payment-option" onclick="selectPaymentOption(this)">
                <img class="payment-icon" src="images/card.png" alt="Card"></div>
            <div class="payment-option" onclick="selectPaymentOption(this)">
                <img class="payment-icon" src="images/paypal.png" alt="PayPal"></div>
            <div class="payment-option" onclick="selectPaymentOption(this)">
                <img class="payment-icon" src="images/applepay.png" alt="Apple Pay"></div>

            <h2 class="header">Shipping</h2>
            <select class="text-input">
                <option>Select shipping option...</option>
                <option>J&T Express</option>
                <option>UPS</option>
            </select>

            <h2 class="header">Name</h2>
            <input class="text-input" type="text">

            <h2 class="header">Street Address</h2>
            <input class="text-input" type="text">

            <h2 class="header">Zip Code</h2>
            <input class="text-input" type="text">

            <input type="checkbox" id="giftWrap" name="giftWrap">
            <label for="giftWrap">Gift wrap this order</label>

            <p>By clicking "Place Order," you agree to pay for your purchase, understand potential delivery delays, accept our return/refund policy, and consent to our privacy policy. You also confirm that all the information you have provided is accurate.</p>

            <button id="place-order-button">Place Order</button>
        </div>

        <!-- Right Content -->
        <div class="right-content">
            <div class="summary-box">
                <h3 class="summary-header">Summary</h3>
                <div class="summary-line"></div>
                <div class="summary-item">2 items</div>
                <div class="summary-line"></div>
                <div class="summary-item">
                    <span>Product total</span>
                    <span>$40</span>
                </div>
                <div class="summary-item">
                    <span>FREE Shipping</span>
                    <span>Always</span>
                </div>
                <div class="summary-line"></div>
                <div class="summary-item">
                    <span>Total</span>
                    <span>$40</span>
                </div>
            </div>

            <div class="features">
                <img src="images/cross.png" alt="icon" class="icon">
                <span>Free, easy cancellation</span>
            </div>
            <div class="features">
                <img src="images/truck.png" alt="icon" class="icon">
                <span>Free shipping, always</span>
            </div>
        </div>
    </div>

    <script>
        function selectPaymentOption(element) {
            var options = document.querySelectorAll('.payment-option');
            options.forEach(function (opt) {
                opt.classList.remove('selected');
            });
            element.classList.add('selected');
        }
    </script>

</body>
</html>
