<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/18
  Time: 下午3:44
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
    <link href="${ctx}/resources/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="${ctx}/resources/fonts/css/font-awesome.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="${ctx}/resources/css/userstyle.css" rel="stylesheet">
    <link href="${ctx}/resources/css/userstyle2.css" rel="stylesheet">
    <link href="${ctx}/resources/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        function comment() {
            var serverUrl = $('#serverUrl').val();
            var fileInfoComment = $('#fileInfoComment').val();
            if (fileInfoComment == null || trim(fileInfoComment) == "" || fileInfoComment.length <= 4) {
                fileInfoComment = $('#fileInfoComment1').val();
            }
            if (fileInfoComment == null || trim(fileInfoComment) == "" || fileInfoComment.length <= 4) {
                return false;
            }
            var url = serverUrl + '/user/fileInfoComment-${requestScope.fileInfo.fileId}';
            $.post(url, {
                fileInfoComment: fileInfoComment
            }, function (requestData) {
                window.location.reload();
            });
        }

        //去掉最后的空格
        function trim(str) {
            return str.replace(/(^\s+)|(\s+$)/g, "");
        }

        function fileAbstrcat() {

            var serverUrl = $('#serverUrl').val();
            var fileAbstrcat = $('#fileAbstrcat').val();
            if (fileAbstrcat == null || trim(fileAbstrcat) == '')
                return false;

            var url = serverUrl + '/user/updateFileAbstrcat-${requestScope.fileInfo.fileId}';
            $.post(url, {
                fileAbstrcat: fileAbstrcat
            }, function (requestData) {
                window.location.reload();
            });
        }
    </script>

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
                                        <a href="#"
                                           onclick="window.location.href='${ctx}/user/readComment-${comment.comId}'">
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
                                    <a href="#"
                                       onclick="window.location.href='${ctx}/user/notReadFileComment'">查看所有未读评论</a>
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
                                    <a href="#"
                                       onclick="window.location.href='${ctx}/user/notReadMessages'">查看所有未读消息</a>
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
                                <li><a href="#" onclick="window.location.href='${ctx}/user/notReadMessages'">未读消息</a>
                                </li>
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
                                <li><a href="#" onclick="window.location.href='${ctx}/user/findWebFile'">搜索文件</a></li>
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
                                <li><a href="#" onclick="window.location.href='${ctx}/user/findMyFile'">搜索文件</a></li>
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
                                <li><a href="#" onclick="window.location.href='${ctx}/user/findComment'">搜索评论</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/notReadFileComment'">未读评论</a>
                                </li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/allFileComment'">所有评论</a>
                                </li>
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
                                <li><a href="#" onclick="window.location.href='${ctx}/user/userInfo'">信息查看</a></li>
                            </ul>
                        </li>
                        <!--系统信息-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-desktop"></i>
                                <span>系统信息</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/EDS'">系统介绍</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/EDSUser'">作者介绍</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/donate'">捐赠作者</a></li>
                            </ul>
                        </li>
                        <!--设置-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-cogs"></i>
                                <span>设  置</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/changePasswordTwo'">密码修改</a>
                                </li>
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
                <section class="wrapper site-min-height">
                    <h3><i class="fa fa-angle-right"></i> 文件详情</h3>
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="col-lg-5">
                                <!--widget start-->
                                <section class="panel">
                                    <div class="twt-feed blue-bg">
                                        <h1>
                                            <c:set value="${fn:length(requestScope.fileInfo.fileName) - 36}"
                                                   var="length"></c:set>
                                            <p class="user">${fn:substring(requestScope.fileInfo.fileName, 0, length)}</p>
                                        </h1>
                                        <p>.${requestScope.fileInfo.fileType}</p>
                                        <a href="#">
                                            <img src="${ctx}/resources/img/prefix/${requestScope.fileInfo.fileType}.png">
                                        </a>
                                    </div>
                                    <div style="margin-top: 55px;">
                                        <ul class="nav nav-pills nav-stacked">
                                            <li><a href="#"> <i class="fa fa-bookmark"></i>
                                                编号：${requestScope.fileInfo.fileId}
                                            </a></li>
                                            <li><a href="#"> <i class="fa fa-user"></i>
                                                作者：${requestScope.fileUser.userName}</a>
                                            </li>
                                            <li><a href="#"> <i class="fa fa-puzzle-piece"></i>
                                                大小：${requestScope.fileInfo.fileSize}</a></li>
                                            <li><a href="#"> <i class="fa fa-clock-o"></i>
                                                上传时间：${fn:substring(requestScope.fileInfo.fileLoadTime, 0, 19)}</a></li>
                                            <li><a href="#"> <i class="fa fa-key"></i> 密级等级：
                                                <c:choose>
                                                    <c:when test="${requestScope.fileInfo.fileSecretLevel == 5}"> A级</c:when>
                                                    <c:when test="${requestScope.fileInfo.fileSecretLevel == 4}"> B级</c:when>
                                                    <c:when test="${requestScope.fileInfo.fileSecretLevel == 3}"> C级</c:when>
                                                    <c:when test="${requestScope.fileInfo.fileSecretLevel == 2}"> 内部</c:when>
                                                    <c:otherwise> 普通</c:otherwise>
                                                </c:choose></a></li>
                                            <li><a href="#"> <i class="fa fa-eye"></i>
                                                查看次数：${requestScope.fileInfo.fileViewtimes}</a></li>
                                            <li><a href="#"> <i class="fa fa-print"></i>
                                                打印次数：${requestScope.fileInfo.filePrinttimes}</a></li>
                                            <li><a href="#"> <i class="fa fa-download"></i>
                                                下载次数：${requestScope.fileInfo.fileDownloadtimes}</a></li>
                                        </ul>
                                    </div>
                                    <div class="twt-write col-sm-12">
                                <textarea class="form-control  t-text-area" rows="2" id="fileAbstrcat"
                                          name="fileAbstrcat"
                                          placeholder="${requestScope.fileInfo.fileAbstrcat}"></textarea>
                                    </div>
                                    <footer class="twt-footer">
                                        <c:choose>
                                            <c:when test="${(requestScope.fileInfo.fileShare == 1) && sessionScope.loginUser.userSecretLevel >= requestScope.fileInfo.fileSecretLevel && (!empty requestScope.fileInfoLimit) && (requestScope.fileInfoLimit.fileWrite==1)}">
                                                <button class="btn btn-space btn-white" data-toggle="button"
                                                        style="margin-top: 15px" onclick="fileAbstrcat()">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </c:when>
                                            <c:when test="${sessionScope.loginUser.userId == requestScope.fileInfo.fileUserId}">
                                                <button class="btn btn-space btn-white" data-toggle="button"
                                                        style="margin-top: 15px" onclick="fileAbstrcat()">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-space btn-white" data-toggle="button"
                                                        style="margin-top: 15px">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>

                                        <button class="btn btn-space btn-white" data-toggle="button"
                                                style="margin-top: 15px"
                                                onclick="window.location.href='${ctx}/user/aboutUser-${requestScope.fileUser.userId}'">
                                            <i class="fa fa-user"></i>
                                        </button>
                                        <c:choose>
                                            <c:when test="${(requestScope.fileInfo.fileShare == 1) && sessionScope.loginUser.userSecretLevel >= requestScope.fileInfo.fileSecretLevel && (!empty requestScope.fileInfoLimit) && (requestScope.fileInfoLimit.filePrint==1)}">
                                                <button class="btn btn-space btn-info pull-right" type="button"
                                                        style="margin-top: 15px"
                                                        onclick="window.location.href='${ctx}/user/download-${requestScope.fileInfo.fileId}'">
                                                    <i class="fa fa-cloud-download"></i>
                                                    下载
                                                </button>
                                            </c:when>
                                            <c:when test="${sessionScope.loginUser.userId == requestScope.fileInfo.fileUserId}">
                                                <button class="btn btn-space btn-info pull-right" type="button"
                                                        style="margin-top: 15px"
                                                        onclick="window.location.href='${ctx}/user/download-${requestScope.fileInfo.fileId}'">
                                                    <i class="fa fa-cloud-download"></i>
                                                    下载
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-space btn-info pull-right" type="button"
                                                        style="margin-top: 15px">
                                                    <i class="fa fa-cloud-download"></i>
                                                    不可下载
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:if test="${sessionScope.loginUser.userId == requestScope.fileInfo.fileUserId}">
                                            <button class="btn btn-space btn-info pull-right" type="button"
                                                    style="margin-top: 15px;font-size: 1.2em"
                                                    onclick="window.location.href='${ctx}/user/deleteFile-${requestScope.fileInfo.fileId}'">
                                                <i class="fa fa-trash-o"></i>
                                                删除
                                            </button>
                                        </c:if>
                                    </footer>
                                </section>
                                <!--widget end-->
                            </div>
                            <c:choose>
                                <c:when test="${fn:length(sessionScope.aFileComments) <= 6}">
                                    <c:set value="0" var="begin"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set value="${fn:length(sessionScope.aFileComments) - 6}" var="begin"/>
                                </c:otherwise>
                            </c:choose>
                            <div class="col-lg-6">
                                <section class="panel">
                                    <header class="panel-heading">
                                        最近评论
                                    </header>
                                    <div class="panel-body">
                                        <div class="timeline-messages">
                                            <c:choose>
                                                <c:when test="${fn:length(sessionScope.aFileComments) == 0}">
                                                    该文件还没有评论...
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${sessionScope.aFileComments}" var="comment"
                                                               varStatus="loop" begin="${begin}">
                                                        <!-- Comment -->
                                                        <div class="msg-time-chat">
                                                            <a href="#" class="message-img"
                                                               onclick="window.location.href='${ctx}/user/aboutUser-${sessionScope.aFileCommentUsers[loop.count-1+begin].userId}'">
                                                                <img class="avatar"
                                                                     src="${sessionScope.aFileCommentUsers[loop.count-1+begin].userPictureUrl}"></a>
                                                            <div class="message-body msg-in">
                                                                <span class="arrow"></span>
                                                                <div class="text">
                                                                    <p class="attribution"><a href="#"
                                                                                              onclick="window.location.href='${ctx}/user/aboutUser-${sessionScope.aFileCommentUsers[loop.count-1+begin].userId}'">
                                                                        <c:choose>
                                                                            <c:when test="${sessionScope.aFileCommentUsers[loop.count-1+begin].userId == requestScope.fileUser.userId}">
                                                                                文件上传者
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                ${sessionScope.aFileCommentUsers[loop.count-1+begin].userName}
                                                                            </c:otherwise>
                                                                        </c:choose></a>
                                                                        At&nbsp;&nbsp;&nbsp;&nbsp;${fn:substring(comment.comTime, 0, 19)}
                                                                    </p>
                                                                    <p>${comment.comData}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /comment -->
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <input type="hidden" id="serverUrl" value="${pageContext.request.contextPath}"/>
                                        <form class="chat-form">
                                            <div class="input-cont ">
                                                <input type="text" class="form-control col-lg-12"
                                                       placeholder="在这里输入评论......" id="fileInfoComment"
                                                       name="fileInfoComment">
                                            </div>
                                            <div class="form-group">
                                                <div class="pull-right chat-features">
                                                    <input class="btn btn-danger" value="留言" id="fileComment"
                                                           type="button"
                                                           onclick="comment()">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </section>
                            </div>
                            <div class="col-lg-11">
                                <section class="panel">
                                    <header class="panel-heading">
                                        所有评论
                                    </header>
                                    <div class="panel-body">
                                        <div class="timeline-messages">
                                            <c:choose>
                                                <c:when test="${fn:length(sessionScope.aFileComments) == 0}">
                                                    该文件还没有评论...
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${sessionScope.aFileComments}" var="comment"
                                                               varStatus="loop">
                                                        <!-- Comment -->
                                                        <div class="msg-time-chat">
                                                            <a href="#" class="message-img"
                                                               onclick="window.location.href='${ctx}/user/aboutUser-${sessionScope.aFileCommentUsers[loop.count-1].userId}'">
                                                                <img class="avatar"
                                                                     src="${sessionScope.aFileCommentUsers[loop.count-1].userPictureUrl}"></a>
                                                            <div class="message-body msg-in">
                                                                <span class="arrow"></span>
                                                                <div class="text">
                                                                    <p class="attribution"><a href="#"
                                                                                              onclick="window.location.href='${ctx}/user/aboutUser-${sessionScope.aFileCommentUsers[loop.count-1].userId}'">
                                                                        <c:choose>
                                                                            <c:when test="${sessionScope.aFileCommentUsers[loop.count-1].userId == requestScope.fileUser.userId}">
                                                                                文件上传者
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                ${sessionScope.aFileCommentUsers[loop.count-1].userName}
                                                                            </c:otherwise>
                                                                        </c:choose></a>
                                                                        At&nbsp;&nbsp;&nbsp;&nbsp;${fn:substring(comment.comTime, 0, 19)}
                                                                    </p>
                                                                    <p>${comment.comData}</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- /comment -->
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <form class="chat-form">
                                            <div class="input-cont ">
                                                <input type="text" class="form-control col-lg-12"
                                                       placeholder="在这里输入评论......" id="fileInfoComment1"
                                                       name="fileInfoComment1">
                                            </div>
                                            <div class="form-group">
                                                <div class="pull-right chat-features">
                                                    <input class="btn btn-danger" value="留言" id="fileComment1"
                                                           type="button"
                                                           onclick="comment()">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </section>
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
<script src="${ctx}/resources/js/jquery-knob/js/jquery.knob.js"></script>

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