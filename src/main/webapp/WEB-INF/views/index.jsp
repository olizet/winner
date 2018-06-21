<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="fragments/headerLogger.jsp" />
<jsp:include page="fragments/header.jsp" />
<div class="container">
    <h1 id="main">Winner</h1>
    <h3 id="main_secondary">Win your dreams!</h3>
<form class="form-group" method="get" action="/analysis">
    <div class="center col-7">
    <input class="form-control" type="text" placeholder="Which match are you interested in?" name="search">
    </div>
    <div class="center col-4">
    <input class="form-control btn btn-success" type="submit" value="SEARCH FOR THE WIN!">
    </div>
</form>
    <h3 id="fresh" class="normal">Fresh meat:</h3>
    <c:forEach items="${freshAnalyses}" var ="analysis">
       <p class="title"> <c:out value="${analysis.title}"/></p>
        <p class="normal">Fixture: <c:out value="${analysis.fixture}"/> Result: <c:out value="${analysis.result}"/> </p>
        <p class="normal">Odds: <c:out value ="${analysis.odds}"/> <c:if test="${not empty analysis.rating}">Rating: <c:out value="${analysis.rating}"/></c:if></p>
        <a class="center btn btn-info" href="/analysis/${analysis.id}">show details</a>
        <hr>
    </c:forEach>
</div>
</body>
</html>
