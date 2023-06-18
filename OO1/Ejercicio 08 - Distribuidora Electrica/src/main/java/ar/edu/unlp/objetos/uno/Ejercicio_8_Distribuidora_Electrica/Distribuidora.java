package ar.edu.unlp.objetos.uno.Ejercicio_8_Distribuidora_Electrica;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

public class Distribuidora {
	private double precioKWh;
	private List<Usuario> usuarios;
	
	public Distribuidora (double precioKWh) {
		this.precioKWh = precioKWh;
		this.usuarios = new ArrayList<Usuario> ();
	}
	
	public double getPrecioKW() {
		return this.precioKWh;
	}
	
	public List<Usuario> getUsuarios () {
		return this.usuarios;
	}
	
	public void agregarUsuario (Usuario usuario) {
		this.usuarios.add(usuario);
	};
	
	public List<Factura> facturar() {
		return this.usuarios.stream()
						.map(user -> user.facturarEnBaseA(this.precioKWh))
						.collect(Collectors.toList());
	};
	
	public double consumoTotalActiva() {
		return this.usuarios.stream()
					.mapToDouble(user -> user.ultimoConsumoActiva())
					.sum();
	};
	
	public void precioKWh (double precio) {
		this.precioKWh = precio;
	};

}
