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
    <title>我的</title>

    <link href="http://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css2?family=Lato:ital,wght@0,300;0,400;0,700;1,400&display=swap"
          rel="stylesheet">

    <link rel="stylesheet" href="assets/css/style-starter.css">
    <style>
   .cart-popup{

       /*margin-left: 500px;*/
       /*margin-right: 500px;*/
       padding: 10px;
       padding-right: 80px;
       text-align: right;
       background-color: #f3f3f3;
       border-radius: 5%;
       box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
       position: relative;
   }
   .checkout-button{
       margin-left: 100px;
       background-color: #fb662a;
   }
   .cart-total{
       color: red;
   }
   .cart-button {
       background-color: #007bff; /* 设置按钮的默认背景颜色 */
       color: white;
       padding: 10px 20px;
       border: none;
       cursor: pointer;
       transition: background-color 0.3s ease; /* 添加过渡效果 */
   }

   .cart-button:hover {
       background-color: #0056b3; /* 设置悬停时的背景颜色 */
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
                        <li class="nav-item active" >
                            <a class="nav-link" href="cart.jsp">购物车</a>
                        </li>
                        <li class="nav-item ">
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

    <section class="w3l-about-breadcrumb text-left">
        <div class="breadcrumb-bg breadcrumb-bg-about py-sm-5 py-4">
            <div class="container py-2">
                <h2 class="title">我的足迹</h2>
                <ul class="breadcrumbs-custom-path mt-2">
                    <li><a href="index.jsp">主页</a></li>
                    <li class="active"><span class="fa fa-arrow-right mx-2" aria-hidden="true"></span>我的购物车</li>
                </ul>
            </div>
        </div>
    </section>

    <section class="w3l-contact" style="margin-bottom: 80px" id="contact">
        <div class="contact-infubd py-5">
        </div>
    </section>


<%--    支付微信 二维码 弹窗--%>
    <div class="modal fade" id="payModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="margin-left: 200px">微信支付</h4>
                    <button type="button" class="close" onclick="closeModal()" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row align-items-center"  >
                        <img style="width: 300px;height: 300px;margin-left: 100px;margin-bottom: 30px" src="/image/wechat.jpg">
                    </div>
                    <div class="register-link m-t-15 text-center">
                        <p>支付宝支付 ? <a href="#" onclick="openZFBModal()">二维码</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--    支付微信 二维码 弹窗--%>
    <div class="modal fade" id="payModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="margin-left: 200px">支付宝支付</h4>
                    <button type="button" class="close" onclick="closeZFBModal()" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row align-items-center"  >
                        <img style="width: 300px;height: 300px;margin-left: 100px;margin-bottom: 30px" src="/image/zfb.jpg">
                    </div>
                    <div class="register-link m-t-15 text-center">
                        <p>微信支付 ? <a href="#" onclick="openModal()">二维码</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer id="site-footer" class="fixed-bottom">
        <div class="cart-container">
            <!-- 购物车悬浮框 -->
            <div id="cart-popup" class="cart-popup">

                <div class="cart-total">
                    <span> <strong>金额:</strong>￥<span id="cart-total">0.00</span>
                   <button onclick="openModal()" class="checkout-button">支付</button></span>
                </div>

            </div>
        </div>
    </footer>




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
            if (sessionStorage.getItem("userid")!=null){
                list();
                totalMoney();

            }else {
                window.location.href = "my.jsp";
            }

        })


        function list() {
            $("#contact").empty();

            var userId = sessionStorage.getItem("userid");
            $.ajax({
                url:"/user/show",
                type:"get",
                dataType:"json",
                data:{
                    uid:userId,
                },
                success:function (data){

                    if (data.data!=null){

                        $("#contact").empty();
                        for (var i = 0; i < data.data.length ; i++) {
                            var list =  data.data[i];

                                $("#contact").append(
                                    ' <div class="row align-items-center" style="margin: 20px 200px 0px 200px">'+

                                    '<div class="col-md-2" style="width:100px ">'+
                                    '<img style="width:100px; " src="/image/'+list.city_image+'" class="img-fluid" alt="">'+
                                    '</div>'+
                                    ' <div class="col-md-2">'+
                                    ' <h6>《'+list.city_name+'》</h6>'+
                                    ' <p >'+'旅游天数:<span  style="color: red">'+list.city_day+'</span ></p>'+
                                    ' <p >'+'金额:<span  style="color: red">'+list.city_price+'</span ></p>'+
                                    ' </div>'+
                                    ' <div class="col-md-2">'+
                                            '<p >'+(list.city_deleted > 0?"":"商品已下架")+'</p>'+
                                    ' </div>'+

                                    ' <div class="col-md-2">'+
                                    ' <div class="d-lg-block d-none">'+

                                    ' <a  class="cart-button" style=" width: 30px;height: 20px;padding: 5px;background-color: #ff6700" onclick="subtract('+list.city_id+','+list.city_price+')" >-</a>'+

                                    '<input type="text" id="number_' + list.city_id + '" style="width: 50px;margin-left: 40px" value="'+list.item.cnumber+'">'+
                                    ' </div>'+
                                    ' </div>'+

                                    ' <div class="col-md-2">'+
                                    ' <div class="d-lg-block d-none" >'+
                                    ' <a class="cart-button" style="width: 30px;height: 20px;padding: 5px;background-color: #ff6700"  onclick="purchase('+list.city_id+','+list.city_price+')" >+</a>'+
                                    ' </div>'+
                                    ' </div>'+

                                    ' <div class="col-md-2">'+
                                    ' <div  class="d-lg-block d-none">'+
                                    ' <a class="cart-button" onclick="delCity('+list.city_id+')" style="width: 30px;height: 15px;padding: 10px;background-color: red" >删除</a>'+
                                    ' </div>'+
                                    ' </div>'+
                                    '</div>'
                                )
                        }
                    }else {
                        $("#contact").append(
                        ' <h2 style="text-align: center;margin-top: 50px;color: red">购物车还没有内容~~~</h2>'
                        )
                    }
                }
            })
        }

        function subtract(city_id,city_price) {

            var inputNumber = document.getElementById('number_'+ city_id);
            var newNumber = parseInt(inputNumber.value);

            if (!isNaN(newNumber) && newNumber > 0) {
                newNumber--;
                inputNumber.value = newNumber;
                //更新 数据库 中的购买量
                updateNumber(city_id, newNumber);
                $.ajax({
                    url: "/user/info",
                    type: "get",
                    dataType: "json",
                    data: {
                        uid: sessionStorage.getItem("userid"),
                    },
                    success: function (data) {
                        if (data.flag){
                            var Money = data.data.uprice;
                            console.log("这是初始值"+Money)

                            Money = Money-city_price;
                            updateMoney(Money);
                        }
                    }
                })

            }
        }
        function purchase(city_id,city_price) {
            var inputNumber = document.getElementById('number_' + city_id);
            var newNumber = parseInt(inputNumber.value);

            if (!isNaN(newNumber)) {
                newNumber++;
                inputNumber.value = newNumber;
                //更新 数据库 中的购买量
                updateNumber(city_id, newNumber);

                $.ajax({
                    url: "/user/info",
                    type: "get",
                    dataType: "json",
                    data: {
                        uid: sessionStorage.getItem("userid"),
                    },
                    success: function (data) {
                        if (data.flag){
                            var Money = data.data.uprice;


                            console.log("这是初始值"+Money)
                            Money = Money+city_price;

                            updateMoney(Money);
                        }
                    }
                })
            }
        }

        function totalMoney() {

            $.ajax({
                url: "/user/info",
                type: "get",
                dataType: "json",
                data: {
                    uid: sessionStorage.getItem("userid"),
                },
                success: function (data) {
                    if (data.flag) {
                        var Money = data.data.uprice;
                        var cartTotalElement = document.getElementById('cart-total');
                        cartTotalElement.textContent = Money.toFixed(2);
                    }
                }
            })
        }

        function updateNumber(cid,number) {
            $.ajax({
                url:"/user/updateNumber",
                type:"get",
                dataType:"json",
                data:{
                    cnumber:number,
                    uid:sessionStorage.getItem("userid"),
                    cid:cid,
                },
                success:function (data) {


                }
            })
        }



        function updateMoney(money) {

            $.ajax({
                url: "/user/updatePrice",
                type: "get",
                dataType: "json",
                data: {
                    uid: sessionStorage.getItem("userid"),
                    uprice:money
                },
                success: function (data) {
                        if (data.flag){
                            totalMoney();
                        }
                }
            })
        }




        function delCity(city_id) {

            var inputNumber = document.getElementById('number_' + city_id);
            var newNumber = parseInt(inputNumber.value);

            if (newNumber == 0){

                var result = confirm("你确定要移除吗？");
                if (result) {
                    var userId = sessionStorage.getItem("userid");
                    $.ajax({
                        url:"/user/delcity",
                        type:"get",
                        dataType:"json",
                        data:{
                            uid:userId,
                            cid:city_id,
                        },
                        success:function (data){
                            if (data.flag){
                                    alert("已移除！");
                                    list();

                            }else {
                                alert("移除失败")
                            }
                        }
                    })
                        }else {
                        // 如果用户点击了取消按钮
                         alert("取消移除操作！");
                                }
            }else {
                alert("正在结算不能删除，清除购买数量即可！")
            }
        }

        function openModal() {
            closeZFBModal()
            $('#payModal1').modal('show');
        }
        function closeModal() {
            $('#payModal1').modal('hide');
        }
        function openZFBModal() {
            closeModal()
            $('#payModal2').modal('show');
        }
        function closeZFBModal() {
            $('#payModal2').modal('hide');
        }
    </script>

    <script src="assets/js/bootstrap.min.js"></script>
    </body>
</html>
