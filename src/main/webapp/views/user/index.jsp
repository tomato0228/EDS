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

<section id="container">
    <!-- **********************************************************************************************************************************************************
    TOP BAR CONTENT & NOTIFICATIONS
    *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <a href="#" class="logo"><b>EDS</b></a>
        <!--logo end-->
        <div class="nav notify-row" id="top_menu">
            <!--  通知 start -->
            <ul class="nav top-menu">
                <!-- 文件评论 start -->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.jsp#">
                        <i class="fa fa-tasks"></i>
                        <span class="badge bg-theme">${fn:length(sessionScope.notReadFileComments)}</span>
                    </a>
                    <ul class="dropdown-menu extended tasks-bar">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">你有 ${fn:length(sessionScope.notReadFileComments)} 条新评论</p>
                        </li>
                        <li>
                            <a href="index.jsp#">
                                <div class="task-info">
                                    <div class="desc">DashGum Admin Panel</div>
                                    <div class="percent">40%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">40% Complete (success)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="index.jsp#">
                                <div class="task-info">
                                    <div class="desc">Database Update</div>
                                    <div class="percent">60%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete (warning)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="index.jsp#">
                                <div class="task-info">
                                    <div class="desc">Product Development</div>
                                    <div class="percent">80%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Complete</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="index.jsp#">
                                <div class="task-info">
                                    <div class="desc">Payments Sent</div>
                                    <div class="percent">70%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                        <span class="sr-only">70% Complete (Important)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="external">
                            <a href="#">查看所有评论</a>
                        </li>
                    </ul>
                </li>
                <!-- 文件评论 end -->
                <!-- inbox dropdown start-->
                <li id="header_inbox_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.jsp#">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-theme">${fn:length(sessionScope.notReadMessages)}</span>
                    </a>
                    <ul class="dropdown-menu extended inbox">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">你有 ${fn:length(sessionScope.notReadMessages)} 条新消息</p>
                        </li>
                        <li>
                            <a href="index.jsp#">
                                <span class="photo"><img alt="avatar" src="${ctx}/resources/img/ui-zac.jpg"></span>
                                <span class="subject">
                                    <span class="from">Zac Snider</span>
                                    <span class="time">
                                        <jsp:useBean id="Timestamp" class="java.util.Date"/>
                                        <fmt:formatDate value="${Timestamp}" type="time" timeStyle="medium"/>
                                    </span>
                                    </span>
                                <span class="message">
                                        Hi mate, how is everything?
                                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.jsp#">
                                <span class="photo"><img alt="avatar" src="${ctx}/resources/img/ui-divya.jpg"></span>
                                <span class="subject">
                                    <span class="from">Divya Manian</span>
                                    <span class="time">40 mins.</span>
                                    </span>
                                <span class="message">
                                     Hi, I need your help with this.
                                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.jsp#">
                                <span class="photo"><img alt="avatar" src="${ctx}/resources/img/ui-danro.jpg"></span>
                                <span class="subject">
                                    <span class="from">Dan Rogers</span>
                                    <span class="time">2 hrs.</span>
                                    </span>
                                <span class="message">
                                        Love your new Dashboard.
                                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.jsp#">
                                <span class="photo"><img alt="avatar" src="${ctx}/resources/img/ui-sherman.jpg"></span>
                                <span class="subject">
                                    <span class="from">Dj Sherman</span>
                                    <span class="time">4 hrs.</span>
                                    </span>
                                <span class="message">
                                        Please, answer asap.
                                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.jsp#">查看所有消息</a>
                        </li>
                    </ul>
                </li>
                <!-- inbox dropdown end -->
            </ul>
            <!--  通知 end -->
        </div>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="#" onclick="window.location.href='${ctx}/user/logout'">注  销</a></li>
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
                            <c:when test="${sessionScope.loginUser.userPictureUrl} == null">
                                <img src="${ctx}/resources/img/ui-sam.jpg" class="img-circle" width="60">
                            </c:when>
                            <c:otherwise>
                                <img src="${sessionScope.loginUser.userPictureUrl}" class="img-circle" width="60">
                            </c:otherwise>
                        </c:choose>
                    </a>
                </p>
                <!--用户名-->
                <h5 class="centered">${sessionScope.loginUser.userName}</h5>

                <!--主页-->
                <li class="mt">
                    <a class="active" href="#">
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
                        <li><a href="blank.html">新建消息</a></li>
                        <li><a href="login.html">未读消息</a></li>
                        <li><a href="lock_screen.html">所有消息</a></li>
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
                        <li><a href="#" onclick="window.location.href='${ctx}/user/recentFile'">近期文件</a></li>
                        <li><a href="basic_table.html">共享文件</a></li>
                        <li><a href="basic_table.html">私人文件</a></li>
                    </ul>
                </li>
                <!--文件评论-->
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-tasks"></i>
                        <span>文件评论</span>
                    </a>
                    <ul class="sub">
                        <li><a href="form_component.html">未读评论</a></li>
                        <li><a href="form_component.html">所有评论</a></li>
                    </ul>
                </li>
                <!--日志系统-->
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>我的日志</span>
                    </a>
                    <ul class="sub">
                        <li><a href="#">我的日志</a></li>
                        <li><a href="#">文件日志</a></li>
                    </ul>
                </li>
                <!--个人信息-->
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class=" fa fa-bar-chart-o"></i>
                        <span>个人信息</span>
                    </a>
                    <ul class="sub">
                        <li><a href="morris.html">信息查看</a></li>
                        <li><a href="panels.html">个人简介</a></li>
                    </ul>
                </li>
                <!--系统信息-->
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-desktop"></i>
                        <span>系统信息</span>
                    </a>
                    <ul class="sub">
                        <li><a href="general.html">系统介绍</a></li>
                        <li><a href="buttons.html">作者介绍</a></li>
                    </ul>
                </li>
                <!--设置-->
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-cogs"></i>
                        <span>设  置</span>
                    </a>
                    <ul class="sub">
                        <li><a href="calendar.html">密码修改</a></li>
                        <li><a href="#" onclick="window.location.href='${ctx}/user/userPicture'">头像修改</a></li>
                        <li><a href="#" onclick="window.location.href='${ctx}/user/userPicture'">信息修改</a></li>
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
                                <h3>933</h3>
                            </div>
                            <p>共记 933 次查看你的共享文档.</p>
                        </div>
                        <div class="col-md-2 col-sm-2 box0">
                            <div class="box1">
                                <span class="li_cloud"></span>
                                <h3>+48</h3>
                            </div>
                            <p>你上传了 48 个共享文档.</p>
                        </div>
                        <div class="col-md-2 col-sm-2 box0">
                            <div class="box1">
                                <span class="li_stack"></span>
                                <h3>23</h3>
                            </div>
                            <p>你总共有 23 个私人文件.</p>
                        </div>
                        <div class="col-md-2 col-sm-2 box0">
                            <div class="box1">
                                <span class="li_note"></span>
                                <h3>+10</h3>
                            </div>
                            <p>你共享的文件有 10 条评论.</p>
                        </div>
                        <div class="col-md-2 col-sm-2 box0">
                            <div class="box1">
                                <span class="li_data"></span>
                                <h3>OK!</h3>
                            </div>
                            <p>你还没有获得认证，请及时完善个人信息</p>
                        </div>

                    </div><!-- /row mt -->


                    <div class="row mt">
                        <!-- SERVER STATUS PANELS -->
                        <div class="col-md-4 col-sm-4 mb">
                            <div class="white-panel pn donut-chart">
                                <div class="white-header">
                                    <h5>SERVER LOAD</h5>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-xs-6 goleft">
                                        <p><i class="fa fa-database"></i> 70%</p>
                                    </div>
                                </div>
                                <canvas id="serverstatus01" height="120" width="120"></canvas>
                                <script>
                                    var doughnutData = [
                                        {
                                            value: 70,
                                            color: "#68dff0"
                                        },
                                        {
                                            value: 30,
                                            color: "#fdfdfd"
                                        }
                                    ];
                                    var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                                </script>
                            </div>
                            <! --/grey-panel -->
                        </div><!-- /col-md-4-->


                        <div class="col-md-4 col-sm-4 mb">
                            <div class="white-panel pn">
                                <div class="white-header">
                                    <h5>TOP PRODUCT</h5>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 col-xs-6 goleft">
                                        <p><i class="fa fa-heart"></i> 122</p>
                                    </div>
                                    <div class="col-sm-6 col-xs-6"></div>
                                </div>
                                <div class="centered">
                                    <img src="${ctx}/resources/img/product.png" width="120">
                                </div>
                            </div>
                        </div><!-- /col-md-4 -->

                        <div class="col-md-4 mb">
                            <!-- WHITE PANEL - TOP USER -->
                            <div class="white-panel pn">
                                <div class="white-header">
                                    <h5>TOP USER</h5>
                                </div>
                                <div class="row">

                                </div>
                                <p><img src="${ctx}/resources/img/ui-zac.jpg" class="img-circle" width="100"></p>
                                <p><b>Zac Snider</b></p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <p class="small mt">MEMBER SINCE</p>
                                        <p>2012</p>
                                    </div>
                                    <div class="col-md-6">
                                        <p class="small mt">TOTAL SPEND</p>
                                        <p>$ 47,60</p>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /col-md-4 -->


                    </div><!-- /row -->


                    <div class="row">
                        <!-- TWITTER PANEL -->
                        <div class="col-md-4 mb">
                            <div class="darkblue-panel pn">
                                <div class="darkblue-header">
                                    <h5>DROPBOX STATICS</h5>
                                </div>
                                <canvas id="serverstatus02" height="120" width="120"></canvas>
                                <script>
                                    var doughnutData = [
                                        {
                                            value: 60,
                                            color: "#68dff0"
                                        },
                                        {
                                            value: 40,
                                            color: "#444c57"
                                        }
                                    ];
                                    var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                                </script>
                                <p>April 17, 2014</p>
                                <footer>
                                    <div class="pull-left">
                                        <h5><i class="fa fa-hdd-o"></i> 17 GB</h5>
                                    </div>
                                    <div class="pull-right">
                                        <h5>60% Used</h5>
                                    </div>
                                </footer>
                            </div>
                            <! -- /darkblue panel -->
                        </div><!-- /col-md-4 -->


                        <div class="col-md-4 mb">
                            <!-- INSTAGRAM PANEL -->
                            <div class="instagram-panel pn">
                                <i class="fa fa-instagram fa-4x"></i>
                                <p>@THISISYOU<br/>
                                    5 min. ago
                                </p>
                                <p><i class="fa fa-comment"></i> 18 | <i class="fa fa-heart"></i> 49</p>
                            </div>
                        </div><!-- /col-md-4 -->

                        <div class="col-md-4 col-sm-4 mb">
                            <!-- REVENUE PANEL -->
                            <div class="darkblue-panel pn">
                                <div class="darkblue-header">
                                    <h5>REVENUE</h5>
                                </div>
                                <div class="chart mt">
                                    <div class="sparkline" data-type="line" data-resize="true" data-height="75"
                                         data-width="90%" data-line-width="1" data-line-color="#fff"
                                         data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff"
                                         data-spot-radius="4"
                                         data-data="[200,135,667,333,526,996,564,123,890,464,655]"></div>
                                </div>
                                <p class="mt"><b>$ 17,980</b><br/>Month Income</p>
                            </div>
                        </div><!-- /col-md-4 -->

                    </div><!-- /row -->

                    <div class="row mt">
                        <!--CUSTOM CHART START -->
                        <div class="border-head">
                            <h3>VISITS</h3>
                        </div>
                        <div class="custom-bar-chart">
                            <ul class="y-axis">
                                <li><span>10.000</span></li>
                                <li><span>8.000</span></li>
                                <li><span>6.000</span></li>
                                <li><span>4.000</span></li>
                                <li><span>2.000</span></li>
                                <li><span>0</span></li>
                            </ul>
                            <div class="bar">
                                <div class="title">JAN</div>
                                <div class="value tooltips" data-original-title="8.500" data-toggle="tooltip"
                                     data-placement="top">85%
                                </div>
                            </div>
                            <div class="bar ">
                                <div class="title">FEB</div>
                                <div class="value tooltips" data-original-title="5.000" data-toggle="tooltip"
                                     data-placement="top">50%
                                </div>
                            </div>
                            <div class="bar ">
                                <div class="title">MAR</div>
                                <div class="value tooltips" data-original-title="6.000" data-toggle="tooltip"
                                     data-placement="top">60%
                                </div>
                            </div>
                            <div class="bar ">
                                <div class="title">APR</div>
                                <div class="value tooltips" data-original-title="4.500" data-toggle="tooltip"
                                     data-placement="top">45%
                                </div>
                            </div>
                            <div class="bar">
                                <div class="title">MAY</div>
                                <div class="value tooltips" data-original-title="3.200" data-toggle="tooltip"
                                     data-placement="top">32%
                                </div>
                            </div>
                            <div class="bar ">
                                <div class="title">JUN</div>
                                <div class="value tooltips" data-original-title="6.200" data-toggle="tooltip"
                                     data-placement="top">62%
                                </div>
                            </div>
                            <div class="bar">
                                <div class="title">JUL</div>
                                <div class="value tooltips" data-original-title="7.500" data-toggle="tooltip"
                                     data-placement="top">75%
                                </div>
                            </div>
                        </div>
                        <!--custom chart end-->
                    </div><!-- /row -->

                </div><!-- /col-lg-9 END SECTION MIDDLE -->


                <!-- **********************************************************************************************************************************************************
                RIGHT SIDEBAR CONTENT
                *********************************************************************************************************************************************************** -->

                <div class="col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
                    <h3>最近评论</h3>

                    <!-- First Action -->
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p>
                                <muted>2 Minutes Ago</muted>
                                <br/>
                                <a href="#">James Brown</a> subscribed to your newsletter.<br/>
                            </p>
                        </div>
                    </div>
                    <!-- Second Action -->
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p>
                                <muted>3 Hours Ago</muted>
                                <br/>
                                <a href="#">Diana Kennedy</a> purchased a year subscription.<br/>
                            </p>
                        </div>
                    </div>
                    <!-- Third Action -->
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p>
                                <muted>7 Hours Ago</muted>
                                <br/>
                                <a href="#">Brandon Page</a> purchased a year subscription.<br/>
                            </p>
                        </div>
                    </div>
                    <!-- Fourth Action -->
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p>
                                <muted>11 Hours Ago</muted>
                                <br/>
                                <a href="#">Mark Twain</a> commented your post.<br/>
                            </p>
                        </div>
                    </div>
                    <!-- Fifth Action -->
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p>
                                <muted>18 Hours Ago</muted>
                                <br/>
                                <a href="#">Daniel Pratt</a> purchased a wallet in your store.<br/>
                            </p>
                        </div>
                    </div>

                    <!-- USERS ONLINE SECTION -->
                    <h3>最近消息</h3>
                    <!-- First Member -->
                    <div class="desc">
                        <div class="thumb">
                            <img class="img-circle" src="${ctx}/resources/img/ui-divya.jpg" width="35px" height="35px"
                                 align="">
                        </div>
                        <div class="details">
                            <p><a href="#">DIVYA MANIAN</a><br/>
                                <muted>Available</muted>
                            </p>
                        </div>
                    </div>
                    <!-- Second Member -->
                    <div class="desc">
                        <div class="thumb">
                            <img class="img-circle" src="${ctx}/resources/img/ui-sherman.jpg" width="35px" height="35px"
                                 align="">
                        </div>
                        <div class="details">
                            <p><a href="#">DJ SHERMAN</a><br/>
                                <muted>I am Busy</muted>
                            </p>
                        </div>
                    </div>
                    <!-- Third Member -->
                    <div class="desc">
                        <div class="thumb">
                            <img class="img-circle" src="${ctx}/resources/img/ui-danro.jpg" width="35px" height="35px"
                                 align="">
                        </div>
                        <div class="details">
                            <p><a href="#">DAN ROGERS</a><br/>
                                <muted>Available</muted>
                            </p>
                        </div>
                    </div>
                    <!-- Fourth Member -->
                    <div class="desc">
                        <div class="thumb">
                            <img class="img-circle" src="${ctx}/resources/img/ui-zac.jpg" width="35px" height="35px"
                                 align="">
                        </div>
                        <div class="details">
                            <p><a href="#">Zac Sniders</a><br/>
                                <muted>Available</muted>
                            </p>
                        </div>
                    </div>
                    <!-- Fifth Member -->
                    <div class="desc">
                        <div class="thumb">
                            <img class="img-circle" src="${ctx}/resources/img/ui-sam.jpg" width="35px" height="35px"
                                 align="">
                        </div>
                        <div class="details">
                            <p><a href="#">Marcel Newman</a><br/>
                                <muted>Available</muted>
                            </p>
                        </div>
                    </div>

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
            2014 - Alvarez.is
            <a href="index.jsp#" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>
    <!--footer end-->
</section>

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
            text: '这里有最安全的加密算法，保证你的文件不会被非授权用户获取到，超强的双重加密与日志系统将时时刻刻保证你的文档安全，若喜欢，欢迎<a href="#" target="_blank" style="color:#ffd777">捐赠作者</a>.',
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
