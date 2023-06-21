/*
 * rutas.java
 *
 * Created on 30 de mayo de 2006, 11:20 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package otros;

import java.io.File;

/**
 *
 * @author 
 */
public class rutas {
    
    /** Creates a new instance of rutas */
    public rutas() {
    }
    
    public String valruta(){
        String ruta;
        //tycho viejo
       // ruta = new String("/usr/local/apache-tomcat-6.0.41/confEci/");
        //tycho nuevo
       ruta = new String("/usr/share/Tomcat7/apache-tomcat-7.0.55/confEci/");
        File arc = new File(ruta);
        if (arc.exists()){
            return ruta;
        }
        else{
            ruta = new String("C:/Tomcat 5.5/confEci/");
            /*if (arc.exists()){
                return ruta;
            }else{*/
                //ruta = new String("C:/Tomcat5.5/confEci/");
                return ruta;
            //}
        }
    }
    
    public String tokenruta(){
        
        String truta;
        //truta = new String("\\");
        truta = new String("/");
        return truta;
    }
}
