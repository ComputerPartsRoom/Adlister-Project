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

<%--<input hidden id="user_id" value="${user.id}">--%>
<%--<c:forEach var="message" items="${messages}">--%>
<%--    <c:if test="${message.received_id == sessionScope.user.id}">--%>
<%--    <p>${message.sent_id}</p>--%>
<%--    <p>${message.received_id}</p>--%>
<%--    <p>${message.content}</p>--%>
<%--    </c:if>--%>
<%--</c:forEach>--%>


<div id="profileView">


    <ul id="profileLeft" class="nav flex-column">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle DropFontUp" data-toggle="dropdown" href="#" role="button" aria-expanded="false">Options</a>
            <div class="dropdown-menu">
                <%--                <a class="dropdown-item" href="#" id="showPosts">My Posts</a>--%>
                <a class="dropdown-item" href="/create" id="create">Create Post</a>
                <a class="dropdown-item" href="/messages" id="messages">Messages</a>

                <div class="dropdown-divider"></div>
                <a class="dropdown-item" data-toggle="modal" href="#" data-target="#exampleModal">Edit My Profile</a>
            </div>
        </li>
    </ul>

    <div id="profileRight">

        <h1>- Your posts are shown below! -</h1>
        <br>

        <div class="row">
            <c:forEach var="post" items="${posts}">
                <c:if test="${post.user_id == sessionScope.user.id}">
                    <div class="posts col-10 ProfPosts">
                        <br>
                        <p>Post # ${post.id}</p>
                        <hr>
                        <p>Title: ${post.title}</p>
                        <hr>
                        <p>Content: ${post.content}</p>
                        <hr>
                        <p>Category: ${post.name}</p>
                        <hr>
                        <p>$${post.price}</p>
                        <hr>
                        <img src="${post.img}">
                        <br>
                        <button id="updateBtn" data-toggle="modal" data-target="#myModal${post.id}">Update</button>
                        <!-- The Modal -->

                        <div class="modal fade" id="myModal${post.id}" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalLabel1"
                             aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel1">Update Post</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>

                                    </div>
                                    <div class="modal-body">
                                        <form action="/profile" method="post">
                                            <input hidden id="Userid" name="Userid" value="${post.user_id}">
                                            <input hidden id="id" name="id" value="${post.id}">
                                            <input hidden id="Postusername" value="${post.username}">
                                            <input hidden name="sender_id" id="sender_id"
                                                   value="${sessionScope.user.username}">
                                            <input hidden name="receiver_id" id="receiver_id" value="${post.username}">


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


                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="category"
                                                       id="Memory"
                                                       value="1" checked>
                                                <label class="form-check-label" for="Memory">
                                                    Memory
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="category"
                                                       id="Peripherals"
                                                       value="2">
                                                <label class="form-check-label" for="Peripherals">
                                                    Peripherals
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="category"
                                                       id="Processors"
                                                       value="3">
                                                <label class="form-check-label" for="Processors">
                                                    Processors
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="category"
                                                       id="Motherboards"
                                                       value="4">
                                                <label class="form-check-label" for="Motherboards">
                                                    Motherboards
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="category"
                                                       id="Graphics-Cards"
                                                       value="5">
                                                <label class="form-check-label" for="Graphics-Cards">
                                                    Graphics Cards
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="category"
                                                       id="Storage"
                                                       value="6">
                                                <label class="form-check-label" for="Storage">
                                                    Storage
                                                </label>
                                            </div>
                                            <div id="updateCond">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="img"
                                                           value="https://i.postimg.cc/YCTfrX6J/conditions-New.png">
                                                    <img src="https://i.postimg.cc/YCTfrX6J/conditions-New.png">
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="img"
                                                           value="https://i.postimg.cc/k4Wd1hs9/conditions-Open.png">
                                                    <img src="https://i.postimg.cc/k4Wd1hs9/conditions-Open.png">
                                                </div>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="img"
                                                           value="https://i.postimg.cc/6Qvsq1DR/conditions-Used.png">
                                                    <img src="https://i.postimg.cc/6Qvsq1DR/conditions-Used.png">
                                                </div>
                                            </div>
                                            <input type="submit" class="btn btn-block btn-primary"
                                                   name="updateOrDelete"
                                                   value="updatePost">
                                            <button type="submit" class="btn btn-danger" name="updateOrDelete"
                                                    value="delete">
                                                Delete
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>


<!-- Update user Modal -->
<div class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
                    <div id="pickImgUpdate">
                        <div class="form-check ModImgs">
                            <img src="https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-with-a-crown-placeholder-vector-38978682.jpg">
                            <input class="form-check-input" type="radio" name="img"
                                   value="https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-with-a-crown-placeholder-vector-38978682.jpg">
                        </div>
                        <div class="form-check ModImgs">
                            <img src="https://cdn4.vectorstock.com/i/thumb-large/86/33/profile-picture-with-a-mustache-placeholder-vector-38978633.jpg">
                            <input class="form-check-input" type="radio" name="img"
                                   value="https://cdn4.vectorstock.com/i/thumb-large/86/33/profile-picture-with-a-mustache-placeholder-vector-38978633.jpg">
                        </div>
                        <div class="form-check ModImgs">
                            <img src="https://cdn5.vectorstock.com/i/thumb-large/84/89/profile-picture-placeholder-vector-38978489.jpg">
                            <input class="form-check-input" type="radio" name="img"
                                   value="https://cdn5.vectorstock.com/i/thumb-large/84/89/profile-picture-placeholder-vector-38978489.jpg">
                        </div>
                    </div>
                    <div id="profModalButtons">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="updateOrDelete" value="updateProfile">Save
                            changes
                        </button>
                        <button type="submit" class="btn btn-danger" name="updateOrDelete" value="deleteProfile">Delete
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/Partials/footer.jsp"/>

<div id='stars'></div>
<div id='stars2'></div>

</body>
</html>
