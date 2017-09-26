<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/16
  Time: 上午2:14
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
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/js/data/datedropper.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/js/data/timedropper.min.css">
    <link rel="stylesheet" href="${ctx}/resources/SweetAlert2/dist/sweetalert2.min.css">


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
    <![endif]-->
    <title>EDS</title>

    <script type="text/javascript">

        function ajax_demo(p) {
            var realName = $('#Name').val();
            var Email = $('#Email').val();
            var sex = $('input[name="sex"]:checked').val();
            var Tel = $('#Tel').val();
            var Birthday = $('#Birthday').val();
            var Profile = $('#Profile').val();
            var company = $('#Company').val();

            if (!editRule(realName, Email)) {
                return false;
            }
            else {
                $.post('/user/User_edit', {
                    Email: Email,
                    realName: realName,
                    sex: sex,
                    Tel: Tel,
                    company: company,
                    Birthday: Birthday,
                    Profile: Profile
                }, function (requestData) {
                    if (requestData.res == 'yes') {
                        window.location.reload();
                    } else {
                        $("#userName").trigger("easyform-ajax", false);
                        $("#password").trigger("easyform-ajax", false);
                    }
                });
            }
        }

        //去掉最后的空格
        function trim(str) {
            return str.replace(/(^\s+)|(\s+$)/g, "");
        }

        function editRule(Name, Email) {
            if (Name == "" || Email == "") {
                swal(
                    '邮箱或姓名不能为空!'
                )
                return false;
            }
            var userNamerule = /^([\u4e00-\u9fa5]{2,7})|([\u4e00-\u9fa5A-Za-z0-9]{4,16})$/;//正则表达式
            var emailrule = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            if (!userNamerule.test(Name)) {
                swal(
                    '错误!',
                    '姓名必须为2—7位的中文或4-16位中英文!',
                    'error'
                )
                return false;
            }
            if (!emailrule.test(Email)) {
                swal(
                    '错误!',
                    '邮件格式错误!',
                    'error'
                )
                return false;
            }
            return true;
        }
    </script>
    <style type="text/css">
        .demo{margin:80px auto 40px auto;width:320px}
        .input{padding:6px;border:1px solid #d3d3d3}
    </style>
</head>
<body>
<c:choose>
    <c:when test="${!empty sessionScope.loginUser}">
        <section id="container">
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right"
                         data-original-title="Toggle Navigation"></div>
                </div>
                <!--logo start-->
                <a href="#" class="logo" onclick="window.location.href='${ctx}/user/index'"><b>EDS</b></a>
                <!--logo end-->
                <div class="nav notify-row" id="top_menu">
                    <!--  通知 start -->
                    <ul class="nav top-menu">
                        <!-- 文件评论 start -->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="fa fa-tasks"></i>
                                <span class="badge bg-theme">${fn:length(sessionScope.notReadFileComments)}</span>
                            </a>
                            <ul class="dropdown-menu extended inbox">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">你有 ${fn:length(sessionScope.notReadFileComments)} 条新评论</p>
                                </li>
                                <c:forEach items="${sessionScope.notReadFileComments}" var="comment" end="4"
                                           varStatus="loop">
                                    <li>
                                            <%--查看--%>
                                        <a href="#" onclick="window.location.href='${ctx}/user/readComment-${comment.comId}'">
                                                <%--头像--%>
                                            <span class="photo">
                                            <img alt="avatar"
                                                 src="${sessionScope.notReadFileCommentsSender[loop.count-1].userPictureUrl}">
                                        </span>
                                            <span class="subject">
                                            <%--名字--%>
                                            <span class="from">${sessionScope.notReadFileCommentsSender[loop.count-1].userName}</span>
                                            <%--时间--%>
                                            <span class="time">
                                                <fmt:formatDate value="${comment.comTime}" type="time"
                                                                timeStyle="medium"/>
                                            </span>
                                        </span>
                                                <%--内容--%>
                                            <span class="message">
                                            <c:choose>
                                                <c:when test="${fn:length(comment.comData) <= 14}">
                                                    ${comment.comData}
                                                </c:when>
                                                <c:otherwise>
                                                    ${fn:substring(comment.comData, 0, 14)}...
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                        </a>
                                    </li>
                                </c:forEach>
                                <li class="external">
                                    <a href="#" onclick="window.location.href='${ctx}/user/notReadFileComment'">查看所有未读评论</a>
                                </li>
                            </ul>
                        </li>
                        <!-- 文件评论 end -->
                        <!-- inbox dropdown start-->
                        <li id="header_inbox_bar" class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="fa fa-envelope-o"></i>
                                <span class="badge bg-theme">${fn:length(sessionScope.notReadMessages)}</span>
                            </a>
                            <ul class="dropdown-menu extended inbox">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">你有 ${fn:length(sessionScope.notReadMessages)} 条新消息</p>
                                </li>
                                <c:forEach items="${sessionScope.notReadMessages}" var="Message" end="4"
                                           varStatus="loop">
                                    <li>
                                            <%--查看--%>
                                        <a href="#">
                                                <%--头像--%>
                                            <span class="photo">
                                                <img alt="avatar"
                                                     src="${sessionScope.notReadMessagesSender[loop.count-1].userPictureUrl}">
                                            </span>
                                            <span class="subject">
                                            <%--名字--%>
                                            <span class="from">${sessionScope.notReadMessagesSender[loop.count-1].userName}</span>
                                            <%--时间--%>
                                            <span class="time">
                                                <fmt:formatDate value="${Message.msgSendtime}" type="time"
                                                                timeStyle="medium"/>
                                            </span>
                                        </span>
                                                <%--内容--%>
                                            <span class="message">
                                            <c:choose>
                                                <c:when test="${fn:length(Message.msgData) <= 14}">
                                                    ${Message.msgData}
                                                </c:when>
                                                <c:otherwise>
                                                    ${fn:substring(Message.msgData, 0, 14)}...
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                        </a>
                                    </li>
                                </c:forEach>
                                <li>
                                    <a href="#" onclick="window.location.href='${ctx}/user/notReadMessages'">查看所有未读消息</a>
                                </li>
                            </ul>
                        </li>
                        <!-- inbox dropdown end -->
                    </ul>
                    <!--  通知 end -->
                </div>
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="#" onclick="window.location.href='${ctx}/user/logout'">注 销</a></li>
                    </ul>
                </div>
            </header>
            <!--header end-->

            <!-- **********************************************************************************************************************************************************
            MAIN SIDEBAR MENU
            *********************************************************************************************************************************************************** -->
            <!--sidebar start-->
            <!--  class="active" -->
            <aside>
                <div id="sidebar" class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu" id="nav-accordion">
                        <!--头像-->
                        <p class="centered">
                            <a href="#" onclick="window.location.href = '${ctx}/user/userPicture'">
                                <c:choose>
                                    <c:when test="${empty sessionScope.loginUser.userPictureUrl}">
                                        <img src="${ctx}/resources/img/ui-sam.jpg" class="img-circle" width="60">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${sessionScope.loginUser.userPictureUrl}" class="img-circle"
                                             width="60">
                                    </c:otherwise>
                                </c:choose>
                            </a>
                        </p>
                        <!--用户名-->
                        <h5 class="centered">${sessionScope.loginUser.userName}</h5>

                        <!--主页-->
                        <li class="mt">
                            <a href="#" onclick="window.location.href='${ctx}/user/index'">
                                <i class="fa fa-home"></i>
                                <span>主  页</span>
                            </a>
                        </li>
                        <!--消息-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-comments-o"></i>
                                <span>我的消息</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/findMessage'">搜索消息</a></li>
                                <li><a href="#"  onclick="window.location.href='${ctx}/user/notReadMessages'">未读消息</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/allMessages'">所有消息</a></li>
                            </ul>
                        </li>
                        <!--共享文件-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-globe"></i>
                                <span>共享文件</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/webRecentFile'">近期文件</a></li>
                                <li><a href="#"  onclick="window.location.href='${ctx}/user/findWebFile'">搜索文件</a></li>
                            </ul>
                        </li>
                        <!--文件-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-th"></i>
                                <span>我的文件</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/newFile'">新建文件</a></li>
                                <li><a href="#"  onclick="window.location.href='${ctx}/user/findMyFile'">搜索文件</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/recentFile'">近期文件</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/enjoyFile'">共享文件</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/privateFile'">私人文件</a></li>
                            </ul>
                        </li>
                        <!--文件评论-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-tasks"></i>
                                <span>文件评论</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#"  onclick="window.location.href='${ctx}/user/findComment'">搜索评论</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/notReadFileComment'">未读评论</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/allFileComment'">所有评论</a></li>
                            </ul>
                        </li>
                        <!--日志系统-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-book"></i>
                                <span>我的日志</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/myLog'">我的日志</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/myFileLog'">文件日志</a></li>
                            </ul>
                        </li>
                        <!--个人信息-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>个人信息</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#"  onclick="window.location.href='${ctx}/user/userInfo'">信息查看</a></li>
                            </ul>
                        </li>
                        <!--系统信息-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-desktop"></i>
                                <span>系统信息</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#"  onclick="window.location.href='${ctx}/user/EDS'">系统介绍</a></li>
                                <li><a href="#"  onclick="window.location.href='${ctx}/user/EDSUser'">作者介绍</a></li>
                                <li><a href="#"  onclick="window.location.href='${ctx}/user/donate'">捐赠作者</a></li>
                            </ul>
                        </li>
                        <!--设置-->
                        <li class="sub-menu">
                            <a class="active" href="javascript:;">
                                <i class="fa fa-cogs"></i>
                                <span>设  置</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/changePasswordTwo'">密码修改</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/userPicture'">头像修改</a></li>
                                <li class="active"><a href="#" onclick="window.location.href='${ctx}/user/changeUserInfo'">信息修改</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->

            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <h3><i class="fa fa-angle-right"></i> Write down your information here.</h3>
                    <div class="row mt">
                        <div class="col-lg-12">


                            <style>
                                .net {
                                    font-family: SansSerif;
                                    font-size: 16px;
                                    color: #61686b;
                                }

                                .size {
                                    font-size: 15px;
                                }
                            </style>

                            <div class="form-horizontal style-form">
                                <div class="form-group container">
                                    <label class="col-sm-1 col-sm-1 control-label"><p class="net">ID号</p></label>
                                    <div class="col-sm-5">
                                        <input class="form-control" id="userId" name="userId" type="text"
                                               placeholder="" value="${sessionScope.loginUser.userId}"

                                               readonly>
                                    </div>
                                    <label class="col-sm-1 col-sm-1 control-label"><p class="net">用户名</p></label>
                                    <div class="col-sm-5">
                                        <input class="form-control round-form" id="userName" name="userName"
                                               type="text" value="${sessionScope.loginUser.userName}" readonly>
                                    </div>
                                </div>

                                <div class="form-group container">
                                    <label class="col-sm-1 col-sm-1 control-label"><p class="net">真实姓名</p></label>
                                    <div class="col-sm-5">
                                        <input class="form-control round-form" id="Name" name="Name" type="text"
                                               value="${sessionScope.loginUser.userRealname}">
                                    </div>
                                    <label class="col-sm-offset-1-1 col-sm-1 control-label"><p class="net">性别</p>
                                    </label>
                                    <c:choose>
                                        <c:when test="${sessionScope.loginUser.userSex==1}">
                                            <div class="col-sm-5">
                                                <label class="col-sm-2 size"><input type="radio" name="sex"
                                                                                    value="1" checked>男</label>
                                                <label class="col-sm-2 size"><input type="radio" name="sex"
                                                                                    value="0">女</label>
                                                <label class="col-sm-3 size"><input type="radio" name="sex"
                                                                                    value="2">unknown</label>
                                            </div>
                                        </c:when>
                                        <c:when test="${sessionScope.loginUser.userSex==0}">
                                            <div class="col-sm-5">
                                                <label class="col-sm-2 size"><input type="radio" name="sex"
                                                                                    value="1">男</label>
                                                <label class="col-sm-2 size"><input type="radio" name="sex"
                                                                                    value="0" checked>女</label>
                                                <label class="col-sm-3 size"><input type="radio" name="sex"
                                                                                    value="2">unknown</label>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-sm-5">
                                                <label class="col-sm-2 size"><input type="radio" name="sex"
                                                                                    value="1">男</label>
                                                <label class="col-sm-2 size"><input type="radio" name="sex"
                                                                                    value="0">女</label>
                                                <label class="col-sm-3 size"><input type="radio" name="sex"
                                                                                    value="2"
                                                                                    checked>unknown</label>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div class="form-group container">
                                    <label class="col-sm-1 col-sm-2 control-label"><p class="net">邮箱</p></label>
                                    <div class="col-sm-5">
                                        <input class="form-control round-form" id="Email" name="Email" type="text"
                                               value="${sessionScope.loginUser.userEmail}"
                                              >
                                    </div>
                                    <label class="col-sm-1 col-sm-1 control-label"><p class="net">电话</p></label>
                                    <div class="col-sm-5">
                                        <input class="form-control round-form" id="Tel" name="Tel" type="text"
                                               value="${sessionScope.loginUser.userTel}">
                                    </div>
                                </div>

                                <div class="form-group container">
                                    <label class="col-sm-1 col-sm-1 control-label"><p class="net">单位</p></label>
                                    <div class="col-sm-5">
                                        <input class="form-control round-form" id="Company" name="Company"
                                               type="text" value="${sessionScope.loginUser.userCompany}">
                                    </div>
                                    <label class="col-sm-1 col-sm-1 control-label"><p class="net">生日</p></label>
                                    <div class="col-sm-5">
                                            <p>请选择日期：<input type="text" class="input" id="Birthday" name="Birthday" value="${fn:substring(sessionScope.loginUser.userBirthday,0,10)}"/></p><br/>
                                    </div>
                                </div>

                                <div class="form-group container">
                                    <label class="col-sm-1 col-sm-1 control-label"><p class="net">密级</p></label>
                                    <div class="col-sm-5">
                                        <c:choose>
                                            <c:when test="${sessionScope.loginUser.userSecretLevel==1}">
                                                <input class="form-control" id="degree" type="text"
                                                       placeholder="Disabled input here..." value="普通"
                                                       readonly>
                                            </c:when>
                                            <c:when test="${sessionScope.loginUser.userSecretLevel==2}">
                                                <input class="form-control" id="degree" type="text"
                                                       placeholder="Disabled input here..." value="内部"
                                                       readonly>
                                            </c:when>
                                            <c:when test="${sessionScope.loginUser.userSecretLevel==3}">
                                                <input class="form-control" id="degree" type="text"
                                                       placeholder="Disabled input here..." value="C"
                                                       readonly>
                                            </c:when>
                                            <c:when test="${sessionScope.loginUser.userSecretLevel==4}">
                                                <input class="form-control" id="degree" type="text"
                                                       placeholder="Disabled input here..." value="B"
                                                       readonly>
                                            </c:when>
                                            <c:otherwise>
                                                <input class="form-control" id="degree" type="text"
                                                       placeholder="Disabled input here..." value="A"
                                                       readonly>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                        <label class="col-sm-1 col-sm-1 control-label"><p class="net">创建时间</p></label>
                                        <div class="col-sm-5">
                                            <input class="form-control round-form" name="" type="text"
                                                   placeholder="${sessionScope.loginUser.userCreateTime}" readonly>
                                        </div>
                                </div>

                                <div class="form-group container">
                                            <label class="col-sm-1 col-sm-1 control-label"><p class="net">个人简介</p>
                                            </label>
                                            <div class="col-sm-5">
                                                <textarea class="form-control" rows="6" id="Profile" name="Profile"
                                                          placeholder="${sessionScope.loginUser.userProfile}"></textarea>
                                            </div>
                                    <div class="buttons col-lg-offset-8" style="margin-top: 50px;">
                                        <input value="确 定" type="submit"  class="btn btn-theme" onclick="ajax_demo(1)"
                                               style="margin-right:20px; margin-top:20px; font-size: 1.5em">
                                    </div>
                                </div>
                            </div>
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
    </c:when>
    <c:otherwise>
        <script>
            window.location.href = "${ctx}/user/tologin";
        </script>
    </c:otherwise>
</c:choose>

<!-- js placed at the end of the document so the pages load faster -->

<script src="${ctx}/resources/js/jquery.js"></script>
<script src="${ctx}/resources/js/userbootstrap.min.js"></script>
<script src="${ctx}/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${ctx}/resources/js/jquery.ui.touch-punch.min.js"></script>
<script class="include" type="text/javascript" src="${ctx}/resources/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${ctx}/resources/js/jquery.scrollTo.min.js"></script>
<script src="${ctx}/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="${ctx}/resources/SweetAlert2/dist/sweetalert2.min.js"></script>
<script src="${ctx}/resources/SweetAlert2/lib/es6-promise.min.js"></script>
<script src="${ctx}/resources/js/data/datedropper.min.js"></script>
<script src="${ctx}/resources/js/data/timedropper.min.js"></script>

<!--common script for all pages-->
<script src="${ctx}/resources/js/common-scripts.js"></script>

<!--script for this page-->

<%--日期选择器--%>
<script>
    $("#Birthday").dateDropper({
        animate: false,
        format: 'Y-m-d',
        maxYear: '2020'
    });
</script>
<script>
    //custom select box

    $(function () {
        $('select.styled').customSelect();
    });

</script>
</body>
</html>
