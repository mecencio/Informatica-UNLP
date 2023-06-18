package ar.edu.unlp.objetos.uno.ejercicio13;

import java.util.ArrayList;
import java.util.List;

public class Email implements ICalcularTamaño {
	private String titulo;
	private String cuerpo;
	List<Archivo> adjuntos;
	
	public Email (String titulo, String cuerpo) {
		this.titulo = titulo;
		this.cuerpo = cuerpo;
		this.adjuntos = new ArrayList<Archivo> ();
	}
	
	public String getTitulo() {
		return this.titulo;
	}
	
	public String getCuerpo() {
		return this.cuerpo;
	}
	
	public double tamaño() {
		double total = this.titulo.length() + this.cuerpo.length();
		total += adjuntos.stream().mapToDouble(adjunto -> adjunto.tamaño()).sum();
		return total;
	}

}
