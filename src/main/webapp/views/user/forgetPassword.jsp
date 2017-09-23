<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<st>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <c:set value="${ pageContext.request.contextPath }" var="ctx"></c:set>
    <link rel="stylesheet" href="${ctx}/resources/css/platform-1.css">
    <link rel="stylesheet" href="${ctx}/resources/js/easyform/easyform.css">
    <link rel="stylesheet" href="${ctx}/resources/css/tab.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/component.css"/>
    <script type="text/javascript" src="${ctx}/resources/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/easyform/easyform.js"></script>
    <title>EDS—忘记密码</title>

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
            var email = $('#email').val();
            if (!forgetPasswordRule(userName,email))
                return false;
            var url = serverUrl + '/user/findPassword';


            //获取浏览器页面可见高度和宽度
            var _PageHeight = document.documentElement.clientHeight,
                _PageWidth = document.documentElement.clientWidth;
//计算loading框距离顶部和左部的距离（loading框的宽度为215px，高度为61px）
            var _LoadingTop = _PageHeight > 61 ? (_PageHeight - 61) / 2 : 0,
                _LoadingLeft = _PageWidth > 215 ? (_PageWidth - 215) / 2 : 0;
//在页面未加载完毕之前显示的loading Html自定义内容
            var _LoadingHtml = '<div id="loadingDiv" class="spinner" style="position:absolute;left:0;width:100%;height:' + _PageHeight + 'px;top:0;background:#f3f8ff;opacity:0.8;filter:alpha(opacity=80);z-index:10000;"><div style="position: absolute; cursor1: wait; left: ' + _LoadingLeft + 'px; top:' + _LoadingTop + 'px; width: auto; height: 57px; line-height: 57px; padding-left: 50px; padding-right: 5px; background: #fff url(/Content/loading.gif) no-repeat scroll 5px 10px; border: 2px solid #95B8E7; color: #696969; font-family:\'Microsoft YaHei\';">页面加载中，请等待...</div></div>';
//呈现loading效果
            document.write(_LoadingHtml);
//window.onload = function () {
//  var loadingMask = document.getElementById('loadingDiv');
//  loadingMask.parentNode.removeChild(loadingMask);
//};
//监听加载状态改变

//加载状态为complete时移除loading效果


            $.post(url, {
                userName: userName,
                email: email
            }, function (requestData) {


                        var loadingMask = document.getElementById('loadingDiv');
                        loadingMask.parentNode.removeChild(loadingMask);


                if (requestData.res == 'yes') {
                    alert('用于找回密码的验证信息已发送到您的邮箱,请您前往邮箱进行验证!');
                    window.location.href="${ctx}/user/tologin";
                } else {
                    $("#userName").trigger("easyform-ajax", false);
                    $("#email").trigger("easyform-ajax", false);
                    alert('您填写的用户名与邮箱不匹配,请填写准确以用于找回密码!');
                }
                return false;
            });
        }

        //去掉最后的空格
        function trim(str) {
            return str.replace(/(^\s+)|(\s+$)/g, "");
        }

        function resetValue() {
            $('#userName').val("");
            $('#password').val("");
        }

        function forgetPasswordRule(userName, email) {
            if (userName == null || email == null || trim(userName) == "" || trim(email) == "")
                return false;
            var userNamerule = /^([\u4e00-\u9fa5]{2,7})|([\u4e00-\u9fa5A-Za-z0-9]{4,16})$/;//正则表达式
            var emailrule = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if (!userNamerule.test(userName) || !emailrule.test(email))
                return false;
            return true;
        }
    </script>

    <script>
        function KeyDown()
        {
            if (event.keyCode == 13)
            {
                event.returnValue=false;
                event.cancel = true;
                form.btnsubmit.click();
            }
        }
    </script>

    <style>
    .spinner {
    width: 60px;
    height: 60px;
    background-color: #67CF22;

    margin: 100px auto;
    -webkit-animation: rotateplane 1.2s infinite ease-in-out;
    animation: rotateplane 1.2s infinite ease-in-out;
    }

    @-webkit-keyframes rotateplane {
    0% { -webkit-transform: perspective(120px) }
    50% { -webkit-transform: perspective(120px) rotateY(180deg) }
    100% { -webkit-transform: perspective(120px) rotateY(180deg)  rotateX(180deg) }
    }

    @keyframes rotateplane {
        0% {
            transform: perspective(120px) rotateX(0deg) rotateY(0deg);
            -webkit-transform: perspective(120px) rotateX(0deg) rotateY(0deg)
        }
        50% {
            transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg);
            -webkit-transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg)
        }
        100% {
            transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
            -webkit-transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
        }
    }
</style>
</head>
<body>
<input type="hidden" id="serverUrl" value="${pageContext.request.contextPath}"/>
<div class="container demo-2">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <h1 class="main-title">
                <div align="center" style="padding-top: 50px;">
                    <div class="header">
                        <a>&nbsp;忘记密码</a>
                        <br>
                    </div>
                    <div class="form-div">
                        <form id="reg-form" name=" form">
                            <table>
                                <tr>
                                    <td>
                                        <div style="color: #ffffff ; font-size: 2em">用户名</div>
                                    </td>
                                    <td><input name="userName" type="text" id="userName" onkeydown=KeyDown()
                                               data-easyform="length:4 16;char-normal;real-time;ajax:ajax_demo(1);"
                                               data-message="用户名必须为4—16位的英文字母或数字"
                                               data-easytip="position:top;class:easy-blue;"
                                               data-message-ajax="用户名与邮箱不匹配!">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="color: #ffffff ; font-size: 2em">email</div>
                                    </td>
                                    <td><input name="email" type="text" id="email" onkeydown=KeyDown()
                                               data-easyform="email;real-time;"
                                               data-message="Email格式要正确"
                                               data-easytip="class:easy-blue;"
                                               data-message-ajax="用户名与邮箱不匹配!">
                                    </td>
                                </tr>
                            </table>
                            <div class="buttons" style="margin-top: 50px;">
                                <input sty value="找回密码" type="submit" name="btnsubmit"
                                       style="margin-right:50px; margin-top:20px; font-size: 1.5em">

                                <input value="登 录" type="button"
                                       style="margin-right:40px; margin-top:20px; font-size: 1.5em"
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
<script src="${ctx}/resources/js/TweenLite.min.js"></script>
<script src="${ctx}/resources/js/EasePack.min.js"></script>
<script src="${ctx}/resources/js/rAF.js"></script>
<script src="${ctx}/resources/js/demo-2.js"></script>
</body>
</html>