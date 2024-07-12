<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }

        .success-message {
            background-color: #9534eb;
            color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            opacity: 0;
            transform: scale(0.9);
            animation: fadeIn 1s forwards, bounce 0.5s 1s forwards;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

        @keyframes bounce {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
        }

        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #ffffff;
            color: #9534eb;
            border: 2px solid #9534eb;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .back-button:hover {
            background-color: #9534eb;
            color: #ffffff;
        }
    </style>
</head>
<body>
<div class="success-message">
    Successfully!
    <a href="${pageContext.request.contextPath}/views/base/main" onclick="refreshPage(event)" class="back-button">Back to Main</a>
</div>
<script>
    function refreshPage(event) {
        var url = "${pageContext.request.contextPath}/views/base/main.jsp"; // Replace with the URL of the page you want to refresh
        window.location.href = url; // Redirect to the specified URL, effectively refreshing it
    }
</script>
</body>
</html>
