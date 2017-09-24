<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/13
  Time: 上午10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/js/gritter/css/jquery.gritter.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/lineicons/style.css">

    <!-- Custom styles for this template -->
    <link href="${ctx}/resources/css/userstyle.css" rel="stylesheet">
    <link href="${ctx}/resources/css/style-responsive.css" rel="stylesheet">

    <script src="${ctx}/resources/js/chart-master/Chart.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
                            <a class="active" href="#" onclick="window.location.href='${ctx}/user/index'">
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
                            <a href="javascript:;">
                                <i class="fa fa-cogs"></i>
                                <span>设  置</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/changePasswordTwo'">密码修改</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/userPicture'">头像修改</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/changeUserInfo'">信息修改</a>
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
                <section class="wrapper">

                    <div class="row">
                        <div class="col-lg-9 main-chart">

                            <div class="row mtbox">
                                <div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                                    <div class="box1">
                                        <span class="li_eye"></span>
                                        <h3>${sessionScope.EnjoyFilesViewtimes}</h3>
                                    </div>
                                    <p>共记 ${sessionScope.EnjoyFilesViewtimes} 次查看你的共享文档.</p>
                                </div>
                                <div class="col-md-2 col-sm-2 box0">
                                    <div class="box1">
                                        <span class="li_cloud"></span>
                                        <h3>${fn:length(sessionScope.EnjoyFiles)}</h3>
                                    </div>
                                    <p>你上传了 ${fn:length(sessionScope.EnjoyFiles)} 个共享文档.</p>
                                </div>
                                <div class="col-md-2 col-sm-2 box0">
                                    <div class="box1">
                                        <span class="li_stack"></span>
                                        <h3>${fn:length(sessionScope.PrivateFile)}</h3>
                                    </div>
                                    <p>你总共有 ${fn:length(sessionScope.PrivateFile)} 个私人文件.</p>
                                </div>
                                <div class="col-md-2 col-sm-2 box0">
                                    <div class="box1">
                                        <span class="li_note"></span>
                                        <h3>${sessionScope.commentsSize}</h3>
                                    </div>
                                    <p>你共享的文件有 ${sessionScope.commentsSize} 条评论.</p>
                                </div>
                                <div class="col-md-2 col-sm-2 box0">
                                    <c:choose>
                                        <c:when test="${sessionScope.loginUser.userIsAccepted == 0}">
                                            <div class="box1">
                                                <span class="li_data"></span>
                                                <h3>NO!</h3>
                                            </div>
                                            <p>你还没有获得认证，请及时完善个人信息</p>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="box1">
                                                <span class="li_data"></span>
                                                <h3>OK!</h3>
                                            </div>
                                            <p>恭喜你，你已经获得认证！</p>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                            </div><!-- /row mt -->


                            <div class="row mt">
                                <c:forEach items="${sessionScope.PrivateFile}" var="privateFile" end="2">
                                    <!-- SERVER STATUS PANELS -->
                                    <div class="col-md-4 col-sm-4 mb">
                                        <div class="white-panel pn donut-chart">
                                            <div class="white-header">
                                                <h5>
                                                    <c:choose>
                                                        <c:when test="${fn:length(privateFile.fileName) <= 15}">
                                                            ${privateFile.fileName}
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${fn:substring(privateFile.fileName, 0, 15)}...
                                                        </c:otherwise>
                                                    </c:choose>
                                                </h5>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6 col-xs-6 goleft">
                                                    <p><i class="fa fa-clock-o"></i>${fn:substring(privateFile.fileLoadTime, 0, 16)}</p>
                                                </div>
                                            </div>
                                            <div class="row centered">
                                                <img src="${ctx}/resources/img/prefix/${privateFile.fileType}.png"
                                                     class="img-rounded" width="100"
                                                     onclick="window.location.href='${ctx}/user/fileInfo-${privateFile.fileId}'">
                                            </div>
                                        </div>
                                        <! --/grey-panel -->
                                    </div>
                                    <!-- /col-md-4-->
                                </c:forEach><!-- 1st ROW OF PANELS -->
                            </div><!-- /row -->


                            <div class="row">
                                <c:forEach items="${sessionScope.notReadMessages}" var="message" varStatus="loop" end="2">
                                    <div class="col-lg-4 col-md-4 col-sm-4 mb">
                                        <!-- WHITE PANEL - TOP USER -->
                                        <div class="white-panel pn">
                                            <div class="white-header">
                                                <h5>${sessionScope.notReadMessagesSender[loop.count-1].userName}</h5>
                                            </div>
                                            <p><img src="${sessionScope.notReadMessagesSender[loop.count-1].userPictureUrl}"
                                                    class="img-circle" width="70"
                                                    onclick="window.location.href='${ctx}/user/aboutUser-${sessionScope.notReadMessagesSender[loop.count-1].userId}'">
                                            </p>
                                            <p><b>${fn:substring(message.msgSendtime, 5, 16)}</b></p>
                                            <div class="row centered">
                                                <div class=" col-md-offset-1 col-md-10">
                                                    <a class="small mt" href="#"
                                                       onclick="window.location.href='${ctx}/user/aboutUser-${sessionScope.notReadMessagesSender[loop.count-1].userId}'">
                                                        Read This Message
                                                    </a>
                                                    <p>
                                                        <c:choose>
                                                            <c:when test="${fn:length(message.msgData) <= 15}">
                                                                ${message.msgData}
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${fn:substring(message.msgData, 0, 15)}...
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /col-md-4 -->
                                </c:forEach>
                            </div><!-- /row -->


                            <div class="row">
                                <c:forEach items="${sessionScope.notReadFileComments}" var="FileComment" varStatus="loop" end="2">
                                    <! -- Blog Panel -->
                                    <div class="col-lg-4 col-md-4 col-sm-4 mb">
                                        <div class="content-panel pn">
                                            <div id="blog-bg">
                                                <img src="${sessionScope.notReadFileCommentsSender[loop.count-1].userPictureUrl}"
                                                     class="img-circle" width="70" style="margin:20px 35px;"
                                                     onclick="window.location.href='${ctx}/user/aboutUser-${FileComment.comSender}'">

                                                <div class="blog-title">${sessionScope.notReadFileCommentsSender[loop.count-1].userName}</div>

                                                <img src="${ctx}/resources/img/prefix/${sessionScope.notReadFileCommentFiles[loop.count-1].fileType}.png"
                                                     class="img-rounded" width="70" style="margin:20px;"
                                                     onclick="window.location.href='${ctx}/user/fileInfo-${FileComment.comRecevier}'">
                                                <div class="blog-titleright">
                                                    <c:choose>
                                                        <c:when test="${fn:length(sessionScope.notReadFileCommentFiles[loop.count-1].fileName) <= 10}">
                                                            ${FileComment.comData}
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${fn:substring(sessionScope.notReadFileCommentFiles[loop.count-1].fileName, 0, 10)}...
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div class="blog-text">
                                                <p style="font-size: 1.2em">
                                                    <c:choose>
                                                        <c:when test="${fn:length(FileComment.comData) <= 35}">
                                                            ${FileComment.comData}
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${fn:substring(FileComment.comData, 0, 35)}...
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <a href="#"
                                                       onclick="window.location.href='${ctx}/user/readComment-${FileComment.comId}'">
                                                        Read This
                                                    </a>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /col-md-4-->
                                </c:forEach>
                            </div><!-- /row -->

                        </div><!-- /col-lg-9 END SECTION MIDDLE -->


                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->

                        <div class="col-lg-3 ds">
                            <!--COMPLETED ACTIONS DONUTS CHART-->
                            <h3>最近评论</h3>
                            <c:choose>
                                <c:when test="${fn:length(sessionScope.notReadFileComments) == 0}">
                                    <!-- First Action -->
                                    <div class="desc">
                                        <div class="thumb">
                                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                        </div>
                                        <div class="details">
                                            <p>
                                                <muted>系统提醒</muted>
                                                <br/>
                                                <a href="#">最近没有评论</a> 快去共享文件吧.<br/>
                                            </p>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${sessionScope.notReadFileComments}" var="FileComment" varStatus="loop"
                                               end="5">
                                        <div class="desc" href="#"
                                             onclick="window.location.href='${ctx}/user/readComment-${FileComment.comId}'">
                                            <div class="thumb">
                                                <img class="img-circle"
                                                     src="${sessionScope.notReadFileCommentsSender[loop.count-1].userPictureUrl}"
                                                     width="35px"
                                                     height="35px"
                                                     align=""
                                                     onclick="window.location.href='${ctx}/user/aboutUser-${FileComment.comSender}'">
                                            </div>
                                            <div class="details">
                                                <p>
                                                    <muted>
                                                        <fmt:formatDate value="${FileComment.comTime}" type="time"
                                                                        timeStyle="medium"/>
                                                    </muted>
                                                    <br/>
                                                    <a href="#"
                                                       onclick="window.location.href='${ctx}/user/aboutUser-${FileComment.comSender}'">
                                                            ${sessionScope.notReadFileCommentsSender[loop.count-1].userName}</a>
                                                    <c:choose>
                                                        <c:when test="${fn:length(FileComment.comData) <= 25}">
                                                            ${FileComment.comData}
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${fn:substring(FileComment.comData, 0, 25)}...
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <br/>
                                                </p>
                                            </div>
                                        </div>
                                        <! -- Blog Panel -->
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            <!-- USERS ONLINE SECTION -->
                            <h3>最近消息</h3>
                            <c:choose>
                                <c:when test="${fn:length(sessionScope.notReadMessages) == 0}">
                                    <!-- First Action -->
                                    <div class="desc">
                                        <div class="thumb">
                                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                                        </div>
                                        <div class="details">
                                            <p>
                                                <muted>系统提醒</muted>
                                                <br/>
                                                <a href="#">最近没有消息</a> 快去和别人发消息吧.<br/>
                                            </p>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${sessionScope.notReadMessages}" var="message" varStatus="loop" end="5">
                                        <div class="desc" href="#"
                                             onclick="window.location.href='${ctx}/user/aboutUser-${sessionScope.notReadMessagesSender[loop.count-1].userId}'">
                                            <div class="thumb">
                                                <img class="img-circle"
                                                     src="${sessionScope.notReadMessagesSender[loop.count-1].userPictureUrl}"
                                                     width="35px"
                                                     height="35px"
                                                     onclick="window.location.href='${ctx}/user/aboutUser-${sessionScope.notReadMessagesSender[loop.count-1].userId}'">
                                            </div>
                                            <div class="details">
                                                <p><a href="#"
                                                      src="${sessionScope.notReadMessagesSender[loop.count-1].userPictureUrl}">
                                                        ${sessionScope.notReadMessagesSender[loop.count-1].userName}</a><br/>
                                                    <muted>
                                                        <c:choose>
                                                            <c:when test="${fn:length(message.msgData) <= 25}">
                                                                ${message.msgData}
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${fn:substring(message.msgData, 0, 25)}...
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </muted>
                                                </p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            <!-- 日历-->
                            <div id="calendar" class="mb">
                                <div class="panel green-panel no-margin">
                                    <div class="panel-body">
                                        <div id="date-popover" class="popover top"
                                             style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                            <div class="arrow"></div>
                                            <h3 class="popover-title" style="disadding: none;"></h3>
                                            <div id="date-popover-content" class="popover-content"></div>
                                        </div>
                                        <div id="my-calendar"></div>
                                    </div>
                                </div>
                            </div><!-- / 日历 -->

                        </div><!-- /col-lg-3 -->
                    </div>
                    <! --/row -->
                </section>
            </section>

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
<script src="${ctx}/resources/js/jquery-1.8.3.min.js"></script>
<script src="${ctx}/resources/js/userbootstrap.min.js"></script>
<script class="include" type="text/javascript" src="${ctx}/resources/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${ctx}/resources/js/jquery.scrollTo.min.js"></script>
<script src="${ctx}/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="${ctx}/resources/js/jquery.sparkline.js"></script>


