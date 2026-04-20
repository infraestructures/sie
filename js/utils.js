function inicio(){
	alturaIframe('contenidoPrincipal');
	centrarImagenFondo('imagenPorDefecto');
	}

function TamVentana() {
  var Tamanyo = [0, 0];
  if (typeof window.innerWidth != 'undefined')
  {
    Tamanyo = [
        window.innerWidth,
        window.innerHeight
    ];
  }
  else if (typeof document.documentElement != 'undefined'
      && typeof document.documentElement.clientWidth !=
      'undefined' && document.documentElement.clientWidth != 0)
  {
 Tamanyo = [
        document.documentElement.clientWidth,
        document.documentElement.clientHeight
    ];
  }
  else   {
    Tamanyo = [
        document.getElementsByTagName('body')[0].clientWidth,
        document.getElementsByTagName('body')[0].clientHeight
    ];
  }
  return Tamanyo;
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
