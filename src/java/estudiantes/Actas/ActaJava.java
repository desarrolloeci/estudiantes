/*
 * ActaJava.java
 *
 * Created on 11 de julio de 2006, 04:09 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package estudiantes.Actas;

import java.util.Vector;
import estudiantes.baseDatos.BdActas;
import estudiantes.configuracion.configECI;
/**
 *
 * @author alexgz
 */
public class ActaJava {
    
    configECI cfgEci = new configECI();
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
    private String estado;
    private String error ; // Si la lectura del Socket no fue exitosa, contiene
                           // el mensaje de error
    /** Creates a new instance of ActaJava */
    public ActaJava() {
        codEst = new String() ;
        claNum = new String() ;
        respuesta = new String() ;
        codDpto = new String() ;
        nomDpto = new String() ;
        nomEst = new String() ;
        nomAcud = new String() ;
        valRen = new String() ;
        obs = new String() ;
        estado = new String();
    }
    
    public void consultarActa(String codEst, String claNum){
        //byte mensajeE [] = new byte[256] ;
        //byte mensajeR [] = new byte[256] ;
	String nameServer, strE, strR ;
        BdActas bdactas = new BdActas();
        Vector datosActa = new Vector();
        Vector infoActa = new Vector();
	try{
            bdactas.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
            datosActa = bdactas.consInfoActa(codEst);
            bdactas.desconectar() ; 
            if(datosActa.size()>0){
                infoActa = (Vector)datosActa.elementAt(0);
                this.codDpto = infoActa.elementAt(1).toString();
                this.nomDpto = infoActa.elementAt(2).toString();
                this.nomEst = infoActa.elementAt(3).toString();
                this.nomAcud = infoActa.elementAt(4).toString();
                this.valRen = infoActa.elementAt(5).toString();
                //this.obs = infoActa.elementAt(2).toString();
                this.codEst = codEst;
                this.claNum = infoActa.elementAt(0).toString();
                this.estado=infoActa.elementAt(9).toString();
                if(infoActa.elementAt(7).equals("4")){
                    this.respuesta = "F";
                }else if(!infoActa.elementAt(6).equals("NF")){
                    this.respuesta = "D";
                }else{
                    this.respuesta = "S";
                }
            }else{
                this.respuesta = "A";
            }
            //Enviando la peticion

            // Creando la conexion de entrada del socket

            //Recibiendo la respuesta
            

	}
        catch(Exception e){
            this.error = "Error De Conexion :" + e.toString() ;
	}   
    }

    public int getActaIntermedio(String codEst, String perhor){
        BdActas bdactas = new BdActas();
        int act = -1;
	try {
            bdactas.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
            act = bdactas.getActaIntermedio(codEst, perhor);
            bdactas.desconectar() ; 
	}
        catch(Exception e){
            this.error = "Error De Conexion :" + e.toString() ;
	} 
        return act ;
    }

    
    public void firmarActa(String codEst, String firma, String obs){
        BdActas bdactas = new BdActas();
        int act = 0;
	try{
            bdactas.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
            act = bdactas.actInfoActa(codEst, firma, obs);
            bdactas.desconectar() ; 
            if(act > 0 && act < 10)
                this.respuesta = "S";
            else
                this.respuesta = "E";
	}
        catch(Exception e){
            this.error = "Error De Conexion :" + e.toString() ;
	}   
    }
    
    public int firmarActaIntermedio(String codEst){
        BdActas bdactas = new BdActas();
        int act = -1;
	try{
            bdactas.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
            act = bdactas.actInfoActaInter(codEst, cfgEci.getPeriodoHor());
            bdactas.desconectar() ; 
	}
        catch(Exception e){
            this.error = "Error De Conexion :" + e.toString() ;
	}  
        return act;
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
   
   public String getEstado() {
        return this.estado ;
    }


}
