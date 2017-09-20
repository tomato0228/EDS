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
            <h3><i class="fa fa-angle-right"></i> 我的私人文件</h3>
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="col-lg-4">
                        <!--widget start-->
                        <aside class="profile-nav alt green-border">
                            <section class="panel">
                                <div class="user-heading alt green-bg">
                                    <a href="#">
                                        <img alt="" src="img/profile-avatar.jpg">
                                    </a>
                                    <h1>Jonathan Smith</h1>
                                    <p>jsmith@flatlab.com</p>
                                </div>

                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="javascript:;"> <i class="icon-time"></i> Mail Inbox <span class="label label-primary pull-right r-activity">19</span></a></li>
                                    <li><a href="javascript:;"> <i class="icon-calendar"></i> Recent Activity <span class="label label-info pull-right r-activity">11</span></a></li>
                                    <li><a href="javascript:;"> <i class="icon-bell-alt"></i> Notification <span class="label label-warning pull-right r-activity">03</span></a></li>
                                    <li><a href="javascript:;"> <i class="icon-envelope-alt"></i> Message <span class="label label-success pull-right r-activity">10</span></a></li>
                                </ul>

                            </section>
                        </aside>
                        <!--widget end-->
                    </div>

                    <div class="col-lg-6">
                        <section class="panel">
                            <header class="panel-heading">
                                Timeline
                            </header>
                            <div class="panel-body profile-activity">
                                <h5 class="pull-right">12 August 2013</h5>
                                <div class="activity terques">
                                  <span>
                                      <i class="icon-shopping-cart"></i>
                                  </span>
                                    <div class="activity-desk">
                                        <div class="panel">
                                            <div class="panel-body">
                                                <div class="arrow"></div>
                                                <i class=" icon-time"></i>
                                                <h4>10:45 AM</h4>
                                                <p>Purchased new equipments for zonal office setup and stationaries.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="activity alt purple">
                                  <span>
                                      <i class="icon-rocket"></i>
                                  </span>
                                    <div class="activity-desk">
                                        <div class="panel">
                                            <div class="panel-body">
                                                <div class="arrow-alt"></div>
                                                <i class=" icon-time"></i>
                                                <h4>12:30 AM</h4>
                                                <p>Lorem ipsum dolor sit amet consiquest dio</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="activity blue">
                                  <span>
                                      <i class="icon-bullhorn"></i>
                                  </span>
                                    <div class="activity-desk">
                                        <div class="panel">
                                            <div class="panel-body">
                                                <div class="arrow"></div>
                                                <i class=" icon-time"></i>
                                                <h4>10:45 AM</h4>
                                                <p>Please note which location you will consider, or both. Reporting to
                                                    the VP you will be responsible for managing.. </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="activity alt green">
                                  <span>
                                      <i class="fa fa-beer"></i>
                                  </span>
                                    <div class="activity-desk">
                                        <div class="panel">
                                            <div class="panel-body">
                                                <div class="arrow-alt"></div>
                                                <i class="fa fa-clock-o"></i>
                                                <h4>12:30 AM</h4>
                                                <p>Please note which location you will consider, or both.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="chat-form">
                                    <div class="input-cont ">
                                        <input type="text" class="form-control col-lg-12"
                                               placeholder="Type a message here...">
                                    </div>
                                    <div class="form-group">
                                        <div class="pull-right chat-features">
                                            <a href="javascript:;">
                                                <i class="icon-camera"></i>
                                            </a>
                                            <a href="javascript:;">
                                                <i class="icon-link"></i>
                                            </a>
                                            <a class="btn btn-danger" href="javascript:;">Send</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
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
                                        <a href="#" class="message-img"><img class="avatar" src="img/chat-avatar.jpg"
                                                                             alt=""></a>
                                        <div class="message-body msg-in">
                                            <span class="arrow"></span>
                                            <div class="text">
                                                <p class="attribution"><a href="#">Jhon Doe</a> at 1:55pm, 13th April
                                                    2013</p>
                                                <p>Hello, How are you brother?</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /comment -->

                                    <!-- Comment -->
                                    <div class="msg-time-chat">
                                        <a href="#" class="message-img"><img class="avatar" src="img/chat-avatar2.jpg"
                                                                             alt=""></a>
                                        <div class="message-body msg-out">
                                            <span class="arrow"></span>
                                            <div class="text">
                                                <p class="attribution"><a href="#">Jonathan Smith</a> at 2:01pm, 13th
                                                    April 2013</p>
                                                <p>I'm Fine, Thank you. What about you? How is going on?</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /comment -->

                                    <!-- Comment -->
                                    <div class="msg-time-chat">
                                        <a href="#" class="message-img"><img class="avatar" src="img/chat-avatar.jpg"
                                                                             alt=""></a>
                                        <div class="message-body msg-in">
                                            <span class="arrow"></span>
                                            <div class="text">
                                                <p class="attribution"><a href="#">Jhon Doe</a> at 2:03pm, 13th April
                                                    2013</p>
                                                <p>Yeah I'm fine too. Everything is going fine here.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /comment -->

                                    <!-- Comment -->
                                    <div class="msg-time-chat">
                                        <a href="#" class="message-img"><img class="avatar" src="img/chat-avatar2.jpg"
                                                                             alt=""></a>
                                        <div class="message-body msg-out">
                                            <span class="arrow"></span>
                                            <div class="text">
                                                <p class="attribution"><a href="#">Jonathan Smith</a> at 2:05pm, 13th
                                                    April 2013</p>
                                                <p>well good to know that. anyway how much time you need to done your
                                                    task?</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /comment -->
                                    <!-- Comment -->
                                    <div class="msg-time-chat">
                                        <a href="#" class="message-img"><img class="avatar" src="img/chat-avatar.jpg"
                                                                             alt=""></a>
                                        <div class="message-body msg-in">
                                            <span class="arrow"></span>
                                            <div class="text">
                                                <p class="attribution"><a href="#">Jhon Doe</a> at 1:55pm, 13th April
                                                    2013</p>
                                                <p>Hello, How are you brother?</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /comment -->
                                </div>
                                <div class="chat-form">
                                    <div class="input-cont ">
                                        <input type="text" class="form-control col-lg-12"
                                               placeholder="Type a message here...">
                                    </div>
                                    <div class="form-group">
                                        <div class="pull-right chat-features">
                                            <a href="javascript:;">
                                                <i class="icon-camera"></i>
                                            </a>
                                            <a href="javascript:;">
                                                <i class="icon-link"></i>
                                            </a>
                                            <a class="btn btn-danger" href="javascript:;">Send</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>


                    <c:forEach items="${sessionScope.PrivateFile}" var="privateFile">
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
                                        <p><i class="fa fa-clock-o"></i>${fn:substring(privateFile.fileLoadTime, 0, 16)}
                                        </p>
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



