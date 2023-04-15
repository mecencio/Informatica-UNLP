package ar.edu.unlp.objetos.uno.Ejercicio_4_Figuras_Geometricas;

public class Cuadrado {
	double lado;
	
	public Cuadrado () {
		this.lado = 0;
	}
	
	public void setLado (double valor) {
		this.lado = valor;
	}
	
	public double getLado() {
		return this.lado;
	}
	
	public double getPerimetro() {
		return this.lado * 4;
	}
	
	public double getArea() {
		return this.lado * this.lado;
	}
}
