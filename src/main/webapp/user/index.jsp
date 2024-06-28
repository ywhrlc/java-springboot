

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!doctype html>
<html lang="zxx">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>主页</title>
  <link href="http://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
  <link href="http://fonts.googleapis.com/css2?family=Lato:ital,wght@0,300;0,400;0,700;1,400&display=swap"
        rel="stylesheet">
  <link rel="stylesheet" href="assets/css/style-starter.css">

  <style>
    #select-city {
      border: 1px solid transparent; /* 初始状态下边框透明 */
      transition: border-color 0.3s; /* 添加过渡效果 */

      /* 其他样式 */
      cursor: pointer;
    }

    #select-city:hover {
      border-color: #fa0202; /* 鼠标悬停时边框颜色为黑色 */
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
      </a>
      </h1>
      <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
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
    </nav>

  </div>
</header>



<section class="w3l-main-slider" id="home">
  <div class="banner-content" id="lunbotu">
    <div id="demo-1"
         data-zs-src='["/image/banner1.jpg", "/image/banner2.jpg", "/image/banner3.jpg", "/image/banner4.jpg"]'
         data-zs-overlay="dots">
      <div class="demo-inner-content">
        <div class="container">
          <div class="banner-infhny">
            <div class="flex-wrap search-wthree-field mt-md-5 mt-4">
              <form action="#" method="post" class="booking-form">
               <div class="row book-form">
                 <div class="form-input col-md-6 mt-md-0 mt-3 d-flex justify-content-center">
                   <input id="input-city" type="text" placeholder="请输入你的目的地" value="">
                 </div>
                 <div class="bottom-btn col-md-4 mt-md-0 mt-3">
                   <button type="button" onclick="search()" class="btn btn-style btn-secondary"><span class="fa fa-search mr-3" aria-hidden="true"></span> 搜索</button>
                 </div>
              </div>
             </form>
           </div>
         </div>
        </div>
      </div>
    </div>
  </div>
</section>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">旅游详情</h5>
        <button type="button" class="close" onclick="closeModal()" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row align-items-center" id="modal-city">


        </div>

      </div>

    </div>
  </div>
</div>



<section class="w3l-grids-3 py-5">
  <div class="container py-md-5">
    <div class="title-content text-left mb-lg-5 mb-4">
      <h3 class="hny-title">流行的旅游圣地</h3>
    </div>
    <div class="row bottom-ab-grids"  id="city_info">
      <!--/row-grids-->

      <!--//row-grids-->
    </div>
  </div>
