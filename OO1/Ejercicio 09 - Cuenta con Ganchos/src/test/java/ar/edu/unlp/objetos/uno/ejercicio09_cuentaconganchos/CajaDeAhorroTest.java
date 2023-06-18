package ar.edu.unlp.objetos.uno.ejercicio09_cuentaconganchos;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CajaDeAhorroTest {
	private CajaDeAhorro cuenta;
	
	@BeforeEach
	public void setup() {
		cuenta = new CajaDeAhorro();
		
		cuenta.depositar(4000);
	}
	
	@Test
	public void testExtraerSinSuperar() {
		assertTrue(cuenta.extraer(2000));
	}
	
	@Test
	public void testExtraerSuperandoLimite() {
		assertFalse(cuenta.extraer(4000));
	}
}
