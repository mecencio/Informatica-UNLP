package ar.edu.unlp.objetos.uno.ejercicio11;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class PlazoFijo extends Inversion {
	private LocalDate fechaDeConstitucion;
	private double montoDepositado;
	private double porcentajeDeInteresDiario;
	
	public PlazoFijo (LocalDate fecha, double monto, double interes) {
		this.fechaDeConstitucion = fecha;
		this.montoDepositado = monto;
		this.porcentajeDeInteresDiario = interes;
	}
	
	public void setFechaDeConstitucion (LocalDate fecha) {
		this.fechaDeConstitucion = fecha;
	}
	
	public LocalDate getFechaDeConstitucion () {
		return this.fechaDeConstitucion;
	}
	
	public void setMontoDepositado (double monto) {
		this.montoDepositado = monto;
	}
	
	public double getMontoDepositado () {
		return this.montoDepositado;
	}
	
	public void setPorcentajeDeInteresDiario (double interes) {
		this.porcentajeDeInteresDiario = interes;
	}
	
	public double getPorcentajeDeInteresDiario() {
		return this.porcentajeDeInteresDiario;
	}
	
	public double valorActual() {
		long dias = ChronoUnit.DAYS.between(fechaDeConstitucion, LocalDate.now());
		return this.montoDepositado * (1 + dias * this.porcentajeDeInteresDiario/100);
	}

}
