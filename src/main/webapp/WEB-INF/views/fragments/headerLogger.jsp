<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tymon
  Date: 20.06.18
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${empty user}">
    <a href="../user/">Register</a>
<form method="post" action="../user/login">
    <input type="text" name="email"/>
    <input type="password" name="password"/>
    <input type="submit" value="Log In">
</form>
</c:if>
<c:if test="${not empty user}">
    <h3>Welcome ${user.firstName} ${user.lastName}</h3>
    <a href="../user/details">Profile</a>
    <a href="../user/logout">Log out</a>
</c:if>

