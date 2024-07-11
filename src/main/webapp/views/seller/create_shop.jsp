<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 10/07/24
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/create_shop.css">
</head>
<body>
<div class="container">
    <header>
        <h1>Create Your Shop</h1>
        <p class="subtitle">Please provide the details below:</p>
    </header>
    <main>
        <form action="${pageContext.request.contextPath}/views/seller/create_shop" method="post">
            <div class="form-group">
                <label for="name">Shop Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>
            <button type="submit" class="btn btn-primary">Create Shop</button>
        </form>
    </main>
</div>
</body>
</html>
