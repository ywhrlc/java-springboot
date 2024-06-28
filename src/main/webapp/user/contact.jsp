<%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2024/6/17
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zxx">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Contact</title>
  <!-- google fonts -->
  <link href="http://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
  <link href="http://fonts.googleapis.com/css2?family=Lato:ital,wght@0,300;0,400;0,700;1,400&display=swap"
        rel="stylesheet">
  <!-- google fonts -->
  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style-starter.css">
  <!-- Template CSS -->
</head>

<body>
<!--header-->
<header id="site-header" class="fixed-top">
  <div class="container">
    <nav class="navbar navbar-expand-lg stroke">
      <h1><a class="navbar-brand mr-lg-5" href="index.jsp">
        Traversal
      </a></h1>
      <!-- if logo is image enable this
    <a class="navbar-brand" href="#index.html">
        <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
    </a> -->
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
          <li class="nav-item">
            <a class="nav-link" href="my.jsp">我的</a>
          </li>
        </ul>
      </div>

      <div class="d-lg-block d-none">
        <a href="contact.jsp" class="btn btn-style btn-secondary">联系我们</a>
      </div>
      <!-- toggle switch for light and dark theme -->
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
      <!-- //toggle switch for light and dark theme -->
    </nav>
  </div>
</header>

<section class="w3l-about-breadcrumb text-left">
  <div class="breadcrumb-bg breadcrumb-bg-about py-sm-5 py-4">
    <div class="container py-2">
      <h2 class="title">联系我们</h2>
      <ul class="breadcrumbs-custom-path mt-2">
        <li><a href="index.jsp">主页</a></li>
        <li class="active"><span class="fa fa-arrow-right mx-2" aria-hidden="true"></span>联系</li>
      </ul>
    </div>
  </div>
</section>

<%--个人信息 填写 和 留言--%>
<section class="w3l-contact" id="contact">
  <div class="contact-infubd py-5">
    <div class="container py-lg-3">
      <div class="contact-grids row">
        <div class="col-lg-6 contact-left">
          <div class="partners">
            <div class="cont-details">
              <h5>取得联系</h5>
              <p class="mt-3 mb-4">您好，我们通过传真、电子邮件或电话全天候24小时为您服务。请给我们留言，以便进一步交流。</p>
            </div>
            <div class="hours">
              <h6 class="mt-4">电子邮件：</h6>
              <p> <a href="mailto:mail@traversal.com">
               2034504934@qq.com</a></p>
              <h6 class="mt-4">来访地址：</h6>
              <p>天津市大学软件学院</p>
              <h6 class="mt-4">联系方式:</h6>
              <p class="margin-top"><a href="#">18240718032</a></p>
            </div>
          </div>
        </div>
        <div class="col-lg-6 mt-lg-0 mt-5 contact-right">
            <div class="input-grids">
              <div class="form-group">
                <input type="text" name="w3lName" id="user-name" placeholder="您的姓名" class="contact-input" />
              </div>
              <div class="form-group">
                <input type="email" name="w3lSender" id="user-phone" placeholder="手机号" class="contact-input" required="" />
              </div>
            </div>
            <div class="form-group">
              <textarea name="w3lMessage" id="user-message" placeholder="留言信息" required=""></textarea>
            </div>
            <div class="text-right">
              <button onclick="send()" class="btn btn-style btn-primary">发送</button>
            </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Template JavaScript -->
<script src="assets/js/jquery-3.3.1.min.js"></script>
<script src="assets/js/theme-change.js"></script>
<script src="js/jquery.js"></script>
<!--/MENU-JS-->
<script>
   function send() {
     var inputName =  $("#user-name").val();
     var inputPhone = $("#user-phone").val();
     var inputMessage = $("#user-message").val();
     console.log(inputName)
     $.ajax({
       url:"/message/send",
       type:"get",
       dataType:"json",
       data:{
         name:inputName,
         phone:inputPhone,
         message:inputMessage,
       },
       success:function (data){
            if (data.flag){
              alert("发送成功");
            }else {
              alert("发送失败")
            }
       }
     })

   }



  $(window).on("scroll", function () {
    var scroll = $(window).scrollTop();
    if (scroll >= 80) {
      $("#site-header").addClass("nav-fixed");
    } else {
      $("#site-header").removeClass("nav-fixed");
    }
  });


</script>


<script src="assets/js/bootstrap.min.js"></script>

</body>

</html>
