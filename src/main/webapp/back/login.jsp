<%@ page language="java" pageEncoding="UTF-8" %>
<%@page contentType="text/html" %>

<!DOCTYPE html>

<html class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>blogger login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co"/>
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive"/>


    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="../static/css/login/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/login/animate.css">
    <link rel="stylesheet" href="../static/css/login/style.css">

    <script src="../static/js/login/modernizr-2.6.2.min.js"></script>
    <script src="../static/js/login/respond.min.js"></script>

    <%-- 引入JQ --%>
    <script src="../static/js/jquery.min.js"></script>
    <script type="text/javascript">

        function adminLogin() {
            var username = $("#username").val();
            var password = $("#password").val();
            if (username === "" || password === "") {
                alert("请完善登陆信息！");
                // location.reload();
            } else {
                var url = "${pageContext.request.contextPath}/checkLogin.do";
                var blogger = {
                    username: username,
                    password: password
                };
                $.ajax({
                    url: url,
                    contentType: "application/json",
                    type: "POST",
                    data: JSON.stringify(blogger),
                    dataType: "JSON",
                    success: function (result) {
                        if (result === true) {
                            window.location.href = "${pageContext.request.contextPath}/my/getOneselfList.do";
                        } else if (result === false) {
                            alert("登陆失败，用户名或密码错误！");
                            location.reload();
                        }
                    }
                })


            }
        }

        $(function () {
            $(document).keydown(function(e){
                var event = e || window.event;
                if (e.keyCode == 13) {
                    if(e.preventDefault) {
                        event .preventDefault();
                    }else{
                        event .returnValue = false;
                    }
                    $('#loginBtn').click();
                }
            })
        })

    </script>

</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">

            <div class="fh5co-form animate-box" data-animate-effect="fadeIn">
                <h2>用户登录</h2>
                <div class="form-group">
                    <label for="username" class="sr-only">用户名</label>
                    <input type="text" class="form-control" id="username" placeholder="用户名" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">密码</label>
                    <input type="password" class="form-control" id="password" placeholder="密码" autocomplete="off">
                </div>
                <div class="form-group">
                    <p><a href="${pageContext.request.contextPath}/forget.do">忘记密码?</a>
                    </p>
                </div>
                <div class="form-group">
                  <button class="btn btn-primary" id="loginBtn" onclick="adminLogin()">登录</button>

                </div>
            </div>

        </div>
    </div>
    <div class="row" style="padding-top: 60px; clear: both;">
        <div class="col-md-12 text-center"><p>Copyright &copy; all rights reserved 2019. Stephanie Went</p></div>
    </div>
</div>

<!-- jQuery -->
<script src="../static/js/login/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../static/js/login/bootstrap.min.js"></script>
<!-- Placeholder -->
<script src="../static/js/login/jquery.placeholder.min.js"></script>
<!-- Waypoints -->
<script src="../static/js/login/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="../static/js/login/main.js"></script>


</body>

</html>

