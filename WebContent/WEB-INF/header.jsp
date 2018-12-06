<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acceuil e-Banque</title>
<style type="text/css">
	<%@include file="../presentation/styles/bootstrap.min.css"%>
	<%@include file="../presentation/styles/style1.css"%>
</style>
<script type="text/javascript">
	<%@include file="../presentation/styles/bootstrap.min.js"%>
	$(document).ready(function(){
	   $('[data-toggle="offcanvas"]').click(function(){
	       $("#navigation").toggleClass("hidden-xs");
	   });
	});
</script>
</head>

<link href="../presentation/styles/font1-awesome.min.css">
<body class="home">
    <div class="container-fluid display-table">
        <div class="row display-table-row">
            <div class="col-md-2 col-sm-1 hidden-xs display-table-cell v-align box" id="navigation">
                <div class="navi" >
                    <ul style="display: inline-flex;">
                        <li class="active" ><a href="acceuil"><i class="fa fa-home" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Acceuil</span></a></li>
                        <li><a href="clients"><i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Clients</span></a></li>
                        <li><a href="operations"><i class="fa fa-calendar" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Opérations</span></a></li>
                        <li style="margin-left:770px;"><a href="deconnecter"><i class="fa fa-cog" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Déconnecter</span></a></li>
                    </ul>
                </div>
            </div> 
        </div>

    </div>
</body>

</html>