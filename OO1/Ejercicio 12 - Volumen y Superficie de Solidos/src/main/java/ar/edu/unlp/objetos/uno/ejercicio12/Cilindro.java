package ar.edu.unlp.objetos.uno.ejercicio12;

public class Cilindro extends Pieza {
	private Integer radio;
	private Integer altura;
	
	public Cilindro (String material, String color, Integer radio, Integer altura) {
		super(material, color);
		this.radio = radio;
		this.altura = altura;
	}
	
	public void setRadio (Integer radio) {
		this.radio = radio;
	}
	
	public Integer getRadio () {
		return this.radio;
	}
	
	public void setAltura (Integer altura) {
		this.altura = altura;
	}
	
	public Integer getAltura () {
		return this.altura;
	}
	
	public double getVolumen () {
		return Math.PI * Math.pow(this.radio, 2) * this.altura;
	}
	
	public double getSuperficie () {
		return ((2 * Math.PI * this.radio * this.altura) + (2 * Math.PI * Math.pow(this.radio, 2)));
	}
}
