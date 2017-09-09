<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/9
  Time: 下午4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    <link rel="stylesheet" href="${ctx}/resources/css/platform-1.css">
    <link rel="stylesheet" href="${ctx}/resources/js/easyform/easyform.css">
    <link rel="stylesheet" href="${ctx}/resources/css/tab.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/style.css">
    <link rel="stylesheet" href="${ctx}/resources/css/main.css"/>
    <script type="text/javascript" src="${ctx}/resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/easyform/easyform.js"></script>
    <title>用户注册</title>
    <script type="text/javascript">
        $(document).ready(function () {
            var v = $('#reg-form').easyform();
            $('#demo-form').easyform();
            v.is_submit = false;
            v.error = function (ef, i, r) {
                //console.log("Error事件：" + i.id + "对象的值不符合" + r + "规则");
            };
            v.success = function (ef) {
                //console.log("成功");
            };
            v.complete = function (ef) {
                console.log("完成");
            };
            $('#tip-test1').easytip();
            $('#tip-test2').easytip();
            $('#tip-test3').easytip();
            $('#tip-test4').easytip();
        });

        function ajax_demo(p) {
            var serverUrl = $('#serverUrl').val();
            var userName = $('#userName').val();
            var password = $('#password').val();
            if (userName == null || password == null || trim(userName) == "" || trim(password) == "") {
                return false;
            }
            $.post(serverUrl + '/user/login', {
                userName: userName,
                password: password
            }, function (requestData) {
                if (requestData.res == 'yes') {
                    window.location.href = serverUrl + '/user/index/' + parseInt(requestData.id);
                } else {
                    $("#userName").trigger("easyform-ajax", false);
                    $("#password").trigger("easyform-ajax", false);
                }
            });
        }

        //去掉最后的空格
        function trim(str) {
            return str.replace(/(^\s+)|(\s+$)/g, "");
        }
    </script>
</head>
<body class="loading">
<input type="hidden" id="serverUrl" value="${pageContext.request.contextPath}"/>
<div id="wrapper">
    <div id="bg"></div>
    <div id="overlay"></div>
    <div id="main">
        <!-- Header -->
        <header id="header">
            <div align="center" style="padding-top: 50px;">
                <div class="header">
                    <a class="link title-ani" data-letters="用户登录">用户登录</a>
                    <br>
                </div>
                <div class="form-div">
                    <form id="reg-form">
                        <table>
                            <tr>
                                <td>用户名</td>
                                <td><input name="userName" type="text" id="userName"
                                           data-easyform="length:4 16;char-normal;real-time;ajax:ajax_demo(1);"
                                           data-message="用户名必须为4—16位的英文字母或数字"
                                           data-easytip="position:top;class:easy-blue;" data-message-ajax="用户名或密码错误!">
                                </td>
                            </tr>
                            <tr>
                                <td>密码</td>
                                <td><input name="password" type="password" id="password"
                                           data-easyform="length:6 16;;ajax:ajax_demo(1);"
                                           data-message="密码必须为6—16位"
                                           data-easytip="class:easy-blue;" data-message-ajax="用户名或密码错误!"></td>
                            </tr>
                        </table>
                        <div class="buttons" style="margin-top: 50px;">
                            <input value="登 录" type="submit" style="margin-right:20px; margin-top:20px;">
                            <input value="注 册" type="button" style="margin-right:45px; margin-top:20px;"
                                   onclick="window.location.href='${ctx}/user/toRegister'">
                        </div>
                        <br class="clear">
                    </form>
                </div>
            </div>
        </header>
        <!-- Footer -->
        <footer id="footer">
            <span class="copyright">&copy; Limit. three silly: <a href="#">About User</a>.</span>
        </footer>
    </div>
</div>
<script>
    window.onload = function () {
        document.body.className = '';
    }
    window.ontouchmove = function () {
        return false;
    }
    window.onorientationchange = function () {
        document.body.scrollTop = 0;
    }
</script>
</body>
</html>