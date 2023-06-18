package ar.edu.unlp.objetos.uno.ejercicio11;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class InversorTest {
	private Inversor inversor;
	private Inversion plazo;
	private Inversion acciones;
	
	@BeforeEach
	public void setup() {
		this.inversor = new Inversor("Nicolas");
		this.plazo = new PlazoFijo(LocalDate.of(2023, 5, 8), 1000, 1);
		this.acciones = new Acciones("Coca", 26, 500);
		
		inversor.agregarInversion(acciones);
		inversor.agregarInversion(plazo);
	}

	@Test
	public void testValorPlazoFijo() {
		assertEquals(1310, this.plazo.valorActual());
	}
	
	@Test
	public void testValorAcciones() {
		assertEquals(13000, this.acciones.valorActual());
	}
	
	@Test
	public void testValorInversor() {
		assertEquals(14310, this.inversor.valorActual());
	}
}
