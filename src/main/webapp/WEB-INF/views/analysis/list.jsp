<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tymon
  Date: 18.06.18
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href='resources/css/style.css' />
<scripst src="resouces/js/app.js"/>
<jsp:include page="../fragments/headerLogger.jsp" />
<h3>List of Analyses</h3>
<c:forEach items="${analyses}" var="analysis">
    <c:out value="${analysis.title}"/> Rating: <c:out value="${analysis.rating}"/>
    <a href = "analysis/${analysis.id}">show details</a>
    <br/>
</c:forEach>
</body>
</html>
