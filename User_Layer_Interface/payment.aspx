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

        .footer {
            background-color: lightslategrey;
            color: white;
            padding: 30px;
            text-align: center;
            margin-top: 100px;
        }

        .side-by-side-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .half-input {
            width: 48%;
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


            .footer {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

                .footer p {
                    flex-basis: 50%;
                }
        }
    </style>
</head>
<body>
    <form runat="server">
        <h1 id="title">kuzé by ekoism</h1>

        <div class="container">
            <!-- Left Content -->
            <div class="left-content">
                <h2 class="header">Payment</h2>

                <!-- User input fields -->

                <h2 class="header">Name</h2>
                <div class="input-wrapper" id="name-input-wrapper">
                    <asp:TextBox CssClass="text-input" ID="nameInput" runat="server" placeholder="John Doe"></asp:TextBox>
                </div>

                <h2 class="header">Street Address</h2>
                <div class="input-wrapper" id="address-input-wrapper">
                    <asp:TextBox CssClass="text-input" ID="addressInput" runat="server" placeholder="123 Main St"></asp:TextBox>
                </div>

                <h2 class="header">Zip Code</h2>
                <div class="input-wrapper" id="zip-code-input-wrapper">
                    <asp:TextBox CssClass="text-input" ID="zipcodeInput" runat="server" placeholder="12345"></asp:TextBox>
                </div>

                <h2 class="header">Shipping</h2>
                <div class="input-wrapper" id="shipping-input-wrapper">
                    <asp:DropDownList CssClass="text-input" ID="shippingInput" runat="server">
                        <asp:ListItem Text="Select shipping option..." Value=""></asp:ListItem>
                        <asp:ListItem Text="J&T Express" Value="J&T Express"></asp:ListItem>
                        <asp:ListItem Text="UPS" Value="UPS"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- Card Payment Details -->

                <h2 class="header">Card Number</h2>
                <div class="input-wrapper" id="card-number-input-wrapper">
                    <asp:TextBox CssClass="text-input" ID="cardNumberInput" runat="server" placeholder="1234 5678 9101 1121"></asp:TextBox>
                </div>

                <h2 class="header">Cardholder Name</h2>
                <div class="input-wrapper" id="cardholder-name-input-wrapper">
                    <asp:TextBox CssClass="text-input" ID="cardholderNameInput" runat="server" placeholder="John Doe"></asp:TextBox>
                </div>

                <h2 class="header">Expiry Date & CVV</h2>
                <div class="side-by-side-container">
                    <div class="input-wrapper half-input" id="expiry-date-input-wrapper">
                        <asp:TextBox CssClass="text-input" ID="expiryDateInput" runat="server" placeholder="MM/YYYY"></asp:TextBox>
                    </div>
                    <div class="input-wrapper half-input" id="cvv-input-wrapper">
                        <asp:TextBox CssClass="text-input" ID="cvvInput" runat="server" placeholder="CVV"></asp:TextBox>
                    </div>
                </div>

                <!-- Gift wrap option -->
                <input type="checkbox" id="giftWrap" name="giftWrap">
                <label for="giftWrap">Gift wrap this order</label>

                <!-- Order placement information -->
                <p>By clicking "Place Order," you agree to pay for your purchase, understand potential delivery delays, accept our return/refund policy, and consent to our privacy policy. You also confirm that all the information you have provided is accurate.</p>

                <!-- Place order button -->
                <asp:Button ID="btnSubmitPayment" runat="server" OnClick="btnSubmitPayment_Click" Text="Submit Payment" UseSubmitBehavior="false" />

            </div>

            <!-- Right Content -->
            <div class="right-content">
                <!-- Order summary box -->
                <div class="summary-box">
                    <h3 class="summary-header">Summary</h3>
                    <div class="summary-line"></div>
                    <div class="summary-item">
                        <asp:Label ID="lblTotalItems" runat="server">0 items</asp:Label>
                    </div>
                    <div class="summary-line"></div>
                    <div class="summary-item">
                        <span>Product total</span>
                        <asp:Label ID="lblProductTotal" runat="server">$0</asp:Label>
                    </div>
                    <div class="summary-item">
                        <span>FREE Shipping</span>
                        <span>Always</span>
                    </div>
                    <div class="summary-line"></div>
                    <div class="summary-item">
                        <span>Total</span>
                        <asp:Label ID="lblTotalPrice" runat="server">$0</asp:Label>
                    </div>
                </div>

                <!-- Additional features -->
                <div class="features">
                    <img src="../images/cross.png" alt="icon" class="icon">
                    <span>Free, easy cancellation</span>
                </div>
                <div class="features">
                    <img src="../images/truck.png" alt="icon" class="icon">
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
                removeExclamationMark(document.querySelector('.payment-options'));
            }

            // Function to place an order
            function placeOrder() {
                var nameInput = document.getElementById('nameInput');
                var nameInputWrapper = document.getElementById('name-input-wrapper');
                var addressInput = document.getElementById('addressInput');
                var addressInputWrapper = document.getElementById('address-input-wrapper');
                var zipCodeInput = document.getElementById('zipcodeInput');
                var zipCodeInputWrapper = document.getElementById('zip-code-input-wrapper');
                var shippingInput = document.getElementById('shippingInput');
                var shippingInputWrapper = document.getElementById('shipping-input-wrapper');

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
                var nameInput = document.getElementById('nameInput');
                var addressInput = document.getElementById('addressInput');
                var zipCodeInput = document.getElementById('zipcodeInput');
                var shippingInput = document.getElementById('shippingInput');
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
        <!--Footer-->
        <footer class="footer">
            <p>© 2023 KUZE by ekoism. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>
