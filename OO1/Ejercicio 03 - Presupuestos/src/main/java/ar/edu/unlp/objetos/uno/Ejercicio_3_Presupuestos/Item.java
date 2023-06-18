package ar.edu.unlp.objetos.uno.Ejercicio_3_Presupuestos;

public class Item extends Presupuesto {
	String detalle;
	int cantidad;
	double costoUnitario;
	
	public Item () {
		this.detalle = "";
		this.cantidad = 0;
		this.costoUnitario = 0;
	}
	
	public String getDetalle () {
		return this.detalle;
	}
	
	public Item detalle ( String detalle ) {
		this.detalle = detalle;
		return this;
	}
	
	public int getCantidad () {
		return this.cantidad;
	}
	
	public Item cantidad ( int cantidad ) {
		this.cantidad = cantidad;
		return this;
	}
	
	public double getCostoUnitario () {
		return this.costoUnitario;
	}
	
	public Item costoUnitario ( double costo ) {
		this.costoUnitario = costo;
		return this;
	}
	
	public double costo () {
		return this.costoUnitario * this.cantidad;
	}
}
