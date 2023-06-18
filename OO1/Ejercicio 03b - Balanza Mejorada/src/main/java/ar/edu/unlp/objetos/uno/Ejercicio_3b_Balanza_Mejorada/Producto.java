package ar.edu.unlp.objetos.uno.Ejercicio_3b_Balanza_Mejorada;

public class Producto {
	double peso;
	double precioPorKilo;
	String descripcion;
	
	public Producto() {
		this.peso = 0;
		this.precioPorKilo = 0;
		this.descripcion = "";
	}
	
	public double getPeso() {
		return this.peso;
	}
	
	public void setPeso (double peso) {
		this.peso = peso;
	}
	
	public double getPrecioPorKilo() {
		return this.precioPorKilo;
	}
	
	public void setPrecioPorKilo (double precio) {
		this.precioPorKilo = precio;
	}
	
	public String getDescripcion() {
		return this.descripcion;
	}
	
	public void setDescripcion (String descripcion) {
		this.descripcion = descripcion;
	}
	
	public double getPrecio() {
		return this.precioPorKilo * this.peso;
	}
}
