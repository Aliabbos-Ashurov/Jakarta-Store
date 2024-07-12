<%@ page import="com.pdp.jakartastore.service.product.ProductService" %>
<%@ page import="com.pdp.jakartastore.service.product.ProductServiceImpl" %>
<%@ page import="com.pdp.jakartastore.entity.product.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pdp.jakartastore.entity.upload.Upload" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop - Products</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/shop.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }
    </style>
</head>
<body>
<section class="product-section">
    <div class="container">
        <h2 class="section-title animate__animated animate__fadeIn">Products</h2>

        <div class="product-grid">
            <%
                String IMAGE_NOT_FOUND_URL = "../../resources/img/image_not_found.png";
                ProductService productService = new ProductServiceImpl();
                List<Product> products = productService.findAll();
                for (Product product : products) {
                    Upload image = product.getImage();
                    String imageUrl = image != null ? image.getExtension() + image.getGeneratedName() : IMAGE_NOT_FOUND_URL;
            %>
            <div class="product animate__animated animate__fadeInUp">
                <form action="${pageContext.request.contextPath}/views/base/shop" method="post">
                    <input type="hidden" name="product_id" value="<%= product.getId() %>">
                    <div class="product-container">
                        <div class="product-image">
                            <img src="<%= imageUrl %>" alt="<%= product.getName() %>">
                        </div>
                        <div class="product-info">
                            <h3 class="product-name"><%= product.getName() %></h3>
                            <span class="product-price">$<%= product.getPrice() %></span>
                        </div>
                        <div class="product-button">
                            <button type="submit" class="info-button">Info</button>
                        </div>
                    </div>
                </form>
            </div>
            <% } %>
        </div>
    </div>
</section>

<footer>
    <div class="footer-content">
        <div class="about-us">
            <h3>About Us</h3>
            <p>Welcome to our shop! We are dedicated to providing the best quality products and exceptional customer
                service. Our journey started with a passion for excellence and a commitment to our customers. Thank you
                for choosing us!</p>
        </div>
        <div class="need-help">
            <h3>Need Help</h3>
            <p>If you have any questions or need assistance, feel free to reach out to our support team. We are here to
                help you with your purchases, returns, and any other inquiries you may have. Your satisfaction is our
                priority.</p>
        </div>
        <div class="contact-us">
            <h3>Contact Us</h3>
            <p>123 Main Street, London, UK</p>
            <p>+01 12345678901</p>
            <p>support@ourshop.com</p>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2024 All Rights Reserved by Our Shop</p>
    </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>