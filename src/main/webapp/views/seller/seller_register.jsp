<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 10/07/24
  Time: 09:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller_register.css">
</head>
<body>
<div class="container">
    <h1>Seller Registration</h1>
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/views/seller/seller_register" method="POST">
            <div class="form-group">
                <label for="phoneNumber">Telephone Number:</label>
                <input type="tel" id="phoneNumber" name="phone_number" placeholder="Enter your telephone number"
                       required>
            </div>
            <button type="submit" class="submit-button">Register</button>
        </form>
    </div>
</div>
</body>
</html>
