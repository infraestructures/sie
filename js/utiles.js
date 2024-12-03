
function verOcultar(capa) {
	if (document.getElementById(capa).className == 'oculto') {
		document.getElementById(capa).className = "visible"
		}
		else {document.getElementById(capa).className = "oculto";}
	}
function verOcultarEstilo(capa) {
	if (document.getElementById(capa).style.display == 'none') {
		document.getElementById(capa).style.display = ''
		}
		else {document.getElementById(capa).style.display = 'none';}
	}

function verCapa(capa) {
	document.getElementById(capa).style.display = "";
	}

function ocultarCapa(capa) {
	document.getElementById(capa).style.display = "none";
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


function setURL(url,destino) {
	self.frames[destino].location.href = url;
}
