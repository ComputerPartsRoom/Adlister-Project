<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Profile"/>
    </jsp:include>

</head>
<body>

<jsp:include page="/WEB-INF/Partials/NavChecker.jsp"/>


<div id="profileView">


    <div id="profileLeft">
        <a href="#" id="showPosts">My Posts</a>
        <a href="/create" id="create">Create Post</a>
        <a href="#" id="messages">Messages</a>

        <a data-toggle="modal" data-target="#exampleModal">Edit My Profile</a>
    </div>



    <div id="profileRight">
        <h1> Here are your posts !</h1>

        <div class="row">
            <c:forEach var="post" items="${posts}">
                <c:if test="${post.user_id == sessionScope.user.id}">
                    <div class="posts col-md-6">
                        <h2>Title: ${post.title}</h2>
                        <p>Content: ${post.content}</p>

                        <form action="/profile" method="post">
                            <input name="catId" id="catId" value="${post.cat_id}">
                            <p>Cat: ${category.name}</p>
                            <button type="submit">Submit</button>
                        </form>

<%--                        <c:forEach var="category" items="${categories}">--%>
<%--                            <p>Category: ${category.name}</p>--%>
<%--                        </c:forEach>--%>


<%--                        <p>Cat Name: ${category.name}</p>--%>
<%--                        <p>Cat_id: ${post.cat_id}</p>--%>
<%--                        <p>Category: ${post.cat_id.name}</p>--%>



                        <p>$${post.price}</p>
                        <img src="${post.img}">
                        <button id="updateBtn" data-toggle="modal" data-target="#myModal${post.id}">Update</button>
                        <!-- The Modal -->
                        <div id="myModal${post.id}" class="modal fade" role="dialog" tabindex="-1">

                            <!-- Modal content -->
                            <div class="modal-content">--%>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>

                                <form action="/profile" method="post">
                                    <input hidden id="Userid" name="Userid" value="${post.user_id}">
                                    <input hidden id="id" name="id" value="${post.id}">
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
                                        <input class="form-check-input" type="radio" name="category" id="Memory"
                                               value="1" checked>
                                        <label class="form-check-label" for="Memory">
                                            Memory
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="category" id="Peripherals"
                                               value="2">
                                        <label class="form-check-label" for="Peripherals">
                                            Peripherals
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="category" id="Processors"
                                               value="3">
                                        <label class="form-check-label" for="Processors">
                                            Processors
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="category" id="Motherboards"
                                               value="4">
                                        <label class="form-check-label" for="Motherboards">
                                            Motherboards
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="category" id="Graphics-Cards"
                                               value="5">
                                        <label class="form-check-label" for="Graphics-Cards">
                                            Graphics Cards
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="category" id="Storage"
                                               value="6">
                                        <label class="form-check-label" for="Storage">
                                            Storage
                                        </label>
                                    </div>

                                    <input type="submit" class="btn btn-block btn-primary" name="updateOrDelete"
                                           value="updatePost">
                                    <button type="submit" class="btn btn-danger" name="updateOrDelete" value="delete">
                                        Delete
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>


<!-- Update user Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Update Profile</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <div class="modal-body">
                <form action="/profile" method="POST">
                    <input hidden id="EditId" name="EditId" value="${user.id}">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input id="username" name="username" class="form-control" type="text" value="${user.username}">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input id="email" name="email" class="form-control" type="text" value="${user.email}">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" name="password" class="form-control" type="password">
                    </div>
                    <div class="form-group">
                        <label for="confirm-password">Confirm-Password</label>
                        <input id="confirm-password" name="confirm-password" class="form-control" type="password">
                    </div>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" name="updateOrDelete" value="updateProfile">Save
                        changes
                    </button>
                    <button type="submit" class="btn btn-danger" name="updateOrDelete" value="deleteProfile">Delete
                    </button>
                </form>
            </div>


        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/Partials/footer.jsp"/>
</body>
</html>
