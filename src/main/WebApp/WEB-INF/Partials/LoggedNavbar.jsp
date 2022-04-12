<nav class="navbar fixed-top navbar-light bg-light" id="LoggedNav">
    <div class="container-fluid">
        <%--    Takes back to main page    --%>
        <a class="navbar-brand" href="/posts">ComputerPartsRoom</a>
            <a href="/create">Create</a>
            <a href="/profile">Profile</a>
        <div id="navLinks">
            <%--      Shows username/profPhoto of logged in user --%>
            <h3>${sessionScope.user.username}</h3>
            <img src="../Styling/Assets/PlaceHolder.jpeg">
                <a class="link" href="logout">Logout</a>
        </div>
    </div>
</nav>

