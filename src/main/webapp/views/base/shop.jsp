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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        .section-title {
            text-align: center;
            margin-bottom: 20px;
            font-size: 2em;
            color: #7b2cc3;
        }

        /* Product Grid Styles */
        .product-section {
            display: flex;
        }

        .category-filter {
            width: 15%;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-right: 20px;
        }

        .category-filter h3 {
            margin-bottom: 10px;
        }

        .category-filter ul {
            list-style: none;
            padding: 0;
        }

        .category-filter ul li {
            margin-bottom: 10px;
        }

        .category-filter ul li a {
            text-decoration: none;
            color: #333;
            transition: color 0.3s;
        }

        .category-filter ul li a:hover {
            color: #7b2cc3;
        }

        .filter-label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .filter-input {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .filter-button {
            background-color: #7b2cc3;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }

        .filter-button:hover {
            background-color: #6a25ac;
        }

        .product-grid {
            width: 80%;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .product {
            width: 30%;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            overflow: hidden;
            transition: transform 0.3s;
        }

        .product:hover {
            transform: translateY(-10px);
        }

        .product-container {
            padding: 10px;
        }

        .product-image img {
            width: 100%;
            height: auto;
        }

        .product-info {
            text-align: center;
            margin-top: 10px;
        }

        .product-name {
            font-size: 1.1em;
            color: #7b2cc3;
        }

        .product-price {
            font-size: 0.9em;
            color: #555;
        }

        .product-button {
            text-align: center;
            margin-top: 10px;
        }

        .info-button {
            background-color: #7b2cc3;
            color: #fff;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .info-button:hover {
            background-color: #6a25ac;
        }

        /* Footer Styles */
        footer {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
        }

        .footer-content {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }

        .footer-content div {
            width: 30%;
        }

        .footer-content h3 {
            margin-bottom: 10px;
        }

        .footer-content p {
            margin: 0;
            font-size: 0.9em;
            line-height: 1.6;
        }

        .footer-bottom {
            text-align: center;
            font-size: 0.8em;
            border-top: 1px solid #444;
            padding-top: 10px;
        }

        @media (max-width: 768px) {
            .container {
                width: 100%;
            }

            .product-section {
                flex-direction: column;
            }

            .category-filter {
                width: 100%;
                margin-bottom: 20px;
            }

            .product-grid {
                width: 100%;
            }

            .product {
                width: 100%;
            }

            .footer-content {
                flex-direction: column;
                align-items: center;
            }

            .footer-content div {
                width: 80%;
                margin-bottom: 20px;
            }
        }
    </style>
</head>

<body>
<section class="product-section">
    <%
        String IMAGE_NOT_FOUND_URL = "../../resources/img/image_not_found.png";
        ProductService productService = new ProductServiceImpl();
        List<String> categories = productService.getCategories();
    %>
    <div class="category-filter">
        <h3>Categories</h3>
        <form action="${pageContext.request.contextPath}/views/base/shop" method="get">
            <ul>
                <li>
                    <input type="radio" id="all" name="category" value="ALL">
                    <label for="all">ALL</label>
                </li>
                <%
                    for (String category : categories) { %>
                <li>
                    <input type="radio" id="<%= category %>" name="category" value="<%= category %>">
                    <label for="<%= category %>"><%= category %></label>
                </li>
                <% } %>
            </ul>
            <h3>Filter by Price</h3>
            <label for="low-price" class="filter-label">Low Price</label>
            <input type="number" id="low-price" class="filter-input" name="low-price" min="1">
            <label for="max-price" class="filter-label">Max Price</label>
            <input type="number" id="max-price" class="filter-input" name="max-price" min="1">
            <button type="submit" class="filter-button animate__animated animate__pulse">Apply Filters</button>
        </form>
    </div>
    <div class="container">
        <h2 class="section-title animate__animated animate__fadeIn">Products</h2>
        <div class="product-grid">
            <%
                @SuppressWarnings("unchecked")
                List<Product> products = (List<Product>) request.getAttribute("products");
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
                            <button type="submit" class="info-button animate__animated animate__bounceIn">Info</button>
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


<!--

-->