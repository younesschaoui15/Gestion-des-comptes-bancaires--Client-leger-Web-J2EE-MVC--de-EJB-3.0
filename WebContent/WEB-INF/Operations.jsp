<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Opérations</title>
</head>
<body>
	<%@include file="./header.jsp"%>
	
	</br>
	<div class="container">
	<c:if test="${!empty msgError}">
		<div class="alert alert-danger">
		  <c:out value="${msgError}"/>
		</div>
	</c:if>
	<c:if test="${!empty msgSuccess}">
	   <div class="alert alert-success">
		  <c:out value="${msgSuccess}"/>
		</div>
	</c:if>
	
	<form method="post" action="operations">
	<h3>Versement/Retraît</h3>
	<div class="row">	  
	  <div class="col-sm-2">
	  	<ul class="list-group">
		  <li class="list-group-item" style="padding:6px 5px 6px 5px;">Montant: </li>
		  <li class="list-group-item" style="padding:6px 5px 6px 5px;">Compte: </li>
		</ul>
	  </div>
	  <div class="col-sm-4">
	  	<ul class="list-group">
		  <li class="list-group-item" style="padding:6px 5px 6px 5px;"><input type="text" name="montant" placeholder="Montant" required="true" /></li>
		  <li class="list-group-item" style="padding:6px 5px 6px 5px;">
		  	<select name="numCompte" >
			<c:forEach items="${listeComptes}" var="c">
			    <option value="${c.numCompte}">${c.numCompte}</option>
			</c:forEach>
			</select>
		  </li>
		  <li class="list-group-item" style="padding:6px 5px 6px 5px;"><input type="submit" name="submit" value="Verser"><input style="margin-left:30px;"type="submit" name="submit" value="Retirer"></li>
		</ul>
	  </div>
	</div>
	</form>
	
<!-- 	<form method="post" action="operations"> -->
<!-- 	<h3>Retraît</h3> -->
<!-- 	<div class="row">	   -->
<!-- 	  <div class="col-sm-2"> -->
<!-- 	  	<ul class="list-group"> -->
<!-- 		  <li class="list-group-item" style="padding:6px 5px 6px 5px;">Montant: </li> -->
<!-- 		  <li class="list-group-item" style="padding:6px 5px 6px 5px;">Compte: </li> -->
<!-- 		</ul> -->
<!-- 	  </div> -->
<!-- 	  <div class="col-sm-4"> -->
<!-- 	  	<ul class="list-group"> -->
<!-- 		  <li class="list-group-item" style="padding:6px 5px 6px 5px;"><input type="text" name="montant" placeholder="Montant" required="true" /></li> -->
<!-- 		  <li class="list-group-item" style="padding:6px 5px 6px 5px;"> -->
<!-- 		  	<select name="numCompte" > -->
<%-- 			<c:forEach items="${listeComptes}" var="c"> --%>
<%-- 			    <option value="${c.numCompte}">${c.numCompte}</option> --%>
<%-- 			</c:forEach> --%>
<!-- 			</select> -->
<!-- 		  </li> -->
<!-- 		  <li class="list-group-item" style="padding:6px 5px 6px 5px;"><input type="submit" name="submit" value="Retirer"></li> -->
<!-- 		</ul> -->
<!-- 	  </div> -->
<!-- 	</div> -->
<!-- 	</form> -->
	
	<form method="post" action="operations">
	<h3>Virement</h3>
	<div class="row">	  
	  <div class="col-sm-2">
	  	<ul class="list-group">
		  <li class="list-group-item" style="padding:6px 5px 6px 5px;">Montant: </li>
		  <li class="list-group-item" style="padding:6px 5px 6px 5px;">Compte source: </li>
		  <li class="list-group-item" style="padding:6px 5px 6px 5px;">Compte destination: </li>
		</ul>
	  </div>
	  <div class="col-sm-4">
	  	<ul class="list-group">
		  <li class="list-group-item" style="padding:6px 5px 6px 5px;"><input type="text" name="montant" placeholder="Montant" required="true" /></li>
		  <li class="list-group-item" style="padding:6px 5px 6px 5px;">
		  	<select name="numCompte1">
			<c:forEach items="${listeComptes}" var="c">
			    <option value="${c.numCompte}">${c.numCompte}</option>
			</c:forEach>
			</select>
		  </li>
		  <li class="list-group-item" style="padding:6px 5px 6px 5px;">
		  	<select name="numCompte2">
			<c:forEach items="${listeComptes}" var="c">
			    <option value="${c.numCompte}">${c.numCompte}</option>
			</c:forEach>
			</select>
		  </li>
		  <li class="list-group-item" style="padding:6px 5px 6px 5px;"><input type="submit" name="submit" value="Transferer"></li>
		</ul>
	  </div>
	</div>
	
	</form> 
	</div>
	</br>
	<div class="container">
	<h3>Les comptes</h3>
	<table class="table" border="1">
	  <thead>
		  <tr class="success">
		    <th>Num</th>
		    <th>Solde</th> 
		    <th>Type</th>
		    <th>Taux</th>
		    <th>Decouvert</th>
		    <th>Date de création</th>
		    <th>Client</th>
		    <th>Crée par (employé)</th>
		  </tr>
	  </thead>
	  <tbody>
	  <c:forEach items="${listeComptes}" var="c" varStatus="loop" >  
		  <tr class="${loop.index % 2 == 0 ? 'info' : 'active'}"  style="padding:7px auto 7px auto;">
		    <td>${c.numCompte }</td>
		    <td>${c.solde }</td>
		    <c:if test="${c.getClass().name =='metier.entities.CompteEpargne' }"> 
		    	<td>E</td>
		    	<td>${c.taux }</td>
		    	<td>N/A</td>
		 	 </c:if>
		    <c:if test="${c.getClass().name =='metier.entities.CompteCourant' }"> 
		    	<td>C</td>
		    	<td>N/A</td>
		    	<td>${c.decouvert }</td>
		 	 </c:if>
		    <td>${c.dateCreation }</td>
		    <td>${c.client.nomClient }</td>
		    <td>${c.employe.numEmploye }</td>
		  </tr>
	  </c:forEach> 
	  </tbody>
	</table>
  </div>
         
</body>
</html>