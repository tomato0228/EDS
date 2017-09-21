<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/20
  Time: 上午9:12
  To change this template use File | Settings | File Templates.
--%>
<%--
  AllFileComment
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


</head>
<body>

<section id="container">
    <!-- **********************************************************************************************************************************************************
                MAIN CONTENT
                *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper site-min-height">
            <h3><i class="fa fa-angle-right"></i> 我的所有评论</h3>
            <div class="row mt">
                <div class="col-lg-12">
                    <c:forEach items="${sessionScope.notReadFileComments}" var="FileComment" varStatus="loop">
                        <! -- Blog Panel -->
                        <div class="col-lg-4 col-md-4 col-sm-4 mb">
                            <div class="content-panel pn">
                                <div id="blog-bg">
                                    <img src="${sessionScope.notReadFileCommentsSender[loop.count-1].userPictureUrl}"
                                         class="img-circle" width="70" style="margin:20px 35px;"
                                         onclick="window.location.href='${ctx}/user/aboutUser-${FileComment.comSender}'">

                                    <div class="blog-title">${sessionScope.notReadFileCommentsSender[loop.count-1].userName}</div>

                                    <img src="${ctx}/resources/img/prefix/${sessionScope.notReadFileCommentFiles[loop.count-1].fileType}.png"
                                         class="img-rounded" width="70" style="margin:20px 35px;"
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
                                            <c:when test="${fn:length(FileComment.comData) <= 75}">
                                                ${FileComment.comData}
                                            </c:when>
                                            <c:otherwise>
                                                ${fn:substring(FileComment.comData, 0, 75)}...
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


