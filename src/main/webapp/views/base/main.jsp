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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gift Shop</title>
    <link rel="stylesheet" href="../../resources/css/main.css">
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
            <li><a href="main.jsp" class="nav-link">HOME</a></li>
            <li><a href="shop.jsp" class="nav-link">SHOP</a></li>
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
            <li><a href="logout.jsp" class="nav-link">LOGOUT</a></li>
            <% } else if (user.getRole() == Users.Role.SELLER) { %>
            <li><a href="${pageContext.request.contextPath}/views/seller/seller_account" class="nav-link">SELLER
                ACCOUNT</a></li>
            <li><a href="logout.jsp" class="nav-link">LOGOUT</a></li>
            <% } else { %>
            <li><a href="account.jsp" class="nav-link">ACCOUNT</a></li>
            <li><a href="${pageContext.request.contextPath}/views/seller/seller_register" class="nav-link">REGISTER
                AS A SELLER</a></li>
            <li><a href="logout.jsp" class="nav-link">LOGOUT</a></li>
            <% }
            } else { %>
            <li><a href="login.jsp" class="nav-link">LOGIN</a></li>
            <li><a href="register.jsp" class="nav-link">SIGN UP</a></li>
            <% }
            } else { %>
            <li><a href="login.jsp" class="nav-link">LOGIN</a></li>
            <li><a href="register.jsp" class="nav-link">SIGN UP</a></li>
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
        <img width="1400" height="350" src="../../resources/img/jy1.png" alt="Girl with shopping bags">
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