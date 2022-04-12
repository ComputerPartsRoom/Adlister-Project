<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Profile"/>
    </jsp:include>
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
            <button id="updateBtn">Update</button>
            <!-- The Modal -->
            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <form action="/profile" method="post">
                        <br>
                        <br>
                        <br>
                        <br>
                        <div class="form-group">
                            <label for="title">Title</label>
                            <input id="title" name="title" class="form-control" type="text"
                                   placeholder="${post.title}">
                        </div>
                        <div class="form-group">
                            <label for="content">Content</label>
                            <textarea id="content" name="content" class="form-control"
                                      placeholder="${post.content}"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="price">Price</label>
                            <input id="price" name="price" class="form-control" type="text"
                                   placeholder="${post.price}">
                        </div>
                        <div class="form-group">
                            <label for="img">Image URL</label>
                            <input id="img" name="img" class="form-control" type="text" placeholder="${post.img}">
                        </div>
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

<script>
    // Get the modal
    let modal = document.getElementById("myModal");

    // Get the button that opens the modal
    let btn = document.getElementById("updateBtn");

    // Get the <span> element that closes the modal
    let span = document.getElementsByClassName("close")[0];

    // When the user clicks on the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>


<jsp:include page="/WEB-INF/Partials/footer.jsp"/>
</body>
</html>
