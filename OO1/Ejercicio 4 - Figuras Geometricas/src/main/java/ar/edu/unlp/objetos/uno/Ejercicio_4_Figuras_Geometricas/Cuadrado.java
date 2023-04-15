package ar.edu.unlp.objetos.uno.Ejercicio_4_Figuras_Geometricas;

<<<<<<< HEAD
public class Cuadrado {
	double lado;
	
	public Cuadrado () {
		this.lado = 0;
	}
	
	public void setLado (double valor) {
		this.lado = valor;
	}
	
=======
public class Cuadrado extends Figura {
	double lado;
	
	public Cuadrado() {
		this.lado = 0;
	}
	
>>>>>>> 74a2edae7f69b48fe3f057789c2ce8ef4214a463
	public double getLado() {
		return this.lado;
	}
	
<<<<<<< HEAD
=======
	public Cuadrado setLado( double valor) {
		this.lado = valor;
		return this;
	}
	
>>>>>>> 74a2edae7f69b48fe3f057789c2ce8ef4214a463
	public double getPerimetro() {
		return this.lado * 4;
	}
	
	public double getArea() {
		return this.lado * this.lado;
	}
}
