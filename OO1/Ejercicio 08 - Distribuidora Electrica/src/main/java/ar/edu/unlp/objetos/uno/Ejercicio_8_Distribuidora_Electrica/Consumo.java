package ar.edu.unlp.objetos.uno.Ejercicio_8_Distribuidora_Electrica;

import java.time.LocalDate;

public class Consumo {
	private LocalDate fecha;
	private double consumoEnergiaActiva;
	private double consumoEnergiaReactiva;
	
	public Consumo(LocalDate fecha, double consumoEnergiaActiva, double consumoEnergiaReactiva) {
		this.fecha = fecha;
		this.consumoEnergiaActiva = consumoEnergiaActiva;
		this.consumoEnergiaReactiva = consumoEnergiaReactiva;
	}
	
	public double costoEnBaseA (double precioKWh) {
		return precioKWh * this.consumoEnergiaActiva;
	};
	
	public double factorDePotencia () {
		return this.consumoEnergiaActiva / Math.sqrt(Math.pow(this.consumoEnergiaActiva, 2) + Math.pow(this.consumoEnergiaReactiva, 2));
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public double getConsumoEnergiaActiva() {
		return consumoEnergiaActiva;
	}

	public void setConsumoEnergiaActiva(double consumoEnergiaActiva) {
		this.consumoEnergiaActiva = consumoEnergiaActiva;
	}

	public double getConsumoEnergiaReactiva() {
		return consumoEnergiaReactiva;
	}

	public void setConsumoEnergiaReactiva(double consumoEnergiaReactiva) {
		this.consumoEnergiaReactiva = consumoEnergiaReactiva;
	};
	
}
