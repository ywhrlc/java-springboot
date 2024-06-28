<%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2024/6/18
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
        .traffic-chart {
            min-height: 335px;
        }
        #flotPie1  {
            height: 150px;
        }
        #flotPie1 td {
            padding:3px;
        }
        #flotPie1 table {
            top: 20px!important;
            right: -10px!important;
        }
        .chart-container {
            display: table;
            min-width: 270px ;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #flotLine5  {
            height: 105px;
        }

        #flotBarChart {
            height: 150px;
        }
        #cellPaiChart{
            height: 160px;
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
                    <a href="table.jsp"  > <i class="menu-icon fa fa-table"></i>旅游管理</a>
                </li>
                <li>
                    <a href="user.jsp"  > <i class="menu-icon fa fa-id-badge"></i>用户列表</a>
                </li>
                <li>
                    <a href="message.jsp"> <i class="menu-icon ti-email"></i>留言信息 </a>
                </li>

                <li class="menu-item-has-children ">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>管理员</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><a href="manager.jsp"><i  class="fa fa-tasks"></i>管理员列表</a></li>
                        <li><a href="delete.jsp"><i class="fa fa-exclamation-triangle"></i>注销账户</a></li>
                        <li><a href="exit.jsp"><i class="fa fa-street-view"></i>退出登录</a></li>
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
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">管理员列表</strong>
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <thead class="thead-dark" >
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">姓名</th>
                                        <th scope="col">密码</th>
                                        <th scope="col">电话</th>
                                        <th scope="col">状态</th>
                                        <th scope="col">编辑</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tbody">

                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--            修改 modal--%>
            <div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="smallmodalLabel">修改个人信息</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label  class="control-label mb-1">姓名:</label>
                                <input id="admin-name" name="cc-payment" type="text" class="form-control" aria-required="true" aria-invalid="false" value="100.00">
                            </div>
                            <div class="form-group">
                                <label  class="control-label mb-1">密码:</label>
                                <input id="admin-pass" name="cc-payment" type="text" class="form-control" aria-required="true" aria-invalid="false" value="">
                            </div>
                            <div class="form-group">
                                <label  class="control-label mb-1">手机号</label>
                                <input id="admin-phone" name="cc-payment" type="text" class="form-control" aria-required="true" aria-invalid="false" value="">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="sub-update" style="margin-right: 45px;padding-left: 55px;padding-right: 55px" class="btn btn-primary">修改</button>
                        </div>
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

            var urlParams = new URLSearchParams(window.location.search);
            var admin = urlParams.get('admin');
            list();
            if(admin ==sessionStorage.getItem("adminName") ){
                deleted(admin);
            }
        }else {
            window.location.href = "login.jsp";
        }


    })

    function list() {
        $.ajax({
            url:"/admin/list",
            type:"get",
            dataType:"json",
            data:{},
            success:function (data) {

                for (var i = 0; i < data.data.length; i++) {
                    var list = data.data[i];
                    if(list.adeleted > 0){
                        $("#tbody").append(
                            '<tr>' +
                            '<td>' + list.aid + '</td>' +
                            '<td>' + list.aname + '</td>' +
                            '<td>' + list.apass + '</td>' +
                            '<td>' + list.aphone + '</td>' +
                            '<td style="color: #1986ff">' + (list.aname == sessionStorage.getItem("adminName") ? '当前使用' : '') + '</td>' +

                            '<td>' +
                            '<button type="button" onclick="update(' + list.aid + ',\'' + list.aname + '\',\'' + list.apass + '\',\'' + list.aphone + '\')" class="btn btn-success" ' + (list.aname == sessionStorage.getItem("adminName") ? '' : 'style="display:none;"') + '>修改</button>'+
                            '</td>' +

                            '</tr>'
                        );
                    }else {
                        continue;
                    }

                }
            }
        })
    }

    function deleted(admin) {
        var result = confirm("你确定注销吗？");
        if (result) {

            $.ajax({
                url: "/admin/deleted",
                type: "get",
                dataType: "json",
                data: {
                    aname: admin,
                },
                success: function (data) {
                    if (data.flag){
                        alert("注销成功！");
                        window.location.href = "exit.jsp";
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

    function update(aid,aname,apass,aphone) {
        var oldName = document.getElementById("admin-name");
        oldName.value = aname;
        var oldPass = document.getElementById("admin-pass");
        oldPass.value = apass;
        var oldPhone = document.getElementById("admin-phone");
        oldPhone.value = aphone;

        var myModal = new bootstrap.Modal(document.getElementById('update'));
        myModal.show();

        $("#sub-update").off('click').on('click', function() {
            var newName = $("#admin-name").val();

            var newPass = $("#admin-pass").val();

            var newPhone = $("#admin-phone").val();

               $.ajax({
                        url: "/admin/update",
                        type: "post",
                        dataType: "json",
                        data: {
                            aid: aid,
                            aname: newName,
                            apass: newPass,
                            aphone: newPhone,
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
                                alert("该用户名已存在！");
                            }
                        },
                        error: function(xhr, status, error) {
                            console.log("修改失败：" + error);
                        }
                    });
                });
    }


</script>
</body>
</html>

