﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistoryPage.aspx.cs" Inherits="kuze.HistoryPage" %>

<!-- This page displays the purchase history of the user -->

<!DOCTYPE html>
<html>
<head>
    <title>Purchase History</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* CSS styles for the page layout and design */

        body, div, span {
            font-family: 'Inter', sans-serif;
            color: #808080;
            margin: 0;
            padding: 0;
        }

        /*Nav Bar*/
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #fff;
    padding: 15px;
}

.navbar p{
    color:darkslateblue;
    font-size: 30px;
    font-weight: 600;
    padding:0 auto;
    margin: 0 auto;
}

.navbar-list {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

.navbar-list li {
     display: inline;
     margin-left: 10px;
     text-align: center;
}

.navbar-list li:first-child {
    margin-left: 0;
 }

.navbar-list li a {
    text-decoration: none;
    color: #000;
    font-weight:500;
    padding: 8px 10px;
    border-bottom: 2px solid transparent;
    transition: border-color 0.3s;
}

  .navbar-list li a:hover {
   border-color: #ffc107;
   font-weight:600;
  }


        .title {
            font-size: 32px;
            font-weight: bold;
            text-align: center;
            margin: 40px 0;
        }

        .purchase-history {
            width: 80%;
            margin: 0 auto;
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .order-header span, .header-item div {
            font-size: 20px;
        }

        .header-label {
            font-weight: bold;
            display: block;
        }

        .order-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .product-image {
            margin-right: 20px;
        }

        .product-image img {
            max-width: 100px;
            max-height: 100px;
        }

        .product-info {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .product-price {
            font-weight: bold;
        }

        .order-total {
            text-align: right;
            margin-top: 20px;
            font-weight: bold;
        }

        .header-item {
            text-align: center;
        }


        .footer {
            background-color: lightslategrey;
            color:white;
            padding: 30px;
            text-align: center;
            margin-top: 100px;
        }

        /* Media query for mobile */
        @media screen and (max-width: 768px) {
            .title {
                font-size: 24px;
                margin: 20px 0;
            }

            .order-header {
                flex-direction: column;
                align-items: center;
            }

            .order-details {
                flex-direction: row;
                align-items: center;
            }

            .order-header span, .header-item div {
                font-size: 16px;
            }

            .purchase-history {
                width: 95%;
            }

            .product-info {
                flex-grow: 1;
                margin-left: 20px;
            }


            .navbar {
                flex-direction: column;
                padding: 10px;
            }

            .navbar-logo {
                margin-bottom: 10px;
            }

            .navbar-list li {
                display: block;
                margin: 5px 0;
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
                <li><a href="HistoryPage.aspx">Order History</a></li>
            </ul>

        </div>
    </nav>

    <!-- Page title -->
    <div class="title">Orders</div>

    <!-- Purchase history section -->
    <div class="purchase-history">
        <!-- Order header section -->
        <div class="order-header">
            <div class="header-item">
                <span class="header-label">Order Number:</span>
                <div>#12345</div>
            </div>
            <div class="header-item">
                <span class="header-label">Date of Order:</span>
                <div>06/08/2023</div>
            </div>
            <div class="header-item">
                <span class="header-label">Delivery Date:</span>
                <div>06/15/2023</div>
            </div>
        </div>

        <hr />

        <!-- Order details section -->
        <div class="order-details">
            <div class="product-image">
                <img src="../images/tshirt.jpg" alt="T-shirt Image" />
            </div>
            <div class="product-info">
                <span class="product-name">T-shirt Name</span>
                <span class="product-size">Size: M</span>
            </div>
            <div class="product-price">
                $20.00
            </div>
        </div>

        <!-- Order total section -->
        <div class="order-total">
            Total Amount: $20.00
        </div>
    </div>

    <!-- JavaScript file -->
    <script src="scripts.js"></script>

    <!--Footer--> 
    <footer class="footer">
      <p>© 2023 KUZE by ekoism. All rights reserved.</p>
    </footer>
</body>
</html>
