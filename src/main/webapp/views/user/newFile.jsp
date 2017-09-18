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
<style>
    .everyWeekDay .weekday, .everyDay .days { /*解决span不支持width属性*/
        display: -moz-inline-box;
        display: inline-block;
        margin: 5px 0 0 20px;
        text-align: center;
        width: 20px;
        border: 1px solid #F7F7F7;
        cursor: pointer;
    }

    .marginTop {
        margin-top: 5px;
    }

    .selectStyle {
        padding-left: 10px;
        border: none;
        border-radius: 3px;
        outline: none;
        appearance: none;
        -moz-appearance: none;
        -webkit-appearance: none;
        margin: 0 10px 0 10px;
        width: 60px;
        border-color: #0FB9EF;
        color: #0FB9EF;
    }
</style>
<script type="text/javascript">
    window.onload = function () {
        var test = document.getElementById("Share");
        test.onclick = function () {
            if (this.checked) {
                document.getElementById("isShare").style.display = "block";
            } else {
                document.getElementById("isShare").style.display = "none";
            }
        }
    }
</script>
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
                    <form action="${pageContext.request.contextPath}/user/uploadFile" enctype="multipart/form-data"
                          method="post">
                        <table style="border-collapse:separate; border-spacing:10px;">
                            <tr>
                                <td>请选择文件:</td>
                                <td><input type="file" name="file" class="btn btn-round btn-default"></td>
                            </tr>
                            <tr>
                                <td>文件描述:</td>
                                <td><textarea name="abstrcat" rows="10" cols="80" class="form-control"></textarea></td>
                            </tr>
                            <tr>
                                <td>文件秘级</td>
                                <td>
                                    <select multiple class="form-control" name="fileSecretLevel" id="fileSecretLevel">
                                        <c:if test="${sessionScope.loginUser.userSecretLevel == 5}">
                                            <option>A</option>
                                        </c:if>
                                        <c:if test="${sessionScope.loginUser.userSecretLevel>= 4}">
                                            <option>B</option>
                                        </c:if>
                                        <c:if test="${sessionScope.loginUser.userSecretLevel >= 3}">
                                            <option>C</option>
                                        </c:if>
                                        <c:if test="${sessionScope.loginUser.userSecretLevel >= 2}">
                                            <option>内部</option>
                                        </c:if>
                                        <option>普通</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>是否共享</td>
                                <td>
                                    <input type="checkbox" id="Share" name="Share"/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="center"><input type="submit" value="上传" class="btn btn-round btn-primary">
                                </td>
                            </tr>
                        </table>
                        <table style="border-collapse:separate; border-spacing:10px;">
                            <tr id="isShare" style="display: none">
                                <td>共享设置</td>
                                <td>
                                    <table style="border-collapse:separate; border-spacing:10px;">
                                        <tr>
                                            <td>是否只读</td>
                                            <td>
                                                <input type="checkbox" id="fileRead" name="fileRead"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>是否可改写</td>
                                            <td>
                                                <input type="checkbox" id="fileWrite" name="fileWrite"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>是否可打印</td>
                                            <td>
                                                <input type="checkbox" id="filePrint" name="filePrint"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>读取次数</td>
                                            <td>
                                                <input type="text" placeholder="-1为无限次" id="fileReadTimes"
                                                       style="background-color: #cfcfcf;border: none;border-radius: 5px;height: 25px;padding-left: 10px;outline:none;"
                                                       name="fileReadTimes">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>生命周期</td>
                                            <td>
                                                <input type="text" id="fileLifeCycle"
                                                       style="background-color: #cfcfcf;border: none;border-radius: 5px;height: 25px;padding-left: 10px;outline:none;"
                                                       readonly="readonly" onfocus="showDate()" name="fileLifeCycle"/>
                                            </td>
                                        </tr>
                                    </table>
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

<%--日期选择器--%>
<script type="text/javascript" src="${ctx}/resources/js/dateJs.fei.js"></script>
<script>
    //custom select box

    $(function () {
        $('select.styled').customSelect();
    });

</script>

</body>
</html>

