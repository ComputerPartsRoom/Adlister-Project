<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/Partials/head.jsp">
        <jsp:param name="title" value="Messages" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/Partials/NavChecker.jsp"/>

<div id="Received">
    <h2>Received Messages</h2>
<c:forEach var="message" items="${messages}">
    <c:if test="${message.received_user == sessionScope.user.username}">
        <div class="card">
        <p>For Post: ${message.id}</p>
        <p>Sent from: ${message.sent_user}</p>
        <p>Content: ${message.content}</p>
        </div>
    </c:if>
</c:forEach>
</div>
<br>
<div id="Sent">
    <h2>Sent Messages</h2>
    <c:forEach var="message" items="${messages}">
        <c:if test="${message.sent_user == sessionScope.user.username}">
            <div class="card">
            <p>For post: ${message.id}</p>
            <p>Sent to: ${message.received_user}</p>
            <p>Content: ${message.content}</p>
            </div>
        </c:if>
    </c:forEach>
</div>

</body>
</html>
