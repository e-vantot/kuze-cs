﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemManagementPage.aspx.cs" Inherits="kuze.ItemManagementPage"  %>

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
                <h2 ID="title" class="title" runat="server">All</h2>
            </div>
            <nav class="menu">
                <ul>
                    <li class="menu-item">
                        <asp:LinkButton runat="server" OnClick='allLinkButton_Click'>All</asp:LinkButton>
                     </li>
                    <asp:Repeater ID="categoryRepeater" runat="server" OnItemCommand="categoryRepeater_ItemCommand">
                        <ItemTemplate>
                            <li class="menu-item">
                                <asp:LinkButton runat="server" CommandName="SelectCategory" CommandArgument='<%# Eval("Category") %>'><%# Eval("Category") %></asp:LinkButton>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </nav>
        </div>

  <asp:GridView ID="productGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="productGridView_RowCommand">
    <Columns>
        <asp:BoundField DataField="ProductID" HeaderText="ProductID" />
        <asp:BoundField DataField="Name" HeaderText="Name" />
        <asp:BoundField DataField="Description" HeaderText="Description" />
        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
        <asp:BoundField DataField="Size" HeaderText="Size" />
        <asp:BoundField DataField="Colour" HeaderText="Colour" />
        <asp:BoundField DataField="QuantityInStock" HeaderText="Quantity In Stock" />
        <asp:BoundField DataField="Category" HeaderText="Category" />
        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image runat="server" ID="imgProduct" ImageUrl='<%# Eval("ImageUrl") %>' Width="100" Height="100" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>
                <asp:Button runat="server" ID="btnEdit" Text="Edit" CommandName="EditProduct" CommandArgument='<%# Eval("ProductID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:Button runat="server" ID="btnDelete" Text="Delete" CommandName="DeleteProduct" CommandArgument='<%# Eval("ProductID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


            <asp:HiddenField ID="hfEditedProductID" runat="server" />


<!-- Add Modal -->
<div id="addModal" class="edit-modal" runat="server">
    <div class="edit-modal-content">
        <asp:Button class="edit-close" onClick="closeAddModal" Text="&times;" runat="server"></asp:Button>
        <div class="edit-modal-header">
            <h2 id="H2" runat="server">Add Product</h2>
        </div>
        <div class="edit-modal-body">
            <div class="image-container">
                <asp:Image ID="Image2" runat="server" alt="Product Image" class="edit-image" />
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


                    <label for="tbAddSize">Size:</label>
                    <asp:TextBox ID="tbAddSize" runat="server"></asp:TextBox>

                    <label for="tbAddColour">Colour:</label>
                    <asp:TextBox ID="tbAddColour" runat="server"></asp:TextBox>

                    <label for="tbAddQuantity">Quantity in Stock:</label>
                    <asp:TextBox ID="tbAddQuantity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Font-Size="12px" ForeColor="Red"
                        ControlToValidate="tbAddQuantity" ErrorMessage="Quantity is required." Text="Quantity is required."
                        ValidationGroup="addForm" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Font-Size="12px" ForeColor="Red"
                        ControlToValidate="tbAddQuantity" ErrorMessage="Invalid quantity format. Only positive integers are allowed."
                        ValidationExpression="^\d+$" ValidationGroup="addForm" />

                    <label for="tbAddCategory">Category:</label>
                    <asp:TextBox ID="tbAddCategory" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Font-Size="12px" ForeColor="Red"
                        ControlToValidate="tbAddCategory" ErrorMessage="Category is required." Text="Category is required"
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
                <asp:Image ID="editImage" runat="server" alt="Product Image" class="edit-image" />
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

                    <label for="productSize">Size:</label>
                    <asp:TextBox ID="productSize" runat="server"></asp:TextBox>

                    <label for="productColour">Colour:</label>
                    <asp:TextBox ID="productColour" runat="server"></asp:TextBox>

                    <label for="productQuantity">Quantity in Stock:</label>
                    <asp:TextBox ID="productQuantity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="productQuantityValidator" runat="server" Font-Size="12px" ForeColor="Red" ControlToValidate="productQuantity" ErrorMessage="Quantity is required." Text="Quantity is required." ValidationGroup="editForm" />
                    <asp:RegularExpressionValidator ID="quantityValidator" runat="server" Font-Size="12px" ForeColor="Red" ControlToValidate="productQuantity" ErrorMessage="Invalid quantity format. Only positive integers are allowed." ValidationExpression="^\d+$" ValidationGroup="editForm" />

                    <label for="productCategory">Category:</label>
                    <asp:TextBox ID="productCategory" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Font-Size="12px" ForeColor="Red"
                        ControlToValidate="productCategory" ErrorMessage="Category is required." Text="Category is required"
                        ValidationGroup="addForm" />

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