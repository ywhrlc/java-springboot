<%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2024/6/18
  Time: 8:51
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

    <link href="static/css/chartist.min.css" rel="stylesheet">
    <link href="static/css/jqvmap.min.css" rel="stylesheet">

    <link href="static/css/weather-icons.css" rel="stylesheet">
    <link href="static/css/fullcalendar.min.css" rel="stylesheet">

    <style>
        #weatherWidget .currentDesc {
            color: #ffffff!important;
        }

        #flotPie1 td {
            padding:3px;
        }
        #flotPie1 table {
            top: 20px!important;
            right: -10px!important;
        }
        .form-control{
            width: 300px;

        }
        .modal-body{
            padding-left: 50px;
        }


        tr,td,th{

            text-align: center !important;

        }
        .cityInfo:hover{
            background-color: #dadada; /* 鼠标悬停时的背景颜色 */
        }
        #modal-city{
            margin: 0px 50px 50px 50px;
        }

    </style>
</head>

<body>
<!-- Left Panel -->
<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="table.jsp"> <i class="menu-icon fa fa-table"></i>旅游管理</a>
                </li>
                <li>
                    <a href="user.jsp"> <i class="menu-icon fa fa-id-badge"></i>用户列表</a>
                </li>
                <li>
                    <a href="message.jsp"> <i class="menu-icon ti-email"></i>留言信息 </a>
                </li>
<%--                <li>--%>
<%--                    <a href="manager.jsp"> <i class="menu-icon fa fa-cogs"></i>管理员</a>--%>
<%--                </li>--%>

                <li class="menu-item-has-children ">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>管理员</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-tasks"></i><a href="manager.jsp">管理员列表</a></li>
                        <li><i class="fa fa-exclamation-triangle"></i><a href="delete.jsp">注销账户</a></li>
                        <li><i class="fa fa-street-view"></i><a href="exit.jsp">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside>

<div id="right-panel" class="right-panel">

    <header id="header" class="header">
        <div class="top-left">
            <div class="navbar-header">
                <a class="navbar-brand" href=""><img src="/image/logo1.jpg" alt="Logo"></a>
                <a class="navbar-brand hidden" href=""><img src="static/picture/logo2.png" alt="Logo"></a>
                <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
            </div>
        </div>

    </header>

    <!-- Content -->
    <div class="content">
        <!-- Animated -->
        <div class="animated fadeIn">

            <!-- Orders -->
            <div class="orders">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <h4 style="margin-left: 20px" class="box-title">旅游管理</h4>
                                    </div>
                                    <div class="col">
                                        <button type="button" onclick="add()" class="btn btn-outline-primary">旅游景点➕</button>
                                    </div>
                                </div></div>
                            <div class="card-body--" >
                                <div class="table-stats order-table ov-h">
                                    <table class="table ">

                                        <thead id="thead">

                                        </thead>

                                        <tbody id="tbody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

<%--            修改 modal--%>
            <div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true">
                <div class="modal-dialog " role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="smallmodalLabel">修改景点信息</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" >
                            <div class="form-group">
                                <label  class="control-label mb-1">城市名称</label>
                                <input id="city-name" name="cc-payment" type="text" class="form-control" aria-required="true" aria-invalid="false" value="100.00">
                            </div>
                            <div class="form-group">
                                <label  class="control-label mb-1">旅游天数</label>
                                <input id="city-day" name="cc-payment" type="text" class="form-control" aria-required="true" aria-invalid="false" value="">
                            </div>
                            <div class="form-group">
                                <label  class="control-label mb-1">总费用</label>
                                <input id="city-price" name="cc-payment" type="text" class="form-control" aria-required="true" aria-invalid="false" value="">
                            </div>
                            <div class="form-group">
                                <label  class="control-label mb-1">图片</label><input id="old-image" value="">

                                <input type="file" id="city-image" name="image" value="" required></span><br>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-1"><label  class=" form-control-label">景点简介</label></div>
                                <div class="col-12 col-md-11"><textarea name="textarea-input" id="city-info" rows="5" placeholder="Content..." class="form-control"></textarea></div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="sub-update" style="margin-right: 45px;padding-left: 55px;padding-right: 55px" class="btn btn-primary">修改</button>
                        </div>
                    </div>
                </div>
            </div>
