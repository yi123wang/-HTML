<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>数据管理中心</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            margin-top: 24px;
        }

        .mysql-container {
            background-color: rgba(0, 0, 0, 0.2);
            z-index: 1;
            max-width: 800px; /* 设置最大宽度 */
            margin: 0 auto; /* 居中 */
        }

        h1 {
            color: #007bff; /* 深蓝色 */
            font-size: 3em; /* 增加字体大小 */
            font-weight: bold;
            text-shadow: 2px 2px 4px #aaa; /* 增加阴影效果 */
        }

        .table-container {
            height: 300px;
            overflow-y: scroll;
            margin-top: 20px;
            background-color: #A9A9A9; /* 浅灰色背景 */
            border-radius: 10px; /* 圆角 */
            padding: 10px;
            max-width: 100%; /* 设置最大宽度 */
            margin: 0 auto; /* 居中 */
        }
        .table-container table, .mt-5 {
            background-color: rgba(0, 0, 0, 0.2); /* 设置表格背景色为白色并设置透明度 */
        }

        .table th,
        .table td {
            background-color: #f8f9fa; /* 浅灰色 */
        }

        .btn_add,
        .btn_delete,
        .btn_updata {
            width: 100%;
            color: #FFF;
            background-color: rgba(0, 0, 0, 0.2);
        }

        .btn_add,
        .btn_delete,
        .btn_updata:hover {
            background-color: rgba(0, 0, 0, 0.2);
        }

        .form-control {
            width: 100%;
            color: #FFF;
            background-color: rgba(0, 0, 0, 0.2);
        }
        .form-control:hover {
            width: 100%;
            color: #FFF;
            background-color: rgba(0, 0, 0, 0.2);
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
        <source src="Rainbow.mp4" type="video/mp4">
        您的浏览器不支持HTML5视频。
    </video>
    <div class="mysql-container">
        <h1 class="mt-5">数据管理中心</h1>

        <div class="row mt-3">
            <div class="col-md-4">
                <!-- Add User Button -->
                <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#addUserModal">
                    添加用户
                </button>
            </div>
            <div class="col-md-4">
                <!-- Modify Password Button -->
                <button type="button" class="btn btn-warning btn-block" data-toggle="modal"
                        data-target="#updatePasswordModal">
                    修改密码
                </button>
            </div>
            <div class="col-md-4">
                <!-- Delete User Button -->
                <button type="button" class="btn btn-danger btn-block" data-toggle="modal"
                        data-target="#deleteUserModal">
                    删除用户
                </button>
            </div>
        </div>

        <!-- Add User Modal -->
        <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addUserModalLabel">添加用户</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddUserServlet" method="post">
                            <div class="form-group">
                                <label for="username">用户名</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="password">密码</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="form-group">
                                <label for="bookName">书名</label>
                                <input type="text" class="form-control" id="bookName" name="bookName" required>
                            </div>
                            <div class="form-group">
                                <label for="price">价格</label>
                                <input type="number" step="0.01" class="form-control" id="price" name="price" required>
                            </div>
                            <div class="btn_add">
                                <button type="submit" class="from-control">添加用户</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- Update Password Modal -->
        <div class="modal fade" id="updatePasswordModal" tabindex="-1" role="dialog"
             aria-labelledby="updatePasswordModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updatePasswordModalLabel">修改密码</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="UpdatePasswordServlet" method="post">
                            <div class="form-group">
                                <label for="updateUsername">用户名</label>
                                <input type="text" class="form-control" id="updateUsername" name="username" required>
                            </div>
                            <div class="form-group">
                                <label for="oldPassword">旧密码</label>
                                <input type="password" class="form-control" id="oldPassword" name="oldPassword"
                                       required>
                            </div>
                            <div class="form-group">
                                <label for="newPassword">新密码</label>
                                <input type="password" class="form-control" id="newPassword" name="newPassword"
                                       required>
                            </div>
                            <div class="btn_updata">
                                <button type="submit" class="btn btn-warning">修改密码</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete User Modal -->
        <div class="modal fade" id="deleteUserModal" tabindex="-1" role="dialog" aria-labelledby="deleteUserModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteUserModalLabel">删除用户</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="DeleteUserServlet" method="post">
                            <div class="form-group">
                                <label for="deleteUsername">用户名</label>
                                <input type="text" class="form-control" id="deleteUsername" name="username" required>
                            </div>
                            <div class="btn_delete">
                                <button type="submit" class="btn btn-danger">删除用户</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- User Table -->

        <div class="row mt-5">
            <div class="col">
                <div class="table-container">
                    <!-- Include the UserServlet output here -->
                    <jsp:include page="getData" />
                </div>
            </div>
        </div>



    </div>
</div>
</body>
</html>
