<%--
  Created by IntelliJ IDEA.
  User: jonclark
  Date: 4/11/22
  Time: 2:13 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="User Exists" />
    </jsp:include></head>
<body>
<jsp:include page="/WEB-INF/Partials/NotLoggedNavbar.jsp" />
<div class="container">
    <br><br><br><br>
<h1>USER ALREADY EXISTS, PLEASE LOGIN</h1>
<br>
    <a type="link" href="login">
<button class="btn btn-primary">Login</button>
    </a>
</div>
</body>
</html>
