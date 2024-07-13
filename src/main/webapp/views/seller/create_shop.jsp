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
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            max-width: 600px;
            margin: 20px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-radius: 10px;
            animation: fadeInUp 0.5s ease-out;
        }

        header {
            text-align: center;
            margin-bottom: 30px;
        }

        header h1 {
            color: #9534eb;
            margin-bottom: 10px;
        }

        header .subtitle {
            color: #333;
            margin-bottom: 20px;
        }

        main {
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            background-color: #9534eb;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #7b2cc3;
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
    </style>
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
