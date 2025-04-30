<!DOCTYPE html>

<html>
<head>
	<title>Servei d'Infraestructures Educatives</title>
	<link rel="stylesheet" href="css/estilos.css" type="text/css" />

	<script src="js/utiles.js" type="" language="JavaScript"></script>
	<script src="js/especificas.js" type="" language="JavaScript"></script>
</head>

<body class="principal" onload="inicio();" id="ventanaPrincipal">
	<div class="cabeceraGeneral">
		<p class="nombreAplicacion">Servei d'Infraestructures Educatives</p>
	</div>
	<div class="barraMarron"></div>
	<ul class="menuSuperior">
		<li class="opcionMenuSuperior" id="liCentre" onclick="setURL('centre/centreListFiltro.php','contenidoPrincipal');" class="opcionMenu" id="aCentres">GESTIÓ DE CENTRES</li>
		<li class="opcionMenuSuperior" id="liConveni" onclick="setURL('conveni/conveniListFiltro.php','contenidoPrincipal');" class="opcionMenu" id="aConvenis">GESTIÓ DE CONVENIS</li>
		<!--<li class="opcionMenuSuperior" id="liEspai" onclick="setURL('espai/espaiList.php','contenidoPrincipal');" class="opcionMenu" id="aEspais">GESTIÓ DE ESPAIS</li>-->
		<li class="opcionMenuSuperior" id="liActuacio" onclick="setURL('actuacio/actuacioListFiltro.php','contenidoPrincipal');" class="opcionMenu" id="aEspais">GESTIÓ D'ACTUACIONS</li>
	</ul>
	<iframe src="paginaBlanco.php" name="contenidoPrincipal" frameborder="0" id="contenidoPrincipal" allowtransparency="true"></iframe>
	<div id="imagenPorDefecto" style="z-index:-1;">
		<img src="imagenes/logoGovernCentral.png" />
	</div>
	<div class="finalListado"></div>
</body>
</html>