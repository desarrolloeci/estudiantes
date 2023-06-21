/*
 * BdGeneral.java
 *
 * Created on 7 de julio de 2006, 02:57 PM
 */

package eci.baseDatos ;
import java.io.* ;
import java.util.Vector ;

public class BdGeneral extends Vector
{

	private	String descripcion ;
	
	public BdGeneral (String des) {	
		super() ;
		descripcion = new String(des) ;			
	}

	public String getDescripcion ()
	{
		return descripcion ;
	}
}