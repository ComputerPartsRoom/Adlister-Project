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



<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/create" method="post">
        <br>
        <br>
        <br>
        <br>
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="content">Content</label>
            <textarea id="content" name="content" class="form-control" type="text"></textarea>
        </div>
        <div class="form-group">
            <label for="price">Price</label>
            <input id="price" name="price" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="img">Image URL</label>
            <input id="img" name="img" class="form-control" type="text">
        </div>
<%--        <div class="form-group">--%>
<%--            <label for="cat_id">Cat ID</label>--%>
<%--            <input id="cat_id" name="cat_id" class="form-control" type="text">--%>
<%--        </div>--%>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>

<c:forEach var="post" items="${posts}">
    <c:if test="${post.user_id == sessionScope.user.id}">
    <div class="col-md-6">
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
