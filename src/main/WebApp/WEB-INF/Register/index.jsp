<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
</head>
<body>
<%--    Not Logged Nav-Bar  --%>
<jsp:include page="/WEB-INF/Partials/NotLoggedNavbar.jsp"/>

<div class="container">
    <h1>Please fill in your information.</h1>
    <form action="/register" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" name="email" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
        </div>
        <div class="form-group">
            <label for="confirm_password">Confirm Password</label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password">
        </div>

        <div id="pickImg">
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
        <input type="submit" class="btn btn-primary btn-block">
    </form>
    <jsp:include page="/WEB-INF/Partials/footer.jsp"/>
</div>

</body>
</html>
