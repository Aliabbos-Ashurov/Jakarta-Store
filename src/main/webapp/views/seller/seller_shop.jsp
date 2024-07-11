<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 10/07/24
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller_shop.css">
</head>
<body>
<div class="container">
    <header>
        <h1>Add Product to Your Shop</h1>
    </header>
    <main>
        <%
            String shopId = (String) session.getAttribute("shop_id");
            System.out.println("Shop ID: " + shopId);
        %>
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
            <input type="hidden" id="shop_id" name="shop_id" value="<%=shopId%>">
            <button type="submit" class="btn btn-primary">Add Product</button>
        </form>
    </main>
    <footer>
        <a href="${pageContext.request.contextPath}/views/base/logout" class="logout-link">Logout</a>
    </footer>
</div>
</body>
</html>