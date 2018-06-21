<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="fragments/headerLogger.jsp" />
<link rel="stylesheet" href='resources/css/style.css' />
<scripst src="resouces/js/app.js"/>
<form method="get" action="/analysis">
    <input type="text" placeholder="Which match are you interested in?" name="search">
    <input type="submit" value="search">
</form>
</body>
</html>
