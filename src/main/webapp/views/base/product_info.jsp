<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 09/07/24
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pdp.jakartastore.entity.product.Product" %>
<%@ page import="com.pdp.jakartastore.entity.upload.Upload" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #7b2cc3;
            color: #333;
        }

        .split-container {
            display: flex;
            height: 100vh;
            animation: slideIn 1s ease-in-out;
        }

        .left-half, .right-half {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .left-half {
            background-color: #7b2cc3;
        }

        .product-image img {
            max-width: 100%;
            max-height: 100%;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }

        .product-image img:hover {
            transform: scale(1.05);
        }

        .right-half {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease-in-out;
        }

        .product-details {
            max-width: 600px;
            text-align: center;
        }

        .product-details h1 {
            font-size: 3em;
            margin-bottom: 20px;
            color: #7b2cc3;
            animation: bounceInDown 1s ease;
        }

        .product-details .price {
            font-size: 2em;
            color: #7b2cc3;
            margin-bottom: 20px;
            animation: fadeIn 1s ease;
        }

        .product-details .description {
            font-size: 1.2em;
            color: #666;
            margin-bottom: 20px;
            animation: fadeIn 1.2s ease;
        }

        .add-to-cart {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .add-to-cart input {
            width: 60px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
            animation: fadeInUp 1s ease;
        }

        .add-to-cart button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #7b2cc3;
            color: #fff;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
            animation: fadeInUp 1s ease;
        }

        .add-to-cart button:hover {
            background-color: #5d1b99;
        }

        .product-details .category {
            font-size: 1em;
            color: #999;
            margin-top: 20px;
            animation: fadeIn 1.5s ease;
        }

        .product-details .category span {
            color: #7b2cc3;
        }

        @keyframes slideIn {
            from {
                transform: translateX(-100%);
            }
            to {
                transform: translateX(0);
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes bounceInDown {
            from {
                opacity: 0;
                transform: translateY(-2000px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
    <!-- Include Animate.css for animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
</head>
<body>
<div class="split-container">
    <%
        String IMAGE_NOT_FOUND_URL = "../../resources/img/image_not_found.png";
        Product product = (Product) request.getAttribute("product");
        Upload image = product.getImage();
        String imageUrl = image != null ? image.getExtension() + image.getGeneratedName() : IMAGE_NOT_FOUND_URL;
    %>
    <div class="left-half animate__animated animate__fadeInLeft">
        <div class="product-image">
            <img src="<%= imageUrl %>" alt="Product Image">
        </div>
    </div>
    <div class="right-half animate__animated animate__fadeInRight">
        <div class="product-details">
            <h1 class="animate__animated animate__bounceInDown"><%= product.getName() %></h1>
            <p class="price animate__animated animate__fadeIn">$<%= product.getPrice() %></p>
            <p class="description animate__animated animate__fadeIn"><%= product.getDescription() %></p>
            <form action="${pageContext.request.contextPath}/views/base/add_to_cart" method="post" class="animate__animated animate__fadeIn">
                <!-- Hidden form fields -->
                <input type="hidden" name="product_id" value="<%= product.getId() %>">
                <input type="hidden" name="user_id" value="<%= session.getAttribute("user_id") %>">
                <input type="hidden" name="count" value="1">
                <div class="add-to-cart">
                    <input type="number" name="quantity" value="1" min="1" class="animate__animated animate__fadeInUp">
                    <button type="submit" class="animate__animated animate__fadeInUp">Add to cart</button>
                </div>
            </form>
            <p class="category animate__animated animate__fadeIn"><span>Category:</span> <%= product.getCategory() %></p>
        </div>
    </div>
</div>
</body>
</html>