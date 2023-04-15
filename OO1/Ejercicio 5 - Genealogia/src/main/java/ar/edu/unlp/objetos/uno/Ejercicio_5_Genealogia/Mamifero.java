package ar.edu.unlp.objetos.uno.Ejercicio_5_Genealogia;

import java.time.LocalDate;

public class Mamifero {
	String identificador;
	String especie;
	LocalDate fechaNacimiento;
	Mamifero padre;
	Mamifero madre;
	
	public Mamifero () {
		this.identificador = "";
		this.especie = "";
		this.fechaNacimiento = LocalDate.now();
	}
	
	public Mamifero (String nombre) {
		this.identificador = nombre;
		this.especie = "";
		this.fechaNacimiento = LocalDate.now();
	}
	
	public String getIdentificador() {
		return this.identificador;
	}
	
	public Mamifero setIdentificador (String id) {
		this.identificador = id;
		return this;
	}
	
	public String getEspecie() {
		return this.especie;
	}
	
	public Mamifero setEspecie (String especie) {
		this.especie = especie;
		return this;
	}
	
	public LocalDate getFechaNacimiento() {
		return this.fechaNacimiento;
	}
	
	public Mamifero setFechaNacimiento (LocalDate fecha) {
		this.fechaNacimiento = fecha;
		return this;
	}
	
	public Mamifero getPadre() {
		return this.padre;
	}
	
	public Mamifero setPadre (Mamifero padre) {
		this.padre = padre;
		return this;
	}
	
	public Mamifero getMadre () {
		return this.madre;
	}
	
	public Mamifero setMadre (Mamifero madre) {
		this.madre = madre;
		return this;
	}
	
	public Mamifero getAbueloMaterno() {
		return this.madre != null ? this.madre.getPadre() : null;
	}
	
	public Mamifero getAbuelaMaterna() {
		return this.madre != null ? this.madre.getMadre() : null;
	}
	
	public Mamifero getAbueloPaterno() {
		return this.padre != null ? this.padre.getPadre() : null;
	}
	
	public Mamifero getAbuelaPaterna() {
		return this.padre != null ? this.padre.getMadre() : null;
	}
	
	public boolean tieneComoAncestroA (Mamifero unMamifero) {
		return  (this.madre == unMamifero) ||
				(this.padre == unMamifero) ||
				(this.madre != null && this.madre.tieneComoAncestroA(unMamifero)) ||
				(this.padre != null && this.padre.tieneComoAncestroA(unMamifero));
	}
	
}
