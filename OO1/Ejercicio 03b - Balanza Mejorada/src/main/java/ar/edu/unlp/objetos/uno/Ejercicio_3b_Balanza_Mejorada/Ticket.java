package ar.edu.unlp.objetos.uno.Ejercicio_3b_Balanza_Mejorada;

import java.time.LocalDate;
import java.util.List;

public class Ticket {
	LocalDate fecha;
	List<Producto> productos; 
	
	public Ticket (List<Producto> productos) {
		this.fecha = LocalDate.now();
		this.productos = productos;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public void setFecha (LocalDate fecha) {
		this.fecha = fecha;
	}
	
	public int getCantidadDeProductos() {
		return this.productos.size();
	}
	
	public double getPesoTotal () {
		double total = 0;
		for (int i = 0; i < this.productos.size(); i++) {
			total += this.productos.get(i).getPeso();
		}
		return total;
	}
	
	public double getPrecioTotal() {
		double total = 0;
		for (int i = 0; i < this.productos.size(); i++) {
			total += this.productos.get(i).getPrecio();
		}
		return total;
	}
	
	public List<Producto> getProductos() {
		return this.productos;
	}
	
	public double impuesto () {
		return this.getPrecioTotal() * 0.21;
	}
}
