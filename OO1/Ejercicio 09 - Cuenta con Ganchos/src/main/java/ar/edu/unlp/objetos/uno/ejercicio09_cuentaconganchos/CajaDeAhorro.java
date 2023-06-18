package ar.edu.unlp.objetos.uno.ejercicio09_cuentaconganchos;

public class CajaDeAhorro extends Cuenta {

	public CajaDeAhorro () {
		super();
	}
	
	@Override
	protected boolean puedeExtraer(double monto) {
		if (this.getSaldo() >= (monto * 1.02)) return true; 
		
		return false;
	}

}
