<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <c:set value="${ pageContext.request.contextPath }" var="ctx"></c:set>
    <link rel="stylesheet" href="${ctx}/resources/css/platform-1.css">
    <link rel="stylesheet" href="${ctx}/resources/js/easyform/easyform.css">
    <link rel="stylesheet" href="${ctx}/resources/css/tab.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/component.css"/>
    <script type="text/javascript" src="${ctx}/resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/easyform/easyform.js"></script>
    <title>个人信息验证成功</title>

</head>
<body>
<input type="hidden" id="serverUrl" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="userId" value="${valiUser.userId}"/>

<div class="container demo-2">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <h1 class="main-title">
                <div align="center" style="padding-top: 50px;">
                    <div class="form-div">
                        <p align="center" style="font-size: 2em">&nbsp;${validateRes} <br> 8s后会自动跳转到登录页....</p>
                        <div align="center">
                        <input value="登 录" type="button"
                               style="margin-left:40px; margin-top:0px; font-size: 1.5em"
                               onclick="window.location.href='${ctx}/user/tologin'">
                    </div>
                    </div>
                </div>
            </h1>
        </div>
    </div>
</div>
<script type="text/javascript">
    var userId = $('#userId').val();
    var serverUrl = $('#serverUrl').val();

    console.log(userId + " -- " + serverUrl);
    if (userId != null && userId != "") {
        setTimeout(function () {
            window.location.href = '${ctx}/user/tologin';
        }, 5000);
    }
</script>

<script src="${ctx}/resources/js/TweenLite.min.js"></script>
<script src="${ctx}/resources/js/EasePack.min.js"></script>
<script src="${ctx}/resources/js/rAF.js"></script>
<script src="${ctx}/resources/js/demo-2.js"></script>
</body>
</html>