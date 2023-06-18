package ar.edu.unlp.objetos.uno.ejercicio11;

public class Acciones extends Inversion {
	private String nombre;
	private int cantidad;
	private double valorUnitario;
	
	public Acciones (String nombre, int cantidad, double valorUnitario) {
		this.nombre = nombre;
		this.cantidad = cantidad;
		this.valorUnitario = valorUnitario;
	}
	
	public void setNombre (String nombre) {
		this.nombre = nombre;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public void setCantidad (int cantidad) {
		this.cantidad = cantidad;
	}
	
	public int getCantidad() {
		return this.cantidad;
	}
	
	public void setValorUnitario (double valor) {
		this.valorUnitario = valor;
	}
	
	public double getValorUnitario () {
		return this.valorUnitario;
	}
	
	public double valorActual() {
		return this.cantidad * this.valorUnitario;
	}
}
