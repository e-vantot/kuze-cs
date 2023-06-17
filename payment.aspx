<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="kuze.Payment" %>

<!-- This page allows users to make a payment -->

<!DOCTYPE html>
<html>
<head>
    <title>Payment Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* CSS styles for the page layout and design */

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

        .input-wrapper {
            display: flex;
            align-items: center;
        }

        .exclamation-mark {
            margin-left: 10px;
        }


        @media screen and (max-width: 768px) {
            /* Media query for mobile devices */

            .container {
                flex-direction: column;
            }

            .left-content,
            .right-content {
                padding: 20px;
                flex: none;
            }

            .right-content {
                order: -1;
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
            <div class="payment-options">
                <!-- Payment options for users to choose from -->
                <div class="payment-option" onclick="selectPaymentOption(this)">
                    <img class="payment-icon" src="images/card.png" alt="Card">
                </div>
                <div class="payment-option" onclick="selectPaymentOption(this)">
                    <img class="payment-icon" src="images/paypal.png" alt="PayPal">
                </div>
                <div class="payment-option" onclick="selectPaymentOption(this)">
                    <img class="payment-icon" src="images/applepay.png" alt="Apple Pay">
                </div>
            </div>

            <!-- User input fields -->
            <h2 class="header">Name</h2>
            <div class="input-wrapper" id="name-input-wrapper">
                <input class="text-input" type="text" id="name-input">
            </div>

            <h2 class="header">Street Address</h2>
            <div class="input-wrapper" id="address-input-wrapper">
                <input class="text-input" type="text" id="address-input">
            </div>

            <h2 class="header">Zip Code</h2>
            <div class="input-wrapper" id="zip-code-input-wrapper">
                <input class="text-input" type="text" id="zip-code-input">
            </div>

            <h2 class="header">Shipping</h2>
            <div class="input-wrapper" id="shipping-input-wrapper">
                <select class="text-input" id="shipping-input">
                    <option value="">Select shipping option...</option>
                    <option>J&T Express</option>
                    <option>UPS</option>
                </select>
            </div>

            <!-- Gift wrap option -->
            <input type="checkbox" id="giftWrap" name="giftWrap">
            <label for="giftWrap">Gift wrap this order</label>

            <!-- Order placement information -->
            <p>By clicking "Place Order," you agree to pay for your purchase, understand potential delivery delays, accept our return/refund policy, and consent to our privacy policy. You also confirm that all the information you have provided is accurate.</p>

            <!-- Place order button -->
            <button id="place-order-button" onclick="placeOrder()">Place Order</button>
        </div>

        <!-- Right Content -->
        <div class="right-content">
            <!-- Order summary box -->
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

            <!-- Additional features -->
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

    <!-- JavaScript code for interactivity -->
    <script>
        // Function to select a payment option
        function selectPaymentOption(element) {
            var options = document.querySelectorAll('.payment-option');
            options.forEach(function (opt) {
                opt.classList.remove('selected');
            });
            element.classList.add('selected');
            removeExclamationMark(document.querySelector('.payment-options')); // Add this line
        }

        // Function to place an order
        function placeOrder() {
            var nameInput = document.getElementById('name-input');
            var nameInputWrapper = document.getElementById('name-input-wrapper');
            var addressInput = document.getElementById('address-input');
            var addressInputWrapper = document.getElementById('address-input-wrapper');
            var zipCodeInput = document.getElementById('zip-code-input');
            var zipCodeInputWrapper = document.getElementById('zip-code-input-wrapper');
            var shippingInput = document.getElementById('shipping-input');
            var shippingInputWrapper = document.getElementById('shipping-input-wrapper');
            var paymentOptions = document.querySelector('.payment-options');
            var paymentSelected = document.querySelector('.payment-option.selected');

            // Remove any existing exclamation marks
            var exclamationMarks = document.querySelectorAll('.exclamation-mark');
            exclamationMarks.forEach(function (mark) {
                mark.remove();
            });

            // Validate name
            if (!nameInput.value) {
                addExclamationMark(nameInputWrapper, "Name is required.");
            }

            // Validate address
            if (!addressInput.value) {
                addExclamationMark(addressInputWrapper, "Address is required.");
            }

            // Validate zip code
            if (!zipCodeInput.value) {
                addExclamationMark(zipCodeInputWrapper, "Zip code is required.");
            }

            // Validate shipping method
            if (!shippingInput.value) {
                addExclamationMark(shippingInputWrapper, "Shipping option is required.");
            }

            // Validate payment method
            if (!paymentSelected) {
                addExclamationMark(paymentOptions, "Payment method is required.");
            }

            // If all fields are valid, proceed to random redirection
            if (nameInput.value && addressInput.value && zipCodeInput.value && shippingInput.value && paymentSelected) {
                var randomNumber = Math.random();
                if (randomNumber < 0.5) {
                    window.location.href = 'paymentSuccess.aspx';
                } else {
                    window.location.href = 'paymentUnsuccessful.aspx';
                }
            }
        }

        // Function to add an exclamation mark and error message
        function addExclamationMark(element, message) {
            var exclamationMark = document.createElement('span');
            exclamationMark.className = 'exclamation-mark';
            exclamationMark.textContent = "❗";
            exclamationMark.title = message;
            element.appendChild(exclamationMark);
        }

        // Function to remove exclamation marks
        function removeExclamationMark(wrapperElement) {
            var exclamationMark = wrapperElement.querySelector('.exclamation-mark');
            if (exclamationMark) {
                exclamationMark.remove();
            }
        }

        // Event listeners for input fields
        document.addEventListener("DOMContentLoaded", function () {
            var nameInput = document.getElementById('name-input');
            var addressInput = document.getElementById('address-input');
            var zipCodeInput = document.getElementById('zip-code-input');
            var shippingInput = document.getElementById('shipping-input');
            var paymentOptions = document.querySelectorAll('.payment-option');

            nameInput.addEventListener('input', function () {
                removeExclamationMark(document.getElementById('name-input-wrapper'));
            });

            addressInput.addEventListener('input', function () {
                removeExclamationMark(document.getElementById('address-input-wrapper'));
            });

            zipCodeInput.addEventListener('input', function () {
                removeExclamationMark(document.getElementById('zip-code-input-wrapper'));
            });

            shippingInput.addEventListener('change', function () {
                removeExclamationMark(document.getElementById('shipping-input-wrapper'));
            });

            paymentOptions.forEach(function (paymentOption) {
                paymentOption.addEventListener('click', function () {
                    removeExclamationMark(document.querySelector('.payment-options'));
                });
            });
        });
    </script>
</body>
</html>
