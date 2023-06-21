/*
 * EqTipo.java
 *
 * Created on 7 de julio de 2006, 02:27 PM
 */

package eci.rechum;

import java.util.Vector;

import java.io.*;

/**
 *
 * @author lrodriguez
 * @version
 */
/**
	Clase para determinar las equivalencias entre los códigos
	y los nombres de los tipos de escrito del empleado.
*/
public class EqTipo implements Serializable {
	
	private Vector	tipos;
	
	public EqTipo() {
		tipos = new Vector();
	}
	
	/**
		Adiciona un nuevo tipo de escrito, para ser utilizado
		en la transformación entre nombres y códigos de los tipos de 
		escritos.
	*/
	public void adicionarTipo(Tipo tipo) {
		tipos.addElement(tipo);
	}
	
	/**
		Obtiene el nombre de un tipo de escrito, dado su código.
		Si el código no existe se retorna un String vacío.
	*/
	public String obtenerNombre(String codigoExt) {
		short			cont = 0;
		Tipo			tipo;
		String 			nomRet = new String();
		boolean			encontrado = false;
		
		if (tipos.size() > 0) {
			do {
				tipo = (Tipo)tipos.elementAt(cont);
				if (tipo.getCodigo().regionMatches(true, 0, codigoExt, 0, 1)) {
					encontrado = true;
					nomRet = new String(tipo.getNombre());
				}
				cont++;
			} while ((cont < tipos.size()) && (!encontrado));
		}
		return nomRet;
	}
		
	/**
		Obtiene el codigo de un tipo de escrito, dado su nombre.
		Si el nombre no existe se retorna un String vacío.
	*/
	public String obtenerCodigo(String nombre) {
		short			cont = 0;
		Tipo			tipo;
		String 			codRet = new String();
		boolean			encontrado = false;
		
		if (tipos.size() > 0) {
			do {
				tipo = (Tipo)tipos.elementAt(cont);
				if (tipo.getNombre().equals(nombre)) {
					encontrado = true;
					codRet = new String(tipo.getCodigo());
				}
				cont++;
			} while ((cont < tipos.size()) && (!encontrado));
		}
		return codRet;
	}
	
	/**
		Este metodo retorna un vector con todods los tipos de escritos
		 disponibles. Cada una de las posiciones de este
		vector contiene un objeto de tipo Tipo.
	*/
	public Vector getTipos() {
		return tipos;
	}
	
  	/** 
  		Metodo que hace parte de la implementacion de la interfaz
      	Serializable, y cuyo objeto es especificar la manera en que
      	el objeto debe ser serializado para poder usarse al enviarse
      	como paramentro en llamados remotos.
    */
	private void writeObject(ObjectOutputStream out) 
		throws IOException {
		out.writeObject(tipos);
  	}
  	  
  	/** 
  		Metodo que hace parte de la implementacion de la interfaz
      	Serializable, y cuyo objeto es especificar la manera en que
      	el objeto debe ser reconstruido para poder usarse al recibirse
      	como paramentro en llamados remotos.
    */
  	private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
		tipos = (Vector)in.readObject();
  	}
  	
  	public Vector getNombresTipos() {
  		int cont;
  		Tipo tipoTemp;
  		Vector nombresTipos = new Vector();
  		
  		for (cont = 0; cont < tipos.size(); cont ++) {
  			tipoTemp = (Tipo)tipos.elementAt(cont);
  			nombresTipos.addElement(tipoTemp.getNombre());
  		}
  		return nombresTipos;
  	}
}
