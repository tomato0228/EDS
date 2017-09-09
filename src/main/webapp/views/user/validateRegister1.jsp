<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>个人信息验证成功</title>
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    <script type="text/javascript" src="${ctx}/resources/js/jquery-3.2.1.min.js"></script>

</head>
<body>
<input type="hidden" id="serverUrl" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="userId" value="${valiUser.userId}"/>

${validateRes} <br> 8s后会自动跳转到首页....
<script type="text/javascript">
    var userId = $('#userId').val();
    var serverUrl = $('#serverUrl').val();

    console.log(userId + " -- " + serverUrl);
    if (userId != null && userId != "") {
        setTimeout(function () {
            window.location.href = serverUrl + "/user/index/" + parseInt(userId);
        }, 5000);
    }
</script>

</body>
</html>