<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Create"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/Partials/NavChecker.jsp"/>


<div class="container" id="CreatePosts">
    <h1>Create a new Ad</h1>
    <form action="/create" method="post">
        <input hidden id="username" value="${sessionScope.user.username}">

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

        <%--    <div class="form-group">--%>
        <%--      <label for="img">Image URL</label>--%>
        <%--      <input id="img" name="img" class="form-control" type="text">--%>
        <%--    </div>--%>

        <%--    <div class="form-group">--%>
        <%--      <label for="inputGroupFile01">Image</label>--%>
        <%--      <div class="custom-file">--%>
        <%--        <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">--%>
        <%--        <label class="custom-file-label" for="inputGroupFile01">Choose file</label>--%>
        <%--      </div>--%>
        <%--    </div>--%>


        <div class="form-check">
            <input class="form-check-input" type="radio" name="Category" id="Memory" value="1" checked>
            <label class="form-check-label cats" for="Memory">
                Memory
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="Category" id="Peripherals" value="2">
            <label class="form-check-label cats" for="Peripherals">
                Peripherals
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="Category" id="Processors" value="3">
            <label class="form-check-label cats" for="Processors">
                Processors
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="Category" id="Motherboards" value="4">
            <label class="form-check-label cats" for="Motherboards">
                Motherboards
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="Category" id="Graphics-Cards" value="5">
            <label class="form-check-label cats" for="Graphics-Cards">
                Graphics Cards
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="Category" id="Storage" value="6">
            <label class="form-check-label cats" for="Storage">
                Storage
            </label>
        </div>

        <div id="createCond">
            <div class="form-check">
                <input class="form-check-input" type="radio" name="condition"
                       value="https://i.postimg.cc/YCTfrX6J/conditions-New.png">
                <img src="https://i.postimg.cc/YCTfrX6J/conditions-New.png">
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="condition"
                       value="https://i.postimg.cc/k4Wd1hs9/conditions-Open.png">
                <img src="https://i.postimg.cc/k4Wd1hs9/conditions-Open.png">
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="condition"
                       value="https://i.postimg.cc/6Qvsq1DR/conditions-Used.png">
                <img src="https://i.postimg.cc/6Qvsq1DR/conditions-Used.png">
            </div>
        </div>


        <input type="submit" class="btn btn-block btn-primary">


    </form>
</div>

<jsp:include page="/WEB-INF/Partials/footer.jsp"/>


</body>
</html>

