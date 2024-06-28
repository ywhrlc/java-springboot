<%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2024/6/17
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!doctype html>
<html lang="zxx">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>我的</title>

  <link href="http://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
  <link href="http://fonts.googleapis.com/css2?family=Lato:ital,wght@0,300;0,400;0,700;1,400&display=swap"
        rel="stylesheet">

  <link rel="stylesheet" href="assets/css/style-starter.css">
  <style>
    .form-group{
      width: 400px;
    }
    .w3l-contact {
      margin-bottom: 80px;
      margin-top: 100px;
    }
    .contact-infubd {
      display: flex;
      justify-content: space-between;
      padding: 20px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(241, 13, 13, 0.1);
    }
    .sidebar {
      width: 20%;
      border-right: 1px solid #ddd;
      padding: 20px;
    }
    .user-avatar {
      text-align: center;
      margin-bottom: 20px;
    }
    .user-avatar img {
      width: 100px;
      height: 100px;
      object-fit: cover;
      border-radius: 50%; /* 圆形图片 */
      border: 1px solid #ff0303;
      cursor: pointer;
      box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
    }
    .sidebar button {
      width: 100%;
      padding: 12px;
      margin-bottom: 10px;
      border: none;
      border-radius: 4px;
      background-color: #9d9d9d;
      color: white;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    .sidebar button:hover {
      background-color: #ff1f54;
    }
    .content {
      flex-grow: 1;
      padding: 20px;
    }




    /* 添加一些基本样式 */
   
    .user-item {
      cursor: pointer;
      display: flex;
      align-items: center;
      margin-right: 200px;
      margin-top: 30px;
      background-color: #d0d0d0;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      width: 500px;
      transition: background-color 0.3s ease; /* 添加过渡效果 */
    }

    .user-item img {
      width: 50px;
      height: 50px;
      margin-right: 20px;
      border-radius: 50%; /* 使图片成为圆形 */
    }

    .user-item:hover {
      background-color: #ed8889;
    }

    .user-item span {
      font-size: 18px;
    }
  </style>

</head>

<body>
<!--header-->
<header id="site-header" class="fixed-top">
  <div class="container">
    <nav class="navbar navbar-expand-lg stroke">
      <h1><a class="navbar-brand mr-lg-5" href="index.jsp">
        Traversal
      </a></h1>
      <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse"
              data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
              aria-label="Toggle navigation">
        <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
        <span class="navbar-toggler-icon fa icon-close fa-times"></span>
        </span>
      </button>

      <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item ">
            <a class="nav-link" href="index.jsp">主页 <span class="sr-only">(current)</span></a>
          </li>

          <li class="nav-item " >
            <a class="nav-link" href="cart.jsp">购物车</a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="my.jsp">我的</a>
          </li>
        </ul>
      </div>

      <div class="d-lg-block d-none">
        <a href="contact.jsp" class="btn btn-style btn-secondary">联系我们</a>
      </div>
<%--灯光 转换--%>
      <div class="mobile-position">
        <nav class="navigation">
          <div class="theme-switch-wrapper">
            <label class="theme-switch" for="checkbox">
              <input type="checkbox" id="checkbox">
              <div class="mode-container">
                <i class="gg-sun"></i>
                <i class="gg-moon"></i>
              </div>
            </label>
          </div>
        </nav>
      </div>
    </nav>
  </div>
</header>


<section class="w3l-contact" id="contact">
  <div class="contact-infubd">
    <!-- 左侧边栏 -->
    <div class="sidebar">
      <!-- 用户头像 -->
      <div class="user-avatar" id="avatar">

      </div>

      <!-- 修改按钮 -->
      <a href="my.jsp"><button>修改个人信息</button></a>
      <!-- 切换用户按钮 -->
      <button onclick="switchUser()">切换账户</button>

      <button onclick="delUser()">注销账户</button>
      <!-- 退出登录按钮 -->
      <button onclick="exit()">退出登录</button>
    </div>
    <!-- 右侧栏留空 -->
      <div id="change-user">
      <div class="contact-infubd py-5"  >
        <div class="container py-lg-3">
          <div class="contact-grids row">
            <div class="col-lg-4 contact-left"  style="margin-right: 300px">
              <div class="input-grids">
                <div class="form-group">用户名:
                  <input type="text" name="w3lName" id="user-name"  class="contact-input" />
                </div>
                <div class="form-group">原密码:
                  <input type="password" name="w3lSender" id="old-pass"  class="contact-input" required="" />
                </div>
                <div class="form-group">新密码:
                  <input type="password" name="w3lSender" id="new-pass"  class="contact-input" required="" />
                </div>
                <div class="form-group">手机号:
                  <input type="text" name="w3lName" id="user-phone"  class="contact-input" />
                </div>
              </div>
              <div class="text-right">
                <button onclick="update()" class="btn btn-style btn-primary">修改</button>
              </div>
            </div>

            </div>
        </div>
      </div>
  </div>
  </div>
</section>




<!--登录 弹窗 Modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" style="margin-left: 200px">登录</h3>
        <button type="button" class="close" onclick="closeLoginModal()" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row align-items-center" >
          <div class="login-form" style="margin: 0 auto">
            <div class="form-group ">
              <label>用户名</label>
              <input type="text" id="login-name" class="form-control" placeholder="UserName">
            </div>
            <div class="form-group">
              <label>密码</label>
              <input type="password" id="login-pass" class="form-control" placeholder="Password">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary"  onclick="login()" style="margin: 0 auto;width: 200px">登录</button>
        </div>
        <div class="register-link m-t-15 text-center">
          <p>还没有账户 ? <a href="#" onclick="openRegisterModal()">注册</a></p>
        </div>
      </div>
      </div>
    </div>
</div>

<!--注册 弹窗 Modal -->
<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" style="margin-left: 200px" >注册</h3>
        <button type="button" class="close" onclick="closeRegisterModal()" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row align-items-center">
          <div class="login-form" style="margin: 0 auto">
              <div class="form-group ">
                <label>用户名</label>
                <input type="text" id="register-name" class="form-control" placeholder="UserName">
              </div>
              <div class="form-group">
                <label>密码</label>
                <input type="password" id="register-pass" class="form-control" placeholder="Password">
              </div>
              <div class="form-group ">
                <label>电话</label>
                <input type="text" id="register-phone" class="form-control" placeholder="Phone">
              </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary"  onclick="register()" style="margin: 0 auto;width: 200px">注册</button>
      </div>
        <div class="register-link m-t-15 text-center">
          <p>已经有账户 ? <a href="#" onclick="openLoginModal()">登录</a></p>
        </div>
    </div>
  </div>
</div>
</div>

<!--修改头像 弹窗 Modal -->
<div class="modal fade" id="update-image" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" style="margin-left: 180px" >修改头像</h3>
        <button type="button" class="close" onclick="closeImageModal()" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row align-items-center">
          <div class="login-form" style="margin: 0 auto">
            <div class="form-group">
              <label  class="control-label mb-1">上传头像:</label>
              <input type="file" id="addImage" name="image" value="" required></span><br>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary"  onclick="sendImage()" style="margin: 0 auto;width: 200px">上传</button>
        </div>

      </div>
    </div>
  </div>
</div>


<!-- Template JavaScript -->
<script src="assets/js/jquery-3.3.1.min.js"></script>
<script src="assets/js/theme-change.js"></script>
<script src="js/jquery.js"></script>
<!--/MENU-JS-->
<script>
  $(window).on("scroll", function () {
    var scroll = $(window).scrollTop();
    if (scroll >= 80) {
      $("#site-header").addClass("nav-fixed");
    } else {
      $("#site-header").removeClass("nav-fixed");
    }
  });

  $(function (){
    var username = sessionStorage.getItem("username")
    var userId = sessionStorage.getItem("userid")
    if (username!=null){
      $.ajax({
        url:"/user/info",
        type:"get",
        dataType:"json",
        data:{
          uid:userId,
        },
        success:function (data){
          if (data.flag){

            sessionStorage.setItem("userPrice",data.data.uprice);

            $("#avatar").append(
                    '<img onclick="openImageModal()" src="/image/'+data.data.uimage+'"><br>'+
                    ' <span>用户:'+username+'</span>'
            )
            var oldName = document.getElementById("user-name");
            oldName.value = username;
            var oldPhone = document.getElementById("user-phone");
            oldPhone.value = data.data.uphone;

            sessionStorage.setItem("userphone",data.data.uphone);

          }

        }
      })
    }else {
      openLoginModal();
      $("#avatar").append(
              '<img  src="/image/nologin.jpg"><br>'+
              ' <span>用户:未登录</span>'
      )
    }

  })

  function delUser() {

          var result = confirm("你确定注销吗？");
          if (result) {
            // 如果用户点击了确定按钮
                $.ajax({
                  url: "/user/deleted",
                  type: "get",
                  dataType: "json",
                  data: {
                    uid: sessionStorage.getItem("userid"),
                  },
                  success: function (data) {
                    if (data.flag){
                      alert("注销成功！");
                      exit();
                      window.location.href = "my.jsp";
                    } else {
                      alert("注销失败");
                    }
                  }
                });

          } else {
            // 如果用户点击了取消按钮
            alert("取消注销操作！");
          }
  }

  function update(){
    var inputName =   $("#user-name").val()
    var inputOldPass =   $("#old-pass").val()
    var inputNewPass =   $("#new-pass").val()
    var inputPhone =  $("#user-phone").val()
    console.log(sessionStorage.getItem("userpass"))
    if (inputOldPass ==  sessionStorage.getItem("userpass"))  {
      $.ajax({
        url:"/user/update",
        type:"get",
        dataType:"json",
        data:{
          uid:sessionStorage.getItem("userid"),
          uname:inputName,
          upass:inputNewPass,
          uphone:inputPhone,
        },
        success: function (data){
          if (data.flag) {
              alert("修改成功！")
              window.location.href = "my.jsp";
          }else {
            alert("修改失败！")
          }
        }
      })
    }else {
      alert("原密码不正确！")
    }



  }

  function sendImage() {
    var userId = sessionStorage.getItem("userid");

    var formData = new FormData();
    formData.append("image", $("#addImage")[0].files[0]);
    var newImage = formData.get("image").name;
    console.log(newImage)
    $.ajax({
      url: "/image/upload",
      type: "post",
      data: formData,
      processData: false,
      contentType: false,
      success: function(data) {
        $.ajax({
          url: "/user/image",
          type: "post",  // 或者使用 "put" 请求
          dataType: "json",
          data: {
            uid: userId,
            uimage: newImage,  // 使用上传成功后返回的文件名
          },
          success: function (data) {
            if (data.flag){
              alert("上传成功")
              closeImageModal();
              window.location.href = "my.jsp";
            }else {
              alert("上传失败")
            }
          }
         })
       }
     })
 }

 function switchUser() {
    $.ajax({
      url:"/user/phone",
      type:"get",
      dataType:"json",
      data:{
        uphone:sessionStorage.getItem("userphone"),
      },
      success:function (data){
        $("#change-user").empty();
        $("#change-user").append(
                '<h3>选择你的账户:</h3>'
        )
        if (data.flag){
          var crruent = sessionStorage.getItem("username");

          for (var i = 0; i < data.data.length ; i++) {
            var list = data.data[i];

            $("#change-user").append(
                  '<div onclick="login(\'' + list.uname + '\',\'' + list.upass + '\')" class="user-item" >' +
                    '<img style="width: 50px;height: 50px" src="/image/'+list.uimage+'">'+

                    '<span style="margin-left: 100px">' + list.uname + (list.uname===crruent ? '<span style="margin-left: 150px;color: #0176f6">当前使用</span>' : '') + '</span>'+
                    '</div>'
             )
          }
          $("#change-user").append(
                  '<div onclick="register(\'' + sessionStorage.getItem("userphone") + '\')" class="user-item" >' +
                  '<img style="width: 50px;height: 50px" src="/image/add.jpg">'+
                  '<span style="margin-left: 100px" >添加账号</span>'+
                  '</div>'
          )
        }
      }
    })
 }


  function register(phone) {
    openRegisterModal();
    var inputName = $("#register-name").val();
    var inputPass = $("#register-pass").val();

    if (phone != null){
      var inputPhone = document.getElementById("register-phone");
      inputPhone.value = phone;
    }else {
      var inputPhone = $("#register-phone").val();
    }

    $.ajax({
      url:"/user/register",
      type:"get",
      dataType:"json",
      data:{
        uname:inputName,
        upass:inputPass,
        uphone:inputPhone,
      },
      success: function (data){
        if (data.flag){
          alert("注册成功");
          $("#uname").empty();
          $("#upass").empty();
          $("#uphone").empty();
          openLoginModal();
        }else {
          alert("注册失败")
        }
      }
    })
  }

  function login(username,password) {
    var inputName = ""
    var inputPass = ""
    if (username!=null){
      inputName = username;
      inputPass = password;
    }else {
       inputName = $("#login-name").val();
       inputPass = $("#login-pass").val();
    }

    $.ajax({
      url:"/user/login",
      type:"get",
      dataType:"json",
      data:{
        uname:inputName,
        upass:inputPass,
      },
      success: function (data){
        if (data.flag){

          if (data.data.udeleted > 0){
            alert("登陆成功");
            closeLoginModal();
            // 将用户ID存储到 localStorage 或 sessionStorage
            sessionStorage.setItem("userid", data.data.uid);
            sessionStorage.setItem("username", inputName);
            sessionStorage.setItem("userpass", inputPass);
            window.location.href = "my.jsp";
          }else {
            alert("该用户已被注销");
          }
        }else {
          alert("登陆失败")
        }
      }
    })
  }



  function exit() {
    sessionStorage.removeItem("userid");
    sessionStorage.removeItem("username");

    alert("退出成功")

    openLoginModal();
    window.location.href = "my.jsp"
  }
  function openImageModal() {
    closeRegisterModal();
    $('#update-image').modal('show');
  }
  function closeImageModal() {
    $('#update-image').modal('hide');
  }
  function openLoginModal() {
    closeRegisterModal();
    $('#login').modal('show');
  }
  function closeLoginModal() {
    $('#login').modal('hide');
  }
  function openRegisterModal() {
    closeLoginModal();
    $('#register').modal('show');
  }
  function closeRegisterModal() {
    $('#register').modal('hide');
  }
</script>

<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
