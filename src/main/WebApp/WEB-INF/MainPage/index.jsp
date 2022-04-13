<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Home" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/Partials/NavChecker.jsp"/>

<h1>Landing Page</h1>

<div class="row">
    <div class="col-sm-6">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">View Current Posts</h5>
                <p class="card-text">View current sellers item for sell</p>
                <c:choose>
                    <c:when test="${sessionScope.user == null}">
                        <a href="/login" class="btn btn-primary">View Posts</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/posts" class="btn btn-primary">View Posts</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">About Us</h5>
                <p class="card-text">About the Team</p>
                <a href="#" class="btn btn-primary">Meet Team</a>
            </div>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/Partials/footer.jsp" />



</body>
</html>
