import villanos.*
import minions.*

class Congelar inherits Villanos{
	var capacitados = []
	
	method buscarMinionsCapacitados() {
		capacitados = minions.filter({unMinion => unMinion.armas().filter({unArma=>
			unArma.nombre()=="Rayo Congelante"
		}).size() > 0
			and unMinion.niveldeConcentracion() == 500})
	}
	
	method realizarMaldad() {
		if (capacitados.size() != 0) {
			self.ciudad().temperatura(-30)
			capacitados.all({unMinion => {
				 self.alimentar(unMinion, 10)
				 unMinion.realizarMaldad()
			}})
		}
	}
}

class Robar inherits Villanos {
	var property objetivo
	var capacitados = []
	
	method buscarMinionsCapacitados() {
		capacitados = objetivo.condiciones().filter({unMinion => unMinion.esPeligroso()})
	}
	
	method realizarMaldad() {
		if (capacitados.size() != 0) {
			self.darRecompensa()
		} else {
			self.error("No hay minions capacitados para robar")
		}
	}
	
	method darRecompensa() {
		return objetivo.recompensa(self, capacitados)
	}
}

class Piramides inherits Villanos{
	var altura
	
	method condiciones() {
		return minions.filter({unMinion => unMinion.nivelDeConcentracion() >= altura/2})
	}
	
	method recompensa(villano, capacitados) {
		capacitados.forEach({unMinion => villano.alimentar(unMinion, 10)})
	}
}

object sueroMutante inherits Villanos {
	method condiciones() {
		return minions.filter({unMinion => unMinion.bananas() >= 100 
			and unMinion.nivelDeConcentracion() >= 23
		})
	}
	
	method recompensa(villano) {
		return self.condiciones().forEach({unMinion => unMinion.consumirSueroMutante()})
	}
}

object luna inherits Villanos {
	method condiciones() {
		return minions.filter({unMinion => unMinion.armas().filter({unArma => 
			unArma.nombre() == "Rayo para Encoger"}).size() > 0})
	}
	
	method recompensa(villano) {
		return self.condiciones().forEach({unMinion => villano.otorgarArma(
			new Arma(nombre="Rayo congelante", potencia=10), unMinion
		)})
	}
}