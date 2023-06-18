package ar.edu.unlp.objetos.uno.Ejercicio_4_Figuras_Geometricas;

<<<<<<< HEAD
public class Circulo {
=======
public class Circulo extends Figura {
>>>>>>> 74a2edae7f69b48fe3f057789c2ce8ef4214a463
	double diametro;
	
	public Circulo() {
		this.diametro = 0;
	}
	
	public double getDiametro() {
		return this.diametro;
	}
	
<<<<<<< HEAD
	public void setDiametro (double valor) {
		this.diametro = valor;
=======
	public Circulo setDiametro(double valor) {
		this.diametro = valor;
		return this;
>>>>>>> 74a2edae7f69b48fe3f057789c2ce8ef4214a463
	}
	
	public double getRadio() {
		return this.diametro/2;
	}
	
<<<<<<< HEAD
	public void setRadio (double valor) {
		this.diametro = valor * 2;
=======
	public Circulo setRadio(double valor) {
		this.diametro = valor * 2;
		return this;
>>>>>>> 74a2edae7f69b48fe3f057789c2ce8ef4214a463
	}
	
	public double getPerimetro() {
		return this.diametro * Math.PI;
	}
	
	public double getArea() {
		return this.getRadio() * this.getRadio() * Math.PI;
	}
}
