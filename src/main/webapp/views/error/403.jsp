<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>403 Forbidden</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            background: linear-gradient(120deg, #f2f2f2, #7b2cc3);
            animation: backgroundChange 30s ease-in-out infinite;
        }

        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }

        .error-title {
            font-size: 72px;
            color: #7b2cc3;
            animation: bounceIn 1s ease-in-out;
        }

        .error-message {
            font-size: 24px;
            color: #333;
            margin: 20px 0;
        }

        .gif-container {
            margin: 20px 0;
        }

        .gif-container img {
            width: 300px;
            height: auto;
            animation: slideIn 1s ease-in-out;
        }
        .home-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #7b2cc3;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            animation: fadeIn 2s ease-in-out;
        }

        .home-link:hover {
            background-color: #5a1d90;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes bounceIn {
            0%, 20%, 40%, 60%, 80%, 100% {
                animation-timing-function: cubic-bezier(0.215, 0.610, 0.355, 1.000);
            }
            0% {
                opacity: 0;
                transform: scale3d(0.3, 0.3, 0.3);
            }
            20% {
                transform: scale3d(1.1, 1.1, 1.1);
            }
            40% {
                transform: scale3d(0.9, 0.9, 0.9);
            }
            60% {
                opacity: 1;
                transform: scale3d(1.03, 1.03, 1.03);
            }
            80% {
                transform: scale3d(0.97, 0.97, 0.97);
            }
            100% {
                opacity: 1;
                transform: scale3d(1, 1, 1);
            }
        }

        @keyframes slideIn {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes backgroundChange {
            0% {
                background: linear-gradient(120deg, #c591ff, #5a1d90);
            }
            25% {
                background: linear-gradient(120deg, #5a1d90, #c591ff);
            }
            50% {
                background: linear-gradient(120deg, #c591ff, #5a1d90);
            }
            75% {
                background: linear-gradient(120deg, #5a1d90, #c591ff);
            }
            100% {
                background: linear-gradient(120deg, #c591ff, #5a1d90);
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="error-title">403</h1>
    <p class="error-message"><strong>Oops!</strong></p>
    <p class="error-message">Forbidden</p>
    <div class="gif-container">
        <iframe src="https://giphy.com/embed/GQlUu7wLzZ7iGNhzQJ" width="480" height="480" style="" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
    </div>
    <a href="${pageContext.request.contextPath}/views/base/main" class="home-link">Go to Home Page</a>
</div>
</body>
</html>