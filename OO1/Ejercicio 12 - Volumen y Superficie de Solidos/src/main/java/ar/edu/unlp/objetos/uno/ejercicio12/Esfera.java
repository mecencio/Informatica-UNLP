package ar.edu.unlp.objetos.uno.ejercicio12;

public class Esfera extends Pieza {
	private Integer radio;
	
	public Esfera (String material, String color, Integer radio) {
		super(material, color);
		this.radio = radio;
	}
	
	public void setRadio (Integer radio) {
		this.radio = radio;
	}
	
	public Integer getRadio() {
		return this.radio;
	}
	
	public double getVolumen () {
		return (Math.PI * Math.pow(this.radio, 3) * 4 / 3);
	}
	
	public double getSuperficie () {
		return Math.PI * Math.pow(this.radio, 2) * 4;
	}
}
