package ar.edu.unq.epers.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import java.sql.Date

@Accessors 
class Sistema {
	
	Home_Sistema homeSistema;
	
	new(){
		this.homeSistema = new Home_Sistema;
	}
	
	def registrar(String nombre,String apellido,String userName,String email, Date fecNac){
		val Usuario user = new Usuario(nombre, apellido, userName, email, fecNac);
		this.getHomeSistema().anadir(user);
	}
	
	def validarCuenta(String codigoValidacion, Usuario nombre_usuario){
		this.getHomeSistema().validarUsuario(codigoValidacion,nombre_usuario);
	}
	
	def ingresarUsuario(String userName, String password){
		this.getHomeSistema().ingresarUser(userName,password);
	}
	
	def cambiarPassword(String userName, String password){
		this.getHomeSistema().cambiarPass(userName, password);
	}
}