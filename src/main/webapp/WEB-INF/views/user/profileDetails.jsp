<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tymon
  Date: 20.06.18
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../fragments/headerLogger.jsp" />

<p id="profileMain">Profile: ${user.firstName} ${user.lastName}</p><a href="../user/"> Edit profile</a>
<a id = "addButton" class="btn btn-success" href="../analysis/add">Add analysis</a>

<p class="detailsAnalysisTitle">Your last 10 analyses:</p>
<table class="table"><thead class="thead-dark">
    <tr>
        <th scope="col">Fixture</th>
        <th scope="col">Date</th>
        <th scope="col">Result</th>
        <th scope="col">Odds</th>
        <th scope="col">Rating</th>
        <th scope="col">Details</th>
    </tr>
</thead>
    <tbody>
<c:forEach items="${addedAnalyses}" var="analysis">
    <tr>
    <td><c:out value="${analysis.fixture}"/></td>
        <td><c:out value=""/></td>
        <td><c:out value="${analysis.result}"/></td>
        <td><c:out value="${analysis.odds}"/></td>
        <td><c:out value="${analysis.rating}"/></td>
        <td><a href = "../analysis/${analysis.id}/">show details</a></td>
    </tr>
</c:forEach>
    </tbody>
</table>

<p class="detailsAnalysisTitle">Your last 10 comments:</p>
<c:forEach items="${addedComments}" var="comment">
    <p><a class="spanList" href="/analysis/${comment.analysis.id}"><span class="spanList"> Title: </span><c:out value="${comment.analysis.title}"/> </a>
        <span class="spanList">Rating: </span><c:out value="${comment.rating}"/> </p>
    <p><span class="spanList">Fixture: </span><c:out value="${comment.analysis.fixture}"/><span class="spanList"> Date: </span><c:out value=""/></p>
    <p> <span class="spanList">Text: </span>: <c:out value="${comment.text}"/></p
        <hr>
</c:forEach>
</body>
</html>
