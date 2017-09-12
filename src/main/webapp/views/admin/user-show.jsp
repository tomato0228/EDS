<%--
  Created by IntelliJ IDEA.
  User: Nero
  Date: 2017/9/11
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.njust.eds.model.Admin" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <script type="text/javascript" src="js/PIE_IE678.js"></script>
    <![endif]-->
    <link type="text/css" rel="stylesheet" href="css/H-ui.css"/>
    <link type="text/css" rel="stylesheet" href="css/H-ui.admin.css"/>
    <link type="text/css" rel="stylesheet" href="font/font-awesome.min.css"/>
    <!--[if IE 7]>
    <link href="font/font-awesome-ie7.min.css" rel="stylesheet" type="text/css"/>
    <![endif]-->
    <title>用户查看</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
    <img class="avatar avatar-XL l" src="images/user.png">
    <dl style="margin-left:80px; color:#fff">
        <dt><span class="f-18">张三</span> <span class="pl-10 f-12">余额：40</span></dt>
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>

</body>
</html>