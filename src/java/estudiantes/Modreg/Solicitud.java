/*
 * Solicitud.java
 *
 * Created on 6 de junio de 2003, 15:05
 */
package estudiantes.Modreg;

import java.util.Vector ;

/**
 *
 * @author  Claudia J. Choconta Vargas
 * @version 
 */
public class Solicitud extends Object {


    // Tipo de operacion,
    private String tipOp ;
    // Codigo de la Asignatura
    private String codAsig ;
    // Numero del grupo
    private String numGrp ;
    // Numero del laboratorio
    private String numLab ;
    // Numero del auxiliar
    private String numAux ;
    // Respuesta de la solicitud
    private char respuesta ;
    
    /** Creates new Solicitud */
    public Solicitud(String tipOp, String codAsig, String numGrp,
                     String numLab, String numAux) {
        this.tipOp = tipOp ;
        this.codAsig = codAsig ;
        this.numAux = numAux ;
        this.numLab = numLab ;
        this.numGrp = numGrp ;
    }
    
    /**
    * @param 
    * @return 
    * @exception Ninguna 
    */
    public void setRespuesta(char respuesta) {
        this.respuesta = respuesta ;
    }

    /** 
    * @param 
    * @return 
    * @exception Ninguna 
    */
    public char getRespuesta() { 
        return this.respuesta ;
    }
    
    /** 
    * @param 
    * @return 
    * @exception Ninguna 
    */
    public String getTipOp (){
        return this.tipOp ;
    }
        
    /** 
    * @param 
    * @return 
    * @exception Ninguna 
    */
    public String getCodAsig (){
        return this.codAsig ;
    }
    
    /** 
    * @param 
    * @return 
    * @exception Ninguna 
    */
    public String getNumGrp (){
        return this.numGrp ;
    }
    
    /** 
    * @param 
    * @return 
    * @exception Ninguna 
    */
    public String getNumLab (){
        return this.numLab ;
    }
    
    /** 
    * @param 
    * @return 
    * @exception Ninguna 
    */
    public String getNumAux (){
        return this.numAux ;
    }
}