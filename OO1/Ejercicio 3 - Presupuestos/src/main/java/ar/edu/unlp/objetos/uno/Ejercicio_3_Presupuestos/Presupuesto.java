package ar.edu.unlp.objetos.uno.Ejercicio_3_Presupuestos;

import java.time.LocalDate;

public class Presupuesto {
	LocalDate fecha;
	String cliente; 
	Item[] items;
	
	public Presupuesto () {
		this.fecha = LocalDate.now();
		this.cliente = "";
		this.items = new Item[10];
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
	
	public Item[] getItems () {
		return this.items;
	}
	
	public void agregarItem ( Item item ) {
		
	}
	
	public double calcularTotal() {
		return 0;
	}
	
}
