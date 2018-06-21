<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tymon
  Date: 20.06.18
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href='../resources/css/style.css' />
    <scripst src="resouces/js/app.js"/>
</head>
<body>
Profile: ${user.firstName} ${user.lastName}
Added analyses:
<c:forEach items="${addedAnalyses}" var="analysis">
    <c:out value="${analysis.title}"/> <a href = "../analysis/${analysis.id}">show details</a>
    <br/>
</c:forEach>
<a href="../analysis/add">Add analysis</a>
<a href="../user/">Edit profile</a>
Last comments:
<c:forEach items="${addedComments}" var="comment">
    Camping: <c:out value="${comment.analysis.title}"/>
    Text: <c:out value="${comment.text}"/>
    Rating: <c:out value="${rating}"/>
    <br/>
</c:forEach>

</body>
</html>
