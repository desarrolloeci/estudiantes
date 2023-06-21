/*
 * Acta.java
 *
 * Created on 19 de mayo de 2003, 9:52
 */
package estudiantes.Actas;

import estudiantes.configuracion.configECI;
import java.net.*;
import java.io.*;

/**
 *
 * @author  
 * @version 1.0
 */
public class Acta extends java.lang.Object {

    // Constantes Puerto y Servidor donde se hacen peticiones y se reciben
    // las respuestas
    private final int Port = 10023;
    configECI confI = new configECI();
    private final String Server = confI.getIPBd() ;
    //private final String Server = "10.1.1.182" ; serv 2003-2


    //private final String Server = "10.1.0.20" ;      
     

    // Atributos de la Clase Acta
    private String codEst ; // Codigo del Estudiate al cual pertenece el acta
    private String claNum ; // Clave num del Estudiate al cual pertenece el acta
    private String respuesta ; // Respuesta del Servidor cuando se consulta 
                               // y se firma el acta
    private String codDpto ; // Codigo del dpto al cual pertenece el Estudiate
    private String nomDpto ; // Nombre del dpto al cual pertenece el Estudiate
    private String nomEst ; //  Nombre del estudiente
    private String nomAcud ; // Nombre del acudiente
    private String valRen ; // Estado del estudiante
    private String obs ; // Observaciones del estudiante con respecto
                                   // al acta firmada
    private String error ; // Si la lectura del Socket no fue exitosa, contiene
                           // el mensaje de error
    
    /** Creates new Acta */
    public Acta() {
        codEst = new String() ;
        claNum = new String() ;
        respuesta = new String() ;
        codDpto = new String() ;
        nomDpto = new String() ;
        nomEst = new String() ;
        nomAcud = new String() ;
        valRen = new String() ;
        obs = new String() ;
    }

    public void firmarActa(String codEst, String firma, String obs){
	Socket sockCli ;
        DataInputStream input ;
	DataOutputStream output ;
        byte mensajeE [] = new byte[256] ;
        byte mensajeR [] = new byte[256] ;
	String nameServer, strE, strR ;

  	sockCli=null ;
	nameServer = new String("");
	try{
            // Conectandose al puerto Port del Servidor Server
            sockCli = new Socket(Server, Port) ;
            // Creando la conexion de salida del socket
            output = new DataOutputStream(sockCli.getOutputStream()) ;
            strE = codEst + "," + firma + "," + obs + ",";
            mensajeE = strE.getBytes() ;
            //Enviando la peticion
            output.write(mensajeE);
            // Creando la conexion de entrada del socket
            input = new DataInputStream(sockCli.getInputStream());
            //Recibiendo la respuesta
            input.read(mensajeR) ;
            strR = new String (mensajeR) ;
            strToConfirmacion(strR);
            sockCli.close() ;
	}
        catch(IOException e){
            this.error = "Error De Conexion :" + e.toString() ;
	}   
    }
    
    public void consultarActa(String codEst, String claNum){
	Socket sockCli ;
        DataInputStream input ;
	DataOutputStream output ;
        byte mensajeE [] = new byte[256] ;
        byte mensajeR [] = new byte[256] ;
	String nameServer, strE, strR ;

  	sockCli=null ;
	nameServer = new String("");
	try{
            // Conectandose al puerto Port del Servidor Server
            sockCli = new Socket(Server, Port) ;
            // Creando la conexion de salida del socket
            output = new DataOutputStream(sockCli.getOutputStream()) ;
            strE = codEst + "," + claNum + "," ;
            mensajeE = strE.getBytes() ;
            //Enviando la peticion
            output.write(mensajeE);
            // Creando la conexion de entrada del socket
            input = new DataInputStream(sockCli.getInputStream());
            //Recibiendo la respuesta
            input.read(mensajeR) ;
            strR = new String (mensajeR) ;
            strToActa(strR);
            sockCli.close() ;
	}
        catch(IOException e){
            this.error = "Error De Conexion :" + e.toString() ;
	}   
    }
    
    private void strToActa(String strR) {
        int index = 0 ; 
        
        try {
            index = strR.indexOf(",") ;
            this.respuesta = strR.substring(0, index) ;
            strR = strR.substring(index + 1 ) ;
            index = strR.indexOf(",") ;
            this.codDpto = strR.substring(0, index) ;
            strR = strR.substring(index + 1 ) ;
            index = strR.indexOf(",") ;
            this.nomDpto = strR.substring(0, index) ;
            strR = strR.substring(index + 1 ) ;
            index = strR.indexOf(",") ;
            this.nomEst = strR.substring(0, index) ;
            strR = strR.substring(index + 1 ) ;
            index = strR.indexOf(",") ;
            this.nomAcud = strR.substring(0, index) ;
            strR = strR.substring(index + 1 ) ;
            index = strR.indexOf(",") ; 
            this.valRen = strR.substring(0, index) ;
            strR = strR.substring(index) ;
        }catch (NullPointerException e){
            this.error = "Parametros incorrectos leyendo del Socket en" + 
                    " consulta de Acta" ;
        }
    }
    
    private void strToConfirmacion(String strR) {
        int index = 0 ; 
        
        try {
            index = strR.indexOf(",") ;
            this.respuesta = strR.substring(0, index ) ;
        }catch (NullPointerException e){
            this.error = "Parametros incorrectos leyendo del Socket en" + 
                    " confirmacion de Acta" ;
        }
    }
    
    
    public String getCodEst() {
        return this.codEst ;
    }
    
    public String getClaNum() {
        return this.claNum ;
    }
    
    public String getRespuesta() {
        return this.respuesta ;
    }
    
    public String getCodDpto() {
        return this.codDpto ;
    }
    
    public String getNomDpto() {
        return this.nomDpto ;
    }
    
    public String getNomEst() {
        return this.nomEst ;
    }
    
    public String getNomAcud() {
        return this.nomAcud ;
    }
    
    public String getValRen() {
        return this.valRen ;
    }

   public String getObs() {
        return this.obs ;
    }
}