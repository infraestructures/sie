<!DOCTYPE html>

<html>
<head>
	<title>Gestió de centres educatius</title>
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
		<li class="opcionMenuSuperior" id="liCentre" onclick="setURL('centreListFiltro.php','contenidoPrincipal');" class="opcionMenu" id="aCentres">GESTIÓ DE CENTRES</li>
		<li class="opcionMenuSuperior" id="liEspai" onclick="setURL('espaiList.php','contenidoPrincipal');" class="opcionMenu" id="aEspais">GESTIÓ DE ESPAIS</li>
	</ul>
	<iframe src="paginaBlanco.php" name="contenidoPrincipal" frameborder="0" id="contenidoPrincipal" allowtransparency="true"></iframe>
	<div id="imagenPorDefecto" style="z-index:-1;">
		<img src="imagenes/logoGovernCentral.png" />
	</div>
	<div class="finalListado"></div>
	<div class="piePagina"></div>
	<div class="logoAD"></div>
</body>
</html>