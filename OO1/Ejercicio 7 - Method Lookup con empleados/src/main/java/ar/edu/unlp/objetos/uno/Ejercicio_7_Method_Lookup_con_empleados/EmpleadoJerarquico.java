package ar.edu.unlp.objetos.uno.Ejercicio_7_Method_Lookup_con_empleados;

public class EmpleadoJerarquico extends Empleado {

	public EmpleadoJerarquico (String nombre) {
		super(nombre);
	}
	
	public double sueldoBasico() {
		return super.sueldoBasico() + this.bonoPorCategoria();
	}
	
	public double montoBasico() {
		return 45000;
	}
	
	public double bonoPorCategoria() {
		return 8000;
	}
}
