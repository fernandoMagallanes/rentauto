package ar.edu.unq.epers.model

import org.eclipse.xtend.lib.annotations.Accessors
import java.sql.Date

@Accessors
class Usuario {
	String nombre;
	String apellido;
	String nombre_de_usuario;
	String email;
	Date fecha_de_nac;
	String codigo_validacion
	Boolean validado;
	
	new(String miNombre,String miApellido,String userName,String email, Date fecNac){
		this.nombre = miNombre;
		this.apellido = miApellido; 
		this.nombre_de_usuario = userName; 
		this.email = email; 
	    this.fecha_de_nac = fecNac;
	    this.codigo_validacion = "";
	    this.validado = false;
	}
	
}




