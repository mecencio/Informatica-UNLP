package ar.edu.unlp.objetos.uno.ejercicio13;

import java.util.ArrayList;
import java.util.List;

public class ClienteDeCorreo {
	private Carpeta inbox;
	private List<Carpeta> carpetas;
	
	public ClienteDeCorreo () {
		inbox = new Carpeta ("Inbox");
		carpetas = new ArrayList<Carpeta> ();
	}
	
	public void recibir (Email email) {
		this.inbox.agregarEmail(email);
	}
	
	public void mover (Email email, Carpeta origen, Carpeta destino) {
		origen.quitarEmail(email);
		destino.agregarEmail(email);
	}
	
}