<%--             添加 modal--%>
            <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true">
                <div class="modal-dialog " role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" >添加旅游地信息</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label  class="control-label mb-1">城市名称</label>
                                <input id="addName" name="cc-payment" placeholder="请输入景点城市" type="text" class="form-control" aria-required="true" aria-invalid="false" value="">
                            </div>
                            <div class="form-group">
                                <label  class="control-label mb-1">旅游天数</label>
                                <input id="addDay" name="cc-payment" placeholder="请输入去旅游天数" type="text" class="form-control" aria-required="true" aria-invalid="false" value="">
                            </div>
                            <div class="form-group">
                                <label  class="control-label mb-1">总费用</label>
                                <input id="addPrice" name="cc-payment" placeholder="请输入总体费用" type="text" class="form-control" aria-required="true" aria-invalid="false" value="">
                            </div>
                            <div class="form-group">
                                <label  class="control-label mb-1">图片</label>

                                <input type="file" id="addImage" name="image" value="" required></span><br>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-1"><label  class=" form-control-label">景点简介</label></div>
                                <div class="col-12 col-md-11"><textarea name="textarea-input" id="addInfo" rows="4" placeholder="内容" class="form-control"></textarea></div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="sub-add" style="margin-right: 45px;padding-left: 55px;padding-right: 55px" class="btn btn-primary">添加</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

 <%-- 查看 city 详情 modal弹窗--%>
    <div class="modal fade" id="show" tabindex="-1" role="dialog" aria-labelledby="largeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="largeModalLabel">旅游城市详情</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div  class="row align-items-center" id="modal-city">

                    </div>
                </div>
            </div>
        </div>
    </div>






</div>

<script src="static/js/jquery.min.js"></script>
<script src="static/js/popper.min.js"></script>

<script src="static/js/jquery.matchHeight.min.js"></script>
<script src="static/js/main.js"></script>

<!--  Chart js -->
<script src="static/js/Chart.bundle.min.js"></script>

<!--Chartist Chart-->
<script src="static/js/chartist.min.js"></script>
<script src="static/js/chartist-plugin-legend.min.js"></script>

<script src="static/js/jquery.flot.min1.js"></script>
<script src="static/js/jquery.flot.pie.min1.js"></script>
<script src="static/js/jquery.flot.spline.min.js"></script>

<script src="static/js/jquery.simpleWeather.min.js"></script>
<script src="static/js/weather-init.js"></script>

