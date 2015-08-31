package ar.edu.unq.epers.model

import java.sql.Connection
import java.sql.DriverManager
import java.sql.PreparedStatement
import java.sql.ResultSet

class Home_Sistema {
	
	def anadir(Usuario usuario) {
		var Connection conn = null;
		var PreparedStatement ps = null;
		var PreparedStatement ps1 = null;
		try{
			conn = this.getConnection();
			// completarUsuario()
			ps = conn.prepareStatement("INSERT INTO Usuarios (NOMBRE, APELLIDO, NOMBRE_USUARIO, EMAIL, FECHA_DE_NAC,VALIDADO) VALUES (?,?,?,?,?,?)");
			ps.setString(1, usuario.nombre);
			ps.setString(2, usuario.apellido);
			ps.setString(3, usuario.nombre_de_usuario);
			ps.setString(4, usuario.email);
			ps.setDate(5, usuario.fecha_de_nac);
			ps.setBoolean(6, usuario.validado);
			// pendiente
			ps.execute();
			
			ps1 = conn.prepareStatement("INSERT INTO Usuarios_Validaciones(NOMBRE_USUARIO, CODIGO_VALIDACION) VALUES(?,?)");
			ps1.setString(1,usuario.nombre);
			ps1.setString(2, usuario.codigo_validacion);
		}finally{
			if(ps != null)
				ps.close();
			if(ps1 != null)
				ps1.close();
			if(conn != null)
				conn.close();
		}
	}
	
	def private Connection getConnection(){
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost/Persistencia_TP1?user=root&password=root");
	}
	
	def validarUsuario(String codigoValidacion,Usuario user) {
		var Connection conn = null;
		var PreparedStatement ps = null;
		var PreparedStatement ps1 = null;
		try{
			conn = this.getConnection();
			// completarUsuario()
			ps = conn.prepareStatement("SELECT nombre_usuario FROM Usuarios_Validaciones WHERE codigo_validacion = ?");
			ps.setString(1,codigoValidacion);
			val ResultSet rs = ps.executeQuery();
			
			if (rs.next){
				ps1 = conn.prepareStatement("UPDATE Usuarios SET validado = true WHERE nombre_usuario = ?");
				ps1.setString(0,user.nombre);
				ps1.execute();
				
				user.validado = true;
			}
		}finally{
			if(ps != null)
				ps.close();
			if(ps1 != null)
				ps1.close();
			if(conn != null)
				conn.close();
		}
	}
	
	def ingresarUser(String userName, String password) {
		
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def cambiarPass(String string, String string2) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}