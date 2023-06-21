/*
 * Dependencia.java
 *
 * Created on 7 de julio de 2006, 02:44 PM
 */

package eci.servlets.dependencias ;

import java.io.* ;
import java.sql.Date ;

public class Dependencia
{
/** Representa el identificador único de la dependencia */
    private	Integer	codigo ;
    private	String	nombre ;
    private	String  director ;
    private java.sql.Date	fecCreacion ;
    private String	descripcion ;
    private String	nemo ;
    private String  tipo ;
    private String  url ;
	
/** Método constructor para una dependencia. */	
    public Dependencia( int cod, String nom, String dir, 
                        String des, String nemo, String tipo, String url) {

        codigo = new Integer(cod) ;
        nombre = new String(nom) ;
        director = new String(dir) ;
        descripcion = new String(des) ;
        this.nemo = new String(nemo) ;
        this.tipo = new String(tipo) ;		
        this.url = new String(url) ;				
    }

    public String getNombre ()
    {
        return nombre;
    }

    public String getDirector ()
    {  
        return director ;
    }

    public String getDescripcion ()
    {
        return descripcion ;
    }

    public String getCodigo ()
    {
        return (codigo.toString()) ;
    }

    public String getUrl ()
    {
        return url ;
    }

}