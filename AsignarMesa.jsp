<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html dir="ltr" xml:lang="ca" lang="ca">
<head>

<title>Asignación de mesas a reserva</title>

<link rel="stylesheet" href="css/estilos.css" type="text/css" />
<link rel="stylesheet" href="css/estilos_ficha_2.css" type="text/css" />

<script src="js/utiles.js" language="javascript"></script>
<script src="js/especificas.js" language="javascript"></script>

<script>
function alturaScrollListado() {
if(navigator.appName!="Microsoft Internet Explorer") {
	document.getElementById('scrollListado').className="scrollListadoMesas_firefox";
	} 
	else { 
		document.getElementById('scrollListado').className="scrollListadoMesas_ie"; 
		}
}
</script>

</head>

<body class="contenido" onload="alturaScrollListado();">
<form name="entidad">
<div id="fichaEditable">
    <div class="contenedorFicha">
        <div class="tituloSeccion"><p class="textoTituloSeccion">Lista de mesas&nbsp;</p></div>
        <div id="scrollListado" class="scrollListadoMesas_firefox">
        <table class="listado" cellpadding="0" cellspacing="0" width="100%">
            <thead>
                <tr class="fondoCabeceraListado">
                    <td class="campoCabeceraListadoInicial">Número de mesa</td>
                    <td class="campoCabeceraListado">Plazas</td>
                    <td class="campoCabeceraListado">Disponible</td>
                    <td class="campoCabeceraListadoFinal">&nbsp;</td>
                </tr>
            </thead>
            <tbody>
                <tr class="fondoListadoCalle">
                    <td class="campoListadoInicial">1</td>
                    <td class="campoListado">3</td>
                    <td class="campoListado">SI</td>
                    <td class="campoListadoFinal"><input type="button" class="boton" value="Assignar" /></td>
                </tr>
                <tr class="fondoListadoCalle">
                    <td class="campoListadoInicial">2</td>
                    <td class="campoListado">8</td>
                    <td class="campoListado">SI</td>
                    <td class="campoListadoFinal"><input type="button" class="boton" value="Assignar" /></td>
                </tr>
                <tr class="fondoListadoCalle">
                    <td class="campoListadoInicial">3</td>
                    <td class="campoListado">2</td>
                    <td class="campoListado">NO</td>
                    <td class="campoListadoFinal">&nbsp;</td>
                </tr>
                <tr class="fondoListadoCalle">
                    <td class="campoListadoInicial">4</td>
                    <td class="campoListado">5</td>
                    <td class="campoListado">SI</td>
                    <td class="campoListadoFinal"><input type="button" class="boton" value="Assignar" /></td>
                </tr>
            </tbody>
        </table>
        </div>
	</div>
</div>
<div class="finalListado"></div>
<div class="piePagina"></div>
</form>
</body>
</html>