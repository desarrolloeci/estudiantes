/*
 * EstudFin.java
 *
 * Created on 17 de julio de 2006, 02:17 PM
 *
 * Invocar las operaciones financieras de un estudiante
 */

package estudiantes.Estudiante;

import java.util.Vector ;
import estudiantes.baseDatos.BdEstfin;
import estudiantes.configuracion.configECI;

/**
 *
 * @author jgarcia
 */
public class EstudFin {

    protected String idEst  ; /* Identificador del estudiante */     
    protected String valor  ; /* Valor de la orden */
    protected String nord ;   /* Numero de la Orden */
    protected String per ;    /* Periodo Académico */
    protected String nref ;   /* Numero de Referencia */
    
    /** Creates a new instance of EstudFin */
    public EstudFin() {
    }
    
    public EstudFin(String id) {
        idEst = new String(id) ;
    }
    
    public Vector getAsigPagar() {   
        Vector lispagar = new Vector() ;
        
        BdEstfin bdEst = new BdEstfin() ;
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        lispagar = bdEst.getAsigPagar(idEst) ; 
        bdEst.desconectar() ;     
        return lispagar;
    }                   

    public Vector getPagarP() {   
        Vector lispagar = new Vector() ;
        
        BdEstfin bdEst = new BdEstfin() ;
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        lispagar = bdEst.getvalpagp(idEst) ; 
        bdEst.desconectar() ;     
        return lispagar;
    }           
        
    public Vector getOrden() {   
        Vector lispagar = new Vector() ;
        
        BdEstfin bdEst = new BdEstfin() ;
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        lispagar = bdEst.getOrden(idEst, cfgEci.getPerOrdenes()) ; 
        bdEst.desconectar() ;     
        return lispagar;
    }   
     
    
    public Vector getpagopse() {   
        Vector lispagar = new Vector() ;
        
        BdEstfin bdEst = new BdEstfin() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        lispagar = bdEst.getvalpagpse(idEst) ; 
        bdEst.desconectar() ;     
        return lispagar;
    }                   
    
    public Vector prcpgasigp(Vector vasigs, Vector vpgs) {   
        Vector lisresp = new Vector() ;
        Vector resAs = new Vector() ;
        int i, na = vasigs.size() ;
        BdEstfin bdEst = new BdEstfin() ;
        String idbib  = new String(""), val = new String("")  ;
        
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());    
        for (i = 0; i < na; i++) {
            idbib =  (String) vasigs.elementAt(i) ;
            val =  (String) vpgs.elementAt(i) ;
            bdEst.actpgasigp(this.idEst, idbib, val) ;     
        }
        bdEst.desconectar() ;     
        return lisresp;
    }                   
    
    public String getValDerGrad(){
        Vector ret;
        BdEstfin bdEst = new BdEstfin() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        ret = bdEst.getValDerGrad();
        bdEst.desconectar() ;
        ret = (Vector)ret.elementAt(0);
        return ret.elementAt(0).toString();
    }

}
