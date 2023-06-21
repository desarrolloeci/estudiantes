/*
 * BdMonitor.java
 *
 * Created on July 3, 2003, 3:11 PM
 */

package estudiantes.baseDatos;

/**
 *
 * @author  Administrador
 * @version 
 */
import estudiantes.configuracion.configECI;
import java.sql.*;
import java.util.*;
//import intraeci.baseDatos.* ;
//import eci.baseDatos.*;
import java.io.* ;



public class BdMonitor extends BaseDatos {

    /** Initialization method that will be called after the applet is loaded
     *  into the browser.
     */
    
    configECI conf= new configECI();
      public BdMonitor() {
      super();      
      this.dbUrl = "jdbc:freetds:sqlserver://"+conf.getIPBd()+"/APOLO";       
    }
    
    public Vector Consultanumsol(String carnet){
        String consulta = new String();     
       
        consulta=new String("select num_sol from apolo.apolo.n_sol_monitor where id_est = "+carnet+" ");    
        
        return this.consultar(consulta, 1);                 
    }       
   
    
    public Vector Consultaidasig(String codasig){
        String consulta = new String();     
       
        consulta=new String("select id_asig  from registro.registro.asignatura where cod_asig like '"+codasig+"' ");    
        return this.consultar(consulta, 1);                 
    }  
    
}

