package ar.edu.unlp.objetos.uno.Ejercicio_3b_Balanza_Mejorada;

import java.util.ArrayList;
import java.util.List;

public class Balanza {
	List<Producto> productos;
	
	public Balanza () {
		this.productos = new ArrayList<Producto>();
	}
	
	public int getCantidadDeProductos() {
		return this.productos.size();
	}
	
	public double getPrecioTotal() {
		double total = 0;
		for (int i = 0; i < this.productos.size(); i++) {
			total += this.productos.get(i).getPrecio();
		}
		return total;
	}
	
	public double getPesoTotal() {
		double total = 0;
		for (int i=0; i < this.getCantidadDeProductos(); i++) {
			total += this.productos.get(i).getPeso();
		}
		return total;
	}
	
	public void ponerEnCero() {
		this.productos = new ArrayList<Producto>();
	}
	
	public void agregarProducto (Producto producto) {
		this.productos.add(producto);
	}
	
	public List<Producto> getProductos() {
		return this.productos;
	}
	
	public Ticket emitirTicket() {
		Ticket ticket = new Ticket (this.productos);
		return ticket;
	}
}
