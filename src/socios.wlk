import actividades.*

class Socio{
	const actvRealizo=[]
	const maxActiv
	const edad
	const property idiomas=#{}
	
	method agregarActv(unaActv){
		if(actvRealizo.size() == maxActiv)
			self.error("Llegó al máximo de actividades permitidas")
		else
			actvRealizo.add(unaActv)
			}
	method adoraSol()= actvRealizo.all({a => a.sirveBronceo()})
	method actvEsforzadas()= actvRealizo.filter({a => a.implicaEsfuerzo()})
	method leAtrae(unaActv)= true
}

class SocioTranquilo inherits Socio{
	override method leAtrae(unaActv)= unaActv.diasActividad() >= 4
}

class SocioCoherente inherits Socio{
	override method leAtrae(unaActv)= self.adoraSol() && unaActv.sirveBronceo() || unaActv.implicaEsfuerzo() 
}

class SocioRelajado inherits Socio{
	override method leAtrae(unaActv)= !(unaActv.idioma().intersection(self.idiomas())).isEmpty()
}



