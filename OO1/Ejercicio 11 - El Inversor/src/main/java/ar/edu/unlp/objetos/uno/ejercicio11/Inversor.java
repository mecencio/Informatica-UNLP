package ar.edu.unlp.objetos.uno.ejercicio11;

import java.util.List;
import java.util.ArrayList;

public class Inversor implements IValorActual {
	private String nombre;
	private List<Inversion> inversiones;
	
	public Inversor (String nombre) {
		this.nombre = nombre;
		this.inversiones = new ArrayList<Inversion> ();
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getNombre () {
		return this.nombre;
	}
	
	public List<Inversion> getInversiones () {
		return this.inversiones;
	}
	
	public void agregarInversion (Inversion inversion) {
		this.inversiones.add(inversion);
	}
	
	public void eliminarInversion (Inversion inversion) {
		this.inversiones.remove(inversion);
	}
	
	public double valorActual() {
		return this.inversiones.stream()
						.mapToDouble(inversion -> inversion.valorActual())
						.sum();
	}
}
