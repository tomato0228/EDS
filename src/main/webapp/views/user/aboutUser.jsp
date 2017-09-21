<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/20
  Time: 下午1:26
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
            <h3><i class="fa fa-angle-right"></i> ${requestScope.ThisUser.userName}的信息</h3>
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="col-lg-4">
                        <!--widget start-->
                        <aside class="profile-nav alt green-border">
                            <section class="panel">
                                <div class="user-heading alt green-bg">
                                    <a href="#">
                                        <img alt="" src="${requestScope.ThisUser.userPictureUrl}">
                                    </a>
                                    <h1>${requestScope.ThisUser.userName}</h1>
                                    <p>${requestScope.ThisUser.userEmail}</p>
                                </div>

                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="javascript:;"> <i class="fa fa-github-alt"></i> 性别：
                                        <c:choose>
                                            <c:when test="${requestScope.ThisUser.userSex == 0}">
                                                女
                                            </c:when>
                                            <c:when test="${requestScope.ThisUser.userSex == 1}">
                                                男
                                            </c:when>
                                            <c:otherwise>
                                                未知
                                            </c:otherwise>
                                        </c:choose>
                                    </a></li>
                                    <li><a href="javascript:;"> <i class="fa fa-phone"></i>
                                        电话：${requestScope.ThisUser.userTel}</a></li>
                                    <li><a href="javascript:;"> <i class="fa fa-building"></i>
                                        单位：${requestScope.ThisUser.userCompany}</a></li>
                                    <li><a href="javascript:;"> <i class="fa fa-gift"></i>
                                        生日：${requestScope.ThisUser.userBirthday}</a></li>
                                    <li><a href="javascript:;"> <i class="fa fa-key"></i> 密级：
                                        <c:choose>
                                            <c:when test="${requestScope.ThisUser.userSecretLevel == 5}"> A</c:when>
                                            <c:when test="${requestScope.ThisUser.userSecretLevel == 4}"> B</c:when>
                                            <c:when test="${requestScope.ThisUser.userSecretLevel == 3}"> C</c:when>
                                            <c:when test="${requestScope.ThisUser.userSecretLevel == 2}"> 内部</c:when>
                                            <c:otherwise> 普通</c:otherwise>
                                        </c:choose>
                                    </a></li>
                                    <li><a href="javascript:;"> <i class="fa fa-calendar"></i>
                                        注册日期：${fn:substring(requestScope.ThisUser.userCreateTime, 0, 11)}</a></li>
                                    <li><a href="javascript:;"> <i class="fa fa-tag"></i>
                                        个人简介：${requestScope.ThisUser.userProfile} </a></li>
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
                                <%--<h5 class="pull-right">12 August 2013</h5>--%>
                                <c:choose>
                                    <c:when test="${fn:length(sessionScope.aUserMessage) <= 8}">
                                        <c:set value="0" var="begin"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set value="${fn:length(sessionScope.aUserMessage) - 8}" var="begin"/>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach items="${sessionScope.aUserMessage}" var="message" begin="${begin}">
                                    <c:choose>
                                        <c:when test="${message.msgSender == requestScope.ThisUser.userId}">
                                            <div class="activity blue">
                                            <span>
                                                <img src="${requestScope.ThisUser.userPictureUrl}" class="img-circle"
                                                     width="50">
                                            </span>
                                                <div class="activity-desk">
                                                    <div class="panel">
                                                        <div class="panel-body">
                                                            <div class="arrow"></div>
                                                                <%--<i class="fa fa-clock-o"></i>--%>
                                                            <h4>${fn:substring(message.msgSendtime, 5, 16)}</h4>
                                                            <p>${message.msgData}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="activity alt green">
                                                <span>
                                                    <img src="${sessionScope.loginUser.userPictureUrl}"
                                                         class="img-circle" width="50">
                                                </span>
                                                <div class="activity-desk">
                                                    <div class="panel">
                                                        <div class="panel-body">
                                                            <div class="arrow-alt"></div>
                                                                <%--<i class="fa fa-clock-o"></i>--%>
                                                            <h4>${fn:substring(message.msgSendtime, 5, 16)}</h4>
                                                            <p>${message.msgData}</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <div class="chat-form">
                                    <div class="input-cont ">
                                        <input type="text" class="form-control col-lg-12"
                                               placeholder="在这里输入你的消息...">
                                    </div>
                                    <div class="form-group">
                                        <div class="pull-right chat-features">
                                            <a class="btn btn-danger" href="javascript:;">发 送</a>
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



