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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Information</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h1, h2 {
            color: #9534eb;
            text-align: center;
            margin-bottom: 20px;
            animation: fadeIn 1s ease-in-out;
        }

        .account-info, .cart-info {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            animation: fadeInUp 0.8s ease-out;
        }

        .account-info p, .cart-info p {
            color: #333;
            line-height: 1.6;
            margin: 10px 0;
        }

        .cart-item {
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
            animation: slideIn 0.9s ease-out;
        }

        .cart-details {
            display: flex;
            flex-direction: column;
        }

        .order-product {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            animation: zoomIn 0.7s ease-out;
        }

        .order-product img {
            width: 100px;
            height: 100px;
            border-radius: 10px;
            margin-right: 20px;
            transition: transform 0.3s ease-in-out;
        }

        .order-product img:hover {
            transform: scale(1.1);
        }

        .product-info {
            flex: 1;
            animation: fadeIn 0.5s ease-in-out;
        }

        .product-info p {
            margin: 5px 0;
            color: #666;
        }

        .product-info .product-name {
            font-weight: bold;
            color: #333;
        }

        .product-info .product-price {
            color: #9534eb;
            font-weight: bold;
        }

        .purchase-button {
            align-self: flex-start;
            background-color: #9534eb;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease-in-out, transform 0.3s ease-in-out;
            animation: bounceIn 0.6s ease-out;
        }

        .purchase-button:hover {
            background-color: #7b2cc3;
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideIn {
            0% {
                opacity: 0;
                transform: translateX(-20px);
            }
            100% {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes zoomIn {
            0% {
                opacity: 0;
                transform: scale(0.8);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes bounceIn {
            0% {
                opacity: 0;
                transform: scale(0.3);
            }
            50% {
                opacity: 1;
                transform: scale(1.1);
            }
            70% {
                transform: scale(0.9);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
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