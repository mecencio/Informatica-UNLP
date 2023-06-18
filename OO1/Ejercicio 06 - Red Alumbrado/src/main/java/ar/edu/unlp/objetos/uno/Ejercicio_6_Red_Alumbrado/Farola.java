package ar.edu.unlp.objetos.uno.Ejercicio_6_Red_Alumbrado;

import java.util.ArrayList;
import java.util.List;

public class Farola {
	boolean isOn;
	List<Farola> neighbors;
	
	public Farola () {
		this.isOn = false;
		this.neighbors = new ArrayList<Farola>();
	}
	
	public void pairWithNeighbor (Farola otraFarola) {
		if (!this.neighbors.contains(otraFarola)) {
			this.neighbors.add(otraFarola);
			otraFarola.pairWithNeighbor(this);
		}
	}
	
	public List<Farola> getNeighbors() {
		return this.neighbors;
	}
	
	public void turnOn() {
		if(!this.isOn) {
			this.isOn = true;
			for ( int i = 0; i < this.neighbors.size(); i++) {
				this.neighbors.get(i).turnOn();
			}
		}
	}
	
	public void turnOff() {
		if(this.isOn) {
			this.isOn = false;
			for ( int i = 0; i < this.neighbors.size(); i++) {
				this.neighbors.get(i).turnOff();
			}
		}
	}
	
	public boolean isOn() {
		return this.isOn;
	}

}
