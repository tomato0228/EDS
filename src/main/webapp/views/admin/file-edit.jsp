<%--
  Created by IntelliJ IDEA.
  User: Nero
  Date: 2017/9/18
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>  <script language="javascript">
    window.onunload = function(){
        window.opener.location.reload();
    }
</script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
    <title>file_edit</title>
</head>
<body>
<% int fileid=Integer.parseInt(request.getParameter("fileid"));
%>
<form action="/admin/file_edit"  method="get">
    <input type="hidden" name="fileid" value="<%=fileid%>">
<textarea name="fileAbstrcat" cols="70" rows="8" align="center"></textarea>
    <input type="submit" value="确定">
</form>

</body>
</html>
