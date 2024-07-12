<%@ page import="com.pdp.jakartastore.service.shop.ShopService" %>
<%@ page import="com.pdp.jakartastore.service.shop.ShopServiceImpl" %>
<%@ page import="com.pdp.jakartastore.entity.shop.Shop" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 10/07/24
  Time: 09:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Account</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller_account.css">
    <style>
        .shop-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .shop-item form {
            display: flex;
            align-items: center;
        }
        .shop-item form button {
            margin-left: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h1>Welcome to Your Seller Account</h1>
        <p class="subtitle">Manage your shop and orders here.</p>
        <form action="${pageContext.request.contextPath}/views/seller/create_shop.jsp" method="get">
            <button type="submit" class="btn btn-primary">CREATE SHOP</button>
        </form>
    </header>
    <main>
        <%-- Fetch seller's shops from database --%>
        <%
            ShopService shopService = new ShopServiceImpl();
            String userId = (String) session.getAttribute("user_id");
            List<Shop> sellerShops = shopService.getSellerShops(userId);
        %>
        <section class="shop-section">
            <h2>Your Shops</h2>
            <div class="shops-list">
                <% for (Shop sellerShop : sellerShops) { %>
                <div class="shop-item">
                    <div>
                        <p class="shop-name">Shop Name: <strong><%= sellerShop.getName() %></strong></p>
                        <p class="shop-name">Shop Address: <strong><%= sellerShop.getAddress() %></strong></p>
                    </div>
                    <form action="${pageContext.request.contextPath}/views/seller/seller_account" method="post">
                        <input type="hidden" name="shop_id" value="<%= sellerShop.getId() %>">
                        <input type="hidden" name="action" value="manage">
                        <button type="submit" class="btn btn-secondary">Manage Shop</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/views/seller/seller_account" method="post">
                        <input type="hidden" name="shop_id" value="<%= sellerShop.getId() %>">
                        <input type="hidden" name="action" value="delete">
                        <button type="submit" style="background-color: red;" class="btn btn-secondary">Delete Shop</button>
                    </form>
                </div>
                <% } %>
            </div>
        </section>
    </main>

    <footer>
        <a href="${pageContext.request.contextPath}/views/base/logout" class="logout-link">Logout</a>
    </footer>
</div>
</body>
</html>