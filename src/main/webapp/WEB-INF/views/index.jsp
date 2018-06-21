<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="fragments/headerLogger.jsp" />
<link rel="stylesheet" href='resources/css/style.css' />
<scripst src="resouces/js/app.js"/>
<form method="get" action="/analysis">
    <input type="text" placeholder="Which match are you interested in?" name="search">
    <input type="submit" value="search">
    <h3>Fresh analyses</h3>
    <c:forEach items="${freshAnalyses}" var ="analysis">
        <c:out value="${analysis.title}"/>
        <c:out value="${analysis.result}"/>
        <c:out value ="${analysis.owner}"/>
    </c:forEach>
</form>
</body>
</html>
