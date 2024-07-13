<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 07/07/24
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .login-container {
        background-color: white;
        padding: 2rem;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        width: 300px;
    }

    .login-container h2 {
        text-align: center;
        margin-bottom: 1.5rem;
        color: #333;
    }

    .login-container form {
        display: flex;
        flex-direction: column;
    }

    .login-container form input {
        padding: 0.75rem;
        margin-bottom: 1rem;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .login-container form input[type="submit"] {
        background-color: #9534eb;
        color: white;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .login-container form input[type="submit"]:hover {
        background-color: #7b2cc3;
    }
    </style>
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
