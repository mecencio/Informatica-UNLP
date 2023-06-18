package ar.edu.unlp.objetos.uno.ejercicio13;

public class Archivo implements ICalcularTamaño {
	private String nombre;
	
	public Archivo (String nombre) {
		this.nombre = nombre;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public void setNombre (String nombre) {
		this.nombre = nombre;
	}
	
	public double tamaño() {
		return this.nombre.length();
	}

}
