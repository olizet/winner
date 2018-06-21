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
    <c:out value="${analysis.owner.firstName}"/>
    <c:out value="${analysis.result}"/>
    <c:out value="${analysis.rating}"/>
    <c:out value="${analysis.description}"/>
<c:if test="${user.id == analysis.owner.id}">
    <a href="../add?id=${analysis.id}">Edit analysis</a>
    <a href="../delete?id=${analysis.id}">Delete analysis</a>
</c:if>
<c:if test="${not empty user}">
    <p>Add comment</p>
    <form:form modelAttribute="comment" method="post" action="../../analysis/${analysis.id}/addComment">
        <form:hidden path="id"/>
        Text: <form:input path="text" required="required"/><form:errors path="text" element="div" cssClass="error" />
        Rating: <form:select path="rating">
        <form:option value="0" label="0"/>
        <form:option value="0.5" label="0.5"/>
        <form:option value="1" label="1"/>
        <form:option value="1.5" label="1.5"/>
        <form:option value="2" label="2"/>
        <form:option value="2.5" label="2.5"/>
        <form:option value="3" label="3"/>
        <form:option value="3.5" label="3.5"/>
        <form:option value="4" label="4"/>
        <form:option value="4.5" label="4.5"/>
        <form:option value="5" label="5"/>
    </form:select>
        <input type="submit" value="Add comment"><br/>
    </form:form>
</c:if>
<c:if test = "${empty user}">
    <p>If you want to add a coment please login</p>
</c:if>

<p>Comments:</p><br/>
<c:forEach items="${commentsByAnalysis}" var ="comment">
    <c:out value="${comment.user.firstName}"/><br/>
    <c:out value="${comment.text}"/><br/>
    <c:out value="${comment.rating}"/><br/>
    <c:if test="${user.id == comment.user.id}">
        <a href="${pageContext.request.contextPath}/analysis/${analysis.id}?commentId=${comment.id}">Edit Comment</a>
        <a href="${pageContext.request.contextPath}/analysis/${analysis.id}/delete?commentId=${comment.id}">Delete Comment</a>
    </c:if>
</c:forEach>

</body>
</html>