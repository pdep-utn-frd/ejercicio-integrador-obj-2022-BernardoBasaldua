class Minion {
	var property color = amarillo
	var bananas = 0
	var property armas = []
	var maldadesRealizadas = 0
	
	method esPeligroso() {
		return color.esPeligroso(self)
	}
	
	method consumirSueroMutante() {
		color.consumirSueroMutante(self)
		bananas = (bananas - 1).max(0)
	}
	
	method nivelDeConcentracion() {
		color.nivelDeConcentracion(self)
	}
	
	method agregarArmas(armaParticular) {
		armas.add(armaParticular)
	}
	
	method realizarMaldad() {
		maldadesRealizadas += 1
	}
	
	method tieneArma(armaParticular) {
		return armas.contains({unArma => unArma.nombre() == armaParticular})
	}
	
	/*method vaciarArmas() {
		armas.clear()
	}
	
	method cantArmas() {
		return armas.size()
	}*/
	
	/*method armas() {
		return armas
	}*/
	
	method bananas() {
		return bananas
	}
	
	method agregarBananas(cantidad) {
		bananas += cantidad
	}
}

object amarillo {
	//var bananas = 0
	//var armas = []
	
	/*method recibirArmas(minion) {
		armas = minion.armas()
	}*/
	
	method esPeligroso(minion) {
		//var cantArmas = armas.size()
		return (minion.armas().size() > 2)
	}
	
	method consumirSueroMutante(minion) {
		minion.color(violeta)
		//bananas = (bananas - 1).max(0)
		minion.armas().clear()
		//minion.vaciarArmas()
	}
	
	method nivelDeConcentracion(minion) {
		return (minion.armas().max({unArma => unArma.potencia()}).potencia() + minion.bananas())
	}
}

object violeta {
	//var armas = []
	
	method esPeligroso(minion) {
		return true
	}
	
	method consumirSueroMutante(minion) {
		minion.color(amarillo)
	}
	
	method nivelDeConcentracion(minion) {
		return minion.bananas()
	}
}

class Arma {
	var property nombre
	var property potencia
}