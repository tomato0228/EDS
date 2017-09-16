<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/16
  Time: 上午9:39
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
            <h3><i class="fa fa-angle-right"></i>新建文件</h3>
            <div class="row mt">
                <div class="col-lg-12">
                    <%--<p>Place your content here.</p>--%>
                    <form action="${pageContext.request.contextPath}/user/uploadFile" enctype="multipart/form-data"
                          method="post">
                        <table>
                            <tr>
                                <td>请选择文件:</td>
                                <td><input type="file" name="file" class="btn btn-round btn-default"></td>
                            </tr>
                            <tr>
                                <td>文件描述:</td>
                                <td><textarea rows="10" cols="80" class="form-control"></textarea></td>
                            </tr>
                            <tr>
                                <td>文件秘级</td>
                                <td>
                                    <select multiple class="form-control ">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>是否共享</td>
                                <td>
                                    <div class="col-sm-6 text-center">
                                        <div class="switch switch-square"
                                             data-on-label="<i class=' fa fa-check'></i>"
                                             data-off-label="<i class='fa fa-times'></i>">
                                            <input type="checkbox"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>共享设置</td>
                                <td>

                                </td>
                            </tr>
                            <tr>
                                <td>


                                </td>
                                <td align="center"><input type="submit" value="上传" class="btn btn-round btn-primary">
                                </td>
                            </tr>
                        </table>


                    </form>
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

<!--custom switch-->
<script src="${ctx}/resources/js/bootstrap-switch.js"></script>

<script>
    //custom select box

    $(function () {
        $('select.styled').customSelect();
    });

</script>

</body>
</html>

