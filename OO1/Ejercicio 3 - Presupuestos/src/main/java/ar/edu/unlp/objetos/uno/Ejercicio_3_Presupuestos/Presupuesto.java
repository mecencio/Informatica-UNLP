package ar.edu.unlp.objetos.uno.Ejercicio_3_Presupuestos;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Presupuesto {
	LocalDate fecha;
	String cliente; 
	List<Item> items;
	
	public Presupuesto () {
		this.fecha = LocalDate.now();
		this.cliente = "";
		this.items = new ArrayList<Item>();
	}
	
	public LocalDate getFecha () {
		return this.fecha;
	}
	
	public Presupuesto fecha ( LocalDate fecha) {
		this.fecha = fecha;
		return this;
	}
	
	public String getCliente () {
		return this.cliente;
	}
	
	public Presupuesto cliente ( String cliente ) {
		this.cliente = cliente;
		return this;
	}
	
	public List<Item> getItems () {
		return this.items;
	}
	
	public void agregarItem ( Item item ) {
		this.items.add(item);
	}
	
	public double calcularTotal() {
		int total = 0;
		for (int i = 0; i < this.items.size(); i++) {
			total += this.items.get(i).costo();
		}
		return total;
	}
	
}
