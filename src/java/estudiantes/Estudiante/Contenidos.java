/*
 * Contenidos.java
 *
 * Created on 12 de enero de 2005, 10:37
 */

package estudiantes.Estudiante;
import java.io.*;
import java.util.Vector ;
import estudiantes.baseDatos.BdContenidos ;
import java.io.* ;
import estudiantes.configuracion.configECI;
/**
 *
 * @author  lrodrigu
 * @version 
 */
public class Contenidos  {

     protected Vector contenido;
    
     public Vector getContenido(PrintWriter out, String idasig){
        BdContenidos bdEst = new BdContenidos() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdApolo(), cfgEci.getPasswdBdApolo());        
       
       	this.contenido = bdEst.despContenido(out, idasig) ; 
         bdEst.desconectar() ;    
       
        return this.contenido ;
    } 
    

}
