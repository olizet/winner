<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: tymon
  Date: 19.06.18
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href='../resources/css/style.css' />
<scripst src="resouces/js/app.js"/>
<jsp:include page="../fragments/headerLogger.jsp" />
<h3>${analysis.title}</h3>
    <c:out value="${analysis.fixture}"/>
    <c:out value="${analysis.owner}"/>
    <c:out value="${analysis.result}"/>
    <c:out value="${analysis.rating}"/>
    <c:out value="${analysis.description}"/>
<c:if test="${user.id == analysis.owner.id}">
    <a href="add?id=${analysis.id}">Edit analysis</a>
    <a href="delete?id=${analysis.id}">Delete analysis</a>
</c:if>
<c:if test="${not empty user}">
    <a href="/analysis/${analysis.id}/addComment">Add Comment or Rate</a>
</c:if>
<c:if test = "${empty user}">
    <a href="">Please login to rate and add comment</a>
</c:if>


<p>Comments:</p><br/>
<c:forEach items="${commentsByAnalysis}" var ="comment">
    <c:out value="${comment.user.firstName}"/><br/>
    <c:out value="${comment.text}"/><br/>
    <c:out value="${comment.rating}"/><br/>
    <c:if test="${user.id == comment.user.id}">
        <a href>Edit Comment</a>
        <a href>Delete Comment</a>
    </c:if>
</c:forEach>

</body>
</html>