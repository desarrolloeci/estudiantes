/*
 * CancelacionJava.java
 *
 * Created on 26 de febrero de 2007, 03:42 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package estudiantes.cancelaciones;

import java.util.Vector;
import estudiantes.baseDatos.BdActas;
import estudiantes.configuracion.configECI;
/**
 *
 * @author alexgz
 */
public class CancelacionJava {
    private String carnet ;
    //Solicitud de Cancelacion = 1 o Confirmacion de cancelacion = 2
    private String clave ;
    private String asig ;
    private String grupo ;
    private String obs ;
    configECI cfgEci = new configECI();
    /** Creates a new instance of CancelacionJava */
    public CancelacionJava() {
    }
    
}
