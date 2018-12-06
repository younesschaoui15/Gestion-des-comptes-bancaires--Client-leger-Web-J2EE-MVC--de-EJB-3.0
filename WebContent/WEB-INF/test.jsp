<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Test page</title>
</head>
<body>

TEST test ! 
<c:if test="${not empty login}"> 
 	<p style="color: red; font-size: 1em; font-style: italic;">
		<c:out value="${login}"/>
  	</p>
</c:if> 

</body>
</html>
