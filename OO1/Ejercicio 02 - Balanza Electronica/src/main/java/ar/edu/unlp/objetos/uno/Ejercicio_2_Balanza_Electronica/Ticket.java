package ar.edu.unlp.objetos.uno.Ejercicio_2_Balanza_Electronica;

import java.time.LocalDate;

public class Ticket {
	LocalDate fecha;
	int cantidadDeProductos;
	double pesoTotal;
	double precioTotal;
	
	public Ticket (int cantidad, double peso, double precio) {
		this.fecha = LocalDate.now();
		this.pesoTotal = peso;
		this.precioTotal = precio;
		this.cantidadDeProductos = cantidad;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public void setFecha (LocalDate fecha) {
		this.fecha = fecha;
	}
	
	public int getCantidadDeProductos() {
		return this.cantidadDeProductos;
	}
	
	public void setCantidadDeProductos ( int cantidad ) {
		this.cantidadDeProductos = cantidad;
	}
	
	public double getPesoTotal () {
		return this.pesoTotal;
	}
	
	public void setPesoTotal ( double peso ) {
		this.pesoTotal = peso;
	}
	
	public double getPrecioTotal() {
		return this.precioTotal;
	}
	
	public void setPrecioTotal ( double precio ) {
		this.precioTotal = precio; 
	}
	
	public double impuesto () {
		return this.precioTotal * 0.21;
	}
}
