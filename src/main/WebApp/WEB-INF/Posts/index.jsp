<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Posts" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/Partials/NavChecker.jsp"/>


<div class="container">

    <h1>Current parts for sale!</h1>



    <form action="/posts/sort" method="post">
    <label for="sortBy">Sort by: </label>
    <select  id="sortBy" class="form-select" aria-label="Default select example" name="sort">
        <option name="category" value="1">Memory</option>
        <option name="category" value="2">Peripherals</option>
        <option name="category" value="3">Processors</option>
        <option name="category" value="4">Motherboards</option>
        <option name="category" value="5">Graphics Cards</option>
        <option name="category" value="6">Storage</option>
    </select>
        <button type="submit" class="btn btn-primary">Go!</button>
    </form>

    <form action="/posts/search" method="post" >
    <input type="text" name ="search">
        <button class = "btn btn-primary" type="submit">Search</button>
    </form>

<%--    Generate content for each Post  --%>
    <c:forEach var="post" items="${posts}">
        <div class="posts col-4">
            <p>${post.user_id}</p>
            <h2>${post.title}</h2>
            <p>${post.content}</p>
            <img src="${post.img}">
        </div>
    </c:forEach>

</div>

<jsp:include page="/WEB-INF/Partials/footer.jsp" />


</body>
</html>
