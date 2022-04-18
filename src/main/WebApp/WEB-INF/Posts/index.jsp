<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Posts"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/Partials/NavChecker.jsp"/>


<div class="container">

    <h1>Current parts for sale!</h1>


    <form action="/posts/sort" method="post">
        <label for="sortBy">Sort by: </label>
        <select id="sortBy" class="form-select" aria-label="Default select example" name="sort">
            <option name="category" value="1">Memory</option>
            <option name="category" value="2">Peripherals</option>
            <option name="category" value="3">Processors</option>
            <option name="category" value="4">Motherboards</option>
            <option name="category" value="5">Graphics Cards</option>
            <option name="category" value="6">Storage</option>
        </select>
        <button type="submit" class="btn btn-primary">Go!</button>
    </form>

    <form action="/posts/search" method="post">
        <input type="text" name="search">
        <button class="btn btn-primary" type="submit">Search</button>
    </form>

    <%--    Generate content for each Post  --%>
    <c:forEach var="post" items="${posts}">
        <div class="posts col-4">
            <p>Posted by: ${post.username}</p>
            <p>Title: ${post.title}</p>
            <p>Content: ${post.content}</p>
            <p>Category: ${post.name}</p>
            <p>$${post.price}</p>
            <div id="postPic">
                <c:choose>
                    <c:when test="${post.name}">
                        <img src="">
                    </c:when>
                    <c:when test="${post.name}">
                        <img src="">
                    </c:when>
                    <c:when test="${post.name}">
                        <img src="">
                    </c:when>
                    <c:when test="${post.name}">
                        <img src="">
                    </c:when>
                    <c:when test="${post.name}">
                        <img src="">
                    </c:when>
                    <c:when test="${post.name}">
                        <img src="">
                    </c:when>
                </c:choose>
            </div>


            <c:choose>
                <c:when test="${sessionScope.user == null}">
                    <button hidden id="message" data-toggle="modal" data-target="#messageModal${post.id}">Message
                    </button>
                </c:when>
                <c:when test="${post.user_id != sessionScope.user.id}">
                    <button id="message" data-toggle="modal" data-target="#messageModal${post.id}">Message</button>
                </c:when>
            </c:choose>
        </div>
        <div class="modal fade" id="messageModal${post.id}" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Send Message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    <div class="modal-body">
                        <form action="/posts" method="POST">
                                <%--                            <input hidden id="SendId" name="SendId" value="${post.user_id}">--%>
                            <div class="form-group">
                                <input hidden name="postId" id="postId" value="${post.id}">
                                <input hidden name="sender_id" id="sender_id" value="${sessionScope.user.username}">
                                <input hidden name="receiver_id" id="receiver_id" value="${post.username}">
                                <label for="content">Message</label>
                                <input id="content" name="content" class="form-control" type="text">
                                <button type="submit" class="btn btn-primary">Send</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </c:forEach>


</div>

<jsp:include page="/WEB-INF/Partials/footer.jsp"/>


</body>
</html>
