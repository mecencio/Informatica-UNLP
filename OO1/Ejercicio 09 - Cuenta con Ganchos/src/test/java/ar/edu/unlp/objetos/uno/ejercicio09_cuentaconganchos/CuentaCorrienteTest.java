package ar.edu.unlp.objetos.uno.ejercicio09_cuentaconganchos;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CuentaCorrienteTest {
	private CuentaCorriente Cuenta;
	
	@BeforeEach
	public void setup() {
		Cuenta = new CuentaCorriente();
		
		Cuenta.setDescubierto(1000);
		
		Cuenta.depositar(4000);
	}
	
	@Test
	public void testExtraerConDescubierto() {
		assertTrue(Cuenta.extraer(4800));
	}
	
	@Test
	public void testExtraerSinDescubierto() {
		assertFalse(Cuenta.extraer(5001));
	}
	
}
