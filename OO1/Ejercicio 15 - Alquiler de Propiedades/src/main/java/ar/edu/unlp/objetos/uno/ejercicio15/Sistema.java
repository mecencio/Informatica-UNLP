package ar.edu.unlp.objetos.uno.ejercicio15;

import java.util.ArrayList;
import java.util.List;

public class Sistema {
	private List<Usuario> usuarios;
	
	public Sistema () {
		this.usuarios = new ArrayList<Usuario> ();
	}
	
	public Usuario crearUsuario (String nombre, String direccion, long dni) {
		Usuario nuevo = new Usuario(nombre, direccion, dni);
		this.usuarios.add(nuevo);
		return nuevo;
	}
	
	public Reserva reservar (Propiedad propiedad, LocalDate desde, LocalDate hasta, Usuario inquilino) {
		Reserva reserva; 
		if (propiedad.estaLibre(desde, hasta)) {
			reserva = new Reserva (desde, hasta);
			propiedad.agregarReserva(reserva);
			inquilino.agregarReserva(reserva);
		}
		return reserva;
	}
	
}
