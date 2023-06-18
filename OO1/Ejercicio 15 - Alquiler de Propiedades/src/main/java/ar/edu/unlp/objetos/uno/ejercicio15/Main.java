package ar.edu.unlp.objetos.uno.ejercicio15;

import java.time.LocalDate;

public class Main {

	public static void main(String[] args) {
		Reserva reserva = new Reserva(LocalDate.of(2023, 5, 5), LocalDate.of(2023, 6, 5));
		
		System.out.println(reserva.cantidadDias());

	}

}
