package ar.edu.unlp.objetos.uno.ejercicio12;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ReporteDeConstruccionTest {
	private ReporteDeConstruccion reporte;
	private ReporteDeConstruccion vacio;
	private Pieza esfera;
	private Pieza cilindro;
	private Pieza prisma;
	
	@BeforeEach
	public void setup () {
		reporte = new ReporteDeConstruccion ();
		vacio = new ReporteDeConstruccion ();
		esfera = new Esfera ("Acero", "Negro", 2);
		cilindro = new Cilindro ("Madera", "Marron", 2, 3);
		prisma = new PrismaRectangular ("Acero", "Marron", 3, 2, 2);
		
		reporte.agregarPieza(cilindro);
		reporte.agregarPieza(esfera);
		reporte.agregarPieza(prisma);
	}
	
	@Test
	public void testGetVolumenDeMaterial () {
		assertEquals(45.51, Math.round(reporte.getVolumenDeMaterial("Acero") *100.00)/100.00);
	}
	
	@Test
	public void testGetSuperficieDeColor () {
		assertEquals(94.83, Math.round(reporte.getSuperficieDeColor("Marron")*100.00)/100.00);
	}
	
	@Test
	public void testGetVolumenDeMaterialVacio () {
		assertEquals(0, vacio.getVolumenDeMaterial("Acero"));
	}
	
	@Test
	public void testGetSuperficieDeColorVacio () {
		assertEquals(0, vacio.getSuperficieDeColor("Marron"));
	}
}
