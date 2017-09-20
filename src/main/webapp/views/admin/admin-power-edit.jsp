<%--
  Created by IntelliJ IDEA.
  User: Nero
  Date: 2017/9/19
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script language="javascript">
        window.onunload = function(){
            window.opener.location.reload();
        }
    </script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
    <title>admin-power-edit</title>
</head>
<body>
<% int adminid=Integer.parseInt(request.getParameter("adminid"));%>
<form action="/admin/admin_power" method="get">
    请选择：<br /><br />
    <input type="hidden" name="adminid" value="<%=adminid%>">
    <label ><input name="power" type="radio" value="3" /> 文件管理</label>
    <label ><input name="power" type="radio" value="4" /> 用户管理 </label>
    <br>
    <input type="submit" value="确定"/>
    </br>
</form>

</body>
</html>
