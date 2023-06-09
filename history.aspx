<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="kuze.history" %>

<!DOCTYPE html>

<html>
<head>
    <title>Purchase History</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body, div, span {
            font-family: 'Inter', sans-serif;
            color: #808080;
        }

        .title {
            font-size: 32px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 70px;
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
        
        .order-header span {
            font-size: 20px;
        }
        
        .header-label {
            font-size: 20px;
            font-weight: bold;
            display: block;
        }
        
        .order-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        .header-item div {
            font-size: 20px;
        }
    </style>
</head>
<body>

    <div class="title">Orders</div>

    <div class="purchase-history">
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

        <div class="order-details">
            <div class="product-image">
                <img src="images/tshirt.jpg" alt="T-shirt Image" />
            </div>
            <div class="product-info">
                <span class="product-name">T-shirt Name</span>
                <span class="product-size">Size: M</span>
            </div>
            <div class="product-price">
                $20.00
            </div>
        </div>

        <div class="order-total">
            Total Amount: $20.00
        </div>
    </div>

    <script src="scripts.js"></script>
</body>
</html>








