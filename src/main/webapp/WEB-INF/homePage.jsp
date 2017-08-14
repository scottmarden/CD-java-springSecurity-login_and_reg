<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
</head>
<body>
	<div class="header">
	    <form id="logoutForm" method="POST" action="/logout">
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        <input type="submit" value="Logout!" />
	    </form>
		<h1>Welcome <c:out value="${currentUser.firstName}"></c:out></h1>
		<c:if test="${adminFlag != null}" >
			<a href="/admin">Admin Dashboard</a>
		</c:if>    
	</div>

    

    
    <p>First Name: <c:out value="${currentUser.firstName}" /></p>
    <p>Last Name: <c:out value="${currentUser.lastName}" /></p>
    <p>Email: <c:out value="${currentUser.username}" /></p>
    <p>Sign up Date: <fmt:formatDate type = "date" value = "${currentUser.createdAt}" /></p>
    <p>Last sign in: <fmt:formatDate type = "date" value = "${currentUser.lastSignIn}" /></p>
    
</body>
</html>