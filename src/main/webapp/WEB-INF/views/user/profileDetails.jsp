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
</div>
<div class="row">
<p id="profileMain">Profile: ${user.firstName} ${user.lastName}</p><a id="editButton" href="../user/">Edit profile</a><br/>
</div>
<a id = "addButton" class="btn btn-success" href="../analysis/add">Add analysis</a><br/>

<p class="centerText">Your last 5 Added analyses:</p>
<table class="table"><thead class="thead-dark">
    <tr>
        <th scope="col">Fixture</th>
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
        <td><c:out value="${analysis.result}"/></td>
        <td><c:out value="${analysis.odds}"/></td>
        <td><c:out value="${analysis.rating}"/></td>
        <td><a href = "../analysis/${analysis.id}/">show details</a></td>
    </tr>
</c:forEach>
    </tbody>
</table>

<p class="centerText">Your last 5 comments:</p>
<c:forEach items="${addedComments}" var="comment">
    <p><span class="category"> Title: </span><c:out value="${comment.analysis.title}"/> <span class="category">Fixture: </span><c:out value="${comment.analysis.fixture}"/>
        <span class="category">Rating:</span><c:out value="${comment.rating}"/> </p>
    <p> Text: <c:out value="${comment.text}"/></p
</c:forEach>

</body>
</html>
