/*
 * BDLogin.java
 *
 * Created on 26 de febrero de 2003, 20:22
 */

package estudiantes.baseDatos;
import java.io.*;
import java.util.Vector;
import java.sql.*;
import java.net.*;

/**
 *
 * @author  Julián garcía
 * @version 1.0
 */
public class BDLogin extends BaseDatosadm {
    
  public String existeNumRef(String numRef, String doc) {
    ResultSet 		res;
    PreparedStatement 	sentenciaConsulta;
    String  cont = new String("0"); 

    try {
        sentenciaConsulta =
        conexion.prepareStatement ("select convert(varchar(10),convert(int, vrpag)) from registro.pginscrip " +
                        "where idinsc = " + numRef + " and doc = '" + doc  + "'" );
        res = sentenciaConsulta.executeQuery();
        try {
            res.next() ;
            cont = res.getString(1) ;
            res.close() ;
 	    sentenciaConsulta.close();
        } catch (SQLException e) { 
            mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
    	} 
        }catch (Exception e) {
            mensaje = e.getMessage();
        }
        return cont;
    }

  public String existeNumRef(String numRef) {
    ResultSet 		res;
    PreparedStatement 	sentenciaConsulta;
    String  cont = new String("0"); 

    try {
        sentenciaConsulta =
        conexion.prepareStatement ("select convert(varchar(10),convert(int, vrpag)) from registro.pginscrip " +
                        "where idinsc = " + numRef + " " );
        res = sentenciaConsulta.executeQuery();
        try {
            res.next() ;
            cont = res.getString(1) ;
            res.close() ;
 	    sentenciaConsulta.close();
        } catch (SQLException e) { 
            mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
    	} 
        }catch (Exception e) {
            mensaje = e.getMessage();
        }
        return cont;
    }
    
  public long pagoCorrecto(String conValPagoCorrec) {
    ResultSet 		res;
    PreparedStatement 	sentenciaConsulta;
    int  cont = 0; 

    try { 
        sentenciaConsulta =
        conexion.prepareStatement (conValPagoCorrec);
        res = sentenciaConsulta.executeQuery();
        try {
            res.next() ;
            cont = res.getInt(1) ;
            res.close() ;
 	    sentenciaConsulta.close();
        } catch (SQLException e) { 
            mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
    	} 
    }catch (Exception e) {
            mensaje = e.getMessage();
    }
    return cont;
 }    
    
  public String estadoInsc(String numRef) {
    ResultSet 		res;
    PreparedStatement 	sentenciaConsulta;
    String result = new String(""); 
    
    try {
        sentenciaConsulta =
        conexion.prepareStatement ("select id_est, num_sol from registro.estudiante " +
                        "where refins = '" + numRef + "' ");
        res = sentenciaConsulta.executeQuery();
        try {
            res.next() ;
            result = new String(res.getString(1) + "$" + res.getString(2)) ;
            res.close() ;
 	    sentenciaConsulta.close();
        } catch (SQLException e) { 
            mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
    	} 
        }catch (Exception e) {
            mensaje = e.getMessage();
        }
        return result;
    }

  public String claveNum(String idEst) {
    ResultSet 		res;
    PreparedStatement 	sentenciaConsulta;
    String result = new String(""); 
    
    try {
        sentenciaConsulta =
        conexion.prepareStatement ("select convert(varchar(5), clanum) from registro.estudiante " +
                        "where id_est = " + idEst + " ");
        res = sentenciaConsulta.executeQuery();
        try {
            res.next() ;
            result = new String(res.getString(1)) ;
            res.close() ;
 	    sentenciaConsulta.close();
        } catch (SQLException e) { 
            mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
    	} 
        }catch (Exception e) {
            mensaje = e.getMessage();
        }
        return result;
    }
    
    
  public int existeCitas(String docProf) {
    ResultSet 		res;
    PreparedStatement 	sentenciaConsulta;
    int  cont = 0; 

    try {
        sentenciaConsulta =
        conexion.prepareStatement ("select count(*) " +
                        " from registro.profesor, registro.pruebadm, registro.estudiante " +
                        " where registro.profesor.id_prof = registro.pruebadm.id_prof and " +
                        " registro.estudiante.id_est = registro.pruebadm.id_est and " +
                        " cc_prof = '" + docProf + "' ");
        res = sentenciaConsulta.executeQuery();
        try {
            res.next() ;
            cont = res.getInt(1) ;
            res.close() ;
 	    sentenciaConsulta.close();
        } catch (SQLException e) { 
            mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
    	} 
        }catch (Exception e) {
            mensaje = e.getMessage();
        }
        return cont;
    }

  public String estadoAdmision(String docAspir) {
    ResultSet 		res;
    PreparedStatement 	sentenciaConsulta;
    String  cont = new String("0"); 

    try {
        sentenciaConsulta =
        conexion.prepareStatement ("select convert(varchar(4), estado) + '$' + convert(varchar(4), id_est) from registro.estudiante " +
                        " where docest = '" + docAspir + "' ");
        res = sentenciaConsulta.executeQuery();
        try {
            res.next() ;
            cont = res.getString(1) ;
            res.close() ;
 	    sentenciaConsulta.close();
        } catch (SQLException e) { 
            mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
    	} 
        }catch (Exception e) {
            mensaje = e.getMessage();
        }
        return cont;
    }
    
}