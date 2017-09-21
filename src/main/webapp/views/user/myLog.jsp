<%--
  Created by IntelliJ IDEA.
  User: Nero
  Date: 2017/9/21
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
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

<section id="container">
    <!-- **********************************************************************************************************************************************************
                MAIN CONTENT
                *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper site-min-height">
            <h3><i class="fa fa-angle-right"></i> ${loginUser.getUserName()}的日志</h3>
            <div class="row mt">
                <div class="col-lg-12">
                    <div class="col-lg-10">
                        <section class="panel">
                            <header class="panel-heading">
                                 Log Table
                            </header>
                            <table class="table table-striped border-top" id="sample_1">
                                <thead>
                                <tr>
                                    <th style="width:8px;"><input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" /></th>
                                    <th> 文  件  名 </th>
                                    <th class="hidden-phone">数 字 密 钥</th>
                                    <th class="hidden-phone">时     间</th>
                                    <th class="hidden-phone">操 作 类 型</th>
                                    <th class="hidden-phone">删 除 记 录</th>
                                </tr>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${loglist}" var="item" varStatus="loop">
                                    <tr class="odd gradeX">
                                        <td><input type="checkbox" class="checkboxes" value="1" /></td>
                                        <td>${filelist[loop.count-1]}</td>
                                        <td class="hidden-phone">${item.logSignature}</td>
                                        <td class="hidden-phone">${item.logTime}</td>
                                        <td class="hidden-phone">
                                            <c:choose>
                                                <c:when test="${item.logOptype==1}"><span class="label label-success">上  传</span></c:when>
                                                <c:when test="${item.logOptype==2}"><span class="label label-danger">删  除</span></c:when>
                                                <c:when test="${item.logOptype==3}"><span class="label label-info">查  看</span></c:when>
                                                <c:when test="${item.logOptype==4}"><span class="label label-warning">下  载</span></c:when>
                                                <c:when test="${item.logOptype==5}"><span class="label label-primary">修  改</span></c:when>

                                            </c:choose></td>
                                        <td class="hidden-phone">
                                            <span class="label label-danger"><button class="btn btn-danger btn-xs" onclick="Log_del(${item.logId})"><i class="fa-trash-o "></i></button></span>
</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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
<script type="text/javascript" src="${ctx}/resources/js/H-ui.user.js"></script>

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



