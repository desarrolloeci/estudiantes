/*
 * Tipo.java
 *
 * Created on 7 de julio de 2006, 02:27 PM
 */

package eci.rechum;

import java.io.*;

/**
	Clase que representa el un empleado.
*/
public class Tipo
	implements Serializable {
	/**
		El código nemónico de un tipo e escrito, representado
		por una sola letra. Las equivalencias de cada uno de estos
		con su nombre pueden ser obtenidas de la tabla apolo.rechum.tipo.
	*/
	private String codigo;
	
	/**
		Nombre completo del Tipo de escrito.
	*/
	private String nombre;
	
	/**
		Método constructor que instancia un nuevo objeto de esta
		clase con sus atributos vacíos.
	*/
	public Tipo() {
		codigo = new String();
		nombre = new String();
	}
	
	/**
		Establece el código del tipo de escrito  que se pasa
		como parámetro.
	*/
	public void setCodigo(String codigoExt) {
		codigo = codigoExt;
	}
	
	/** 
		Establece el nombre del tipo de escrito  que se pasa
		como parametro.
	*/
	public void setNombre(String nombreExt) {
		nombre = nombreExt;
	}
	
	/**
		Obtiene el código para este tipo de escrito.
	*/
	public String getCodigo() {
		return codigo;
	}
	
	/**
		Obtiene el nombre para este tipo de escrito.
	*/
	public String getNombre() {
		return nombre;
	}
	
  	/** 
  		Metodo que hace parte de la implementacion de la interfaz
      	Serializable, y cuyo objeto es especificar la manera en que
      	el objeto debe ser serializado para poder usarse al enviarse
      	como paramentro en llamados remotos.
    */
	private void writeObject(ObjectOutputStream out) 
		throws IOException {
		out.writeObject(codigo);
		out.writeObject(nombre);
  	}
  	  
  	/** 
  		Metodo que hace parte de la implementacion de la interfaz
      	Serializable, y cuyo objeto es especificar la manera en que
      	el objeto debe ser reconstruido para poder usarse al recibirse
      	como paramentro en llamados remotos.
    */
  	private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
		codigo = (String)in.readObject();
		nombre = (String)in.readObject();
  	}		
}
