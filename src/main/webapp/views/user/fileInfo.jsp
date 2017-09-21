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


</head>
<body>

<section id="container">
    <!-- **********************************************************************************************************************************************************
                MAIN CONTENT
                *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper site-min-height">
            <h3><i class="fa fa-angle-right"></i> 文件详情</h3>
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="col-lg-4">
                        <!--widget start-->
                        <section class="panel">
                            <div class="twt-feed blue-bg">
                                <h1>
                                    <c:set value="${fn:length(requestScope.fileInfo.fileName)}"
                                    <c:choose>
                                        <c:when test="${fn:length(requestScope.fileInfo.fileName) <= 15}">
                                            <p class="user">${requestScope.fileInfo.fileName}</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p class="user">${fn:substring(requestScope.fileInfo.fileName, 0, 15)}...</p>
                                        </c:otherwise>
                                    </c:choose>
                                </h1>
                                <p>jsmith@flatlab.com</p>
                                <a href="#">
                                    <img src="${ctx}/resources/img/prefix/${requestScope.fileInfo.fileType}.png" >
                                </a>
                            </div>
                            <div style="margin-top: 55px;">
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="javascript:;"> <i class="icon-time"></i> Mail Inbox <span class="label label-primary pull-right r-activity">19</span></a></li>
                                    <li><a href="javascript:;"> <i class="icon-calendar"></i> Recent Activity <span class="label label-info pull-right r-activity">11</span></a></li>
                                    <li><a href="javascript:;"> <i class="icon-bell-alt"></i> Notification <span class="label label-warning pull-right r-activity">03</span></a></li>
                                    <li><a href="javascript:;"> <i class="icon-envelope-alt"></i> Message <span class="label label-success pull-right r-activity">10</span></a></li>
                                </ul>
                            </div>
                            <div class="twt-write col-sm-12">
                                <textarea class="form-control  t-text-area" rows="2" placeholder="Tweet Here"></textarea>
                            </div>
                            <footer class="twt-footer">
                                <button class="btn btn-space btn-white" data-toggle="button" style="margin-top: 15px">
                                    <i class="fa fa-pencil"></i>
                                </button>
                                <button class="btn btn-space btn-white" data-toggle="button" style="margin-top: 15px">
                                    <i class="fa fa-user"></i>
                                </button>
                                <button class="btn btn-space btn-info pull-right" type="button" style="margin-top: 15px">
                                    <i class="fa fa-cloud-download"></i>
                                    下载
                                </button>
                            </footer>
                        </section>
                        <!--widget end-->
                    </div>
                    <div class="col-lg-6">
                        <section class="panel">
                            <header class="panel-heading">
                                Chats
                            </header>
                            <div class="panel-body">
                                <div class="timeline-messages">
                                    <!-- Comment -->
                                    <div class="msg-time-chat">
                                        <a href="#" class="message-img"><img class="avatar" src="img/chat-avatar.jpg" alt=""></a>
                                        <div class="message-body msg-in">
                                            <span class="arrow"></span>
                                            <div class="text">
                                                <p class="attribution"><a href="#">Jhon Doe</a> at 1:55pm, 13th April 2013</p>
                                                <p>Hello, How are you brother?</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /comment -->

                                    <!-- Comment -->
                                    <div class="msg-time-chat">
                                        <a href="#" class="message-img"><img class="avatar" src="img/chat-avatar2.jpg" alt=""></a>
                                        <div class="message-body msg-out">
                                            <span class="arrow"></span>
                                            <div class="text">
                                                <p class="attribution"> <a href="#">Jonathan Smith</a> at 2:01pm, 13th April 2013</p>
                                                <p>I'm Fine, Thank you. What about you? How is going on?</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /comment -->

                                    <!-- Comment -->
                                    <div class="msg-time-chat">
                                        <a href="#" class="message-img"><img class="avatar" src="img/chat-avatar.jpg" alt=""></a>
                                        <div class="message-body msg-in">
                                            <span class="arrow"></span>
                                            <div class="text">
                                                <p class="attribution"><a href="#">Jhon Doe</a> at 2:03pm, 13th April 2013</p>
                                                <p>Yeah I'm fine too. Everything is going fine here.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /comment -->

                                    <!-- Comment -->
                                    <div class="msg-time-chat">
                                        <a href="#" class="message-img"><img class="avatar" src="img/chat-avatar2.jpg" alt=""></a>
                                        <div class="message-body msg-out">
                                            <span class="arrow"></span>
                                            <div class="text">
                                                <p class="attribution"><a href="#">Jonathan Smith</a> at 2:05pm, 13th April 2013</p>
                                                <p>well good to know that. anyway how much time you need to done your task?</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /comment -->
                                    <!-- Comment -->
                                    <div class="msg-time-chat">
                                        <a href="#" class="message-img"><img class="avatar" src="img/chat-avatar.jpg" alt=""></a>
                                        <div class="message-body msg-in">
                                            <span class="arrow"></span>
                                            <div class="text">
                                                <p class="attribution"><a href="#">Jhon Doe</a> at 1:55pm, 13th April 2013</p>
                                                <p>Hello, How are you brother?</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /comment -->
                                </div>
                                <div class="chat-form">
                                    <div class="input-cont ">
                                        <input type="text" class="form-control col-lg-12" placeholder="Type a message here...">
                                    </div>
                                    <div class="form-group">
                                        <div class="pull-right chat-features">
                                            <a href="javascript:;">
                                                <i class="icon-camera"></i>
                                            </a>
                                            <a href="javascript:;">
                                                <i class="icon-link"></i>
                                            </a>
                                            <a class="btn btn-danger" href="javascript:;">留言</a>
                                        </div>
                                    </div>

                                </div>
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
            2014 - Alvarez.is
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



