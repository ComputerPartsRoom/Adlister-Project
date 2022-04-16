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
    <c:if test="${message.received_id == sessionScope.user.id}">
        <p>Sender Id: ${message.sent_id}</p>
        <p>Receiver Id: ${message.received_id}</p>
        <p>Content: ${message.content}</p>
    </c:if>
</c:forEach>
</div>

<div id="Sent">
    <h2>Sent Messages</h2>
    <c:forEach var="message" items="${messages}">
        <c:if test="${message.sent_id == sessionScope.user.id}">
            <p>Sender Id: ${message.sent_id}</p>
            <p>Receiver Id: ${message.received_id}</p>
            <p>Content: ${message.content}</p>
        </c:if>
    </c:forEach>
</div>

</body>
</html>
