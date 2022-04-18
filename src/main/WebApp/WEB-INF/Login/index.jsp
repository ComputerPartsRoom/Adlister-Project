<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body id="LoginBody">
    <jsp:include page="/WEB-INF/Partials/NotLoggedNavbar.jsp"/>

    <div class="container" id="LogInBox">
        <h1>Please Log In</h1>
        <form action="/login" method="POST">
            <div class="form-group">

                <input id="username" name="username" class="form-control" type="text" >
                <label for="username">^ Username ^</label>
            </div>
            <div class="form-group">

                <input id="password" name="password" class="form-control" type="password">
                <label for="password">^ Password ^</label>
            </div>
            <input type="submit" class="btn btn-primary btn-block" value="Log In">
        </form>
    </div>



<jsp:include page="/WEB-INF/Partials/footer.jsp"/>
<%--    <div id='stars'></div>--%>
<%--    <div id='stars2'></div>--%>


</body>
</html>
