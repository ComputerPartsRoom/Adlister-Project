<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Home" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/Partials/NotLoggedNavbar.jsp" />
<br>
<br>
<br>
<br>
<p>${sessionScope.user.username}</p>
<p>${sessionScope.user.id}</p>
<p>${sessionScope.user.email}</p>
<p>${sessionScope.user.password}</p>
<jsp:include page="/WEB-INF/Partials/footer.jsp" />



</body>
</html>
