<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Posts" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/Partials/LoggedNavbar.jsp" />
<div class="container">
    <br>
    <br>
    <br>
    <br>
    <h1>Current parts for sale!</h1>


    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Dropdown button
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something else here</a>
        </div>
    </div>
    <form action="/posts" method="post">
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

    <form action="/posts" method="post" >
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



<p>${sessionScope.user.username}</p>
<p>${sessionScope.user.id}</p>
<p>${sessionScope.user.email}</p>
<p>${sessionScope.user.password}</p>


<jsp:include page="/WEB-INF/Partials/footer.jsp" />


</body>
</html>
