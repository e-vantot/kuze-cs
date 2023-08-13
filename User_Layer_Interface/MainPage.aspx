<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="kuze.MainPage" %>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="MainPageStyles.css" />
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
        <!-- Banner Section -->
        <div class="banner">
            <div class="banner-content">
                <h5>kuze by ekoism</h5>
                <h1>Embrace timeless style with a conscience.</h1>
                <h3>Let the elegance of conscious fashion inspire and ignite a harmonious future for generations to come.</h3>
                <a href="ProductPage.aspx" class="button">Shop Now</a>
            </div>
            <img src="/Images/kuze-banner.png" alt="Page Banner" />
        </div>

        <!-- Featured Section -->
        <div class="featured-container">
            <div class="featured">
                <img src="/Images/bestfeatured.png" alt="Dress Collection 2023" />
                <label class="featured-item">Featured Dresses</label>
                <a href="ProductPage.aspx?category=Dresses">
                    <label>SHOP NOW</label>
                </a>
            </div>
            <div class="featured">
                <img src="/Images/clothingcollections.png" alt="Clothing Collections 2023" />
                <label class="featured-item">Featured Tops</label>
                <a href="ProductPage?category=Clothes">
                    <label>SHOP NOW</label>
                </a>
            </div>
            <div class="featured">
                <img src="/Images/accessories.png" alt="Accessories" />
                <label class="featured-item">Accessories</label>
                <a href="ProductPage?category=Accessories">
                    <label>SHOP NOW</label>
                </a>
            </div>
            <div class="featured">
                <img src="/Images/bottoms.png" alt="Bottoms" />
                <label class="featured-item">Featured Bottoms</label>
                <a href="ProductPage?category=Pants">
                    <label>SHOP NOW</label>
                </a>
            </div>
        </div>

        <!-- Content Section -->
        <div class="content">
            <div class="content-left">
                <img src="/Images/kuze-mainpg.png" alt="Kuze Main" />
            </div>
            <div class="content-right">
                <h3>Tag Us on Socials</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                <h5>#kuzebyekoism</h5>
            </div>
        </div>

        <!-- Sustainable Labels Section -->
        <div class="content-title">
            <h3>Sustainable Labels</h3>
        </div>
        <div class="suslabels-container">
            <img src="/Images/suslabel1.png" alt="Organic Textile Certification" />
            <img src="/Images/suslabel2.png" alt="Labels for Recycled Materials" />
            <img src="/Images/suslabel3.png" alt="Responsible Wool Standard" />
            <img src="/Images/suslabel4.png" alt="Made Safe" />
            <img src="/Images/suslabel5.png" alt="Certified Vegan" />
        </div>
    </form>
    <!--Footer-->
    <footer class="footer">
        <p>© 2023 KUZE by ekoism. All rights reserved.</p>
    </footer>
</body>
</html>
