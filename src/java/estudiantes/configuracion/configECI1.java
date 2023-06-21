/*
 * configECI.java
 *
 * Created on 17 de marzo de 2003, 11:24 AM
 */

package estudiantes.configuracion;

import java.io.*;
/**
 *
 * @author  administrador
 * @version 
 */
public class configECI1 extends java.lang.Object {

    /*atributos*/
    private String nomArchConf ; /*Nombre del Archivo donde se encuetra la
                                  configuracion del sistema de informacion de
                                  la ECI*/
    private String perAcad ;        /* Periodo Academico Actual */
    private String perAcadSig ;     /* Periodo Academico Siguiente */
    private String IPbd ;           /* Direccion IP donde recide la Base de Datos*/ 
    private String usuBdReg ;       /* Usuario de la Base de Datos Registro*/ 
    private String passBdReg ;      /* Password de la Base de Datos Registro*/
    private String usuBdApolo ;     /* Usuario de la Base de Datos Apolo*/     
    private String passBdApolo ;    /* Password de la Base de Datos Apolo*/    
    
    /** Creates new configECI */
    public configECI1() {

//        nomArchConf = new String ("../confECI/ServECI.conf");  
        //nomArchConf = new String ("e:\\jakarta-tomcat-3.2.1\\confEci\\ServECI01.conf");  
        otros.rutas ruta = new otros.rutas();
        nomArchConf = new String (ruta.valruta() + "ServECI01.conf");      
        try{
            FileInputStream in = new FileInputStream (nomArchConf);
            BufferedReader archIn = new BufferedReader(new InputStreamReader(in));
            
            perAcad = new String(archIn.readLine());
            perAcadSig = new String(archIn.readLine());
            IPbd = new String(archIn.readLine());
            usuBdReg= new String(archIn.readLine());
            passBdReg = new String(archIn.readLine());
            usuBdApolo= new String(archIn.readLine());
            passBdApolo = new String(archIn.readLine());            

            archIn.close();
            in.close();
        }catch(IOException e){
            System.out.println(e.getMessage());
        }         
   
    }
    
    /**
    * @param 
    * @return String Periodo Actual Para las operaciones de registro
    * @exception Ninguna 
    */  
    public String getPeriodoActual (){
        return  this.perAcad;
    }

    /**
    * @param 
    * @return String Periodo Siguiente Para las operaciones de registro
    * @exception Ninguna 
    */  
    public String getPeriodoSig (){
        return  this.perAcadSig;
    }
    
    /**
    * @param
    * @return String Direccion IP de la Base de Datos
    * @exception Ninguna 
    */  
    public String getIPBd(){
        return  this.IPbd;
    }

    /**
    * @param
    * @return String Usuario de la Base de Datos de Registro
    * @exception Ninguna 
    */      
    public String getUsuarioBdReg(){
        return  this.usuBdReg;
    }

    /**
    * @param
    * @return String Password de la Base de Datos de Registro
    * @exception Ninguna 
    */  
    public String getPasswdBdReg(){
        return  this.passBdReg;
    }
    
    /**
    * @param
    * @return String Usuario de la Base de Datos de Apolo
    * @exception Ninguna 
    */  
    public String getUsuarioBdApolo(){
        return  this.usuBdApolo;
    }
    
        /**
    * @param
    * @return String Password de la Base de Datos de Apolo
    * @exception Ninguna 
    */  
    public String getPasswdBdApolo(){
        return  this.passBdApolo;
    }
}
