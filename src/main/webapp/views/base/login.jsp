<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 07/07/24
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="../../resources/css/login_styles.css">
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="${pageContext.request.contextPath}/views/base/login" method="post">
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
        <div class="error-message">
            <h2 style="color: red"><%= errorMessage %>
            </h2>
        </div>
        <% } %>
        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Username" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login">
    </form>
</div>
</body>
</html>
