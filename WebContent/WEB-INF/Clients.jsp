<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clients</title>
</head>
<body>
	<%@include file="./header.jsp"%>
	
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
	
	
	<form method="post" action="clients">
		<h3>Crée un compte</h3>
		<div class="row">	  
		  <div class="col-sm-2">
		  	<ul class="list-group">
			  <li class="list-group-item" style="padding:6px 5px 6px 5px;">Type de compte: </li>
			  <li class="list-group-item" style="padding:6px 5px 6px 5px;">Taux/Decouvert: </li>
			  <li class="list-group-item" style="padding:6px 5px 6px 5px;">Solde initial: </li>
			  <li class="list-group-item" style="padding:6px 5px 6px 5px;">Client: </li>
			  <li class="list-group-item" style="padding:6px 5px 6px 5px;">Taux/Decouvert: </li>
			</ul>
		  </div>
		  <div class="col-sm-4">
		  	<ul class="list-group">
			  <li class="list-group-item" style="padding:6px 5px 6px 5px;">
			  	<select name="typeCompte">
				    <option value="E">Epargne</option>
				    <option value="C">Courant</option>
				</select>
			  </li>
			  <li class="list-group-item" style="padding:6px 5px 6px 5px;"><input type="text" name="td" placeholder="Taux pour un compte epargne ou l'inverse." required="true" /></li>
			  <li class="list-group-item" style="padding:6px 5px 6px 5px;"><input type="text" name="solde" placeholder="Solde" required="true" /></li>
			  <li class="list-group-item" style="padding:6px 5px 6px 5px;">
			  	<select name="client">
					<c:forEach items="${listeClients}" var="cl">
					    <option value="${cl.codeClient}">${cl.codeClient}</option>
					</c:forEach>
				</select>
			  </li>
			  <li class="list-group-item" style="padding:6px 5px 6px 5px;"><input type="submit" name="submit" value="Créer le compte"></li>
			</ul>
		  </div>
		</div>
	</form>
	</br>
	<form method="post" action="clients">
		<h3>Crée un client</h3>
		<div class="row">	  
		  <div class="col-sm-2">
		  	<ul class="list-group">
			  <li class="list-group-item">Nom & prénom: </li>
			</ul>
		  </div>
		  <div class="col-sm-4">
		  	<ul class="list-group">
			  <li class="list-group-item"><input type="text" name="npClient" placeholder="Le nom et le prénom" required="true" /></li>
			  <li class="list-group-item" style="padding:6px 5px 6px 5px;"><input type="submit" name="submit" value="Créer le client"></li>
			</ul>
		  </div>
		</div>
	</form>
	
	</br>
	<div class="container">
	<h3>Les clients</h3>
	<table class="table" border="1">
		<thead>
		  <tr>
		    <th>Code</th>
		    <th>Nom & prénom</th> 
<!-- 		    <th>Nombre de comptes</th> -->
		  </tr>	  
		</thead>
		<tbody>
		  <c:forEach items="${listeClients}" var="cl" varStatus="loop">  		
			  <tr class="${loop.index % 2 == 0 ? 'active' : 'info'}">
			    <td  style="padding:6px 5px 6px 5px;">${cl.codeClient }</td>
			    <td  style="padding:6px 5px 6px 5px;">${cl.nomClient }</td>
<%-- 			    <td>${fn:length(cl.comptes)}</td> --%>
<!-- 				<td>#</td> -->
			  </tr>
		  </c:forEach>
	   </tbody> 
	</table>
	</div>
	</div>
	
	<div class="container">
	<h3>Les comptes</h3>
	<table class="table" border="2">
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
	  <c:forEach items="${listeComptes}" var="c" varStatus="loop">  
		  <tr class="${loop.index % 2 == 0 ? 'info' : 'active'}">
		    <td  style="padding:6px 5px 6px 5px;">${c.numCompte }</td>
		    <td style="padding:6px 5px 6px 5px;">${c.solde }</td>
		    <c:if test="${c.getClass().name =='metier.entities.CompteEpargne' }"> 
		    	<td style="padding:6px 5px 6px 5px;">E</td>
		    	<td style="padding:6px 5px 6px 5px;">${c.taux }</td>
		    	<td style="padding:6px 5px 6px 5px;">N/A</td>
		 	 </c:if>
		    <c:if test="${c.getClass().name =='metier.entities.CompteCourant' }"> 
		    	<td style="padding:6px 5px 6px 5px;">C</td>
		    	<td style="padding:6px 5px 6px 5px;">N/A</td>
		    	<td style="padding:6px 5px 6px 5px;">${c.decouvert }</td>
		 	 </c:if>
		    <td style="padding:6px 5px 6px 5px;">${c.dateCreation }</td>
		    <td style="padding:6px 5px 6px 5px;">${c.client.nomClient }</td>
		    <td style="padding:6px 5px 6px 5px;">${c.employe.numEmploye }</td>
		  </tr>
	  </c:forEach> 
	  </tbody>
	</table>
  </div>

</body>
</html>