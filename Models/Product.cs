using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Product
{
    public int ProductID { get; set; }
    public string Name { get; set; }
    // Add other product properties as needed

    public Product(int productId, string name)
    {
        ProductID = productId;
        Name = name;
        // Set other product properties here
    }
}