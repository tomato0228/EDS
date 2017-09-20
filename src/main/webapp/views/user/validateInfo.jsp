<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>找回密码</title>
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    <script type="text/javascript" src="${ctx}/resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">

        $(function(){
            var serverUrl=$('#serverUrl').val();

            $('#ensureBtn').bind('click',function(){
                var oldPassword = $('#oldPassword').val();
                var newPassword = $('#newPassword').val();
                if (oldPassword == null || newPassword == null || oldPassword == "" || newPassword == "") {
                    $('#errorTip').html("新输入的密码不能为空!");
                    return false;
                }
                if(oldPassword!=newPassword){
                    $('#errorTip').html("两次输入的密码不一致!");
                    return false;
                }
                $('#errorTip').html("");

                var id=$('#userId').val();
                $.post(serverUrl+'/user/updateUserPassword/'+parseInt(id),{
                    password:newPassword

                },function(requestData){
                    if (requestData.updateRes=='ok') {
                        alert('密码修改成功!');
                        window.location.href=serverUrl+'/user/index/'+parseInt(id);
                    } else {
                        alert('密码修改失败,请联系系统管理员!');
                    }

                });
            });
        });


    </script>
</head>
<body>
<input type="hidden" id="serverUrl" value="${pageContext.request.contextPath}" />
<input type="hidden" id="userId" value="${requestScope.valiUser.userId}"/>
验证信息 ${requestScope.validateRes}
<br>
<c:choose>
    <c:when test="${requestScope.validateRes=='验证成功'}">
        <form action="">
            <table>
                <tr>
                    <td>用户名：</td>
                    <td><input type="text" value="${requestScope.valiUser.userName}" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td>新密码：</td>
                    <td><input type="password" id="oldPassword" /></td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td><input type="password" id="newPassword" /></td>
                </tr>
                <tr>
                    <td><input type="button" value="确认" id="ensureBtn"/></td>
                    <td></td>
                </tr>
            </table>
            <div id="errorTip"></div>
        </form>
    </c:when>
    <c:otherwise>
        <font size="12" color="#ff000">*${requestScope.validateRes}</font>
    </c:otherwise>
</c:choose>

</body>
</html>  