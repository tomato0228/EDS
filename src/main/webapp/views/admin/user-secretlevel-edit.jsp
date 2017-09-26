<%--
  Created by IntelliJ IDEA.
  User: Nero
  Date: 2017/9/16
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script language="javascript">
        window.onunload = function(){
            window.opener.location.reload();
        }
    </script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
    <title>user-secretlevel-edit</title>
</head>
<body>

    <% int userid=Integer.parseInt(request.getParameter("userid"));
            int usersecretlevel=Integer.parseInt(request.getParameter("usersecretlevel"));
            if(usersecretlevel==1) {
        %>
    <form action="/admin/user_secretlevel_edit"  method="get">
        请选择：<br /><br />
        <input type="hidden" name="userid" value="<%=userid%>">
        <label ><input name="SecretLevel" type="radio" value="1" disabled="disabled"/>普通 </label>
        <label ><input name="SecretLevel" type="radio" value="2" />内部 </label>
        <label ><input name="SecretLevel" type="radio" value="3" />C </label>
        <label ><input name="SecretLevel" type="radio" value="4" />B </label>
        <label ><input name="SecretLevel" type="radio" value="5" />A </label>
        <br>
        <p><input type="submit" value="确定"/></p>
    </form>
<% }
       else if(usersecretlevel==2){
%>
<form action="/admin/user_secretlevel_edit" method="get">
    请选择：<br /><br />
    <input type="hidden" name="userid" value="<%=userid%>">
    <label ><input name="SecretLevel" type="radio" value="1" />普通 </label>
    <label ><input name="SecretLevel" type="radio" value="2" disabled="disabled" />内部 </label>
    <label ><input name="SecretLevel" type="radio" value="3" />C </label>
    <label ><input name="SecretLevel" type="radio" value="4" />B </label>
    <label ><input name="SecretLevel" type="radio" value="5" />A </label>
    <br>
    <p><input type="submit" value="确定"/></p>
</form>
<% } else if(usersecretlevel==3){
 %>
<form action="/admin/user_secretlevel_edit" method="get">
    请选择：<br /><br />
    <input type="hidden" name="userid" value="<%=userid%>">
    <label ><input name="SecretLevel" type="radio" value="1" />普通 </label>
    <label ><input name="SecretLevel" type="radio" value="2" />内部 </label>
    <label ><input name="SecretLevel" type="radio" value="3" disabled="disabled"/>C </label>
    <label ><input name="SecretLevel" type="radio" value="4" />B </label>
    <label ><input name="SecretLevel" type="radio" value="5" />A </label>
    <br>
    <p><input type="submit" value="确定"/></p>
</form>
<% }else if(usersecretlevel==4){
%>
<form action="/admin/user_secretlevel_edit" method="get">
    请选择：<br /><br />
    <input type="hidden" name="userid" value="<%=userid%>">
    <label ><input name="SecretLevel" type="radio" value="1" />普通 </label>
    <label ><input name="SecretLevel" type="radio" value="2" />内部 </label>
    <label ><input name="SecretLevel" type="radio" value="3" />C </label>
    <label ><input name="SecretLevel" type="radio" value="4" disabled="disabled"/>B </label>
    <label ><input name="SecretLevel" type="radio" value="5" />A </label>
    <br>
    <p><input type="submit" value="确定"/></p>

</form>
<%} else{
    %>
<form action="/admin/user_secretlevel_edit" method="get">
    请选择：<br /><br />
    <input type="hidden" name="userid" value="<%=userid%>">
    <label ><input name="SecretLevel" type="radio" value="1" />普通 </label>
    <label ><input name="SecretLevel" type="radio" value="2" />内部 </label>
    <label ><input name="SecretLevel" type="radio" value="3" />C </label>
    <label ><input name="SecretLevel" type="radio" value="4" />B </label>
    <label ><input name="SecretLevel" type="radio" value="5" disabled="disabled"/>A </label>
    <br>
    <p><input type="submit" value="确定"/></p>

</form>
<% } %>

</body>
</html>
