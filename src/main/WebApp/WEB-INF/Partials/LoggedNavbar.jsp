<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar " id="LoggedNav">
    <div id="LoggedLeft">
        <a class="navbar-brand" href="/main">Computer-Parts-Room</a>
    </div>
    <div id="LoggedRight">
        <div id="profImg">
        <img src="${sessionScope.user.img}">
        <a href="/profile"><h5>${sessionScope.user.username}</h5></a>
        </div>
        <a class="link" href="logout">Logout</a>
    </div>
</nav>
