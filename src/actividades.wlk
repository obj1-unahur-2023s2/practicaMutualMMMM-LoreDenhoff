import socios.*

class Actividad{
	const property idioma = #{}

	method implicaEsfuerzo()
	method sirveBronceo()
	method diasActividad()
	method esInteresante()= idioma.size()>= 2
	method esRecomendada(unSocio)= self.esInteresante() && unSocio.leAtrae() && !unSocio.actvRealizo().contains(self)
}

class ViajesPlaya inherits Actividad{
	const largoPlaya

	override method implicaEsfuerzo()= largoPlaya>1200
	override method sirveBronceo()=true
	override method diasActividad()= largoPlaya/500
	} 

class ExcursionCiudad inherits Actividad{
	var atracciones 

	override method implicaEsfuerzo() = atracciones.between(5,8) 
	override method sirveBronceo() = false
	override method diasActividad()= atracciones / 2
	override method esInteresante()= super() || atracciones.equals(5)
} 

class CiudadTropical inherits ExcursionCiudad{
	
	override method sirveBronceo() = true
	override method diasActividad() = super()+1
}

class SalidaTrekking inherits Actividad{
	const kmSendero= 0
	const diasSol= 0
	
	override method implicaEsfuerzo() = kmSendero > 80
	override method sirveBronceo() = diasSol > 200 || (diasSol.between(100, 200) && kmSendero>120)
	override method diasActividad() = kmSendero/50
	override method esInteresante()= super() && diasSol > 140 
}

class ClaseGimnasia inherits Actividad{
	
	override method idioma()= #{"espaniol"}
	override method diasActividad()=1
	override method implicaEsfuerzo()= true
	override method sirveBronceo()= false
	override method esRecomendada(unSocio)= unSocio.edad().between(20,30)
}

