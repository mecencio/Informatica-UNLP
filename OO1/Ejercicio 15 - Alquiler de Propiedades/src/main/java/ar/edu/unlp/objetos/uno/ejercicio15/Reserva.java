package ar.edu.unlp.objetos.uno.ejercicio15;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Reserva {
	private LocalDate desde, hasta;
	
	public Reserva (LocalDate desde, LocalDate hasta) {
		this.desde = desde;
		this.hasta = hasta;
	}
	
	public long cantidadDias() {
		return ChronoUnit.DAYS.between(desde, hasta);
	}
	
	public LocalDate getFechaDesde() {
		return this.desde;
	}
	
	public LocalDate getFechaHasta () {
		return this.hasta;
	}

}
