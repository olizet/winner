<%--
  Created by IntelliJ IDEA.
  User: tymon
  Date: 17.06.18
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="../resources/css/style.css" rel="stylesheet" type="text/css" >
</head>
<body>
<jsp:include page="../fragments/header.jsp" />
<h2>Add user</h2>
<form:form modelAttribute="user" method="post">
    <form:hidden path="id"/>
    First Name: <form:input path="firstName" class="form-control" required="required"/><form:errors path="firstName" element="div" cssClass="error" />
    Last Name: <form:input path="lastName" class="form-control" required="required"/><form:errors path="lastName" element="div" cssClass="error" />
    E-Mail: <form:input path="email" class="form-control" required="required"/><form:errors path="email" element="div" cssClass="error" />
    Password <form:password path="password" class="form-control" required="required"/><form:errors path="password" element="div" cssClass="error" />
    <input type="submit" value="Register">
</form:form>
</body>
</html>
