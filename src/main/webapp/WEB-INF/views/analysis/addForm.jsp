<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tymon
  Date: 18.06.18
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../fragments/headerLogger.jsp" />
</div>
<h2 id="addAnalysis">Add analysis</h2>

<c:if test="${empty user}">
    <p>If you want to add analysis, please log in</p>
    <a href="../user/">Register</a>
    <p>If you don't have account, please register</p>
    <a href="../user/login">Log In</a>
</c:if>
<c:if test="${not empty user}">
    <div class="form-group">
<form:form modelAttribute="analysis" method="post">
    <form:hidden path="id"/>
    Title: <form:input class="form-control" path="title" required="required"/><form:errors path="title" element="div" cssClass="error" />
    Fixture: <form:input class="form-control" path="fixture" required="required"/><form:errors path="fixture" element="div" cssClass="error" />
    Date: <form:input type="date" class="form-control" path="date" required="required"/><form:errors path="date" element="div" cssClass="error" />
    Odds: <form:input class="form-control" path="odds" required="required"/><form:errors path="odds" element="div" cssClass="error" />
    Result: <form:input class="form-control" path="result" required="required"/><form:errors path="result" element="div" cssClass="error" />
    Description: <form:textarea class="form-control" path="description"/><form:errors path="description" element="div" cssClass="error" />
    <c:if test="${empty analysis.id}">
    <input type="submit" value="add analysis">
    </c:if>
    <c:if test="${not empty analysis.id}">
        <input type="submit" value="edit analysis">
    </c:if>
</form:form>
    </div>
</c:if>
</body>
</html>
