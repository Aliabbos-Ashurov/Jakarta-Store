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
    <title>Sign Up</title>
    <link rel="stylesheet" href="../../resources/css/register_styles.css">
</head>
<body>
<div class="signup-container">
    <h2>Sign Up</h2>
    <form action="register" method="post">
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) { %>
        <p class="error"><%= errorMessage %></p>
        <% }
        %>
        <label for="fullname">Fullname</label>
        <input type="text" id="fullname" name="fullname" placeholder="Fullname" required>

        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Username" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Email" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Password" required>

        <input type="submit" value="Sign Up">
    </form>
</div>
</body>
</html>