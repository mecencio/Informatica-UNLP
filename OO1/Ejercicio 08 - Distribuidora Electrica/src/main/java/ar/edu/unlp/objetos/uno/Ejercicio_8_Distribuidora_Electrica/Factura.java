package ar.edu.unlp.objetos.uno.Ejercicio_8_Distribuidora_Electrica;

import java.time.LocalDate;

public class Factura {
	private double montoEnergiaActiva;
	private double descuento;
	private LocalDate fecha;
	private Usuario usuario;
	
	public Factura (double montoEnergiaActiva, double descuento, Usuario usuario) {
		this.montoEnergiaActiva = montoEnergiaActiva;
		this.descuento = descuento;
		this.fecha = LocalDate.now();
		this.usuario = usuario;
	}
	
	public double getMontoEnergiaActiva() {
		return this.montoEnergiaActiva;
	}

	public void setMontoEnergiaActiva(double montoEnergiaActiva) {
		this.montoEnergiaActiva = montoEnergiaActiva;
	}

	public void setDescuento(double descuento) {
		this.descuento = descuento;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}


	public double montoTotal() {
		System.out.println(this.descuento);
		return this.montoEnergiaActiva * (1 - this.descuento/100);
	};
	
	public Usuario getUsuario() {
		return this.usuario;
	};
	
	public LocalDate getFecha() {
		return this.fecha;
	};
	
	public double getDescuento() {
		return this.descuento;
	};

}
