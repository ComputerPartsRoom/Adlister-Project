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
        <button id="messageReply" data-toggle="modal" data-target="#messageModal${message.id}">Send Reply</button>
        </div>
        <div class="modal fade" id="messageModal${message.id}" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Send Message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    <div class="modal-body">
                        <form action="/messages" method="POST">
                                <%--                            <input hidden id="SendId" name="SendId" value="${post.user_id}">--%>
                            <div class="form-group">
                                <input name="messageId" id="ReplyPostId" value="${message.id}">
                                <input name="sender_id" id="SendingUser" value="${sessionScope.user.username}">
                                <input name="receiver_id" id="ReceivingUser" value="${message.sent_user}">
                                <input name="user_id" id="SenderId" value="${sessionScope.user.id}">
                                <input name="receivedId" id="ReceiverId" value="${message.user_id}">
                                <label for="content">Message</label>
                                <input id="content" name="content" class="form-control" type="text">
                                <br>
                                <button type="submit" class="btn btn-primary">Send</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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
<jsp:include page="/WEB-INF/Partials/footer.jsp"/>
</body>
</html>
