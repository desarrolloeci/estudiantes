/*
 * Operacion.java
 *
 * Created on 6 de junio de 2003, 11:03
 */
package estudiantes.cancelaciones;

import java.util.Vector ;
import java.util.StringTokenizer ;
import java.io.* ;
import java.net.* ;

/**
 *
 * @author  Claudia J. Choconta Vargas
 * @version 
 */
public class Cancelacion extends Object {

    /** Atributos */
    // Constantes Puerto y Servidor donde se hacen peticiones y se reciben
    // las respuestas

    private final int MAXBUFF = 1100;
    //private final String Server = "10.1.0.249" ;    
    private final String Server = "10.1.0.20" ;        
    //private final String Server = "10.1.0.103" ;        
    private int Port = 10031 ;
    // Numero de Carnet al cual estan asocidas las solicitudes de Registro
    private String carnet ;
    //Solicitud de Cancelacion = 1 o Confirmacion de cancelacion = 2
    private String clave ;
    private String asig ;
    private String grupo ;
    private String obs ;
    
    // Solicitudes de una operacion de registro. Cada fila contiene una 
    // Objeto Solicitud
//    private Solicitud Solicitudes[] ;
    // Contiene la cadena que se le envia al servidor, con las solicitudes
    // Si la solicitud es de consulta, solEnvio contiene una cadena con formato
    // "carnet,L, ,0,0,0, ,"
    // Si la solicitud es de modificacion, solEnvio contiene una cadena con 
    // formato
    // "carnet  NEMONICO      ngrupo    nlab    naux     "
    private String solEnvio ;
    // Contiene la cadena que el servidor envia como respuesta a las solicitudes
    // Si la solicitud es de consulta, solRespuesta contiene una cadena con 
    // formato
    // "S,0,ZCTL,cod,NEMONICO,cod,NEMONICO,..."
    private String solRespuesta ;
    // Si la lectura del Socket no fue exitosa, contiene el mensaje de error
    private String error ; 
    
    
    /** Creates new Operacion */
    public Cancelacion(String carnet, String clave, String asig, String grupo, String obs) {
        this.carnet = carnet ;
        this.clave = clave ;
        this.asig = asig ;
        this.grupo = grupo ;
        this.obs = obs ;
        this.Port = 10031 ;
    }
    /** Creates new Operacion */
    public Cancelacion(String confCancel, PrintWriter out) {
        StringTokenizer strSol = new StringTokenizer(confCancel, "$") ;
        String rp = strSol.nextToken() ;
        String nom = strSol.nextToken() ;
        String carnet = strSol.nextToken() ;
        String nemon = strSol.nextToken() ;
        String idReg = strSol.nextToken() ;
        String idGrp = strSol.nextToken() ;
        String raz = strSol.nextToken() ;
        String solEnvio= "2$" + carnet + "$" + idReg + "$" + nemon + "$" + idGrp + "$" + raz + "$" ;
        this.solEnvio = solEnvio;        
    }
     /**
    * @param 
    * @return 
    * @exception Ninguna 
    */      
    public boolean enviarCancelacion(PrintWriter out){
        this.solEnvio = "1$" + this.carnet + "$" + this.clave + "$" + this.asig 
            + "$" + this.grupo + "$" + this.obs + "$" ; 
//out.println("<br>SolEnvia - envia Cancelacion: " + solEnvio) ;         
        return this.enviar(out);       
    }

     /**
    * @param 
    * @return 
    * @exception Ninguna 
    */      
    public boolean confirmarCancelacion(PrintWriter out){      
        return this.enviar(out);
    }

    /**
    * @param 
    * @return 
    * @exception Ninguna 
    */      
    public boolean enviar(PrintWriter out){
	Socket sockCli ;
        DataInputStream input ;
	DataOutputStream output ;
    
        byte mensajeE [] = new byte[4096] ;
        byte mensajeR [] = new byte[4096] ;
	String nameServer, strE, strR ;
   
  	sockCli=null ;
	nameServer = new String("");      
        limpiarBuffers(mensajeE,mensajeR);
        
	try{    
            // Conectandose al puerto Port del Servidor Server
            sockCli = new Socket(Server, Port) ;
            // Creando la conexion de salida del socket
            output = new DataOutputStream(sockCli.getOutputStream()) ;
            mensajeE = this.solEnvio.getBytes() ;
            //Enviando la peticion
            mensajeE = this.solEnvio.getBytes() ;            
            output.write(mensajeE);
            // Creando la conexion de entrada del socket
            input = new DataInputStream(sockCli.getInputStream());
            //Recibiendo la respuesta
            input.read(mensajeR) ;
            this.solRespuesta = new String (mensajeR) ;     
            sockCli.close() ;
	}
        catch(IOException e){
            this.error = "Error De Conexion :" + e.toString() ;
            return false ;
	}   
        
        return true ;
    }
    
    /** 
    * @param 
    * @return 
    * @exception Ninguna 
    */
    public String getSolRespuesta() {
        return this.solRespuesta ;
    }
    
    private void limpiarBuffers(byte mensajeE[], byte mensajeR[]){
        for ( int i = 0 ; i < MAXBUFF ; i++ ){
            mensajeE [i] = 0X0 ;
            mensajeR [i] = 0X0 ;
        }
    }
}