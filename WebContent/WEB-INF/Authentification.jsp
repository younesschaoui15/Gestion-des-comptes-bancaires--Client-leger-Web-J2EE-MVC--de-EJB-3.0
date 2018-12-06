<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bienvenu </title>
<style type="text/css" ref="stylesheet">
	@import url(../presentation/styles/font1.css);
body {
  background-color:#fff;
  -webkit-font-smoothing: antialiased;
  font: normal 14px Roboto,arial,sans-serif;
}

.container {
    padding: 25px;
    position: fixed;
}

.form-login {
    background-color: #EDEDED;
    padding-top: 10px;
    padding-bottom: 20px;
    padding-left: 20px;
    padding-right: 20px;
    border-radius: 15px;
    border-color:#d2d2d2;
    border-width: 5px;
    box-shadow:0 1px 0 #cfcfcf;
}

h4 { 
 border:0 solid #fff; 
 border-bottom-width:1px;
 padding-bottom:10px;
 text-align: center;
}

.form-control {
    border-radius: 10px;
}

.wrapper {
    text-align: center;
}
	
</style>
</head>
<body style="background-image: url('../presentation/images/bg.jpg'); ">
	<link href="../presentation/styles/font1-awesome.min.css" rel="stylesheet">
	<div class="container">
	<form method="post" action="authentification">
      <div class="form-login" style="margin:50px auto 10px auto; width:300px;">
      <h3>Authentification...</h3>
      <input style="padding:10px 8px 10px 8px; margin-buttom:15px; height:20px;" type="text" id="username" name="identifiant" class="form-control input-sm chat-input" placeholder="Nom d'utilisateur" required="true" />
      </br>
      <input style="padding:10px 8px 10px 8px; margin-buttom:15px; height:20px;" type="password" id="userPassword" name="motpasse" class="form-control input-sm chat-input" placeholder="Mot de passe" required="true"/></br>
      </br>
      <div class="wrapper">
      <span class="group-btn">     
          <input type="submit" name="submit" value="Connexion">
      </span>
      </div>
      </div>
    </form>
	<c:if test="${!empty msgError}">
		<div class="alert alert-danger">
		  <c:out value="${msgError}"/>
		</div>
	</c:if>
	</div>	            
	

</body>
</html>
