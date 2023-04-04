package ar.edu.unlp.objetos.uno.Ejercicio_7_Method_Lookup_con_empleados;

public class Gerente extends EmpleadoJerarquico {

	public Gerente (String nombre) {
		super(nombre);
	}
	
	public double aportes() {
		return this.montoBasico() * 0.05d;
	}
	
	public double montoBasico() {
		return 57000;
	}
}