<!--common script for all pages-->
<script src="${ctx}/resources/js/common-scripts.js"></script>

<script type="text/javascript" src="${ctx}/resources/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/gritter-conf.js"></script>

<!--script for this page-->
<script src="${ctx}/resources/js/sparkline-chart.js"></script>
<script src="${ctx}/resources/js/zabuto_calendar.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: '欢迎来到 EDS!',
            // (string | mandatory) the text inside the notification
            text: '这里有最安全的加密算法，保证你的文件不会被非授权用户获取到，超强的双重加密与日志系统将时时刻刻保证你的文档安全，若喜欢，欢迎<a href="#" onclick="window.location.href=\'${ctx}/user/donate\'"  target="_blank" style="color:#ffd777">捐赠作者</a>.',
            // (string | optional) the image to display on the left
            image: '${sessionScope.loginUser.userPictureUrl}',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: false,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
    });
</script>

<script type="application/javascript">
    $(document).ready(function () {
        $("#date-popover").popover({html: true, trigger: "manual"});
        $("#date-popover").hide();
        $("#date-popover").click(function (e) {
            $(this).hide();
        });

        $("#my-calendar").zabuto_calendar({
            action: function () {
                return myDateFunction(this.id, false);
            },
            action_nav: function () {
                return myNavFunction(this.id);
            },
            ajax: {
                url: "show_data.php?action=1",
                modal: true
            },
            legend: [
                {type: "text", label: "Special event", badge: "00"},
                {type: "block", label: "Regular event",}
            ]
        });
    });


    function myNavFunction(id) {
        $("#date-popover").hide();
        var nav = $("#" + id).data("navigation");
        var to = $("#" + id).data("to");
        console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
</script>


</body>
</html>
