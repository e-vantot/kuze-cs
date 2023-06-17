<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="kuze.ShoppingCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Cart</title>
    <style>
        body, div, span {
            font-family: 'Inter', sans-serif;
            color: #808080;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start; /* Align content at the top */
            height: 100vh;
        }

        .title {
            font-size: 32px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 50px;
        }

        .product-image {
            width: 100px;
            height: 100px;
            object-fit: contain;
        }

        .price {
            font-size: 16px;
            color: #FF6699;
        }

        .quantity {
            font-size: 16px;
            color: #808080;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .checkout-btn {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="title">Shopping Cart</div>
            <table>
                <tr>
                    <th style="width: 20%;">Product Image</th>
                    <th style="width: 20%;">Product Name</th>
                    <th style="width: 15%;">Price</th>
                    <th style="width: 15%;">Quantity</th>
                    <th style="width: 15%;">Total Price</th>
                </tr>
                <% foreach (CartItem item in CartItems) { %>
                    <tr>
                        <td>
                            <div class="product-image">
                                <img class="product-image" src="./Images/<%= item.ProductImage %>" alt="<%= item.ProductImage %>" />
                            </div>
                        </td>
                        <td>
                            <div class="product-name"><%= item.ProductName %></div>
                        </td>
                        <td>
                            <div class="price">$<%= item.Price %></div>
                        </td>
                        <td>
                            <div class="quantity">Quantity: <%= item.Quantity %></div>
                        </td>
                        <td>
                            <div class="price">$<%= item.TotalPrice %></div>
                        </td>
                    </tr>
                <% } %>
            </table>
            <div class="checkout-btn">
                <asp:Button ID="btnCheckout" runat="server" Font-Bold="True" Font-Names="Calibri" Text="C H E C K O U T" OnClick="Checkout_Click" BackColor="#088434" ForeColor="White" Height="45px" Width="221px" />
            </div>
        </div>
    </form>
</body>
</html>