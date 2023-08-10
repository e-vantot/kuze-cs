using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CartItem
{
    public string ProductName { get; set; }
    public decimal Price { get; set; }
    public int Quantity { get; set; }
    public string ImageURL { get; set; }
    public decimal TotalPrice { get; set; }

    public CartItem(string productName, decimal price, int quantity, string imageURL, decimal totalPrice)
    {
        ProductName = productName;
        Price = price;
        Quantity = quantity;
        ImageURL = imageURL;
        TotalPrice = totalPrice;
    }
}