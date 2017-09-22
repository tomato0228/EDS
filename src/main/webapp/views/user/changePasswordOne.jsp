<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/13
  Time: 下午10:58
  To change this template use File | Settings | File Templates.
--%>
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
    <title>更改密码</title>

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
            var password = $('#password').val();
            var password2 = $('#password2').val();
            var id = $('#userId').val();
            if (!changePasswordOneRule(password, password2))
                return false;
            $.post(serverUrl + '/user/updateUserPassword/' + parseInt(id), {
                password: newPassword
            }, function (requestData) {
                if (requestData.updateRes == 'ok') {
                    alert('密码修改成功!');
                    window.location.href = "${ctx}/user/tologin";
                } else {
                    alert('密码修改失败,请联系系统管理员!');
                }
            });
        }

        //去掉最后的空格
        function trim(str) {
            return str.replace(/(^\s+)|(\s+$)/g, "");
        }

        function changePasswordOneRule(password, password2) {
            if (password == null || password2 == null || trim(password) == "" || trim(password2) == "")
                return false;
            var pwdrule = /^[a-zA-Z]\w{5,17}$/;
            if (password != password2)
                return false;
            if (!pwdrule.test(password))
                return false;
            return true;
        }

    </script>

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
                    <c:choose>
                        <c:when test="${validateRes=='验证成功'}">
                            <div class="header">
                                <a>&nbsp;${validateRes}</a>
                                <br>
                            </div>
                            <div class="form-div">
                            <form id="reg-form">
                                <table>
                                    <tr>
                                        <td>
                                            <div style=" font-size: 2em">用户名</div>
                                        </td>
                                        <td><input type="text" value="${valiUser.userName}" readonly="readonly"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style=" font-size: 1.5em">新密码</div>
                                        </td>
                                        <td><input name="password" type="password" id="password"
                                                   data-easyform="length:6 16;ajax:ajax_demo(1);"
                                                   data-message="密码必须为6—16位"
                                                   data-easytip="class:easy-blue;"></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style=" font-size: 1.5em">确认密码</div>
                                        </td>
                                        <td><input name="password2" type="password" id="password2"
                                                   data-easyform="length:6 16;equal:#password;"
                                                   data-message="两次密码输入要一致" data-easytip="class:easy-blue;"></td>
                                    </tr>
                                </table>
                                <div class="buttons" style="margin-top: 50px;">
                                    <input sty value="更改密码" type="submit"
                                           style="margin-right:50px; margin-top:20px; font-size: 1.5em">
                                    <input value="登 录" type="button"
                                           style="margin-right:40px; margin-top:20px; font-size: 1.5em"
                                           onclick="window.location.href='${ctx}/user/tologin'">
                                </div>
                                <br class="clear">
                            </form>
                            </div>
                        </c:when>
                        <c:otherwise>
                        <div class="form-div">
                            <p align="center" style="font-size: 2em">&nbsp;${validateRes}</p>
                            <div align="center">
                                <input value="登 录" type="button"
                                       style="margin-left:40px; margin-top:0px; font-size: 1.5em"
                                       onclick="window.location.href='${ctx}/user/tologin'">
                            </div>
                        </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </h1>
        </div>
    </div>
</div>

<script src="${ctx}/resources/js/TweenLite.min.js"></script>
<script src="${ctx}/resources/js/EasePack.min.js"></script>
<script src="${ctx}/resources/js/rAF.js"></script>
<script src="${ctx}/resources/js/demo-2.js"></script>
</body>
</html>