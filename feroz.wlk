object feroz {
  var peso = 10
  const pesoInicial = 10

  method peso() = peso

  method estaSaludable() {
    return peso >= 20 && peso <= 150
  }

  method modificarPeso(cantidad) {
    peso = peso + cantidad
  }

  method sufrirCrisis() {
    peso = pesoInicial
  }

  method comer(algo) {
    self.modificarPeso(algo.peso() * 0.1)
  }

  method correrA(unLugar) {
    self.modificarPeso(-1)
  }
}

object bosque { }
object casaDeLaAbuelita { }

object abuelita {
  method peso() = 50
}

object manzana {
  method peso() = 0.2
}

object canasta {
  var cantidadDeManzanas = 6

  method cantidadDeManzanas() = cantidadDeManzanas

  method peso() {
    return cantidadDeManzanas * manzana.peso()
  }

  method perderManzana() {
    cantidadDeManzanas = cantidadDeManzanas - 1
  }
}

object caperucita {
  method peso() = 60

  method pesoTotal() {
    return self.peso() + canasta.peso()
  }

  method cruzarBosque() {
    canasta.perderManzana()
  }
}

object cazador {
  // Final 1: el lobo se come al cazador
  method serComidoPorFeroz() {
    feroz.comer(self)
  }

  // Final 2: el cazador asusta al lobo y le provoca una crisis
  method provocarleCrisisAFeroz() {
    feroz.sufrirCrisis()
  }

  // Final 3: el cazador obliga al lobo a correr mucho y adelgazar
  method perseguirAFeroz() {
    feroz.correrA(bosque)
    feroz.correrA(casaDeLaAbuelita)
    feroz.correrA(bosque)
  }

  method peso() = 80
}

object historia {
  method suceder() {
    feroz.correrA(bosque)
    feroz.correrA(casaDeLaAbuelita)
    feroz.comer(abuelita)
    canasta.perderManzana()
    feroz.comer(caperucita)
    feroz.comer(canasta)
  }
}
