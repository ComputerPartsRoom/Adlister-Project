<h1> Here are your posts !</h1>

<c:forEach var="post" items="${posts}">
    <c:if test="${post.user_id == sessionScope.user.id}">
        <div class="posts col-4">
            <p>${post.id}</p>
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
                        <input id="Userid" name="Userid" value="${post.user_id}">
                        <input id="id" name="id" value="${post.id}">

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
                            <input class="form-check-input" type="radio" name="category" id="Memory" value="1" checked>
                            <label class="form-check-label" for="Memory">
                                Memory
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="category" id="Peripherals" value="2">
                            <label class="form-check-label" for="Peripherals">
                                Peripherals
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="category" id="Processors" value="3">
                            <label class="form-check-label" for="Processors">
                                Processors
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="category" id="Motherboards" value="4">
                            <label class="form-check-label" for="Motherboards">
                                Motherboards
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="category" id="Graphics-Cards" value="5">
                            <label class="form-check-label" for="Graphics-Cards">
                                Graphics Cards
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="category" id="Storage" value="6">
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