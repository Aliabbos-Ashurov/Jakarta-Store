<%@ page import="com.pdp.jakartastore.entity.user.Users" %>
<%@ page import="com.pdp.jakartastore.service.cart.CartService" %>
<%@ page import="com.pdp.jakartastore.service.cart.CartServiceImpl" %>
<%@ page import="com.pdp.jakartastore.service.order.OrderService" %>
<%@ page import="com.pdp.jakartastore.service.order.OrderServiceImpl" %>
<%@ page import="com.pdp.jakartastore.service.product.ProductService" %>
<%@ page import="com.pdp.jakartastore.service.product.ProductServiceImpl" %>
<%@ page import="com.pdp.jakartastore.entity.cart.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.pdp.jakartastore.entity.order.Orders" %>
<%@ page import="com.pdp.jakartastore.entity.product.Product" %>
<%@ page import="com.pdp.jakartastore.entity.upload.Upload" %>
<%@ page import="com.pdp.jakartastore.service.user.UserService" %>
<%@ page import="com.pdp.jakartastore.service.user.UserServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 09/07/24
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Information</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/account.css">
</head>
<body>
<div class="container">
    <%
        UserService userService = new UserServiceImpl();
        String id = (String) session.getAttribute("user_id");
        Users user = userService.findById(id);
        CartService cartService = new CartServiceImpl();
        OrderService orderService = new OrderServiceImpl();
        ProductService productService = new ProductServiceImpl();
        List<Cart> cartList = cartService.findByUserId(user.getId());
        String IMAGE_NOT_FOUND_URL = "../../resources/img/image_not_found.png";
    %>
    <div class="account-info">
        <h1>Account Information</h1>
        <p><strong>Full Name:</strong> <%= user.getFullname() != null ? user.getFullname() : "UNKNOWN FULLNAME" %>
        </p>
        <p><strong>Username:</strong> <%= user.getUsername() != null ? user.getUsername() : "UNKNOWN USERNAME" %>
        </p>
        <p><strong>Email:</strong> <%= user.getEmail() != null ? user.getEmail() : "UNKNOWN EMAIL" %>
        </p>
        <p><strong>Phone
            Number:</strong> <%= user.getPhoneNumber() != null ? user.getPhoneNumber() : "UNKNOWN PHONE NUMBER" %>
        </p>
    </div>

    <div class="cart-info">
        <h2>Your Cart</h2>
        <% if (Objects.nonNull(cartList)) {
            for (Cart cart : cartList) {
                List<Orders> ordersByCartId = orderService.getOrdersByCartId(cart.getId());
        %>
        <div class="cart-item">
            <div class="cart-details">
                <p><%= cart.isPaid() ? "Archive" : "Active" %>
                </p>
                <% for (Orders orders : ordersByCartId) {
                    Product product = productService.findById(orders.getProduct().getId());
                    Upload image = product.getImage();
                    String imageURL = (image != null) ? (image.getExtension() + image.getGeneratedName()) : IMAGE_NOT_FOUND_URL;
                %>
                <div class="order-product">
                    <img src="<%= imageURL %>" alt="<%= product.getName() %>">
                    <div class="product-info">
                        <p class="product-name"><%= product.getName() %>
                        </p>
                        <p class="product-price">$<%= product.getPrice() %>
                        </p>
                        <p>Quantity: <%= orders.getQuantity() %>
                        </p>
                    </div>
                </div>
                <% } %>
                <% if (!cart.isPaid()) { %>
                <form action="${pageContext.request.contextPath}/views/base/account" method="post">
                    <input type="hidden" name="cart_id" value="<%= cart.getId() %>">
                    <button type="submit" class="purchase-button">Purchase</button>
                </form>
                <% } %>
            </div>
        </div>
        <% }
        } %>
    </div>
</div>
</body>
</html>