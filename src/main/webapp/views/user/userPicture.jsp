<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/14
  Time: 上午10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" isELIgnored="false" contentType="text/html; utf-8" %>
<html>
<head>
    <title>头像上传</title>
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    <link href="${ctx}/resources/css/userImgStyle.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/resources/js/cropper/cropper.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<!--头像上传-->
<div class="container">
    <div class="row">
        <div id="crop-avatar">
            <div class="avatar-view" title="点击修改头像">
                <c:choose>
                    <c:when test="${sessionScope.url!=null}">
                        <img src="${sessionScope.url}"
                             alt="用户头像">
                    </c:when>
                    <c:otherwise>
                        <img src="${ctx}/resources/img/userPicture/ui-sam.jpg"
                             alt="无头像">
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label"
     role="dialog"
     tabindex="-1">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <form class="avatar-form"
                  action="${ctx}/user/uploadUserImg"
                  enctype="multipart/form-data" method="post">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal" type="button">&times;</button>
                    <h4 class="modal-title" id="avatar-modal-label">请选择头像</h4>
                </div>
                <div class="modal-body">
                    <div class="avatar-body">
                        <div class="avatar-upload">
                            <input class="avatar-src" name="avatar_src" type="hidden">
                            <input class="avatar-data" name="avatar_data" type="hidden">
                            <label for="avatarInput">图片上传</label>
                            <input class="avatar-input" id="avatarInput" name="avatar_file"
                                   type="file" style="margin-right:20px">
                        </div>
                        <div class="row">
                            <div class="col-xs-8">
                                <div class="file-type">
                                    支持JPG，PNG，图片小于<em>1MB</em>，尺寸<em>不小于180*180</em>，真实高清头像更受欢迎！
                                </div>
                                <div class="avatar-wrapper">
                                </div>
                            </div>
                            <div class="col-xs-4">
                                <div class="avatar-preview preview-mx">
                                </div>
                                <div class="avatar-preview preview-md">
                                </div>
                                <div class="avatar-preview preview-ml">
                                </div>
                                <div class="avatar-btns">
                                    <button class="btn btn-primary" type="submit">
                                        保存修改
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${ctx}/resources/js/jquery-1.9.1.min.js"></script>
<script src="${ctx}/resources/js/bootstrap.min.js"></script>
<script src="${ctx}/resources/js/cropper/cropper.min.js"></script>
<script src="${ctx}/resources/js/userImgMain.js"></script>
</body>
</html>
