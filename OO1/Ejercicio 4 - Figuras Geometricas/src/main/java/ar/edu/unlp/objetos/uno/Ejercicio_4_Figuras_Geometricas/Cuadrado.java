package ar.edu.unlp.objetos.uno.Ejercicio_4_Figuras_Geometricas;

public class Cuadrado extends Figura {
	double lado;
	
	public Cuadrado() {
		this.lado = 0;
	}
	
	public double getLado() {
		return this.lado;
	}
	
	public Cuadrado setLado( double valor) {
		this.lado = valor;
		return this;
	}
	
	public double getPerimetro() {
		return this.lado * 4;
	}
	
	public double getArea() {
		return this.lado * this.lado;
	}
}
