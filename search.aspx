<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="kuze.search" %>

<!-- This is a product search page written in HTML and C# -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Product Search Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* CSS styles for the page layout and design */

        body,
        html {
            margin: 0;
            padding: 0;
        }

        #header {
            background-image: url(images/searchbackground.jpg);
            background-size: 100% 100%;
            background-repeat: no-repeat;
            height: 300px;
            position: relative;
        }

        #search-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            display: flex;
            align-items: center;
            padding: 15px 30px;
            border: 1px solid #ccc;
            border-radius: 20px;
        }

        #search-input {
            font-size: 20px;
            margin-right: 10px;
            border: none;
            background: transparent;
            width: 300px;
        }

        #search-icon {
            font-size: 36px;
        }

        #search-results {
            text-align: left;
            margin-left: 26%;
            margin-top: 10px;
            font-size: 32px;
        }

        .content {
            display: flex;
            margin-right: 10%;
        }

        .sidebar {
            padding: 20px;
            font-size: 18px;
            margin: 0 100px 0 100px;
        }

            .sidebar div {
                font-weight: bold;
                margin-bottom: 15px;
                white-space: nowrap;
            }

            .sidebar a {
                display: block;
                margin-bottom: 10px;
            }

        .products {
            flex-grow: 1;
            display: grid;
            flex-wrap: wrap;
            justify-content: space-between;
            grid-template-columns: auto auto auto auto;
        }

        .product {
            text-align: left;
            margin: 10px;
            width: 27%;
            cursor: pointer;
        }

            .product img {
                max-height: 200px;
                max-width: 200px;
            }

        .product-name {
            white-space: nowrap;
        }

        .stars {
            display: inline-block;
            color: yellow;
        }

        .price {
            margin-top: 5px;
        }

        a {
            text-decoration: none;
            color: blue;
        }

        .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            display: flex;
        }

            .modal-content div {
                margin: 8px 0;
            }


        .left {
            flex: 1;
        }

        .right {
            flex: 1;
            padding-left: 20px;
        }

        .dropdown {
            width: 100%;
        }

        .quantity-input {
            width: 40px;
        }

        .addToCartTitle {
            font-size: 24px;
            text-align: center;
            position: relative;
            padding-right: 40px;
        }

        .modal-header {
            padding: 10px;
            position: relative;
        }

        .close {
            position: absolute;
            right: 10px;
            top: 10px;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

            .close:hover,
            .close:focus {
                color: red;
                cursor: pointer;
            }

        .addToCartButton {
            display: block;
            margin: 20px auto;
            padding: 10px;
            font-size: 18px;
            cursor: pointer;
            background-color: black;
            color: white;
            border: none;
            border-radius: 5px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <!-- Header section -->
        <div id="header">
            <div id="search-container">
                <input id="search-input" type="text" placeholder="Search for products..." />
                <span id="search-icon">&#128269;</span>
            </div>
        </div>

        <!-- Search results section -->
        <div id="search-results">
            <h2>Search Results</h2>
        </div>

        <div class="content">
            <!-- Sidebar section -->
            <div class="sidebar">
                <div>Refine your results</div>
                <div>Category</div>
                <a href="#">Clothes</a>
                <a href="#">Pants</a>
                <a href="#">Hoodies</a>
                <a href="#">Dresses</a>
            </div>

            <!-- Products section -->
            <div class="products">
                <!-- Example Product -->
                <div class="product">
                    <img src="images/tshirt.jpg" alt="product name">
                    <div class="product-name">Piqué Biker Jacket</div>
                    <div class="stars">★★★★★</div>
                    <div class="price">$99.99</div>
                </div>
                <div class="product">
                    <img src="images/tshirt.jpg" alt="product name">
                    <div class="product-name">Piqué Biker Jacket</div>
                    <div class="stars">★★★★★</div>
                    <div class="price">$99.99</div>
                </div>
                <div class="product">
                    <img src="images/tshirt.jpg" alt="product name">
                    <div class="product-name">Piqué Biker Jacket</div>
                    <div class="stars">★★★★★</div>
                    <div class="price">$99.99</div>
                </div>
                <div class="product">
                    <img src="images/tshirt.jpg" alt="product name">
                    <div class="product-name">Piqué Biker Jacket</div>
                    <div class="stars">★★★★★</div>
                    <div class="price">$99.99</div>
                </div>
            </div>
        </div>
    </form>

    <!-- Modal (popup) -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <div class="left">
                <img src="images/tshirt.jpg" alt="product name" style="max-width: 100%;">
            </div>
            <div class="right">
                <div class="modal-header">
                    <div class="addToCartTitle">Add to Cart</div>
                    <span class="close" onclick="document.getElementById('myModal').style.display = 'none'">&times;</span>
                </div>
                <div style="font-weight: bold;">Price</div>
                <input type="text" value="$20.5" readonly>
                <div style="font-weight: bold;">Name</div>
                <input type="text" value="Piqué Biker Jacket" readonly>
                <div style="font-weight: bold;">Colour</div>
                <select class="dropdown">
                    <option selected>Black</option>
                    <option>Red</option>
                    <option>Blue</option>
                </select>
                <div style="font-weight: bold;">Size</div>
                <select class="dropdown">
                    <option selected>Medium</option>
                    <option>Small</option>
                    <option>Large</option>
                </select>
                <div style="font-weight: bold;">Quantity</div>
                <input id="quantity" class="quantity-input" type="text" value="1" readonly>
                <button onclick="incrementQuantity()">+</button>
                <button class="addToCartButton" onclick="document.getElementById('myModal').style.display = 'none'">Add to Cart</button>
            </div>
        </div>
    </div>

    <script>
        // JavaScript code for the functionality of the page

        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the product elements to open the modal
        var products = document.getElementsByClassName("product");

        // When the user clicks on a product, open the modal
        for (var i = 0; i < products.length; i++) {
            products[i].onclick = function () {
                modal.style.display = "block";
            }
        }

        // When the user clicks on the product, open the modal
        product.onclick = function () {
            modal.style.display = "block";
        }

        // Increase quantity
        function incrementQuantity() {
            var quantityInput = document.getElementById("quantity");
            var quantity = parseInt(quantityInput.value, 10);
            quantityInput.value = quantity + 1;
        }
    </script>
</body>

</html>
