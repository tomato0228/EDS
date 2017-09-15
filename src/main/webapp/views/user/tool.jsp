<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/13
  Time: 上午10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录成功</title>
</head>
<body>
登录成功
当前用户: ${sessionScope.loginUser.userName}
${sessionScope.loginUser.userId}
点击此处以管理你的文件<a href="<c:url value='user/add-document-${loginUser.userId}' />">Click here to upload/manage your documents</a>
<h1>hello task !!</h1>

<h2>文件上传</h2>
<form action="${pageContext.request.contextPath}/user/uploadFile" enctype="multipart/form-data" method="post">
    <table>
        <tr>
            <td>文件描述:</td>
            <td><input type="text" name="abstrcat"></td>
        </tr>
        <tr>
            <td>请选择文件:</td>
            <td><input type="file" name="file"></td>
        </tr>
        <tr>
            <td><input type="submit" value="上传"></td>
        </tr>
    </table>
</form>
<h3>文件下载</h3>
<a onclick="window.location.href='${pageContext.request.contextPath}/user/download/12'">
    下载
</a>
</body>
</html>