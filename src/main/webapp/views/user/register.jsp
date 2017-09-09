<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    <script type="text/javascript" src="${ctx}/resources/js/jquery-3.2.1.min.js"></script>
    <title>用户注册</title>

    <script type="text/javascript">

        $(function(){
            var serverUrl=$('#serverUrl').val();

            $('#regBtn').click(function(){
                var userName = $('#userName').val();
                var password = $('#password').val();
                var email = $('#email').val();
                if (userName == null || password == null || email==null || trim(userName) == "" || trim(password) == "" || trim(email) == "") {
                    $('#errorTip').html("用户名或密码或邮箱不能为空!");
                    return false;
                }
                $('#errorTip').html("");

                $.post(serverUrl+'/user/checkUserName',{userName:userName},function(requestData){
                    if(requestData=='isExist'){
                        $('#errorTip').html("该用户名已经被占用!");
                        return false;
                    }

                    $('#errorTip').html("");
                    $.post(serverUrl+'/user/register',{
                        userName:userName,
                        password:password,
                        email:email

                    },function(requestData){
                        alert('注册成功!请登录您的邮箱进行验证');

                    });
                });

            });
        });

        //去掉最后的空格
        function trim(str) {
            return str.replace(/(^\s+)|(\s+$)/g, "");
        }

    </script>

</head>
<body>
<input type="hidden" id="serverUrl" value="${pageContext.request.contextPath}" />
<div align="center" style="padding-top: 50px;">
    <form>
        <table>
            <tr>
                <td>用户名：</td>
                <td><input type="text" id="userName" name="userName" /></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="password" id="password" name="password" /></td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td><input type="text" id="email" name="email" /></td>
            </tr>
            <tr>
                <td><input type="button" value="注册" id="regBtn"/></td>
                <td><input type="reset" value="重置" /></td>
            </tr>
            <tr>
                <td></td>
                <td id="errorInfo" style="color: #5fff58;"></td>
            </tr>
        </table>
        <div id="errorTip"></div>
    </form>
</div>
</body>
</html>