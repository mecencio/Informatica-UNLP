package ar.edu.unlp.objetos.uno.ejercicio13;

import java.util.ArrayList;
import java.util.List;

public class Carpeta {
	private String nombre;
	private List<Email> emails;
	
	public Carpeta (String nombre) {
		this.nombre = nombre;
		emails = new ArrayList<Email>();
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public void setNombre (String nombre) {
		if (this.nombre.toLowerCase() != "inbox" && nombre.toLowerCase() != "inbox") {
			this.nombre = nombre;
		}
	}
	
	public double tamaño () {
		double total = 0;
		total += emails.stream().mapToDouble(email -> email.tamaño()).sum();
		return total;
	}
	
	public void agregarEmail (Email email) {
		this.emails.add(email);
	}
	
	public void quitarEmail (Email email) {
		this.emails.remove(email);
	}
	
}
