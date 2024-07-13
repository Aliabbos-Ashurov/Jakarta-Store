<%@ page import="com.pdp.jakartastore.service.shop.ShopService" %>
<%@ page import="com.pdp.jakartastore.service.shop.ShopServiceImpl" %>
<%@ page import="com.pdp.jakartastore.service.user.UserService" %>
<%@ page import="com.pdp.jakartastore.service.user.UserServiceImpl" %>
<%@ page import="com.pdp.jakartastore.entity.user.Users" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pdp.jakartastore.entity.shop.Shop" %><%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 11/07/24
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Account</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin_account.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
</head>
<body>
<div class="container">
    <h1 class="title animate__animated animate__fadeIn">Shop Management</h1>
    <div class="user-table animate__animated animate__fadeInUp">
        <%
            ShopService shopService = new ShopServiceImpl();
            List<Shop> shops = shopService.getByFilter();
            int row = 1;
        %>
        <table>
            <tr>
                <th>N</th>
                <th>Name</th>
                <th>Address</th>
                <th>Phone Number</th>
                <th>Owner</th>
                <th>Action</th>
            </tr>
            <% for (Shop shop : shops) {
                if (!shop.getStatus().equals(Shop.Status.DELETED)) { %>
            <tr>
                <td><%= row++ %></td>
                <td><%= shop.getName() %></td>
                <td><%= shop.getAddress() %></td>
                <td><%= shop.getPhone() %></td>
                <td><%= shop.getOwner().getFullname() %></td>
                <td>
                    <% if (shop.getStatus().equals(Shop.Status.ACTIVE)) { %>
                    <form action="${pageContext.request.contextPath}/views/admin/admin_account" method="post"
                          class="inline-form">
                        <input type="hidden" name="shop_id" value="<%= shop.getId() %>">
                        <input type="hidden" name="action" value="deactive_shop">
                        <button type="submit" class="btn btn-danger">Deactivate</button>
                    </form>
                    <% } else if (shop.getStatus().equals(Shop.Status.NOT_ACTIVE)){ %>
                    <form action="${pageContext.request.contextPath}/views/admin/admin_account" method="post"
                          class="inline-form">
                        <input type="hidden" name="shop_id" value="<%= shop.getId() %>">
                        <input type="hidden" name="action" value="active_shop">
                        <button type="submit" class="btn btn-success">Activate</button>
                    </form>
                    <% } %>
                </td>
            </tr>
            <% }
            } %>
        </table>
    </div>
    <h1 class="title animate__animated animate__fadeIn">User Management</h1>
    <div class="user-table animate__animated animate__fadeInUp">
        <%
            UserService userService = new UserServiceImpl();
            List<Users> users = userService.getByFilters();
            int rowNum = 1;
        %>
        <table>
            <tr>
                <th>N</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
            <% for (Users user : users) {
                if (user.getRole() != Users.Role.SELLER && user.getRole() != Users.Role.ADMIN) { %>
            <tr>
                <td><%= rowNum++ %></td>
                <td><%= user.getFullname() %></td>
                <td><%= user.getEmail() %></td>
                <td>
                    <% if (user.getStatus().equals(Users.Status.ACTIVE)) { %>
                    <form action="${pageContext.request.contextPath}/views/admin/admin_account" method="post"
                          class="inline-form">
                        <input type="hidden" name="user_id" value="<%= user.getId() %>">
                        <input type="hidden" name="action" value="deactive">
                        <button type="submit" class="btn btn-danger">Deactivate</button>
                    </form>
                    <% } else { %>
                    <form action="${pageContext.request.contextPath}/views/admin/admin_account" method="post"
                          class="inline-form">
                        <input type="hidden" name="user_id" value="<%= user.getId() %>">
                        <input type="hidden" name="action" value="active">
                        <button type="submit" class="btn btn-success">Activate</button>
                    </form>
                    <% } %>
                    <form action="${pageContext.request.contextPath}/views/admin/admin_account" method="post"
                          class="inline-form">
                        <input type="hidden" name="user_id" value="<%= user.getId() %>">
                        <input type="hidden" name="action" value="delete">
                        <button type="submit" class="btn btn-delete">Delete</button>
                    </form>
                </td>
            </tr>
            <% }
            } %>
        </table>
    </div>
</div>
</body>
</html>