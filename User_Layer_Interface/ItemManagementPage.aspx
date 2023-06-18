<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemManagementPage.aspx.cs" Inherits="kuze.ItemManagementPage" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Item Management Page</title>
    <link rel="stylesheet" href="ItemManagementStyles.css"/>
</head>
  
<body>
    <nav class="navbar">
        <div class="navbar-logo">
            <p>KUZE</p>
            <span> admin</span>
        </div>
        <div class="navbar-links">
            <ul class="navbar-list">
                <li><a href="ItemManagementPage.aspx">Item Management</a></li>
                <li><a href="UserManagement.aspx">User Management</a></li>
            </ul>
        </div>
    </nav>
    <form id="itemManagementForm" runat="server">
        <header>
            <div class="banner-title">
                <p>kuzé by ekoism</p>
                <h1>Item Management Page</h1>
            </div>
            <div class="circle"></div>
        </header>
        <div class="container">
            <h1 class="title">Our Products</h1>
            <div class="hamburger-container">
                <div class="hamburger-menu">
                    <div class="menu-icon"></div>
                </div>
                <h2 class="title">New Arrivals</h2>
            </div>
            <nav class="menu">
                <ul>
                    <li>
                        <a href="#"> All Products </a>
                    </li>
                    <li>
                        <a href="#"> Clothing </a>
                    </li>
                    <li>
                        <a href="#"> Shoes </a>
                    </li>
                    <li>
                        <a href="#"> Accessories </a>
                    </li>
                </ul>
            </nav>
            <div class="item-management">
                <div class="row">
                    <div class="product-container">
                        <div class="product-details">
                            <img src="../Images/cloth.jpg" alt="Product 1" class="cloth-img" />
                            <div style="padding: 0px 10px">
                                <div class="name-container">
                                    <h3>Product 1</h3>
                                    <img
                                        width="20"
                                        height="20"
                                        src="https://img.icons8.com/officel/16/filled-like.png"
                                        alt="filled-like"
                                    />
                                </div>
                                <p style="margin-top: 0px">$19.99</p>
                            </div>
                            <div class="button-row">
                                <asp:Button runat="server" class="edit-button" onClick="openEditModal" Text="Edit" />
                                <asp:Button runat="server" class="delete-button" onClick="openDeleteModal" Text="Delete"/>
                            </div>
                        </div>
                    </div>
                    <div class="product-container">
                        <div class="product-details">
                            <img src="../Images/cloth.jpg" alt="Product 2" class="cloth-img" />
                            <div style="padding: 0px 10px">
                                <div class="name-container">
                                    <h3>Product 2</h3>
                                    <img
                                        width="20"
                                        height="20"
                                        src="https://img.icons8.com/officel/16/filled-like.png"
                                        alt="filled-like"
                                    />
                                </div>
                                <p style="margin-top: 0px">$24.99</p>
                            </div>
                            <div class="button-row">
                                <asp:Button runat="server" class="edit-button" onClick="openEditModal" Text="Edit" />
                                <asp:Button runat="server" class="delete-button" onClick="openDeleteModal" Text="Delete"/>
                            </div>
                        </div>
                    </div>
                    <div class="product-container">
                        <div class="product-details">
                            <img src="../Images/cloth.jpg" alt="Product 2" class="cloth-img" />
                            <div style="padding: 0px 10px">
                                <div class="name-container">
                                    <h3>Product 3</h3>
                                    <img
                                        width="20"
                                        height="20"
                                        src="https://img.icons8.com/officel/16/filled-like.png"
                                        alt="filled-like"
                                    />
                                </div>
                                <p style="margin-top: 0px">$34.99</p>
                            </div>
                            <div class="button-row">
                                <asp:Button runat="server" class="edit-button" onClick="openEditModal" Text="Edit" />
                                <asp:Button runat="server" class="delete-button" onClick="openDeleteModal" Text="Delete"/>
                            </div>
                        </div>
                    </div>
                    <div class="product-container">
                        <div class="product-details">
                            <img src="../Images/cloth.jpg" alt="Product 2" class="cloth-img" />
                            <div style="padding: 0px 10px">
                                <div class="name-container">
                                    <h3>Product 4</h3>
                                    <img
                                        width="20"
                                        height="20"
                                        src="https://img.icons8.com/officel/16/filled-like.png"
                                        alt="filled-like"
                                    />
                                </div>
                                <p style="margin-top: 0px">$54.99</p>
                            </div>
                            <div class="button-row">
                                <asp:Button runat="server" class="edit-button" onClick="openEditModal" Text="Edit" />
                                <asp:Button runat="server" class="delete-button" onClick="openDeleteModal" Text="Delete"/>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="product-container">
                        <div class="product-details">
                            <img src="../Images/cloth.jpg" alt="Product 1" class="cloth-img" />
                            <div style="padding: 0px 10px">
                                <div class="name-container">
                                    <h3>Product 1</h3>
                                    <img
                                        width="20"
                                        height="20"
                                        src="https://img.icons8.com/officel/16/filled-like.png"
                                        alt="filled-like"
                                    />
                                </div>
                                <p style="margin-top: 0px">$19.99</p>
                            </div>
                            <div class="button-row">
                                <asp:Button runat="server" class="edit-button" onClick="openEditModal" Text="Edit" />
                                <asp:Button runat="server" class="delete-button" onClick="openDeleteModal" Text="Delete"/>
                            </div>
                        </div>
                    </div>
                    <div class="product-container">
                        <div class="product-details">
                            <img src="../Images/cloth.jpg" alt="Product 2" class="cloth-img" />
                            <div style="padding: 0px 10px">
                                <div class="name-container">
                                    <h3>Product 2</h3>
                                    <img
                                        width="20"
                                        height="20"
                                        src="https://img.icons8.com/officel/16/filled-like.png"
                                        alt="filled-like"
                                    />
                                </div>
                                <p style="margin-top: 0px">$24.99</p>
                            </div>
                            <div class="button-row">
                                <asp:Button runat="server" class="edit-button" onClick="openEditModal" Text="Edit" />
                                <asp:Button runat="server" class="delete-button" onClick="openDeleteModal" Text="Delete"/>
                            </div>
                        </div>
                    </div>
                    <div class="product-container">
                        <div class="product-details">
                            <img src="../Images/cloth.jpg" alt="Product 2" class="cloth-img" />
                            <div style="padding: 0px 10px">
                                <div class="name-container">
                                    <h3>Product 3</h3>
                                    <img
                                        width="20"
                                        height="20"
                                        src="https://img.icons8.com/officel/16/filled-like.png"
                                        alt="filled-like"
                                    />
                                </div>
                                <p style="margin-top: 0px">$34.99</p>
                            </div>
                            <div class="button-row">
                                <asp:Button runat="server" class="edit-button" onClick="openEditModal" Text="Edit" />
                                <asp:Button runat="server" class="delete-button" onClick="openDeleteModal" Text="Delete"/>
                            </div>
                        </div>
                    </div>
                    <div class="product-container">
                        <div class="product-details">
                            <img src="../Images/cloth.jpg" alt="Product 2" class="cloth-img" />
                            <div style="padding: 0px 10px">
                                <div class="name-container">
                                    <h3>Product 4</h3>
                                    <img
                                        width="20"
                                        height="20"
                                        src="https://img.icons8.com/officel/16/filled-like.png"
                                        alt="filled-like"
                                    />
                                </div>
                                <p style="margin-top: 0px">$54.99</p>
                            </div>
                            <div class="button-row">
                                <asp:Button runat="server" class="edit-button" onClick="openEditModal" Text="Edit" />
                                <asp:Button runat="server" class="delete-button" onClick="openDeleteModal" Text="Delete"/>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Add Modal -->
        <div id="addModal" class="edit-modal" runat="server">
            <div class="edit-modal-content">
                <asp:Button class="edit-close" onClick="closeAddModal" Text="&times;" runat="server"></asp:Button>
                <div class="edit-modal-header">
                    <h2 id="H2" runat="server">Add Product</h2>
                </div>
                <div class="edit-modal-body">
                    <div class="image-container">
                        <asp:Image ID="Image2" runat="server" src="../Images/cloth.jpg" alt="Product Image" class="edit-image" />
                    </div>
                    <div class="form-container">
                        <asp:Panel ID="Panel2" runat="server" CssClass="form-innerContainer">
                            <label for="tbAddName">Name:</label>
                            <asp:TextBox ID="tbAddName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Size="12px" ForeColor="Red"
                                ControlToValidate="tbAddName" ErrorMessage="Name is required." Text="Name is required"
                                ValidationGroup="addForm" />

                            <label for="tbAddDescription">Description:</label>
                            <asp:TextBox ID="tbAddDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Font-Size="12px" ForeColor="Red"
                                ControlToValidate="tbAddDescription" ErrorMessage="Description is required." Text="Description is required"
                                ValidationGroup="addForm" />

                            <label for="tbAddPrice">Price:</label>
                            <asp:TextBox ID="tbAddPrice" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Font-Size="12px" ForeColor="Red"
                                ControlToValidate="tbAddPrice" ErrorMessage="Price is required." Text="Price is required."
                                ValidationGroup="addForm" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Font-Size="12px" ForeColor="Red"
                                ControlToValidate="tbAddPrice" ErrorMessage="Invalid price format. Only numeric values are allowed."
                                ValidationExpression="^\d+(\.\d{1,2})?$" ValidationGroup="addForm" />

                            <label for="tbAddImage">Image:</label>
                            <asp:FileUpload ID="tbAddImage" runat="server" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Font-Size="12px" ForeColor="Red"
                                ControlToValidate="tbAddImage" ErrorMessage="Invalid image file. Only .jpg, .jpeg, .png, or .gif files are allowed."
                                ValidationExpression="^.*\.(jpg|jpeg|png|gif)$" Text="Invalid image file. Only .jpg, .jpeg, .png, or .gif files are allowed."
                                ValidationGroup="addForm" />

                            <label for="DropDownList1">Postage:</label>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="">Select Postage</asp:ListItem>
                                <asp:ListItem Value="standard">Standard</asp:ListItem>
                                <asp:ListItem Value="express">Express</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Font-Size="12px" ForeColor="Red"
                                ControlToValidate="DropDownList1" ErrorMessage="Postage is required." Text="Postage is required."
                                ValidationGroup="addForm" />

                            <asp:Button ID="Button1" runat="server" Text="Save" OnClick="addButton_Click" ValidationGroup="addForm"
                                CssClass="save-button" />
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>


        <!-- Edit Modal -->
        <div id="editModal" class="edit-modal" runat="server">
            <div class="edit-modal-content">
                <asp:Button class="edit-close" onClick="closeEditModal" Text="&times;" runat="server"></asp:Button>
                <div class="edit-modal-header">
                    <h2 id="editTitle" runat="server">Edit Product</h2>
                </div>
                <div class="edit-modal-body">
                    <div class="image-container">
                        <asp:Image ID="editImage" runat="server" src="../Images/cloth.jpg" alt="Product Image" class="edit-image" />
                    </div>
                    <div class="form-container">
                        <asp:Panel ID="editPanel" runat="server" CssClass="form-innerContainer">
                            <label for="productName">Name:</label>
                            <asp:TextBox ID="productName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="productNameValidator" runat="server" Font-Size="12px" ForeColor="Red" ControlToValidate="productName" ErrorMessage="Name is required." Text="Name is required" ValidationGroup="editForm" />
                    
                            <label for="productDescription">Description:</label>
                            <asp:TextBox ID="productDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="productDescriptionValidator" runat="server" Font-Size="12px" ForeColor="Red" ControlToValidate="productDescription" ErrorMessage="Description is required." Text="Description is required" ValidationGroup="editForm" />
                    
                            <label for="productPrice">Price:</label>
                            <asp:TextBox ID="productPrice" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="productPriceValidator" runat="server" Font-Size="12px" ForeColor="Red" ControlToValidate="productPrice" ErrorMessage="Price is required." Text="Price is required." ValidationGroup="editForm" />
                    
                            <label for="productImage">Image:</label>
                            <asp:FileUpload ID="productImage" runat="server" />
                            <asp:RegularExpressionValidator ID="imageFileValidator" runat="server" Font-Size="12px" ForeColor="Red" ControlToValidate="productImage" ErrorMessage="Invalid image file. Only .jpg, .jpeg, .png, or .gif files are allowed." ValidationExpression="^.*\.(jpg|jpeg|png|gif)$" Text="Invalid image file. Only .jpg, .jpeg, .png, or .gif files are allowed." ValidationGroup="editForm" />

                            <label for="productPostage">Postage:</label>
                            <asp:DropDownList ID="productPostage" runat="server">
                                <asp:ListItem Value="">Select Postage</asp:ListItem>
                                <asp:ListItem Value="standard">Standard</asp:ListItem>
                                <asp:ListItem Value="express">Express</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="productPostageValidator" runat="server" Font-Size="12px" ForeColor="Red" ControlToValidate="productPostage" ErrorMessage="Postage is required." Text="Postage is required." ValidationGroup="editForm" />

                    
                            <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" ValidationGroup="editForm" CssClass="save-button" />
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete modal -->
        <div id="deleteModal" class="delete-modal" runat="server">
            <div class="delete-modal-content">
                <asp:Button class="edit-close" onClick="closeDeleteModal" Text=&times; runat='server'></asp:Button>
                <div class="delete-modal-header">
                    <h2>Delete Product</h2>
                </div>
                <div class="delete-modal-body">
                    <p>Are you sure you want to delete this product?</p>
                </div>
                <div class="delete-modal-footer">
                    <asp:Button ID="deleteCancelButton" runat="server" CssClass="delete-cancel-button" Text="Cancel" OnClick="closeDeleteModal" />
                    <asp:Button ID="deleteDeleteButton" runat="server" CssClass="delete-delete-button" Text="Delete" OnClick="deleteProduct_Click" />
                </div>
            </div>
        </div>
        <div class="addButtonContainer">
              <asp:Button ID="addProductButton" runat="server" CssClass="add-product-button" Text="Add Product" OnClick="openAddModal_Click" />
        </div>
        <asp:ScriptManager runat="server"></asp:ScriptManager>
    </form>
     <!--Footer--> 
        <footer class="footer">
            <p>© 2023 KUZE by ekoism. All rights reserved.</p>
        </footer>
</body>
</html>


