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
<c:if test="${empty analyses}">
    <h3 class="listHeader">Sorry, no analyses for your match. Come on do your own!</h3>
</c:if>
<c:if test="${not empty analyses}">
<h3 class="listHeader">List of Analyses</h3>
<c:forEach items="${analyses}" var ="analysis">
    <p class="title"> <c:out value="${analysis.title}"/>
    <p><span class="spanList">Fixture: </span><c:out value="${analysis.fixture}"/> <span class="spanList"> Date: </span><c:out value="${analysis.date}"/></p>
    <p><span class="spanList">Result: </span><c:out value="${analysis.result}"/> </p>
    <p class="inline"> <span class="spanList">Result: </span><c:out value="${analysis.result}"/> <span class="spanList">Odds: </span><c:out value ="${analysis.odds}"/>
        <c:if test="${not empty analysis.rating}"><span class="spanList">Rating: </span><c:out value="${analysis.rating}"/></c:if></p>
    <a class="centerText btn btn-info" href="/analysis/${analysis.id}">show details</a>
    <hr>
</c:forEach>
</c:if>
</body>
</html>
