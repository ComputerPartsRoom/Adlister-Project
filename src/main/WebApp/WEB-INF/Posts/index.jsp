<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Posts" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/Partials/navbar.jsp" />

<div class="container">
    <h1>Current parts for sale!</h1>

    <c:forEach var="post" items="${posts}">
        <div class="col-md-6">
            <h2>${post.title}</h2>
            <p>${post.content}</p>
        </div>
    </c:forEach>

</div>



</body>
</html>
