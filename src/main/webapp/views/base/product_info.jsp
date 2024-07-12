<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 09/07/24
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pdp.jakartastore.entity.product.Product" %>
<%@ page import="com.pdp.jakartastore.entity.upload.Upload" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <link rel="stylesheet" href="../../resources/css/product_info.css">
    <!-- Include Animate.css for animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
</head>
<body>
<div class="split-container">
    <%
        String IMAGE_NOT_FOUND_URL = "../../resources/img/image_not_found.png";
        Product product = (Product) request.getAttribute("product");
        Upload image = product.getImage();
        String imageUrl = image != null ? image.getExtension() + image.getGeneratedName() : IMAGE_NOT_FOUND_URL;
    %>
    <div class="left-half animate__animated animate__fadeInLeft">
        <div class="product-image">
            <img src="<%= imageUrl %>" alt="Product Image">
        </div>
    </div>
    <div class="right-half animate__animated animate__fadeInRight">
        <div class="product-details">
            <h1 class="animate__animated animate__bounceInDown"><%= product.getName() %></h1>
            <p class="price animate__animated animate__fadeIn">$<%= product.getPrice() %></p>
            <p class="description animate__animated animate__fadeIn"><%= product.getDescription() %></p>
            <form action="${pageContext.request.contextPath}/views/base/add_to_cart" method="post" class="animate__animated animate__fadeIn">
                <!-- Hidden form fields -->
                <input type="hidden" name="product_id" value="<%= product.getId() %>">
                <input type="hidden" name="user_id" value="<%= session.getAttribute("user_id") %>">
                <input type="hidden" name="count" value="1">
                <div class="add-to-cart">
                    <input type="number" name="quantity" value="1" min="1" class="animate__animated animate__fadeInUp">
                    <button type="submit" class="animate__animated animate__fadeInUp">Add to cart</button>
                </div>
            </form>
            <p class="category animate__animated animate__fadeIn"><span>Category:</span> <%= product.getCategory() %></p>
        </div>
    </div>
</div>
</body>
</html>