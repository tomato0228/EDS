<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <c:set value="${ pageContext.request.contextPath }" var="ctx"></c:set>
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

            loading4();
            $.post(url, {
                userName: userName,
                email: email
            }, function (requestData) {
                console.log(requestData.res);
                if (requestData.res == 'yes') {
                    removeLoading('test');
                    swal(
                        '发送成功!',
                        '用于找回密码的验证信息已发送到您的邮箱,请您前往邮箱进行验证!',
                        'success'
                    )

                } else {
                    removeLoading('test');
                    $("#userName").trigger("easyform-ajax", false);
                    $("#email").trigger("easyform-ajax", false);
                    swal(
                        '发送失败!',
                        '您填写的用户名与邮箱不匹配,请填写准确以用于找回密码!',
                        'error'
                    )
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
        function loading4() {
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
        body,html{
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .div-btn{
            width: 100%;
            max-width: 560px;
            /*margin:200px auto; */
        }

        .div-btn div{
            margin: 10px 0 ;
        }

        .test-div{
            width: 300px;
            height: 300px;
            margin:20px auto;
            border: 1px solid #aaa;
            position: relative;
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
                                    <td><input name="userName" type="text" onkeydown=KeyDown() id="userName"
                                               data-easyform="length:4 16;char-chinese;;real-time;ajax:ajax_demo(1);"
                                               data-message="用户名必须为2—7位的中文或4-16位中英文或数字"
                                               data-easytip="position:top;class:easy-blue;"
                                               data-message-ajax="用户名与邮箱不匹配!">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="color: #ffffff ; font-size: 2em">email</div>
                                    </td>
                                    <td><input name="email" type="text" onkeydown=KeyDown() id="email"
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

<script src="${ctx}/resources/css/loading/js/loading.js"></script>
<script src="${ctx}/resources/js/TweenLite.min.js"></script>
<script src="${ctx}/resources/js/EasePack.min.js"></script>
<script src="${ctx}/resources/js/rAF.js"></script>
<script src="${ctx}/resources/js/demo-2.js"></script>
<script src="${ctx}/resources/SweetAlert2/dist/sweetalert2.min.js"></script>
<script src="${ctx}/resources/SweetAlert2/lib/es6-promise.min.js"></script>

</body>
</html>