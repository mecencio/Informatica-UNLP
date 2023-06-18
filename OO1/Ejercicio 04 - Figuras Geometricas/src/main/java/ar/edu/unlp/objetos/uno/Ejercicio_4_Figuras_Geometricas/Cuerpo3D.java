package ar.edu.unlp.objetos.uno.Ejercicio_4_Figuras_Geometricas;

public class Cuerpo3D {
	Figura caraBasal;
	double altura;
	
	public Cuerpo3D () {
		this.altura = 0;
	}
	
	public Cuerpo3D setAltura (double valor) {
		this.altura = valor;
		return this;
	}
	
	public double getAltura () {
		return this.altura;
	}
	
	public Cuerpo3D setCaraBasal (Figura cara) {
		this.caraBasal = cara;
		return this;
	}
	
	public double getVolumen() {
		return this.caraBasal.getArea() * this.altura;
	}
	
	public double getSuperficieExterior () {
		return (2 * this.caraBasal.getArea()) + (this.caraBasal.getPerimetro() * this.altura);
	}
}
