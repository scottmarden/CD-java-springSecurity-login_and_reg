<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Page</title>
</head>
<body>
    <div class="header">
    <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
    </form>
    <h1>Admin Dashboard </h1>
    <a href="/home">Home</a>
    <h2>Current Admin: <c:out value="${currentUser.firstName}"/></h2>
    </div>
    
    <div class="content">
    		<table cellspacing="10">
    			<tr>
    				<th>Name</th>
    				<th>Email</th>
    				<th>Action</th>
    			</tr>
   		<c:forEach items="${users}" var="user">
  			<tr>
  				<td><c:out value="${user.firstName}" /> <c:out value="${user.lastName}" /></td>
  				<td><c:out value="${user.username}" /></td>
  				<td><a href="/admin/delete/${user.id}">Delete</a> <a href="/admin/create_admin/${user.id}">Make Admin</a></td> 
  			</tr>
  		</c:forEach>
   		<c:forEach items="${admins}" var="admin">
  			<tr>
  				<td><c:out value="${admin.firstName}" /> <c:out value="${admin.lastName}" /></td>
  				<td><c:out value="${admin.username}" /></td>
  			</tr>
  		</c:forEach>
  		
    		
    		</table>
    
    </div>
    
    
    
</body>
</html>