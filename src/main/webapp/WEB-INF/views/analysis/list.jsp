<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tymon
  Date: 18.06.18
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../fragments/headerLogger.jsp" />
</div>
<h3>List of Analyses</h3>
<c:forEach items="${analyses}" var ="analysis">
    <p class="title"> <c:out value="${analysis.title}"/></p>
    <p class="normal"><span class="category">Fixture: </span><c:out value="${analysis.fixture}"/> <span class="category">Result: </span><c:out value="${analysis.result}"/> </p>
    <p class="normal"><span class="category">Odds: </span><c:out value ="${analysis.odds}"/> <c:if test="${not empty analysis.rating}">Rating: <c:out value="${analysis.rating}"/></c:if></p>
    <a class="center btn btn-info" href="/analysis/${analysis.id}">show details</a>
    <hr>
</c:forEach>
</body>
</html>
