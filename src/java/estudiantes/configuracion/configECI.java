/*
 * configECI.java
 *
 * Created on 17 de marzo de 2003, 11:24 AM
 */

package estudiantes.configuracion;

import java.io.FileInputStream;
import java.util.Properties;
/**
 *
 * @author  administrador
 * @version 
 */
public class configECI {

    /*atributos*/
    private String perAcad ;        /* Periodo Academico Actual */
    private String perAcadSig ;     /* Periodo Academico Siguiente */
    private String IPbd ;           /* Direccion IP donde recide la Base de Datos*/ 
    private String usuBdReg ;       /* Usuario de la Base de Datos Registro*/ 
    private String passBdReg ;      /* Password de la Base de Datos Registro*/
    private String usuBdApolo ;     /* Usuario de la Base de Datos Apolo*/     
    private String passBdApolo ;    /* Password de la Base de Datos Apolo*/      
    private String dirmodreg ;    /* Dirección ip del modificador de registro*/   
    private String perHorario ;     /* Periodo Academico Siguiente */    
    private String msjerror; 
    private String perOrdenes;
    private String perCursos;
    
    /** Creates new configECI */
    public configECI() {   
        otros.rutas ruta = new otros.rutas();
        String FICHERO_CONFIGURACION = ruta.valruta() + "ServEci.properties";
        Properties propiedades;
        try {
            FileInputStream f = new FileInputStream(FICHERO_CONFIGURACION);
            propiedades = new Properties();
            propiedades.load(f);
            f.close();
            this.perAcad = propiedades.getProperty("perAcad");
            this.perAcadSig = propiedades.getProperty("perAcadSig");
            this.IPbd = propiedades.getProperty("IPbd");
            this.usuBdReg= propiedades.getProperty("usuBdReg");
            this.passBdReg = propiedades.getProperty("passBdReg");
            this.usuBdApolo= propiedades.getProperty("usuBdApolo");
            this.passBdApolo = propiedades.getProperty("passBdApolo");
            this.dirmodreg = propiedades.getProperty("dirmodreg");
            this.perHorario = propiedades.getProperty("perHorario");
            this.perOrdenes = propiedades.getProperty("perOrdenes");
            this.perCursos = propiedades.getProperty("perCursos");
        } catch (Exception e) {
            msjerror = "ERROR: " + e.getMessage();
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
    
    public String getDirModReg(){
        return  this.dirmodreg;
    }

        public String getPeriodoHor (){
        return  this.perHorario;
    }
    
    public String getPerOrdenes(){
        return  this.perOrdenes;
    }
    
    public String getPerCursos(){
        return  this.perCursos;
    
    }
    
}