<script src="static/js/moment.min.js"></script>
<script src="static/js/fullcalendar.min.js"></script>
<script src="static/js/fullcalendar-init.js"></script>
<script src="static/js/jquery.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script>
    $(function (){
        $("#thead").empty();
        $("#tbody").empty();
        if (sessionStorage.getItem("adminName")!=null){
            list();
        }else {
            window.location.href = "login.jsp";
        }


    })

    /*点击 tr 标签 获取 city信息*/

    function cityinfo(cityId) {
        // 获取当前触发事件的元素
        var targetElement = event.target || event.srcElement;
        // 检查目标元素是否是按钮
        if (targetElement.tagName.toLowerCase() !== 'button') {
            // 显示 详情 弹窗
            var myModal = new bootstrap.Modal(document.getElementById('show'));
            myModal.show();

            $.ajax({
                url:"/city/content",
                type:"get",
                dataType:"json",
                data:{
                    city_id:cityId,
                },
                success:function (data){

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
                        '</div>'
                    )
                }
             })
        }
    }

    function list() {
        $.ajax({
            url:"/city/list",
            type:"get",
            dataType:"json",
            data:{},
            success:function (data){

                $("#thead").append(
                    '<tr>'+
                        '<th>景点ID</th>'+
                        '<th>景点名称</th>'+
                        '<th>图片</th>'+
                        '<th>旅游天数</th>'+
                        '<th>价格</th>'+
                        '<th class="bianji">编辑</th>'+
                    '</tr>'
                )

                for (var i = 0; i < data.data.length ; i++) {
                    var list = data.data[i];
                    var cityId = list.city_id;
                    var cityName = list.city_name;
                    var cityImage = list.city_image;
                    var cityDay = list.city_day;
                    var cityPrice = list.city_price;
                    var cityInfo = list.city_info;
                    var cityDel = list.city_deleted;
                    if (cityDel > 0) {
                        $("#tbody").append(
                            '<tr class="cityInfo" onclick="cityinfo(' + cityId + ')" style="cursor:pointer;">' +
                            '<td> ' + cityId + ' </td>' +
                            '<td>  <span >' + cityName + '</span> </td>' +
                            '<td><img src=" /image/' + cityImage + '" ></td>' +
                            '<td> <span >' + cityDay + '天' + '</span> </td>' +
                            '<td><span >' + cityPrice + '元' + '</span></td>' +
                            '<td>' +
                            '<button type="button" onclick="updateinfo(' + cityId + ',\'' + cityName + '\',\'' + cityImage + '\',' + cityDay + ',' + cityPrice + ',\'' + cityInfo + '\')"  class="btn btn-success">修改</button>' +
                            '&nbsp&nbsp&nbsp&nbsp' +
                            '<button type="button" onclick="del(' + cityId + ')" class="btn btn-secondary">下架</button>' +
                            '</td>' +
                            '</tr>'
                        )
                    }else {
                        continue;
                    }

                }

            }
        })
    }

    function updateinfo(cityId,cityName,cityImage,cityDay,cityPrice,cityInfo) {

        var oldName = document.getElementById("city-name");
        oldName.value = cityName;
        var oldImage = document.getElementById("old-image");
        oldImage.value = cityImage;
        var oldDay = document.getElementById("city-day");
        oldDay.value = cityDay;
        var oldPrice = document.getElementById("city-price");
        oldPrice.value = cityPrice;
        var oldInfo = document.getElementById("city-info");
        oldInfo.value = cityInfo;
        // 显示修改弹窗
        console.log("============")
        var myModal = new bootstrap.Modal(document.getElementById('update'));
        myModal.show();

        // 点击修改按钮  更新到后台

        $("#sub-update").off('click').on('click', function() {
            var newName = $("#city-name").val();

            var newDay = $("#city-day").val();

            var newPrice = $("#city-price").val();

            var newInfo = $("#city-info").val();

            var formData = new FormData();
            formData.append("image", $("#city-image")[0].files[0]);
            var newImage = formData.get("image").name;

            $.ajax({
                url: "/image/upload",
                type: "post",
                data: formData,
                processData: false,
                contentType: false,
                success: function(data) {
                    $.ajax({
                        url: "/city/update",
                        type: "post",  // 或者使用 "put" 请求
                        dataType: "json",
                        data: {
                            city_id: cityId,
                            city_name: newName,
                            city_image: newImage,  // 使用上传成功后返回的文件名
                            city_day: newDay,
                            city_price: newPrice,
                            city_info: newInfo,
                        },
                        success: function(data) {
                            if (data.flag) {
                                alert("修改成功");
                                // 关闭模态框
                                myModal.hide();

                                $("#thead").empty();
                                $("#tbody").empty();
                                list();

                            }else {
                                alert("修改失败");
                            }
                        },
                        error: function(xhr, status, error) {
                            console.log("修改失败：" + error);
                        }
                    });
                },
                error: function(xhr, status, error) {
                    console.log("上传失败：" + error);
                }
            });
        });
    }

    function del(cityId) {
        $.ajax({
            url:"/city/delect",
            type:"get",
            dataType:"json",
            data:{
                city_id: cityId,
            },
            success:function (data){
                if (data.flag){
                    alert("下架成功");
                    $("#thead").empty();
                    $("#tbody").empty();
                    list();
                }else {
                    alert("下架失败")
                }
            }
        })
    }
    function add() {

        // 显示修改弹窗
        var myModal = new bootstrap.Modal(document.getElementById('add'));
        myModal.show();

        $("#sub-add").off('click').on('click', function() {
            var cityName = $("#addName").val();
            var cityDay = $("#addDay").val();
            var cityPrice = $("#addPrice").val();
            var cityInfo = $("#addInfo").val();

            var formData = new FormData();
            formData.append("image", $("#addImage")[0].files[0]);
            var cityImage = formData.get("image").name;

            $.ajax({
                url: "/image/upload",
                type: "post",
                data: formData,
                processData: false,
                contentType: false,
                success: function(data) {
                    console.log(data)
                    $.ajax({
                        url: "/city/add",
                        type: "get",
                        dataType: "json",
                        contentType: "application/json,charset=utf-8",
                        data: {
                            city_name: cityName,
                            city_day: cityDay,
                            city_price: cityPrice,
                            city_image: cityImage,
                            city_info: cityInfo,
                        },
                        success: function (data) {
                            if (data.flag) {
                                alert("添加成功");
                                // 关闭模态框
                                myModal.hide();

                                // 清空输入框内容
                                $("#addName").val("");
                                $("#addDay").val("");
                                $("#addPrice").val("");
                                $("#addInfo").val("");
                                $("#addImage").val("");  // 清空文件输入框内容
                                $("#thead").empty();
                                $("#tbody").empty();
                                list();
                            } else {
                                alert("添加失败")
                            }
                        }
                    })
                }
            })

        });
    }

</script>
</body>
</html>

