<%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2024/6/27
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<script src="static/js/jquery.js"></script>
<script>
  $(function (){

    if (sessionStorage.getItem("adminName")!=null){
      window.location.href = "manager.jsp?admin=" + sessionStorage.getItem("adminName");
    }else {
        window.location.href = "login.jsp";
    }

  })
</script>

</body>
</html>
