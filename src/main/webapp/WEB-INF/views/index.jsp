<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="fragments/headerLogger.jsp" />
    <h1 id="mainHeader">Winner</h1>
    <h3 id="mainHeader_secondary">Win your dreams!</h3>
<form class="center form-group" method="get" action="/analysis">
    <input class="form-control" type="text" placeholder="Which match are you interested in?" name="search">
    <input class="form-control btn btn-success" type="submit" value="SEARCH FOR THE WIN!">
</form>
    <h3 class="listHeader"> Fresh analyses:</h3>
<div class="analysisList">
    <c:forEach items="${freshAnalyses}" var ="analysis">
       <p class="title"> <c:out value="${analysis.title}"/>
        <p><span class="spanList">Fixture: </span><c:out value="${analysis.fixture}"/> <span class="spanList">Result: </span><c:out value="${analysis.result}"/> </p>
        <p class="inline"> <span class="spanList">Result: </span><c:out value="${analysis.result}"/> <span class="spanList">Odds: </span><c:out value ="${analysis.odds}"/> <c:if test="${not empty analysis.rating}">
            <span class="spanList">Rating: </span><c:out value="${analysis.rating}"/></c:if></p>
        <a class="centerText btn btn-info" href="/analysis/${analysis.id}">show details</a>
        <hr>
    </c:forEach>
</div>
</body>
</html>
