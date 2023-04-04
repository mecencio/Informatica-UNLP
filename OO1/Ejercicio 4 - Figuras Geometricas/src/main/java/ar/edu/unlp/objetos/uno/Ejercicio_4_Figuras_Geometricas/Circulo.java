package ar.edu.unlp.objetos.uno.Ejercicio_4_Figuras_Geometricas;

public class Circulo extends Figura {
	double diametro;
	
	public Circulo() {
		this.diametro = 0;
	}
	
	public double getDiametro() {
		return this.diametro;
	}
	
	public Circulo setDiametro(double valor) {
		this.diametro = valor;
		return this;
	}
	
	public double getRadio() {
		return this.diametro/2;
	}
	
	public Circulo setRadio(double valor) {
		this.diametro = valor * 2;
		return this;
	}
	
	public double getPerimetro() {
		return this.diametro * Math.PI;
	}
	
	public double getArea() {
		return this.getRadio() * this.getRadio() * Math.PI;
	}
}
