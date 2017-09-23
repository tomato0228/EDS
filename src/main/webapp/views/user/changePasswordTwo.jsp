<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/21
  Time: 下午11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" isELIgnored="false" contentType="text/html; utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    <title>EDS</title>

    <!-- Bootstrap core CSS -->
    <link href="${ctx}/resources/css/userbootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="${ctx}/resources/fonts/css/font-awesome.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="${ctx}/resources/css/userstyle.css" rel="stylesheet">
    <link href="${ctx}/resources/css/style-responsive.css" rel="stylesheet">


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


    <script type="text/javascript">


        function ajax_demo() {
            var serverUrl = $('#serverUrl').val();
            var oldpassword = $('#oldpassword').val();
            var password = $('#password').val();
            var password2 = $('#password2').val();
            if (!changePasswordOneRule(oldpassword, password, password2))
                return false;
            $.post(serverUrl + '/user/updateUserPasswordTwo', {
                oldpassword: oldpassword,
                password: password
            }, function (requestData) {
                if (requestData.updatepwd == 'ok') {
                    alert('密码修改成功,请重新登录!');
                    window.location.href = "${ctx}/user/logout";
                } else if (requestData.updatepwd == 'not') {
                    $('#errorInfo1').html("密码错误!");
                } else {
                    alert('密码修改失败,请联系系统管理员!');
                }
            });
        }

        //去掉最后的空格
        function trim(str) {
            return str.replace(/(^\s+)|(\s+$)/g, "");
        }

        function changePasswordOneRule(oldpassword, password, password2) {
            if (password == null || password2 == null || trim(password) == "" || trim(password2) == "" || oldpassword == null || trim(oldpassword) == "") {
                $('#errorInfo1').html("密码不能为空!");
                return false;
            }
            $('#errorInfo1').html("");
            var pwdrule = /^[a-zA-Z]\w{5,17}$/;
            if (!pwdrule.test(oldpassword)) {
                $('#errorInfo1').html("密码必须为6—16位!");
                return false;
            }
            $('#errorInfo1').html("");
            if (!pwdrule.test(password)) {
                $('#errorInfo2').html("密码必须为6—16位!");
                return false;
            }
            $('#errorInfo2').html("");
            if (!pwdrule.test(password2)) {
                $('#errorInfo3').html("密码必须为6—16位!");
                return false;
            }
            $('#errorInfo3').html("");
            if (password != password2) {
                $('#errorInfo3').html("密码不一致!");
                return false;
            }
            $('#errorInfo3').html("");
            return true;
        }

    </script>

</head>
<body>

<section id="container">
    <!-- **********************************************************************************************************************************************************
                MAIN CONTENT
                *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper site-min-height">
            <h3><i class="fa fa-angle-right"></i> 密码修改</h3>
            <div class="row mt">
                <div class="col-lg-12">

                    <input type="hidden" id="serverUrl" value="${pageContext.request.contextPath}"/>
                    <div class="row">
                        <table class="col-lg-4 col-lg-offset-3"
                               style="border-collapse:separate; border-spacing:0px 10px;margin-top: 150px">
                            <tr>
                                <td>
                                    <div style="font-size: 1.3em">原密码</div>
                                </td>
                                <td><input name="userName" type="text" id="oldpassword" class="form-control">
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td id="errorInfo1" style="color: #ff0000;"></td>
                            </tr>
                            <tr>
                                <td>
                                    <div style=" font-size: 1.5em">新密码</div>
                                </td>
                                <td><input name="password" type="password" id="password" class="form-control"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td id="errorInfo2" style="color: #ff0000;"></td>
                            </tr>
                            <tr>
                                <td>
                                    <div style=" font-size: 1.5em">确认密码</div>
                                </td>
                                <td><input name="password2" type="password" id="password2" class="form-control"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td id="errorInfo3" style="color: #ff0000;"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-lg-4 col-lg-offset-4">
                        <div class="button" style="margin-top: 50px;">
                            <button type="button" class="btn btn-theme" onclick="ajax_demo()"><i class="fa fa-cog"></i>
                                确 认
                            </button>
                        </div>
                    </div>
                    <br class="clear">
                </div>
            </div>

        </section>
        <! --/wrapper -->
    </section>
    <!-- /MAIN CONTENT -->

    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
        <div class="text-center">
            2017 - Limit. three silly
            <a href="#" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>
    <!--footer end-->
</section>


<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/resources/js/jquery.js"></script>
<script src="${ctx}/resources/js/userbootstrap.min.js"></script>
<script src="${ctx}/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${ctx}/resources/js/jquery.ui.touch-punch.min.js"></script>
<script class="include" type="text/javascript" src="${ctx}/resources/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${ctx}/resources/js/jquery.scrollTo.min.js"></script>
<script src="${ctx}/resources/js/jquery.nicescroll.js" type="text/javascript"></script>

<!--common script for all pages-->
<script src="${ctx}/resources/js/common-scripts.js"></script>

<!--script for this page-->

<script>
    //custom select box

    $(function () {
        $('select.styled').customSelect();
    });

</script>
</body>
</html>


