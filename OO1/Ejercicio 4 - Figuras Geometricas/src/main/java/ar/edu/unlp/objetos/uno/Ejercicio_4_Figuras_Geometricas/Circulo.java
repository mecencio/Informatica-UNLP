package ar.edu.unlp.objetos.uno.Ejercicio_4_Figuras_Geometricas;

public class Circulo {
	double diametro;
	
	public Circulo() {
		this.diametro = 0;
	}
	
	public double getDiametro() {
		return this.diametro;
	}
	
	public void setDiametro (double valor) {
		this.diametro = valor;
	}
	
	public double getRadio() {
		return this.diametro/2;
	}
	
	public void setRadio (double valor) {
		this.diametro = valor * 2;
	}
	
	public double getPerimetro() {
		return this.diametro * Math.PI;
	}
	
	public double getArea() {
		return this.getRadio() * this.getRadio() * Math.PI;
	}
}