</section>

    <script src="js/jquery.js"></script>
    <script>

      function openModal() {
        $('#exampleModal').modal('show');
      }


      function closeModal() {
        $('#exampleModal').modal('hide');
      }
      $(function () {
        $.ajax({
          url:"/city/list",
          type:"get",
          dataType:"json",
          data:{},
          success:function (data){
            for (var i = 0; i < data.data.length ; i++) {
                var list = data.data[i];
                var cityName = list.city_name;
                var cityImage = list.city_image;
               var cityDay = list.city_day;
               var cityPrice = list.city_price;
               var cityDel = list.city_deleted;
              if(cityDel > 0){
                $("#city_info").append(
                        '<div  class="col-lg-6 subject-card mt-lg-0 mt-4">'+
                        '<div onclick="cityinfo(' + list.city_id + ')" id="select-city" class="subject-card-header p-4">'+

                        '<div class="row align-items-center">'+
                        '<div class="col-sm-5 subject-img">'+
                        '<img src="/image/' + cityImage + '" class="img-fluid" >'+
                        '</div>'+
                        '<div class="col-sm-7 subject-content mt-sm-0 mt-4">'+
                        '<h4>'+cityName+'</h4>'+
                        '<p>'+cityDay+'天'+'</p>'+
                        '<div class="dst-btm">'+
                        '<h6 class="">'+"总费用"+'</h6>'+
                        '<span>'+cityPrice+'元'+'</span>'+
                        '</div>'+
                        '<p class="sub-para">Per person on twin sharing</p>'+
                        '</div></div></div></div>'

                )
              }else {
                continue;
              }

            }

          }
        })
      });

      function cityinfo(city_id) {

        $.ajax({
          url:"/city/content",
          type:"get",
          dataType:"json",
          data:{
            city_id:city_id,
          },
          success:function (data){
            if (data.flag){

                $("#modal-city").empty();
                $("#modal-city").append(
                        '<div class="col-md-4">'+
                        '<span style="color: red">'+'度假天数：'+data.data.city_day+'天'+'</span><br>'+
                        '<span style="color: red"> '+'总费用：'+data.data.city_price+'元'+'</span>'+
                        '<a href="#url"><img src="/image/' + data.data.city_image + '" class="img-fluid" alt=""></a>'+
                        '</div>'+
                        '<div class="col-md-8">'+
                        '<h5>《'+data.data.city_name+'》</h5><hr>'+

                        '<p>&nbsp&nbsp&nbsp&nbsp'+data.data.city_info+'</p>'+
                        '</div>'+
                        '<div class="modal-footer">'+
                        '<button onclick="addCity(' + city_id + ')" style="margin-left: 300px" type="button" class="btn btn-secondary" >加入购物车</button>'+
                        ' </div> '
                )
              }
              openModal();
            }
        })
      }

      function search() {
        var inputCity = $("#input-city").val();
        $.ajax({
          url:"/city/search",
          type:"get",
          dataType:"json",
          data:{
            city_name:inputCity,
          },
          success:function (data){
            if (data.flag){
              console.log(data.data)
              $("#modal-city").empty();
              for (var i = 0; i < data.data.length ; i++) {
                 var  list  =  data.data[i];

                $("#modal-city").append(
                        '<div class="col-md-4">'+
                        '<span style="color: red">'+'度假天数：'+list.city_day+'天'+'</span><br>'+
                        '<span style="color: red"> '+'总费用：'+list.city_price+'元'+'</span>'+
                        '<a href="#url"><img src="/image/' + list.city_image + '" class="img-fluid" alt=""></a>'+
                        '</div>'+
                        '<div class="col-md-8">'+
                        '<h5>《'+list.city_name+'》</h5><hr>'+

                        '<p>&nbsp&nbsp&nbsp&nbsp'+list.city_info+'</p>'+
                        '</div>'+
                        '<div class="modal-footer">'+
                        '<button onclick="addCity(' + list.city_id + ')" style="margin-left: 300px" type="button" class="btn btn-secondary" >加入购物车</button>'+
                        ' </div> '
                )
              }
              openModal();
            }
          }
        })
      }

      function addCity(city_id) {

        var userId = sessionStorage.getItem("userid");
        if (userId!=null){
          $.ajax({
            url:"/user/add",
            type:"get",
            dataType:"json",
            data:{
              cid:city_id,
              uid:userId,
            },
            success:function (data){
              if (data.flag){
                alert("添加购物车成功!")
                closeModal();
              }else {
                alert("已存在,请勿重复添加!")
                closeModal();
              }
            }
          })
        }else {
          alert("请先去登录！")
        }

      }


      // 滚动后 标题变红
      $(window).on("scroll", function () {
        var scroll = $(window).scrollTop();

        if (scroll >= 80) {
          $("#site-header").addClass("nav-fixed");
        } else {
          $("#site-header").removeClass("nav-fixed");
        }
      });
    </script>

<!-- Template JavaScript -->
<script src="assets/js/jquery-3.3.1.min.js"></script>
<script src="assets/js/theme-change.js"></script>
<!--/slider-js-->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/modernizr-2.6.2.min.js"></script>
<script src="assets/js/jquery.zoomslider.min.js"></script>

<script src="assets/js/owl.carousel.js"></script>
<script src="assets/js/jquery.waypoints.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

</body>

</html>
