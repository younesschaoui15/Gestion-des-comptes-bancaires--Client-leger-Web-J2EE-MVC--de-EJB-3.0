<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acceuil e-Banque</title>
</head>
<body>
	<%@include file="./header.jsp"%>
	
	</br>
	<c:if test="${!empty sessionScope.EMPLOYE}">
	<div class="row">
	  <div class="col-sm-2">
	  	<ul class="list-group">
		  <li class="list-group-item">Num: </li>
		  <li class="list-group-item">Nom: </li>
		  <li class="list-group-item">Salaire: </li>
		  <li class="list-group-item">Sup: </li>
		</ul>
	  </div>
	  <div class="col-sm-10">
	  	<ul class="list-group">
		  <li class="list-group-item">${EMPLOYE.numEmploye}</li>
		  <li class="list-group-item">${EMPLOYE.nomEmploye}</li>
		  <li class="list-group-item">${EMPLOYE.salaire}</li>
		  <li class="list-group-item">${EMPLOYE.supHierarchique.numEmploye}</li>
		</ul>
	  </div>
	</div> 
	</c:if>
	
</body>
</html>