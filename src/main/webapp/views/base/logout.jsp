<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 09/07/24
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
    <link rel="stylesheet" href="../../resources/css/logout.css">
</head>
<body>
<div class="logout-container">
    <h1>Are you sure you want to logout?</h1>
    <form action="${pageContext.request.contextPath}/views/base/logout" method="post">
        <button type="submit" name="confirm" value="yes" class="btn">Yes</button>
        <button type="submit" name="confirm" value="no" class="btn">No</button>
    </form>
</div>
</body>
</html>
