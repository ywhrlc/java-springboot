<%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2024/6/19
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ela Admin - HTML5 Admin Template</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">




    <link rel="stylesheet" href="static/css/normalize.min.css">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/css/themify-icons.css">
    <link rel="stylesheet" href="static/css/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="static/css/flag-icon.min.css">
    <link rel="stylesheet" href="static/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="static/css/style.css">

    <link href='static/css/css.css' rel='stylesheet' type='text/css'>

    <style>
        .login-form{
            width: 400px;
            margin: 0 auto;
        }
    </style>
</head>
<body class="bg-dark">

<div class="sufee-login d-flex align-content-center flex-wrap">
    <div class="container">
        <div class="login-content">
            <div class="login-logo">
                <img class="align-content" src="../image/logo.jpg" alt="">
            </div>
            <div class="login-form">
                <form>
                    <div class="form-group">
                        <label>用户名</label>
                        <input type="text" id="aname" class="form-control" placeholder="UserName">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input type="password" id="apass" class="form-control" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label>电话</label>
                        <input type="text" id="aphone" class="form-control" placeholder="Phone">
                    </div>
                    <button type="button" id="register" class="btn btn-primary btn-flat m-b-30 m-t-30">注册</button>
                    <br><br>
                    <div class="register-link m-t-15 text-center">
                        <p>已经有账户 ? <a href="login.jsp">登录</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="static/js/jquery.min.js"></script>
<script src="static/js/popper.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/jquery.matchHeight.min.js"></script>
<script src="static/js/main.js"></script>
<script src="static/js/jquery.js"></script>
<script>
    $(function (){

        $("#register").click(function() {
            var inputName =  $("#aname").val()
            console.log(inputName)
            var inputPass =  $("#apass").val()
            var inputPhone =  $("#aphone").val()

            $.ajax({
                url:"/admin/register",
                type:"get",
                dataType:"json",
                contentType:"application/json; charset=UTF-8",
                data:{
                    aname:inputName,
                    apass:inputPass,
                    aphone:inputPhone,
                },
                success:function (data){
                    if (data.flag){
                        alert("注册成功")
                        window.location.href = "login.jsp";
                    }else {
                        alert("注册失败")
                    }
                }
            })
        });

    })

</script>

</body>
</html>

