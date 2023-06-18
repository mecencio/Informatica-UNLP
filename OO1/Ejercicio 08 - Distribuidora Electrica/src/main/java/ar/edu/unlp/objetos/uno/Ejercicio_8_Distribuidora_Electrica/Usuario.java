package ar.edu.unlp.objetos.uno.Ejercicio_8_Distribuidora_Electrica;

import java.util.ArrayList;
import java.util.List;

public class Usuario {
	private String nombre;
	private String domicilio;
	private List<Factura> facturas;
	private List<Consumo> consumos;
	
	public Usuario (String nombre, String domicilio) {
		this.nombre = nombre;
		this.domicilio = domicilio;
		this.facturas = new ArrayList<Factura>();
		this.consumos = new ArrayList<Consumo>();
	}
	
	public void agregarMedicion (Consumo medicion) {
		this.consumos.add(medicion);
	};
	
	public double ultimoConsumoActiva() {
		if (this.ultimoConsumo() != null) {
			return this.ultimoConsumo().getConsumoEnergiaActiva();
		}
		return 0;
	};
	
	public Factura facturarEnBaseA(double precioKWh) {
		double descuento = 0;
		Consumo consumo = this.ultimoConsumo();
		Factura nuevaFac;
		if (consumo != null) {
			if (consumo.factorDePotencia() > 0.8) {
				descuento = 10;
			}

			nuevaFac = new Factura (consumo.costoEnBaseA(precioKWh), descuento, this);
			
		} else {			
			nuevaFac = new Factura (0, 0, this);
		}

		this.facturas.add(nuevaFac);
		return nuevaFac;
	};
	
	public List<Factura> facturas () {
		return this.facturas;
	};
	
	public Consumo ultimoConsumo () {
		Consumo consumo = null;

		if (!this.consumos.isEmpty()) {
			consumo = this.consumos.get(this.consumos.size()-1);
		}
		
		return consumo;
	}

}
