import minions.*
import maldades.*

class Villanos {
	var minions = []
	var property ciudad = campana
	
	method nuevoMinion() {
		minions.add(new Minion(bananas=5, armas=[new Arma(nombre="Rayo Congelante", potencia=10)]))
	}
	
	method otorgarArma(armaParticular, minion) { //minion.get(nro)
		minion.agregarArmas(armaParticular)
	}
	
	method alimentar(minion, banAdicionales) {
		minion.agregarBananas(banAdicionales)
	}
	
	method nivelDeConcentracion(minion) {
		return minion.nivelDeConcentracion()
	}
	
	method esPeligroso(minion) {
		return minion.esPeligroso()
	}
	
	method planificarMaldad(maldad) {
		maldad.buscarMinionsCapacitados()
	}
	
	method obtenerMinionMasUtil() {
		return minions.max({unMinion => unMinion.maldadesRealizadas()})
	}
	
	method obtenerMinionMasInutil() {
		return minions.filter({unMinion => unMinion.maldadesRealizadas() == 0})
	}
}

class Ciudad {
	var nombre
	var property temperatura
	var objetivosDeLaCiudad = [new Piramides(altura=100), sueroMutante, luna]
}

object campana {
	var nombre = "campana"
}

class NroNegativoBananaException inherits Exception{
	
}