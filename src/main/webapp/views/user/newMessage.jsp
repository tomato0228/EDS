<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/16
  Time: 上午2:24
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

    <link rel="stylesheet" href="${ctx}/resources/js/message/style.css" media="screen" type="text/css" />
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
            <h3><i class="fa fa-angle-right"></i> Blank Page</h3>
            <div class="row mt">
                <div class="col-lg-12">
                    <p>Place your content here.</p>


                    <div id="convo" data-from="Sonu Joshi">
                        <ul class="chat-thread">
                            <li></li>
                            <li>yes, what time suits you?</li>
                            <li>I was thinking after lunch, I have a meeting in the morning</li>
                            <li>Are we meeting today?</li>
                            <li>yes, what time suits you?</li>
                            <li>I was thinking after lunch, I have a meeting in the morning</li>
                            <li>Are we meeting today?</li>
                            <li>yes, what time suits you?</li>
                            <li>I was thinking after lunch, I have a meeting in the morning</li>
                            <li>Are we meeting today?</li>
                            <li>yes, what time suits you?</li>
                            <li>I was thinking after lunch, I have a meeting in the morning</li>
                        </ul>
                    </div>
                    <div style="text-align:center;clear:both">
                        <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
                        <script src="/follow.js" type="text/javascript"></script>
                    </div>
                    <div class="credits"><a href="http://codepen.io/clintioo/pen/HAkjq">Original Pen</a> by <a href="http://codepen.io/clintioo/pen/HAkjq">clintioo</a></div>








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
            <a href="userInfo.jsp#" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>
    <!--footer end-->
</section>


<!-- js placed at the end of the document so the pages load faster -->
<script src='${ctx}/resources/js/message/jquery.js'></script>
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


