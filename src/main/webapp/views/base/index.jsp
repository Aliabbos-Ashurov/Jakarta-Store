<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login or Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
        }

        .background {
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 50px;
            border-radius: 16px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2.5em;
            color: #9534eb;
            margin-bottom: 20px;
        }

        .buttons {
            margin-top: 20px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 10px;
            text-decoration: none;
            color: #fff;
            background-color: #9534eb;
            border: 1px solid #9534eb;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #7b2cc3;
        }
    </style>
</head>
<body>
<div class="background">
    <div class="container">
        <h1>Welcome!</h1>
        <div class="buttons">
            <a href="login.jsp" class="button">Log In</a>
            <a href="register.jsp" class="button">Sign Up</a>
        </div>
    </div>
</div>
</body>
</html>