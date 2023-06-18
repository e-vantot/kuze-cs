using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace kuze
{
    public partial class ProductPage : System.Web.UI.Page
    {
        protected decimal totalPrice = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitializeCart();
                LoadCartItems();
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int productId = Convert.ToInt32(btn.CommandArgument);
            string productName = GetProductName(productId);
            decimal price = GetProductPrice(productId);
            int quantity = GetSelectedQuantity(productId);
            string size = GetProductSize(productId);
            string productImage = GetProductImage(productId);

            // Calculate the total price
            totalPrice = CalculateTotalPrice();

            CartItem cartItem = new CartItem(productId, productName, price, quantity, size, productImage, totalPrice);
            AddItemToCart(cartItem);

            LoadCartItems();
        }

        private void InitializeCart()
        {
            if (Session["CartItems"] == null)
            {
                List<CartItem> cartItems = new List<CartItem>();
                Session["CartItems"] = cartItems;
            }
        }

        private void AddItemToCart(CartItem item)
        {
            List<CartItem> cartItems = (List<CartItem>)Session["CartItems"];
            cartItems.Add(item);
        }

        private List<CartItem> GetCartItems()
        {
            List<CartItem> cartItems = new List<CartItem>();

            // Retrieve the cart items from the session
            if (Session["CartItems"] != null)
            {
                cartItems = (List<CartItem>)Session["CartItems"];
            }

            return cartItems;
        }

        private decimal CalculateTotalPrice()
        {
        decimal totalPrice = 0;

        // Retrieve the cart items from the session or storage mechanism
        List<CartItem> cartItems = GetCartItems();

        // Calculate the total price by summing up the prices multiplied by quantities
        foreach (CartItem cartItem in cartItems)
        {
            totalPrice += cartItem.Price * cartItem.Quantity;
        }

        return totalPrice;
    }

        private string GetProductName(int productId)
        {
            // Retrieve the product name based on the product ID.
            // Replace this with your logic to fetch the product name from the database or any other data source.
            switch (productId)
            {
                case 1:
                    return "Biker Jacket";
                case 2:
                    return "Varsity Jacket";
                case 3:
                    return "Sexy Skirt";
                case 4:
                    return "Bikini";
                default:
                    return string.Empty;
            }
        }

        private decimal GetProductPrice(int productId)
        {
            // Retrieve the product price based on the product ID.
            // Replace this with your logic to fetch the product price from the database or any other data source.
            switch (productId)
            {
                case 1:
                    return 99.99m;
                case 2:
                    return 129.99m;
                case 3:
                    return 39.99m;
                case 4:
                    return 15.59m;
                default:
                    return 0.00m;
            }
        }

        private int GetSelectedQuantity(int productId)
        {
            DropDownList quantityDropdown;
            switch (productId)
            {
                case 1:
                    quantityDropdown = quantityDropdown1;
                    break;
                case 2:
                    quantityDropdown = quantityDropdown2;
                    break;
                case 3:
                    quantityDropdown = quantityDropdown3;
                    break;
                case 4:
                    quantityDropdown = quantityDropdown4;
                    break;
                default:
                    return 0;
            }

            return Convert.ToInt32(quantityDropdown.SelectedValue);
        }

        private string GetProductSize(int productId)
        {
            DropDownList sizeDropdown;
            switch (productId)
            {
                case 1:
                    sizeDropdown = sizeDropdown1;
                    return sizeDropdown.SelectedValue;
                case 2:
                    sizeDropdown = sizeDropdown2;
                    return sizeDropdown.SelectedValue;
                case 3:
                    sizeDropdown = sizeDropdown3;
                    return sizeDropdown.SelectedValue;
                case 4:
                    sizeDropdown = sizeDropdown4;
                    return sizeDropdown.SelectedValue;
                default:
                    return string.Empty;
            }
        }

        private string GetProductImage(int productId)
        {
            // Retrieve the product image URL based on the product ID.
            // Replace this with your logic to fetch the product image URL from the database or any other data source.
            switch (productId)
            {
                case 1:
                    return "tshirt.jpg";
                case 2:
                    return "varsityjacket.jpg";
                case 3:
                    return "sexyskirt.jpg";
                case 4:
                    return "bikini.jpg";
                default:
                    return string.Empty;
            }
        }

        private void LoadCartItems()
        {
            List<CartItem> cartItems = (List<CartItem>)Session["CartItems"];
            decimal totalPrice = CalculateTotalPrice(); // Calculate the total price

            if (cartItems != null)
            {
                // Display the cart items on the page.
                // You can modify this part to suit your layout and design.
                foreach (CartItem item in cartItems)
                {
                    // Add code to display the cart items on the page
                }
            }
        }
    }
}

public class CartItem
{
    public int ProductId { get; set; }
    public string ProductName { get; set; }
    public decimal Price { get; set; }
    public int Quantity { get; set; }
    public string Size { get; set; }
    public string ProductImage { get; set; }
    public decimal TotalPrice { get; set; }

    public CartItem(int productId, string productName, decimal price, int quantity, string size, string productImage, decimal totalPrice)
    {
        ProductId = productId;
        ProductName = productName;
        Price = price;
        Quantity = quantity;
        Size = Size;
        ProductImage = productImage;
        TotalPrice = totalPrice;
    }
}