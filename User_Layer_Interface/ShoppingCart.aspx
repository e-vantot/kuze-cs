<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="kuze.ShoppingCart" %>

<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="CartStyles.css" />
</head>
<body>
    <!-- Navigation Bar -->
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
        <div class="container">
            <div class="title">Shopping Cart</div>
            <% if (TotalCartPrice > 0)
                { %>
            <table>
                <tr>
                    <th style="width: 20%;">Product Image</th>
                    <th style="width: 20%;">Product Name</th>
                    <th style="width: 15%;">Price</th>
                    <th style="width: 15%;">Quantity</th>
                    <th style="width: 15%;">Total Price</th>
                </tr>
                <asp:Repeater ID="cartRepeater" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div class="product-image">
                                    <img class="product-image" src='<%# "/Images/" + Eval("ImageURL") %>' alt='<%# Eval("ProductName") %>' />
                                </div>
                            </td>
                            <td>
                                <div class="product-name"><%# Eval("ProductName") %></div>
                            </td>
                            <td>
                                <div class="price">$<%# Eval("Price") %></div>
                            </td>
                            <td>
                                <div class="quantity">Quantity: <%# Eval("Quantity") %></div>
                            </td>
                            <td>
                                <div class="price">$<%# Eval("TotalPrice") %></div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <td colspan="5" class="total-price-cell">Total Cart Price: $<%= TotalCartPrice %>
                    </td>
                </tr>
            </table>
            <div class="checkout-btn">
                <asp:Button ID="btnCheckout" runat="server" Text="C H E C K O U T" OnClick="btnCheckout_Click" Font-Bold="True" Font-Names="Calibri" BackColor="#088434" ForeColor="White" Height="45px" Width="221px" />
            </div>
            <div class="checkout-btn">
                <asp:Button ID="btnClear" runat="server" Text="C L E A R   C A R T" OnClick="btnClearShopping_Click" Font-Bold="True" Font-Names="Calibri" BackColor="#FF0000" ForeColor="White" Height="45px" Width="221px" />
            </div>
            <% }
                else
                { %>
            <div class="empty-cart-message">Shopping Cart is Empty</div>
            <div class="checkout-btn">
                <asp:Button ID="btnStartShopping" runat="server" Text="S H O P   H E R E" OnClick="btnStartShopping_Click" Font-Bold="True" Font-Names="Calibri" BackColor="#088434" ForeColor="White" Height="45px" Width="221px" />
            </div>
            <% } %>
        </div>
    </form>

    <!-- Footer -->
    <footer class="footer">
        <p>© 2023 KUZE by ekoism. All rights reserved.</p>
    </footer>
</body>
</html>
