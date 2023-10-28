import actividades.*
import socios.*

class TallerLiterario inherits Actividad{
	const librosTrabaj=[]
	
	method idiomasUsados()= librosTrabaj.map({l => l.idioma()}).asSet()
	override method diasActividad()=librosTrabaj.size()+1
	method cantDepaginas()= librosTrabaj.all({l => l.cantPag() >500})
	method mismoAutor()= librosTrabaj.map({l => l.autor()}).asSet().size()==1
	override method implicaEsfuerzo()= self.cantDepaginas() && self.mismoAutor() && librosTrabaj.size()<1
	override method sirveBronceo()=false
	override method esRecomendada(unSocio)= unSocio.idiomas().size()>1
}

class Libros{
	const property idioma
	const property cantPag
	const property autor
}