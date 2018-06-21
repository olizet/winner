<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tymon
  Date: 18.06.18
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href='../resources/css/style.css' />
<scripst src="resouces/js/app.js"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Add analysis</h2>
<c:if test="${empty user}">
    <p>If you want to add analysis, please log in</p>
    <a href="../user/">Register</a>
    <p>If you don't have account, please register</p>
    <a href="../user/login">Log In</a>
</c:if>
<c:if test="${not empty user}">
<form:form modelAttribute="analysis" method="post">
    <form:hidden path="id"/>
    Title: <form:input path="title" required="required"/><form:errors path="title" element="div" cssClass="error" />
    Fixture: <form:input path="fixture" required="required"/><form:errors path="fixture" element="div" cssClass="error" />
    Result: <form:input path="result" required="required"/><form:errors path="result" element="div" cssClass="error" />
    Description: <form:input path="description"/><form:errors path="description" element="div" cssClass="error" />
    <input type="submit">
</form:form>
</c:if>
</body>
</html>
