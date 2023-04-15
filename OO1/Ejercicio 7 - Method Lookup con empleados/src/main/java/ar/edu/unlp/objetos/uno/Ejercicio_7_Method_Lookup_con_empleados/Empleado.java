package ar.edu.unlp.objetos.uno.Ejercicio_7_Method_Lookup_con_empleados;

public class Empleado {
	String nombre;
	
	public Empleado (String nombre) {
		this.nombre = nombre;
	}
	
	public double aportes() {
		return 35000;
	}
	
	public double montoBasico() {
		return 13500;
	}
	
	public double sueldoBasico() {
		return this.montoBasico() + this.aportes();
	}
}
