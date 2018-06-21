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
    <jsp:include page="header.jsp"></jsp:include>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-4">
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/">Home</a>
        </div>
        <div class="col-8">
<c:if test="${empty user}">
    <a id="registerButton" href="../user/" class="btn btn-primary">Register</a>
<form id="loggerForm" method="post" action="../user/login">
    <input placeholder="email" type="text" name="email"/>
    <input placeholder="password" type="password" name="password"/>
    <input class="btn btn-primary" type="submit" value="Log In">
</form>
        </div>
    </div>
</c:if>
<c:if test="${not empty user}">
    <div class="logged">
    <p id="userNameP">${user.firstName} ${user.lastName}</p>
    <a id="profileButton" class="btn btn-primary" href="../../user/details">Profile</a>
    <a id="logOutButton" class="btn btn-warning" href="../../user/logout">Log out</a>
    </div>
</c:if>
</div>

