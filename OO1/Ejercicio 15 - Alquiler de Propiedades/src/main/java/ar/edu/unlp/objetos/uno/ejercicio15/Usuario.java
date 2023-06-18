package ar.edu.unlp.objetos.uno.ejercicio15;

import java.util.ArrayList;
import java.util.List;

public class Usuario {
	private String nombre, direccion;
	private long dni;
	private List<Propiedad> propiedades;
	private List<Reserva> reservas;
	
	public Usuario (String nombre, String direccion, long dni) {
		this.nombre = nombre; 
		this.direccion = direccion;
		this.dni = dni;
		this.propiedades = new ArrayList<Propiedad>();
	}
	
	public void agregarPropiedad (Propiedad propiedad) {
		this.propiedades.add(propiedad);
	}
	
	public void agregarReserva (Reserva reserva) {
		this.reservas.add(reserva);
	}
	
	public String getNombre () {
		return this.nombre;
	}
	
	public String getDireccion () {
		return this.direccion;
	}
	
	public long getDni () {
		return this.dni;
	}
	
	public List<Propiedad> getPropiedades () {
		return this.propiedades;
	}
	
	public List<Reserva> getReservas () {
		return this.reservas;
	}
	
}
