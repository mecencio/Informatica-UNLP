package ar.edu.unlp.objetos.uno.Ejercicio_7_Method_Lookup_con_empleados;

public class Main {

	public static void main(String[] args) {
		Gerente alan = new Gerente("Alan Turing");
		double aportesDeAlan = alan.aportes();
		
		System.out.println(aportesDeAlan);
		
		double sueldoBasicoDeAlan = alan.sueldoBasico();
		
		System.out.println(sueldoBasicoDeAlan);

	}

}
