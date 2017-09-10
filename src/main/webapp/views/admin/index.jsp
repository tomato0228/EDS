<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/10
  Time: 上午11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <script src="${ctx}/resources/js/jquery.min.js"></script>
    <script src="${ctx}/resources/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $(".meun-item").click(function () {
                $(".meun-item").removeClass("meun-item-active");
                $(this).addClass("meun-item-active");
                var itmeObj = $(".meun-item").find("img");
                itmeObj.each(function () {
                    var items = $(this).attr("src");
                    items = items.replace("_grey.png", ".png");
                    items = items.replace(".png", "_grey.png")
                    $(this).attr("src", items);
                });
                var attrObj = $(this).find("img").attr("src");
                ;
                attrObj = attrObj.replace("_grey.png", ".png");
                $(this).find("img").attr("src", attrObj);
            });
            $("#topAD").click(function () {
                $("#topA").toggleClass(" glyphicon-triangle-right");
                $("#topA").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topBD").click(function () {
                $("#topB").toggleClass(" glyphicon-triangle-right");
                $("#topB").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topCD").click(function () {
                $("#topC").toggleClass(" glyphicon-triangle-right");
                $("#topC").toggleClass(" glyphicon-triangle-bottom");
            });
            $(".toggle-btn").click(function () {
                $("#leftMeun").toggleClass("show");
                $("#rightContent").toggleClass("pd0px");
            })
        })
    </script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/slide.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/flat-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/jquery.nouislider.css">
    <title>H-ui.admin v2.1</title>
    <script >
        $(function(){
            $('.meun-item').click(function(){
                $(this).addClass('meun-item-active').siblings('li').removeClass('meun-item-active');
            })
        })
    </script>
</head>
<body >
<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun">
        <div id="logoDiv">
            <p id="logoP"><img id="logo" alt="EDS管理系统" src="${ctx}/resources/images/logo.png"><span>EDS管理系统</span></p>
        </div>
        <div id="personInfor">
            <p id="userName">${loginAdmin.adminName}</p>
            <p><span>${loginAdmin.adminEmail}</span></p>
            <p>
                <a>退出登录</a>
            </p>
        </div>
        <div class="meun-title ">普通管理</div>
        <div class="meun-item meun-item-active" onclick="window.location.href='${ctx}/user/tologin'" ><img
                src="${ctx}/resources/images/icon_source.png">文件管理
        </div>
        <div class="meun-item" href="#"  ><img
                src="${ctx}/resources/images/icon_chara_grey.png">用户管理
        </div>
        <div class="meun-item" href="#" ><img
                src="${ctx}/resources/images/icon_user_grey.png">消息管理
        </div>
        <div class="meun-item" href="#" ><img
                src="${ctx}/resources/images/icon_change_grey.png">个人设置
        </div>
        <div class="meun-title">系统管理</div>
        <div class="meun-item" href="#" ><img
                src="${ctx}/resources/images/icon_house_grey.png">系统信息
        </div>
        <div class="meun-item" href="#" ><img
                src="${ctx}/resources/images/icon_rule_grey.png">密级管理
        </div>
        <div class="meun-item" href="#" ><img
                src="${ctx}/resources/images/icon_card_grey.png">管理员
        </div>
    </div>

    <div id="rightContent">

    </div>
    <!-- 右侧具体内容栏目 -->


</div>
</body>
</html>
<!--
<%--<div id="rightContent1">--%>
    <%--<a class="toggle-btn" id="nimei">--%>
        <%--<i class="glyphicon glyphicon-align-justify"></i>--%>
    <%--</a>--%>
    <%--<!-- Tab panes -->--%>
    <%--<div >--%>
        <%--<!-- 资源管理模块 -->--%>
        <%--<div id="sour" style="height: 800px;">--%>
            <%--<iframe  width="100%" height="100%" marginwidth=0 marginheight=0 src="${ctx}/user/tologin" ></iframe>--%>
        <%--</div>--%>
        <%--<!-- 权限管理模块 -->--%>
        <%--<div role="tabpanel" style="height: 800px;" id="char">--%>
            <%--<iframe  width="100%" height="100%" marginwidth=0 marginheight=0 src="${ctx}/admin/tologin" ></iframe>--%>
        <%--</div>--%>
        <%--<!--用户管理模块-->--%>
        <%--<div role="tabpanel" class="tab-pane" id="user">--%>
        <%--</div>--%>
        <%--<!-- 修改密码模块 -->--%>
        <%--<div role="tabpanel" class="tab-pane" id="chan">--%>
        <%--</div>--%>
        <%--<!--规则管理模块-->--%>
        <%--<div role="tabpanel" class="tab-pane" id="regu" style="padding-top: 50px;">--%>

        <%--</div>--%>
        <%--<!--座位管理模块-->--%>
        <%--<div role="tabpanel" class="tab-pane" id="sitt">--%>
        <%--</div>--%>
        <%--<!--座位详情模块-->--%>
        <%--<div role="tabpanel" class="tab-pane" id="sitDetail">--%>

        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
-->