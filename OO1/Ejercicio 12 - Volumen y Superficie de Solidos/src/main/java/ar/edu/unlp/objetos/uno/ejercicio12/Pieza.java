package ar.edu.unlp.objetos.uno.ejercicio12;

public abstract class Pieza {
	private String material;
	private String color;
	
	public Pieza (String material, String color) {
		this.color = color;
		this.material = material;
	}
	
	public void setMaterial (String material) {
		this.material = material;
	}
	
	public String getMaterial() {
		return this.material;
	}
	
	public void setColor (String color) {
		this.color = color;
	}
	
	public String getColor() {
		return this.color;
	}
	
	public abstract double getVolumen ();
	
	public abstract double getSuperficie ();
	
}
