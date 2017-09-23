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
    <link rel="stylesheet" href="${ctx}/resources/SweetAlert2/dist/sweetalert2.min.css">
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
        <div id="gr" class="meun-item  meun-item-active" ><img
                src="${ctx}/resources/images/icon_change_grey.png">个人设置
        </div>
        <div class="meun-title">系统管理</div>
        <div id="xt" class="meun-item" onclick="window.location.href='${ctx}/admin/SystemInfo'"><img
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
    <% String tel=admin.getAdminTel();
        String email=admin.getAdminEmail();
        String password=admin.getAdminPassword();
        String power;
        String name=admin.getAdminName();
        int id=admin.getAdminId();
        int p=admin.getAdminPower();
        if(p==1)
            {
                power="系统管理";
            }
            else if(p==2)
                {
                    power="管理员管理";
                }
                 else if(p==3)
                {
                    power="文件管理";
                }
                  else {power="用户管理";}
%>
    <div id="rightContent">
        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>
        <!-- Tab panes -->
        <div class="tab-content">
            <nav class="Hui-breadcrumb"><i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 个人管理
                <a class="btn btn-success radius r mr-20"
                   style="line-height:1.6em;margin-top:3px"
                   href="javascript:location.replace(location.href);" title="刷新"><i
                        class="icon-refresh"></i></a></nav>
        </div>
            <div role="tabpanel" class="tab-pane" id="chan">
                <div class="check-div">
                    修改你的信息 :
                </div>
                <div style="padding: 100px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 820px;margin: 50px auto;">
                    <form class="form-horizontal" name="admin" id="admin" method="post">
                        <div class="form-group">
                            <label for="" class="col-xs-4 control-label">管理员名：</label>
                            <div class="col-xs-5">
                                <input type="" class="form-control input-sm duiqi" name="name" placeholder="<%=name%>" style="margin-top: 7px;height: auto;" disabled>
                            </div>
                        </div> <div class="form-group">
                        <label for="" class="col-xs-4 control-label">管理员ID：</label>
                        <div class="col-xs-5">
                            <input type="" class="form-control input-sm duiqi" name="id" placeholder="<%=id%>" style="margin-top: 7px;height: auto;" disabled>
                        </div>
                    </div>
                        <div class="form-group">
                            <label for="" class="col-xs-4 control-label">管理员权限：</label>
                            <div class="col-xs-5">
                                <input type="" class="form-control input-sm duiqi" name="power" placeholder="<%=power%>" style="margin-top: 7px;height: auto;" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-4 control-label">联系电话：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" name="tel" id="tel" placeholder="<%=tel%>" style="margin-top: 7px;height: auto;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-4 control-label">邮箱地址:</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" name="email" id="email"  placeholder="<%=email%>" style="margin-top: 7px;height: auto;">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                                <button type="reset" class="btn btn-xs btn-white">取 消</button>
                                <input type="button" class="btn btn-xs btn-green" id="1" value="保存" onclick="admin_edit_save100('<%=id%>')"></input>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-4 control-label">修改密码：</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm duiqi" name="oldpw" id="oldpw" placeholder="原始密码" style="margin-top: 7px;height: auto;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-4 control-label">新密码：</label>
                            <div class="col-xs-5">
                                <input type="password" class="form-control input-sm duiqi" name="newpw1" id="newpw1" placeholder="输入新密码" style="margin-top: 7px;height: auto;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-4 control-label">确认密码：</label>
                            <div class="col-xs-5">
                                <input type="password" class="form-control input-sm duiqi"name="newpw2" id="newpw2" placeholder="确认密码" style="margin-top: 7px;height: auto;">
                            </div>
                        </div>
                        <div class="form-group text-right">
                            <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                                <button type="reset" class="btn btn-xs btn-white">取 消</button>
                                <input type="button" class="btn btn-xs btn-green" id="1" value="保存" onclick="admin_edit('<%=password%>','<%=id%>')"></input>
                            </div>
                        </div>

                    </form>
                </div>

            </div>
        <script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
        <script type="text/javascript" src="${ctx}/resources/layer/layer.min.js"></script>
        <script type="text/javascript" src="${ctx}/resources/js/pagenav.cn.js"></script>
        <script type="text/javascript" src="${ctx}/resources/js/H-ui.js"></script>
        <script type="text/javascript" src="${ctx}/resources/js/WdatePicker.js"></script>
        <script type="text/javascript" src="${ctx}/resources/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="${ctx}/resources/js/H-ui.admin.js"></script>
        <script type="text/javascript">
            window.onload = (function () {
                // optional set
                pageNav.pre = "&lt;上一页";
                pageNav.next = "下一页&gt;";
                // p,当前页码,pn,总页面
                pageNav.fn = function (p, pn) {
                    $("#pageinfo").text("当前页:" + p + " 总页: " + pn);
                };
                //重写分页状态,跳到第三页,总页33页
                pageNav.go(1, 13);
            });
            $('.table-sort').dataTable({
                "lengthMenu": false,//显示数量选择
                "bFilter": false,//过滤功能
                "bPaginate": false,//翻页信息
                "bInfo": false,//数量信息
                "aaSorting": [[1, "desc"]],//默认第几个排序
                "bStateSave": true,//状态保存
                "aoColumnDefs": [
                    //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                    {"orderable": false}// 制定列不参与排序
                ]
            });
        </script>
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
    <script src="${ctx}/resources/SweetAlert2/dist/sweetalert2.min.js"></script>
    <script src="${ctx}/resources/SweetAlert2/lib/es6-promise.min.js"></script>
</body>
</html>