package com.pdp.jakartastore.service.email;

/**
 * @author Aliabbos Ashurov
 * @since 13/July/2024  14:57
 **/
public class MessageType {
    public static String FOR_USER_BLOCKING = """
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Account Blocked</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f4f4f4;
                        margin: 0;
                        padding: 0;
                    }
                    .container {
                        width: 100%;
                        padding: 20px;
                        text-align: center;
                    }
                    .content {
                        background-color: #fff;
                        border-radius: 8px;
                        padding: 20px;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                        display: inline-block;
                        text-align: left;
                        margin: 20px 0;
                    }
                    .header {
                        font-size: 24px;
                        font-weight: bold;
                        color: #d9534f;
                    }
                    .message {
                        font-size: 16px;
                        color: #333;
                    }
                    .footer {
                        font-size: 14px;
                        color: #777;
                        margin-top: 20px;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="content">
                        <div class="header">Account Blocked</div>
                        <div class="message">
                            <p>Dear User,</p>
                            <p>We regret to inform you that your account has been blocked by the admin. Please contact support for more information.</p>
                            <p>Thank you for your understanding.</p>
                        </div>
                        <div class="footer">© 2024 Your Company. All rights reserved.</div>
                    </div>
                </div>
            </body>
            </html>
            """;
    public static String FOR_SELLER_BLOCKING = """
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Account Blocked</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f4f4f4;
                        margin: 0;
                        padding: 0;
                    }
                    .container {
                        width: 100%;
                        padding: 20px;
                        text-align: center;
                    }
                    .content {
                        background-color: #fff;
                        border-radius: 8px;
                        padding: 20px;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                        display: inline-block;
                        text-align: left;
                        margin: 20px 0;
                    }
                    .header {
                        font-size: 24px;
                        font-weight: bold;
                        color: #d9534f;
                    }
                    .message {
                        font-size: 16px;
                        color: #333;
                    }
                    .footer {
                        font-size: 14px;
                        color: #777;
                        margin-top: 20px;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="content">
                        <div class="header">Account Blocked</div>
                        <div class="message">
                            <p>Dear User,</p>
                            <p>We regret to inform you that your shop has been blocked by the admin. Please contact support for more information.</p>
                            <p>Thank you for your understanding.</p>
                        </div>
                        <div class="footer">© 2024 Your Company. All rights reserved.</div>
                    </div>
                </div>
            </body>
            </html>
            """;
}
