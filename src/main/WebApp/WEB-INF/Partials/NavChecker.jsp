<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${sessionScope.user.username == null}">
        <jsp:include page="/WEB-INF/Partials/NotLoggedNavbar.jsp" />
    </c:when>
    <c:otherwise>
        <jsp:include page="/WEB-INF/Partials/LoggedNavbar.jsp" />
    </c:otherwise>
</c:choose>