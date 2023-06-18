package ar.edu.unlp.objetos.uno.ejercicio15;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Propiedad {
	private String nombre, direccion, descripcion;
	private double precioPorNoche;
	private List<Reserva> reservas;
	
	public Propiedad (String nombre, String direccion, String descripcion, double precio) {
		this.nombre = nombre; 
		this.direccion = direccion; 
		this.descripcion = descripcion;
		this.precioPorNoche = precio;
		this.reservas = new ArrayList<Reserva> ();
	}
	
	public String getNombre () {
		return this.nombre;
	}
	
	public String getDireccion () {
		return this.direccion;
	}
	
	public String getDescripcion () {
		return this.descripcion;
	}
	
	public double getPrecioPorNoche () {
		return this.precioPorNoche;
	}
	
	public List<Reserva> getReservas () {
		return this.reservas;
	}
	
	public void agregarReserva (Reserva reserva) {
		this.reservas.add(reserva);
	}
	
	public boolean estaLibre (LocalDate desde, LocalDate hasta) {
		List<Reserva> r = reservas.stream().filter(reserva -> (reserva.getFechaDesde().isAfter(desde) || reserva.getFechaDesde().equals(desde)))
				.filter(reserva -> (reserva.getFechaHasta().isBefore(hasta) || reserva.getFechaHasta().equals(hasta)))
				.collect(Collectors.toList());
		if (r.size() > 0) {
			return false;
		} else {
			return true;
		}
	}

}
