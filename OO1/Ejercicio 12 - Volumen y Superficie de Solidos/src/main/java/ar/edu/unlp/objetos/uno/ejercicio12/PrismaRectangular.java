package ar.edu.unlp.objetos.uno.ejercicio12;

public class PrismaRectangular extends Pieza {
	private Integer ladoMayor;
	private Integer ladoMenor;
	private Integer altura;
	
	public PrismaRectangular (String material, String color, Integer ladoMayor, Integer ladoMenor, Integer altura) {
		super(material, color);
		this.ladoMayor = ladoMayor;
		this.ladoMenor = ladoMenor;
		this.altura = altura;
	}
	
	public void setLadoMayor (Integer lado) {
		this.ladoMayor = lado;
	}
	
	public Integer getLadoMayor () {
		return this.ladoMayor;
	}
	
	public void setLadoMenor (Integer ladoMenor) {
		this.ladoMenor = ladoMenor;
	}
	
	public Integer getLadoMenor() {
		return this.ladoMenor;
	}
	
	public void setAltura (Integer altura) {
		this.altura = altura;
	}
	
	public Integer getAltura () {
		return this.altura;
	}
	
	public double getVolumen () {
		return this.ladoMayor * this.ladoMenor * this.altura;
	}
	
	public double getSuperficie () {
		return (2 * ((this.ladoMayor * this.ladoMenor) + (this.ladoMayor * this.altura) + (this.ladoMenor * this.altura)));
	}

}
