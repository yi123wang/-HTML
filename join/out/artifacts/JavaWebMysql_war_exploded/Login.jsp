<%--
  Created by IntelliJ IDEA.
  User: 30414
  Date: 2024/6/6
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: rgba(255, 255, 255, 0.5); /* 设置页面背景为半透明 */
            margin-top: 24px;
        }

        .login-container {
            position: relative;
            zindex: 1;
            max-width: 400px;
            margin: 160px auto;
            padding: 32px;
            color: #FFF;
            background-color: rgba(0, 0, 0, 0.2); /* 设置登录框的背景为半透明白色 */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border: #444 solid 1px;
            border-radius: 10px;
            backdrop-filter: blur(24px);
        }

        .title-text {
            margin: 16px auto;
        }

        .input-container {
            margin: 48px auto;
        }

        .btn-container {
            margin: 0 auto;
        }

        .btn-custom {
            width: 100%;
            color: #FFF;
            background-color: rgba(0, 0, 0, 0.2);
        }

        .btn-custom:hover {
            background-color: rgba(64, 64, 64, 0.2);
        }

        .form-control {
            color: #FFF;
            border: none;
            background-color: rgba(0, 0, 0, 0.2);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .forgot-password {
            color: #aaa;
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .forgot-password:hover {
            color: #fff;
            border-bottom: none;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }

        #myVideo {
            position: fixed;
            object-fit: cover;
            right: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<div class="container">
    <video autoplay muted loop id="myVideo">
        <source src="Star_Space.mp4" type="video/mp4">
        您的浏览器不支持HTML5视频。
    </video>
    <div class="login-container">
        <div class="title-text">
            <h2 class="text-center">登录</h2>
        </div>
        <!-- 显示错误消息 -->
        <c:if test="${not empty errorMsg}">
            <p class="error-message">${errorMsg}</p>
        </c:if>
        <form action="LoginServlet" method="post">
            <div class="input-container">
                <div class="form-group">
                    <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" required>
                </div>
            </div>

            <div class="btn-container">
                <button type="submit" class="btn btn-primary btn-custom">登录</button>

                <button onclick="location.href='Register.jsp'" class="btn btn-secondary btn-custom mt-2">注册</button>
                <a href="ForgotPassword.jsp" class="forgot-password">忘记密码？</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
