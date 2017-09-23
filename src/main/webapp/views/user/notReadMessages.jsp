<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/21
  Time: 下午10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- Custom styles for this template -->
    <link href="${ctx}/resources/css/userstyle.css" rel="stylesheet">
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
            <h3><i class="fa fa-angle-right"></i> 我的未读消息</h3>
            <div class="row mt">
                <div class="col-lg-12">

                    <c:forEach items="${sessionScope.notReadMessages}" var="message" varStatus="loop">
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
            <a href="userInfo.jsp#" class="go-top">
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

