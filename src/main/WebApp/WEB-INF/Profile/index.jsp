<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Profile" />
    </jsp:include>
</head>
<body>
<%--    Logged-In Nav-Bar   --%>
<jsp:include page="/WEB-INF/Partials/LoggedNavbar.jsp" />
<br>
<br>
<br>
<br>
<h1> Here are your posts !</h1>

<c:forEach var="post" items="${posts}">
    <c:if test="${post.user_id == sessionScope.user.id}">
    <div class="posts col-md-6">
        <p>${post.user_id}</p>
        <h2>${post.title}</h2>
        <p>${post.content}</p>
        <img src="${post.img}">
    </div>
    </c:if>
</c:forEach>


<p>${sessionScope.user.username}</p>
<p>${sessionScope.user.id}</p>
<p>${sessionScope.user.email}</p>
<p>${sessionScope.user.password}</p>


<jsp:include page="/WEB-INF/Partials/footer.jsp" />
</body>
</html>
