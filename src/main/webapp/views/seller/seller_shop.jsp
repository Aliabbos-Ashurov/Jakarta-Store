<%@ page import="com.pdp.jakartastore.entity.product.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pdp.jakartastore.entity.upload.Upload" %>
<%@ page import="com.pdp.jakartastore.service.product.ProductService" %>
<%@ page import="com.pdp.jakartastore.service.product.ProductServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 10/07/24
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller_shop.css">
    <style>
        form {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif;
            animation: fadeIn 0.8s ease-out;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"],
        input[type="file"],
        textarea {
            width: calc(100% - 24px);
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="file"]:focus,
        textarea:focus {
            border-color: #7b2cc3;
            outline: none;
        }

        textarea {
            resize: vertical;
        }

        button[type="submit"].btn {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            background-color: #7b2cc3;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        button[type="submit"].btn:hover {
            background-color: #5e1e99;
            transform: translateY(-3px);
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<div class="container">
    <%
        String shopId = (String) session.getAttribute("shop_id");
        ProductService productService = new ProductServiceImpl();
        List<Product> products = productService.findByShopId(shopId);
    %>
    <header>
        <h1>Add Product to Your Shop</h1>
    </header>
    <main>
        <!-- Form to add new product -->
        <form action="${pageContext.request.contextPath}/views/seller/seller_shop" method="post"
              enctype="multipart/form-data">
            <div class="form-group">
                <label for="productName">Product Name:</label>
                <input type="text" id="productName" name="productName" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="text" id="price" name="price" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" required>
            </div>
            <div class="form-group">
                <label for="imageFile">Product Image:</label>
                <input type="file" id="imageFile" name="imageFile" accept="image/*" required>
            </div>
            <input type="hidden" id="shop_id" name="shop_id" value="<%= shopId %>">
            <button type="submit" class="btn">Add Product</button>
        </form>

        <!-- List of products in table format with delete option -->
        <h2>Products in Your Shop</h2>
        <div class="product-list">
            <% for (Product product : products) {
                Upload image = product.getImage();
                String imageURL = image.getExtension() + image.getGeneratedName();
            %>
            <div class="product-item">
                <img src="<%= imageURL %>" alt="<%= product.getName() %>" class="product-image">
                <div class="product-details">
                    <h3><%= product.getName() %></h3>
                    <p><%= product.getDescription() %></p>
                    <p>$<%= product.getPrice() %></p>
                    <form action="${pageContext.request.contextPath}/views/seller/seller_delete" method="post">
                        <input type="hidden" name="product_id" value="<%= product.getId() %>">
                        <input type="hidden" name="shop_id" value="<%= shopId %>">
                        <button type="submit" style="background-color: red" class="btn btn-danger">Delete</button>
                    </form>
                </div>
            </div>
            <% } %>
        </div>
    </main>
    <footer>
        <a href="${pageContext.request.contextPath}/views/base/logout" class="logout-link">Logout</a>
    </footer>
</div>
</body>
</html>