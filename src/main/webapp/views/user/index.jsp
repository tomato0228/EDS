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
当前用户: ${loginUser.userName}
点击此处以管理你的文件<a href="<c:url value='user/add-document-${user.id}' />">Click here to upload/manage your documents</a>
<h1>hello task !!</h1>

<form action="${pageContext.request.contextPath}/user/mvcTest8-4" method="post" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="submit" value="Submit" />
</form>

</body>
</html>