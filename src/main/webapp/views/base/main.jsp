<%@ page import="com.pdp.jakartastore.entity.user.Users" %>
<%@ page import="com.pdp.jakartastore.service.user.UserService" %>
<%@ page import="com.pdp.jakartastore.service.user.UserServiceImpl" %>
<%@ page import="com.pdp.jakartastore.service.product.ProductService" %>
<%@ page import="com.pdp.jakartastore.service.product.ProductServiceImpl" %>
<%@ page import="com.pdp.jakartastore.entity.product.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pdp.jakartastore.entity.upload.Upload" %>
<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 08/07/24
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GAMING Shop</title>
   <style>
       body {
           font-family: Arial, sans-serif;
           margin: 0;
           padding: 0;
       }

       header {
           background-color: #fff;
           padding: 10px 0;
           box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
           animation: slideDown 0.5s ease-in-out;
       }

       header nav ul {
           list-style: none;
           margin: 0;
           padding: 0;
           display: flex;
           justify-content: center;
       }

       header nav ul li {
           margin: 0 15px;
       }

       header nav ul li a {
           text-decoration: none;
           color: #000;
           font-weight: bold;
           position: relative;
       }

       header nav ul li a::before {
           content: "";
           position: absolute;
           width: 0;
           height: 2px;
           bottom: 0;
           left: 0;
           background-color: #7b2cc3;
           visibility: hidden;
           transition: all 0.3s ease-in-out;
       }

       header nav ul li a:hover::before {
           visibility: visible;
           width: 100%;
       }

       .welcome-section {
           display: flex;
           align-items: center;
           justify-content: space-around;
           background-color: #7b2cc3;
           padding: 50px 0;
           animation: fadeIn 2s ease-in-out;
       }

       .welcome-content {
           max-width: 600px;
           animation: slideInLeft 1s ease-in-out;
       }

       .welcome-content h1 {
           font-size: 48px;
           color: #fff;
           margin-bottom: 20px;
       }

       .welcome-content p {
           color: #fff;
           font-size: 16px;
           margin-bottom: 20px;
       }

       .contact-button {
           background-color: #ff4d4d;
           color: #fff;
           padding: 10px 20px;
           border: none;
           cursor: pointer;
           font-size: 16px;
           transition: background-color 0.3s ease, transform 0.3s ease;
       }

       .contact-button:hover {
           background-color: #e03e3e;
           transform: scale(1.05);
       }

       .welcome-image img {
           max-width: 400px;
           animation: slideInRight 1s ease-in-out;
       }

       @keyframes fadeIn {
           from {
               opacity: 0;
           }
           to {
               opacity: 1;
           }
       }

       @keyframes slideInLeft {
           from {
               transform: translateX(-100%);
           }
           to {
               transform: translateX(0);
           }
       }

       @keyframes slideInRight {
           from {
               transform: translateX(100%);
           }
           to {
               transform: translateX(0);
           }
       }

       @keyframes slideDown {
           from {
               transform: translateY(-100%);
           }
           to {
               transform: translateY(0);
           }
       }

       .latest-products {
           text-align: center;
           padding: 50px 0;
           animation: fadeIn 2s ease-in-out;
       }

       .latest-products h2 {
           font-size: 32px;
           margin-bottom: 20px;
       }

       .product-grid {
           display: flex;
           flex-wrap: wrap;
           justify-content: center;
           animation: slideInUp 1s ease-in-out;
       }

       .product {
           border: 1px solid #ddd;
           padding: 25px;
           margin: 15px;
           text-align: center;
           width: 300px;
           position: relative;
           transition: transform 0.3s ease;
       }

       .product:hover {
           transform: scale(1.05);
       }

       .product span {
           position: absolute;
           top: 10px;
           left: 10px;
           background-color: #ff4d4d;
           color: #fff;
           padding: 2px 5px;
           font-size: 12px;
       }

       .product img {
           width: 200px;
           height: 200px;
           object-fit: cover;
       }

       .product .price {
           color: #ff4d4d;
           font-weight: bold;
       }

       .contact-section {
           padding: 30px 0;
           background-color: #f9f9f9;
       }

       .contact-section h2 {
           text-align: center;
           margin-bottom: 10px;
           font-size: 20px;
           animation: fadeIn 2s ease-in-out;
       }

       .contact-content {
           display: flex;
           justify-content: center;
           gap: 50px;
           animation: slideInUp 1s ease-in-out;
       }

       .map iframe {
           border: none;
       }

       .contact-form {
           max-width: 400px;
       }

       .contact-form form {
           display: flex;
           flex-direction: column;
           gap: 30px;
       }

       .contact-form input, .contact-form textarea {
           padding: 30px;
           border: 1px solid #ddd;
           width: 100%;
       }

       .contact-form button {
           padding: 20px;
           background-color: #ff4d4d;
           color: #fff;
           border: none;
           cursor: pointer;
           transition: background-color 0.3s ease, transform 0.3s ease;
       }

       .contact-form button:hover {
           background-color: #e03e3e;
           transform: scale(1.05);
       }

       footer {
           background-color: #333;
           color: #fff;
           padding: 50px 0;
           animation: fadeIn 2s ease-in-out;
       }

       .footer-content {
           display: flex;
           justify-content: space-around;
           gap: 50px;
       }

       .footer-content div {
           max-width: 250px;
       }

       .footer-content h3 {
           margin-bottom: 15px;
           color: #7b2cc3;
           animation: slideInUp 1s ease-in-out;
       }

       .footer-content p, .footer-content form {
           margin-bottom: 15px;
       }

       .footer-content input {
           padding: 10px;
           width: 100%;
           border: none;
           margin-bottom: 10px;
       }

       .footer-content button {
           padding: 10px;
           background-color: #ff4d4d;
           color: #fff;
           border: none;
           cursor: pointer;
           transition: background-color 0.3s ease, transform 0.3s ease;
       }

       .footer-content button:hover {
           background-color: #e03e3e;
           transform: scale(1.05);
       }

       .footer-bottom {
           text-align: center;
           padding: 15px 0;
           background-color: #222;
           color: #7b2cc3;
           animation: slideInUp 1s ease-in-out;
       }

       @keyframes slideInUp {
           from {
               transform: translateY(100%);
           }
           to {
               transform: translateY(0);
           }
       }

       @keyframes fadeIn {
           from {
               opacity: 0;
           }
           to {
               opacity: 1;
           }
       }
   </style>
    <style>
        .nav-link {
            text-decoration: none;
            color: #333;
            padding: 10px 15px;
            display: inline-block;
            transition: transform 0.3s ease;
        }

        .nav-link:hover {
            transform: scale(1.1);
        }
    </style>
    <%
        String IMAGE_NOT_FOUND_URL = "../../resources/img/image_not_found_png";
    %>
