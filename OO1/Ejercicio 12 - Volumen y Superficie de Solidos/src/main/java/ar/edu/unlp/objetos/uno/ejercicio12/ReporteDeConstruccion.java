package ar.edu.unlp.objetos.uno.ejercicio12;

import java.util.ArrayList;
import java.util.List;

public class ReporteDeConstruccion {
	private List<Pieza> piezas;
	
	public ReporteDeConstruccion () {
		this.piezas = new ArrayList<Pieza> ();
	}
	
	public void agregarPieza (Pieza pieza) {
		this.piezas.add(pieza);
	}
	
	public double getVolumenDeMaterial(String material) {
		double total = 0;
		total += piezas.stream().filter(pieza -> pieza.getMaterial().equals(material))
					.mapToDouble(pieza -> pieza.getVolumen())
					.sum();
		return total;
	}
	
	public double getSuperficieDeColor (String color) {
		double total = 0;
		total += piezas.stream().filter(pieza -> pieza.getColor().equals(color))
					.mapToDouble(pieza -> pieza.getSuperficie())
					.sum();
		return total;
	}
}
