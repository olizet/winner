<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: tymon
  Date: 19.06.18
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href='resources/css/style.css' />
<scripst src="resouces/js/app.js"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>Add comment</h3>
<form:form modelAttribute="comment" method="post">
   Text: <form:input path="text" required="required"/><form:errors path="text" element="div" cssClass="error" />
   Rating: <form:select path="rating">
        <form:options items="${ratings}"/>
        </form:select>
    <input type="submit" value="Add comment"><br/>
</form:form>
</body>
</html>