</head>
<body>
<!-- Header -->
<header>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/views/base/main" class="nav-link">HOME</a></li>
            <li><a href="${pageContext.request.contextPath}/views/base/shop" class="nav-link">SHOP</a></li>
            <%
                String id = (String) session.getAttribute("user_id");
                if (id != null) {
                    UserService userService = new UserServiceImpl();
                    Users user = userService.findById(id);
                    if (user != null) {
                        if (user.getRole() == Users.Role.ADMIN) {
            %>
            <li><a href="${pageContext.request.contextPath}/views/admin/admin_account" class="nav-link">ADMIN&nbsp;ACCOUNT</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/views/base/logout" class="nav-link">LOGOUT</a></li>
            <% } else if (user.getRole() == Users.Role.SELLER) { %>
            <li><a href="${pageContext.request.contextPath}/views/seller/seller_account" class="nav-link">SELLER
                ACCOUNT</a></li>
            <li><a href="${pageContext.request.contextPath}/views/base/logout" class="nav-link">LOGOUT</a></li>
            <% } else { %>
            <li><a href="${pageContext.request.contextPath}/views/base/account" class="nav-link">ACCOUNT</a></li>
            <li><a href="${pageContext.request.contextPath}/views/seller/seller_register" class="nav-link">REGISTER
                AS A SELLER</a></li>
            <li><a href="${pageContext.request.contextPath}/views/base/logout" class="nav-link">LOGOUT</a></li>
            <% }
            } else { %>
            <li><a href="${pageContext.request.contextPath}/views/base/login" class="nav-link">LOGIN</a></li>
            <li><a href="${pageContext.request.contextPath}/views/base/register" class="nav-link">SIGN UP</a></li>
            <% }
            } else { %>
            <li><a href="${pageContext.request.contextPath}/views/base/login" class="nav-link">LOGIN</a></li>
            <li><a href="${pageContext.request.contextPath}/views/base/register" class="nav-link">SIGN UP</a></li>
            <% } %>
        </ul>
    </nav>
</header>

<!--Welcome_Section -->
<section class="welcome-section">
    <div class="welcome-content">
        <h1>Welcome To Our GAMING SHOP</h1>
        <p>Discover a world of unique products and exceptional service. We strive to provide you with the best shopping
            experience, ensuring every purchase meets your expectations.</p>
        <button class="contact-button">Contact Us</button>
    </div>
    <div class="welcome-image">
        <img width="1400" height="350" src="../../resources/img/jy1.png" alt="JOY STICK">
    </div>
</section>

<!-- Latest Products -->
<section class="latest-products">
    <h2>Latest Products</h2>
    <div class="product-grid">
        <%
            ProductService productService = new ProductServiceImpl();
            List<Product> products = productService.findAllByNamedQuery();
            for (Product product : products) {
                Upload image = product.getImage();
                //                               ../../resources/img/     578ca6df-da55-4704-9b7f-26db755f96c4-iphone.png
                String imageUrl = image != null ? image.getExtension() + image.getGeneratedName() : IMAGE_NOT_FOUND_URL;
        %>
        <div class="product" onclick="document.getElementById('form_<%= product.getId() %>').submit();">
            <form id="form_<%= product.getId() %>" action="shop" method="post">
                <input type="hidden" name="product_id" value="<%= product.getId() %>">
            </form>
            <span>New</span>
            <img src="<%= imageUrl %>" alt="<%= product.getName() %>">
            <p><%= product.getName() %>
            </p>
            <p class="price">$<%= product.getPrice() %>
            </p>
        </div>
        <% } %>
    </div>
</section>

<!-- Contact Us Section -->
<section class="contact-section">
    <h2>Contact Us</h2>
    <div class="contact-content">
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2624.9999481930735!2d2.292292315674767!3d48.85884407928744!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66f9e1f7a9f1b%3A0x40b82c3688b86118!2sEiffel%20Tower!5e0!3m2!1sen!2sfr!4v1618333386634!5m2!1sen!2sfr"
                    width="600" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
        <div class="contact-form">
            <form action="#" method="post">
                <input type="text" placeholder="Name" required>
                <input type="email" placeholder="Email" required>
                <input type="tel" placeholder="Phone" required>
                <textarea placeholder="Message" required></textarea>
                <button type="submit">Send</button>
            </form>
        </div>
    </div>
</section>

<!-- Footer -->
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
<script>
    document.querySelectorAll('.product').forEach(function (product) {
        product.addEventListener('click', function () {
            this.querySelector('form').submit();
        });
    });
</script>
</body>
</html>