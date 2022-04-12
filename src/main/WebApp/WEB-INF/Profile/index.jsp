<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Profile"/>
    </jsp:include>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

</head>
<body>
<%--    Logged-In Nav-Bar   --%>
<jsp:include page="/WEB-INF/Partials/LoggedNavbar.jsp"/>
<br>
<br>
<br>
<br>
<h1> Here are your posts !</h1>

<c:forEach var="post" items="${posts}">
    <c:if test="${post.user_id == sessionScope.user.id}">
        <div class="posts col-4">
            <p>${post.user_id}</p>
            <h2>${post.title}</h2>
            <p>${post.content}</p>
            <img src="${post.img}">
            <button id="updateBtn" data-toggle="modal" data-target="#myModal${post.id}">Update</button>
            <!-- The Modal -->
            <div id="myModal${post.id}" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <form action="/profile" method="post">
                        <br>
                        <br>
                        <br>
                        <br>
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input id="title" name="title" class="form-control" type="text"
                                   value="${post.title}">
                        </div>
                        <div class="form-group">
                            <label for="content">Content</label>
                            <input id="content" name="content" class="form-control"
                                      value="${post.content}">
                        </div>
                        <div class="form-group">
                            <label for="price">Price</label>
                            <input id="price" name="price" class="form-control" type="text"
                                   value="${post.price}">
                        </div>
                        <div class="form-group">
                            <label for="img">Image URL</label>
                            <input id="img" name="img" class="form-control" type="text" value="${post.img}">
                        </div>


                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="Category" id="Memory" value="1" checked>
                            <label class="form-check-label" for="Memory">
                                Memory
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="Category" id="Peripherals" value="2">
                            <label class="form-check-label" for="Peripherals">
                                Peripherals
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="Category" id="Processors" value="3">
                            <label class="form-check-label" for="Processors">
                                Processors
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="Category" id="Motherboards" value="4">
                            <label class="form-check-label" for="Motherboards">
                                Motherboards
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="Category" id="Graphics-Cards" value="5">
                            <label class="form-check-label" for="Graphics-Cards">
                                Graphics Cards
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="Category" id="Storage" value="6">
                            <label class="form-check-label" for="Storage">
                                Storage
                            </label>
                        </div>

                        <input type="submit" class="btn btn-block btn-primary">

                    </form>
                </div>
            </div>
        </div>
    </c:if>
</c:forEach>


<p>${sessionScope.user.username}</p>
<p>${sessionScope.user.id}</p>
<p>${sessionScope.user.email}</p>
<p>${sessionScope.user.password}</p>



<jsp:include page="/WEB-INF/Partials/footer.jsp"/>
</body>
</html>
