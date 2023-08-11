<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="kuze.ProductPage" %>

<!-- This is a product search page written in HTML and C# -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Product Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* CSS styles for the page layout and design */

        body,
        html {
            font-family: 'Inter', sans-serif;
        }


        /*Nav Bar*/
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #fff;
            padding: 15px;
        }

            .navbar p {
                color: darkslateblue;
                font-size: 30px;
                font-weight: 600;
                padding: 0 auto;
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
                    font-weight: 500;
                    padding: 8px 10px;
                    border-bottom: 2px solid transparent;
                    transition: border-color 0.3s;
                }

                    .navbar-list li a:hover {
                        border-color: #ffc107;
                        font-weight: 600;
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
                color: rosybrown;
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
            position: relative;
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
            color: sandybrown;
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
            margin-left: 16px;
        }

        .quantity-input {
            margin-left: 20px;
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
            padding: 10px;
            font-size: 12px;
            cursor: pointer;
            background-color: darkslategrey;
            color: white;
            border: none;
            border-radius: 5px;
            width: 100%;
            position: absolute;
            top: 31px;
            right: 10px;
        }

        .product-details {
            position: absolute;
            bottom: 44px;
            left: 125px;
            display: flex;
            align-items: flex-end;
        }


        .quantity-input,
        .size-input {
            width: 34px;
        }

        .footer {
            background-color: lightslategrey;
            color: white;
            padding: 30px;
            text-align: center;
            margin-top: 100px;
        }


        /* Media Queries for Responsive Design */
        @media only screen and (max-width: 768px) {
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
            <h2 style="font-size: 32px">Search Results</h2>
        </div>

        <div class="content">
            <!-- Sidebar section -->
            <div class="sidebar">
                <div>Refine your results</div>
                <div>Category</div>
                <a href="ProductPage.aspx">All</a>
                <!-- Link to show all products -->
                <a href="ProductPage.aspx?category=Clothes">Clothes</a>
                <a href="ProductPage.aspx?category=Pants">Pants</a>
                <a href="ProductPage.aspx?category=Hoodies">Hoodies</a>
                <a href="ProductPage.aspx?category=Dresses">Dresses</a>
                <a href="ProductPage.aspx?category=Accessories">Accessories</a>
            </div>

            <!-- Products section -->
            <div class="products">
                <!-- Example Product -->
                <asp:Repeater ID="productRepeater" runat="server" OnItemDataBound="productRepeater_ItemDataBound">
                    <ItemTemplate>
                        <div class="product" data-productid='<%# Eval("ProductId") %>'>
                            <img src='<%# "/Images/" + Eval("ImageUrl") %>' alt='<%# "Image for " + Eval("Name") %>' />
                            <div class="product-name"><%# Eval("Name") %></div>
                            <div class="stars">★★★★★</div>
                            <div class="price"><%# Eval("Price", "{0:C}") %></div>
                            <div class="product-details">
                                <div class="dropdown">
                                    <asp:DropDownList ID="quantityDropdown" runat="server" CssClass="quantity-input">
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="dropdown">
                                    <asp:Button ID="addToCartButton" runat="server" CssClass="addToCartButton" OnClick="addToCartButton_Click" Text="Add to Cart" CommandArgument='<%# Eval("ProductId") %>' />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
    <!--Footer-->
    <footer class="footer">
        <p>© 2023 KUZE by ekoism. All rights reserved.</p>
    </footer>
</body>

</html>
