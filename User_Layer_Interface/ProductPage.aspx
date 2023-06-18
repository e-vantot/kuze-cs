<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="kuze.ProductPage" %>

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
            font-family: 'Inter', sans-serif;
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
            padding: 10px;
            font-size: 12px;
            cursor: pointer;
            background-color: green;
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

        .dropdown {
            margin-right: 5px;
        }

        .quantity-input,
        .size-input {
            width: 34px;
        }

        .footer {
        background-color: lightslategrey;
        color:white;
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
                <a href="#">Clothes</a>
                <a href="#">Pants</a>
                <a href="#">Hoodies</a>
                <a href="#">Dresses</a>
            </div>

            <!-- Products section -->
            <div class="products">
                <!-- Example Product -->
                <div class="product" data-productid="1">
                    <img src="../images/tshirt.jpg?" alt="product name" />
                    <div class="product-name">Biker Jacket</div>
                    <div class="stars">★★★★★</div>
                    <div class="price">$99.99</div>
                    <div class="product-details">
                        <div class="dropdown">
                            <asp:DropDownList ID="quantityDropdown1" runat="server" CssClass="quantity-input">
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="dropdown">
                            <asp:DropDownList ID="sizeDropdown1" runat="server" CssClass="quantity-input">
                                <asp:ListItem Text="S" Value="S"></asp:ListItem>
                                <asp:ListItem Text="M" Value="M"></asp:ListItem>
                                <asp:ListItem Text="L" Value="L"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="dropdown">
                            <asp:Button ID="addToCartButton1" runat="server" CssClass="addToCartButton" Text="Add to Cart" OnClick="AddToCart_Click" CommandArgument="1" />
                        </div>
                    </div>
                </div>
                <div class="product" data-productid="2">
                    <img src="../images/varsityjacket.jpg?" alt="product name" />
                    <div class="product-name">Varsity Jacket</div>
                    <div class="stars">★★★★★</div>
                    <div class="price">$129.99</div>
                    <div class="product-details">
                        <div class="dropdown">
                            <asp:DropDownList ID="quantityDropdown2" runat="server" CssClass="quantity-input">
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="dropdown">
                            <asp:DropDownList ID="sizeDropdown2" runat="server" CssClass="quantity-input">
                                <asp:ListItem Text="S" Value="S"></asp:ListItem>
                                <asp:ListItem Text="M" Value="M"></asp:ListItem>
                                <asp:ListItem Text="L" Value="L"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="dropdown">
                            <asp:Button ID="addToCartButton2" runat="server" CssClass="addToCartButton" Text="Add to Cart" OnClick="AddToCart_Click" CommandArgument="2" />
                        </div>
                    </div>
                </div>
                <div class="product" data-productid="3">
                    <img src="../images/sexyskirt.jpg?" alt="product name" />
                    <div class="product-name">Sexy Skirt</div>
                    <div class="stars">★★★★</div>
                    <div class="price">$39.99</div>
                    <div class="product-details">
                        <div class="dropdown">
                            <asp:DropDownList ID="quantityDropdown3" runat="server" CssClass="quantity-input">
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="dropdown">

                            <asp:DropDownList ID="sizeDropdown3" runat="server" CssClass="quantity-input">
                                <asp:ListItem Text="S" Value="S"></asp:ListItem>
                                <asp:ListItem Text="M" Value="M"></asp:ListItem>
                                <asp:ListItem Text="L" Value="L"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="dropdown">
                            <asp:Button ID="addToCartButton3" runat="server" CssClass="addToCartButton" Text="Add to Cart" OnClick="AddToCart_Click" CommandArgument="3" />
                        </div>
                    </div>
                </div>
                <div class="product" data-productid="4">
                    <img src="../images/bikini.jpg?" alt="product name" />
                    <div class="product-name">Bikini</div>
                    <div class="stars">★★★</div>
                    <div class="price">$15.59</div>
                    <div class="product-details">
                        <div class="dropdown">
                            <asp:DropDownList ID="quantityDropdown4" runat="server" CssClass="quantity-input">
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="dropdown">
                            <asp:DropDownList ID="sizeDropdown4" runat="server" CssClass="quantity-input">
                                <asp:ListItem Text="S" Value="S"></asp:ListItem>
                                <asp:ListItem Text="M" Value="M"></asp:ListItem>
                                <asp:ListItem Text="L" Value="L"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="dropdown">
                            <asp:Button ID="addToCartButton4" runat="server" CssClass="addToCartButton" Text="Add to Cart" OnClick="AddToCart_Click" CommandArgument="4" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!--Footer--> 
    <footer class="footer">
      <p>© 2023 KUZE by ekoism. All rights reserved.</p>
    </footer>
</body>

</html>
