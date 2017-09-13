<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/11
  Time: 上午11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.njust.eds.model.Admin" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="format-detection" content="telephone=no">
    <link type="text/css" rel="stylesheet" href="${ctx}/resources/css/H-ui.css"/>
    <link type="text/css" rel="stylesheet" href="${ctx}/resources/css/H-ui.admin.css"/>
    <link type="text/css" rel="stylesheet" href="${ctx}/resources/fonts/font-awesome.min.css"/>
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
    <link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/slide.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/flat-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/jquery.nouislider.css">
    <title>EDS文件管理系统</title>
    <script>
        $(function () {
            $('.meun-item').click(function () {
                $(this).addClass('meun-item-active').siblings('li').removeClass('meun-item-active');
            })
        })
    </script>
    <script type="text/javascript">

        function logoutEDS() {
            window.location.href = "${ctx}/admin/logout";
        }
    </script>
</head>
<body>
<%
    Admin admin = (Admin) session.getAttribute("loginAdmin");

    if (admin != null) {
%>
<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun">
        <div id="logoDiv">
            <p id="logoP"><img id="logo" alt="EDS管理系统" src="${ctx}/resources/images/logo.png"><span>EDS管理系统</span></p>
        </div>
        <div id="personInfor">
            <p id="userName">${sessionScope.loginAdmin.adminName}</p>
            <p><span>${sessionScope.loginAdmin.adminEmail}</span></p>
            <p>
                <a onclick="logoutEDS()">退出登录</a>
            </p>
        </div>
        <div class="meun-title ">普通管理</div>
        <%
            int Power = admin.getAdminPower();
            int adminid=admin.getAdminId();
            if (Power == 3 || Power == 1) {
        %>
        <div id="wj" class="meun-item" onclick="window.location.href='${ctx}/admin/FileControl'"><img
                src="${ctx}/resources/images/icon_source.png">文件管理
        </div>
        <%
            }
            if (Power == 4 || Power == 1) {
        %>
        <div id="yh" class="meun-item" onclick="window.location.href='${ctx}/admin/UserControl'"><img
                src="${ctx}/resources/images/icon_chara_grey.png">用户管理
        </div>
        <%
            }
        %>
        <div id="xx" class="meun-item" onclick="window.location.href='${ctx}/admin/MessageControl'"><img
                src="${ctx}/resources/images/icon_user_grey.png">消息管理
        </div>
        <div id="gr" class="meun-item" onclick="window.location.href='${ctx}/admin/PersonalSettings'"><img
                src="${ctx}/resources/images/icon_change_grey.png">个人设置
        </div>
        <div class="meun-title">系统管理</div>
        <div id="xt" class="meun-item meun-item-active"><img
                src="${ctx}/resources/images/icon_house_grey.png">系统信息
        </div>

        <%
            if (Power == 1) {
        %>
        <div id="mj" class="meun-item" onclick="window.location.href='${ctx}/admin/SecretLeveControl'"><img
                src="${ctx}/resources/images/icon_rule_grey.png">密级管理
        </div>
        <%
            }
            if (Power == 1 || Power == 2) {
        %>
        <div id="gly" class="meun-item" onclick="window.location.href='${ctx}/admin/AdminControl'"><img
                src="${ctx}/resources/images/icon_card_grey.png">管理员
        </div>
        <%
            }
        %>
    </div>
    <div id="rightContent">
        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>
        <!-- Tab panes -->
        <div class="tab-content">
            <nav class="Hui-breadcrumb"><i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 系统信息
                <a class="btn btn-success radius r mr-20"
                   style="line-height:1.6em;margin-top:3px"
                   href="javascript:location.replace(location.href);" title="刷新"><i
                        class="icon-refresh"></i></a></nav>
            <div class="cl pd-20" style=" background-color:#5bacb6">
                <img class="avatar avatar-XL l" src="${ctx}/resources/images/logo.png">
                <dl style="margin-left:80px; color:#fff">
                    <dt><span class="f-18">EDS管理系统</span> <span class="pl-10 f-12">余额：40</span></dt>
                    <dd class="pt-10 f-12" style="margin-left:0">这家伙很懒，什么也没有留下</dd>
                </dl>
            </div>
            <div class="pd-20">
                <table class="table">
                    <tbody>
                    <tr>
                        <th class="text-r" width="80">性别：</th>
                        <td>男</td>
                    </tr>
                    <tr>
                        <th class="text-r">手机：</th>
                        <td>13000000000</td>
                    </tr>
                    <tr>
                        <th class="text-r">邮箱：</th>
                        <td>admin@mail.com</td>
                    </tr>
                    <tr>
                        <th class="text-r">地址：</th>
                        <td>北京市 海淀区</td>
                    </tr>
                    <tr>
                        <th class="text-r">注册时间：</th>
                        <td>2014.12.20</td>
                    </tr>
                    <tr>
                        <th class="text-r">积分：</th>
                        <td>330</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/H-ui.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/H-ui.admin.js"></script>

    <%
    } else {
    %>
    <script>
        alert("未登录!");
        window.location.href = "${ctx}/admin/tologin";
    </script>
    <%
        }
    %>
</div>
</body>
</html>