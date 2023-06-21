package estudiantes.baseDatos;

import estudiantes.configuracion.configECI;
import java.sql.*;
import java.net.*;
import java.util.*;
import java.io.*;


/** Esta clase ha sido creada para consultar los contenidos programáticos
    de las asignaturas que se encuentran en apolo*/
public class BdContenidos extends BaseDatos {

    /**
        Instancia un nuevo objeto de esta clase para realizar
        operaciones sobre la base de datos Apolo 
       
    */
       public BdContenidos () {
        super () ;
           configECI conf = new configECI();
        this.dbUrl = "jdbc:freetds:sqlserver://"+conf.getIPBd()+"/REGISTRO" ;
    }
	
       
  public Vector despContenido(PrintWriter out,  String idasig) {
	String consulta ;			
    	Vector  lisnom = new Vector() ;
					
       	consulta = new String("select nom_asig, vigd, vigh, ultmod, penmod, " +
                                "obj, just, intens, biblio, contres, cntdet, metod " + 
                                "FROM registro.descasig, registro.asignatura " + 
                                "WHERE  registro.descasig.idAsig = registro.asignatura.id_asig and  " +
                                "registro.asignatura.id_asig =" + idasig +" ") ;    
               //   out.println(consulta);
              return this.consultar(consulta, 12);
    }
        
public static String quitarSaltosL(String Linea) {
        String cadTmp = new String() ;
        int     pos ;
        
        pos = Linea.indexOf("\n") ;
        while ( pos >= 0) {
            cadTmp = cadTmp + Linea.substring(0, pos) ;
            Linea = Linea.substring(pos + 1) ;
            cadTmp = cadTmp  + "<br>" ;
            pos = Linea.indexOf("\n") ;
        }
        cadTmp = cadTmp + Linea ;
        return cadTmp ;
    }
        
    
}