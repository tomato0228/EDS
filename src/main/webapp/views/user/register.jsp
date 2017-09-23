<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/9
  Time: 下午3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    <link rel="stylesheet" href="${ctx}/resources/css/platform-1.css">
    <link rel="stylesheet" href="${ctx}/resources/js/easyform/easyform.css">
    <link rel="stylesheet" href="${ctx}/resources/css/tab.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/component.css"/>
    <link rel="stylesheet" href="${ctx}/resources/css/loading/css/animate.css">
    <link rel="stylesheet" href="${ctx}/resources/css/loading/css/global.css">
    <link rel="stylesheet" href="${ctx}/resources/css/loading/css/loading.css">
    <link rel="stylesheet" href="${ctx}/resources/SweetAlert2/dist/sweetalert2.min.css">
    <script type="text/javascript" src="${ctx}/resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/easyform/easyform.js"></script>
    <title>EDS—用户注册</title>
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
            var password2 = $('#password2').val();
            var email = $('#email').val();
            if (!registerRule(userName, password, password2, email))
                return false;

            $.post(serverUrl + '/user/checkUserName', {userName: userName}, function (requestData) {
                if (requestData == 'isExist') {
                    $("#userName").trigger("easyform-ajax", false);
                    return false;
                }
                loading5();
                $.post(serverUrl + '/user/register', {
                    userName: userName,
                    password: password,
                    email: email
                }, function (requestData) {
                    removeLoading('test');
                    swal(
                        '注册成功!',
                        '请您前往邮箱进行验证!',
                        'success'
                    )
                });
            });
        }

        //去掉最后的空格
        function trim(str) {
            return str.replace(/(^\s+)|(\s+$)/g, "");
        }

        function registerRule(userName, password, password2, email) {
            if (userName == null || password == null || password2 == null || email == null || trim(userName) == "" || trim(password) == "" || trim(password2) == "" || trim(email) == "")
                return false;
            var userNamerule = /^([\u4e00-\u9fa5]{2,7})|([\u4e00-\u9fa5A-Za-z0-9]{4,16})$/;//正则表达式
            var pwdrule = /^[a-zA-Z]\w{5,17}$/;
            var emailrule = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if (!userNamerule.test(userName))
                return false;
            if (password != password2)
                return false;
            if (!pwdrule.test(password))
                return false;
            if (!emailrule.test(email))
                return false;
            return true;
        }
        function loading5() {
            $('body').loading({
                loadingWidth:240,
                title:'请稍等!',
                name:'test',
                discription:'正在发送邮件...',
                direction:'column',
                type:'origin',
                originBg:'#71EA71',
                originDivWidth:40,
                originDivHeight:40,
                originWidth:6,
                originHeight:6,
                smallLoading:false,
                loadingBg:'#389A81',
                loadingMaskBg:'rgba(123,122,222,0.2)'
            });

        }
    </script>
</head>
<body>
<input type="hidden" id="serverUrl" value="${pageContext.request.contextPath}"/>
<div class="container demo-3">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <h1 class="main-title">
                <div align="center" style="padding-top: 50px;">
                    <div class="header">
                        <a>&nbsp;用户注册</a>
                        <br>
                    </div>
                    <div class="form-div">
                        <form id="reg-form">
                            <table>
                                <tr>
                                    <td>
                                        <div style="font-size: 1.2em">用户名</div>
                                    </td>
                                    <td><input name="userName" type="text" id="userName"
                                               data-easyform="length:4 16;char-chinese;real-time;ajax:ajax_demo(1);"
                                               data-message="用户名必须为2—7位的中文或4-16位中英文或数字"
                                               data-easytip="position:top;class:easy-blue;" data-message-ajax="用户名已存在!">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="font-size: 1.2em">密码</div>
                                    </td>
                                    <td><input name="password" type="password" id="password"
                                               data-easyform="length:6 16;"
                                               data-message="密码必须为6—16位"
                                               data-easytip="class:easy-blue;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="font-size: 1.2em">确认密码</div>
                                    </td>
                                    <td><input name="password2" type="password" id="password2"
                                               data-easyform="length:6 16;equal:#password;"
                                               data-message="两次密码输入要一致" data-easytip="class:easy-blue;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="font-size: 1.2em">email</div>
                                    </td>
                                    <td><input name="email" type="text" id="email" data-easyform="email;real-time;"
                                               data-message="Email格式要正确"
                                               data-easytip="class:easy-blue;"></td>
                                </tr>
                            </table>
                            <div class="buttons" style="margin-top: 50px;">
                                <input value="注 册" type="submit"
                                       style="margin-right:20px; margin-top:20px; font-size: 1.5em">
                                <input value="登 录" type="button"
                                       style="margin-right:80px; margin-top:20px; font-size: 1.5em"
                                       onclick="window.location.href='${ctx}/user/tologin'">
                            </div>
                            <br class="clear">
                        </form>
                    </div>
                </div>
            </h1>
        </div>
    </div>
</div>
<script src="${ctx}/resources/css/loading/js/loading.js"></script>
<script src="${ctx}/resources/js/TweenLite.min.js"></script>
<script src="${ctx}/resources/js/EasePack.min.js"></script>
<script src="${ctx}/resources/js/rAF.js"></script>
<script src="${ctx}/resources/js/demo-3.js"></script>
<script src="${ctx}/resources/SweetAlert2/dist/sweetalert2.min.js"></script>
<script src="${ctx}/resources/SweetAlert2/lib/es6-promise.min.js"></script>
</body>
</html>