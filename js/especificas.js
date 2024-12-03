function inicio(){
	alturaIframe('contenidoPrincipal');
	centrarImagenFondo('imagenPorDefecto');
	}


function scroll_listado(){
document.getElementById('listadoScroll').style.display = "none";
document.getElementById('generalScroll').style.display = "";
document.getElementById('cuerpo').className = "scroll_ventana";
}
function scroll_general(){
document.getElementById('listadoScroll').style.display = "";
document.getElementById('generalScroll').style.display = "none";
document.getElementById('cuerpo').className = "scroll_total";
}



function alturaIframe(id) {

var capa = document.getElementById(id);

var heightIframe = TamVentana();

capa.style.height = heightIframe[1] - 170 + "px";
}

function centrarImagenFondo(id) {
	
	var capa = document.getElementById(id);
	var ventana = TamVentana();
	
	capa.style.left = ventana[0]/2 - 155 + "px";
	capa.style.top = ventana[1]/2 - 175 + "px";
}

function setURL(url,destino) {
	self.frames[destino].location.href = url;
}

function ocultarFondoPrincipal() { 
	parent.document.getElementById('imagenPorDefecto').style.display = "none";
	}

function abrirConsultaDisponibilidad() {
	if(navigator.appName!="Microsoft Internet Explorer") {alto = 208;} 
		else { alto = 218; }
	window.open('AsignarMesa.htm','ventana','menubar=0,resizable=0,status=1,width=600,height='+alto+'')
	}