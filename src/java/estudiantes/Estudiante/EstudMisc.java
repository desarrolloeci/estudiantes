/*
 * EstudMisc.java
 *
 * Created on 18 de octubre de 2006, 11:07 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package estudiantes.Estudiante;

import java.io.* ;
import java.util.Vector ;
import estudiantes.baseDatos.BdEstmisc;
import estudiantes.configuracion.configECI;

/**
 *
 * @author jgarcia
 */
public class EstudMisc {

    protected String idEst  ; /* Identificador del estudiante */     
    
    /** Creates a new instance of EstudFin */

    public EstudMisc(String id) {
        idEst = new String(id) ;
    }
    
    public EstudMisc() {
        idEst = "0" ;
    }
    
    public int getPortatil() {   
        Vector datos = new Vector() ;
        Integer tmp = new Integer(0) ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        datos = bdEst.getPortatil(idEst) ; 
        bdEst.desconectar() ;    
        tmp = new Integer(((String) ((Vector) datos.elementAt(0)).elementAt(0))) ;
        return tmp.intValue() ;
    }           
    
    public Vector getGrupo(String idg) {   
        Vector datos = new Vector() ;
        Vector tmp = new Vector() ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        datos = bdEst.getGrupo(idg, idEst) ; 
        bdEst.desconectar() ;    
        if (datos.size() > 0 ) {
            tmp = (Vector) datos.elementAt(0) ;
            return tmp ;
        }
        return null ;
    }           
    
    public String getNumSorteo() {  
        Vector datos = new Vector(), tmp = new Vector() ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        datos = bdEst.getNumSorteo(idEst) ; 
        tmp = (Vector)datos.elementAt(0) ;
        bdEst.desconectar();
        return tmp.elementAt(0).toString();
    }
    
    public String setNumSorteo() {  
        int resp;
        String num;
        Vector datos = new Vector(), tmp = new Vector() ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        datos = bdEst.getSecNumSorteo() ; 
        tmp = (Vector)datos.elementAt(0) ;
        num = tmp.elementAt(0).toString();
        if(num.equals("No disponible"))
            num = "1";
        resp = bdEst.setNumSorteo(idEst, num) ; 
        bdEst.desconectar() ; 
        return num ;
    }           

    public String regPortatil(String mac, String marca, String ref, String prc) {   
        Vector lispreins = new Vector() ;
        String dip = new String() ;
        
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
//        bdEst.regPortatil(idEst, mac, marca, ref, prc) ;
        dip = bdEst.regPortatilN(idEst, mac, marca, ref, prc) ;
        bdEst.desconectar() ;     
        return dip ;
    }
    
    public Vector getlisSoftware() {   
        Vector datos = new Vector() ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        datos = bdEst.getlisSoftware() ; 
        bdEst.desconectar() ;    
        return datos ;
    }           

    public Vector getlisEncuestas() {   
        Vector datos = new Vector() ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        datos = bdEst.getlisEncuesta(idEst) ; 
        bdEst.desconectar() ;    
        return datos ;
    }           
    
    public Vector getlisEncuestaPosgrado() {   
        Vector datos = new Vector() ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        datos = bdEst.getlisEncuestaPosgrado(idEst) ; 
        bdEst.desconectar() ;    
        return datos ;
    }  
    
    
    
    
    public int ingEncuesta(String idgrp, String ngrp, String prof, String asig, String obs, String resp,
            String vacum) {   
        Vector dat = new Vector(), tmp = new Vector() ;
        int ret = 0 ;
        
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());  
        dat = bdEst.getRespuesta(idEst, idgrp) ;
        tmp = (Vector) dat.elementAt(0) ;
        if (Integer.parseInt((String) tmp.elementAt(0)) > 0 )
            ret = bdEst.insRespEncuesta(idEst, asig, ngrp, prof, resp, idgrp, obs, cfgEci.getPeriodoHor(),
                                        vacum) ;
        else
            ret = -1 ;
        bdEst.desconectar() ;     
        return ret ;
    }
    
    public Vector getlisTurnos() {   
        Vector datos = new Vector() ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        datos = bdEst.consTurnos(idEst) ; 
        bdEst.desconectar() ;    
        return datos ;
    }           
    
    public Vector getlisSalas() {   
        Vector datos = new Vector() ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        datos = bdEst.consSalas() ; 
        bdEst.desconectar() ;    
        return datos ;
    }           
    
    public String getTurno(String fec, String hor, String soft, String depto) {   
        Vector lispreins = new Vector() ;
        String eqt = new String() ;
        int ret = 0 ;
        
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        eqt = bdEst.getTurno(fec, hor, soft, depto) ;
        if ( !eqt.equals("0") ) {
            ret = bdEst.insTurno(idEst, eqt, fec, hor, soft, "T") ;
        }
        bdEst.desconectar() ;   
        if (ret == 0)
            return "0" ;
        return eqt ;
    }                     
    
    public String getSala(String fec, String hor, String soft, String sala) {   
        Vector lispreins = new Vector() ;
        String eqt = new String() ;
        int ret = 0 ;
        
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        eqt = bdEst.getSala(fec, hor, soft, sala) ;
        if ( eqt.equals("1") ) {
            ret = bdEst.insTurno(idEst, sala, fec, hor, soft, "S") ;
        }
        bdEst.desconectar() ;   
        if (ret == 0)
            return "0" ;
        return eqt ;
    }                     
    
    public void cancelTurnos(Vector lista) {   
        int k = 0 ;
        Vector turno = new Vector() ;
        
        if (lista.size() <= 0)
            return ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());        
        for (k = 0; k < lista.size(); k++ ) {        
            bdEst.cancTurno(idEst, (String)lista.elementAt(0) ) ;
        }
        bdEst.desconectar() ;     
        return ; 
    }      
    
    public Vector getActa(String idact) {   
        Vector datos = new Vector() ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());    
        if (idact.equals("0"))
            datos = bdEst.getlisActas() ; 
        else
            datos = bdEst.getActa(idact) ; 
        bdEst.desconectar() ;    
        return datos ;
    }                     
    
    public Vector getDepartamentos() {   
        Vector datos = new Vector() ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());    
        datos = bdEst.getDepartamentos(); 
        bdEst.desconectar() ;    
        return datos ;
    } 
    
    public Vector getMunicipios(String id_dpto) {   
        Vector datos = new Vector() ;
        BdEstmisc bdEst = new BdEstmisc() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());    
        datos = bdEst.getMunicipio(id_dpto); 
        bdEst.desconectar() ;    
        return datos ;
    }
}
