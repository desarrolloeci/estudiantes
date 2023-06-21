/*
 * BdEstmisc.java
 *
 * Created on 18 de octubre de 2006, 11:05 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package estudiantes.baseDatos;

import java.sql.*;
import java.net.*;
import java.util.*;
import java.io.*;

/**
 *
 * @author jgarcia
 */
public class BdEstmisc extends BaseDatos {
    
    /** Creates a new instance of BdEstfin */
    public BdEstmisc() {
    }
    
    public Vector getGrupo(String idg, String ide){
        String consulta = new String();        
        consulta = new String("select registro.grupo.id_asig, num_grupo, registro.grupo.id_profesor, " +
                " nom_prof, nom_asig, id_grupo " +
                " from registro.asignatura, registro.grupo, registro.profesor, registro.contenc " +
                " where id_grupo = idg and registro.asignatura.id_asig = registro.grupo.id_asig and " +
                " registro.grupo.id_profesor = registro.profesor.id_prof and id_grupo = " + idg + 
                " and ide = " + ide + " and res = 0 "  ) ; 
        return this.consultar(consulta, 6);                 
    }   
    
    public Vector getPortatil(String idEst){
        String consulta = new String();        
        consulta = new String("SELECT count(*) " +
                " FROM registro.portatiles  " +
                " WHERE idest = " + idEst + " "  ) ; 
        return this.consultar(consulta, 1);                 
    }   
    
    public Vector getNumSorteo(String idEst){
        String consulta = new String();        
        consulta = new String(" SELECT no_che from registro.estudiante " +
                " WHERE id_est = " + idEst) ; 
        return this.consultar(consulta, 1);                 
    } 
    
    public Vector getSecNumSorteo(){
        String consulta = new String();        
        consulta = new String(" SELECT max(convert(int, no_che))+1 from registro.estudiante " +
                " WHERE no_che is not null ") ; 
        return this.consultar(consulta, 1);                 
    }   
    
    public int setNumSorteo(String idEst, String numsort){
        String consulta = new String();        
        consulta = new String(" update registro.estudiante set no_che = '" + numsort + "' " +
                " where id_est = '" + idEst + "'") ; 
         return this.actualizar(consulta);             
    } 
    
    public Vector getlisSoftware(){
        String consulta = new String();        
        consulta = new String("Select ids, noms from registro.lissoftware  " +
                " where ids in (select ids from registro.softequipo ) " +
                " order by noms "  ) ; 
        return this.consultar(consulta, 2);                 
    }   

    public Vector getlisEncuesta(String id){
        String consulta = new String();        
        consulta = new String("select idg, nom_asig + ' Gr: ' + convert(varchar(5), num_grupo), opasig " +
                " from registro.contenc, registro.grupo, registro.asignatura " +
                " where idg = id_grupo and registro.grupo.id_asig = registro.asignatura.id_asig and " +
                " res = 0 and ide = " + id + " order by opasig, nom_asig" ) ;
        return this.consultar(consulta, 3);
    }   
    
    
    public Vector getlisEncuestaPosgrado(String id){
        String consulta = new String();        
        consulta = new String("select grupo, nom_asig + ' Gr: ' + convert(varchar(5), nro),id_encuestado,encuestas.encuestas.encuestado.id_enc, programa, encuestas.encuestas.encuestado.per_acad, tipo_enc , otro_prof, encuestas.encuestas.encuestado.n_grp" +
                " from encuestas.encuestas.encuestado, registro.grupo_post, registro.asignatura, encuestas.encuestas.encuestas, encuestas.encuestas.grpprof " +
                " where grupo = id_grp and registro.grupo_post.id_asig = registro.asignatura.id_asig and " +
                " encuestas.encuestas.encuestado.estado = 0 and documento = '" + id + "'  and  encuestas.encuestas.encuestado.id_enc=  encuestas.encuestas.encuestas.id_enc "  +
                " and encuestas.encuestas.encuestado.grupo = encuestas.encuestas.grpprof.id_grupo and encuestas.encuestas.encuestado.n_grp = encuestas.encuestas.grpprof.n_grp and encuestas.encuestas.grpprof.fecha_fin > getdate() order by  nom_asig" ) ;
        return this.consultar(consulta, 9);
    }  
    
     public Vector getRespuesta(String idEst, String idg){
        String consulta = new String();
  
          consulta=new String(" select count(*) from registro.contenc "  +
            " where ide = " + idEst + " and idg = " + idg + " and res = 0 ");     
        return this.consultar(consulta, 1);                 
    }
     

     
    public int insRespEncuesta(String idEst, String asig, String ngr, String prof, String resp, 
               String idgrp, String obs, String per, String vac){
        String consulta = new String();   
        int ret ;

        consulta = new String("insert into registro.respenc values ('" + per + "', " + prof + ", " +
                asig + ", " + ngr + ", '" + resp + "', '" + obs + "', " + vac + " )" ) ; 
        ret = this.actualizar(consulta);  
        if (ret > 0) {
            consulta = new String("update registro.contenc set res = 1 " +
                    " where ide = " + idEst + " and idg = " + idgrp + " " ) ; 
            return this.actualizar(consulta);           
        }
        return -1 ;
    }   
    
    public Vector consTurnos(String idEst){
        String consulta = new String();        
        consulta = new String("select iduso, convert(varchar(16), fuso, 121), cod_sal, nro, noms " +
            " from registro.usocomp, registro.lissoftware, registro.computador, registro.salones " +
            " where sala = id_sal and comp = ideq and fuso > getdate() and tipo = 'T' and " +
            " ids = soft and idusu = " + idEst + 
            " order by convert(varchar(16), fuso, 121) " ) ; 
        return this.consultar(consulta, 5);                 
    }   
    
    public Vector consSalas(){
        String consulta = new String();        
        consulta = new String("select iduso, convert(varchar(16), fuso, 121), cod_sal, 'Sala', noms " +
            " from registro.usocomp, registro.lissoftware, registro.salones " +
            " where comp = id_sal and fuso between getdate() and dateadd(day, 7, getdate()) and tipo = 'S' and ids = soft" +
            " order by convert(varchar(16), fuso, 121) " ) ; 
        return this.consultar(consulta, 5);                 
    }   
    
    public String getTurno(String fec, String hor, String soft, String depto) {   
        String consulta = new String();       
        String fform = new String(), dat = new String() ;
        Vector v = new Vector(), sal = new Vector() ;
        
        fform = fec + " " + hor ;
        consulta = new String("select min(ide) from registro.softequipo " +
                " where ids = " + soft + " and ide not in (select comp from registro.usocomp " +
                "   where tipo = 'T' and fuso = '" + fform + "' ) and " +
                "   ide in (select ideq from registro.computador, registro.salones" +
                "            where sala = id_sal and (dep = 0 or dep = " + depto + ") ) and " +
                " ide not in ( select ideq from registro.usocomp, registro.computador " +
                "   where comp = sala and tipo <> 'T' and fuso = '" + fform + "' ) "  ) ; 
        v = this.consultar(consulta, 1);
        if ( v.size() > 0 ) {
            sal = (Vector) v.elementAt(0) ;
            dat = (String) sal.elementAt(0) ;
            if (!dat.equals("No disponible"))
                return (String) sal.elementAt(0) ;
            else
                return "0" ;
        }
        return "0" ;
    }   

    public String getSala(String fec, String hor, String soft, String idsal) {   
        String consulta = new String();       
        String fform = new String(), dat = new String() ;
        Vector v = new Vector(), sal = new Vector() ;
        int cant ;
        
        fform = fec + " " + hor ;
        consulta = new String("select count(*) from registro.usocomp " +
                " where comp = " + idsal + " and tipo = 'S' and fuso = '" + fform + "' " ) ; 
        v = this.consultar(consulta, 1);        
        if ( v.size() > 0 ) {
            sal = (Vector) v.elementAt(0) ;
            cant = Integer.parseInt((String) sal.elementAt(0)) ;
            if (cant > 0)
                return "0" ;
            
            consulta = new String("select count(*) from registro.usocomp, registro.computador " +
                    " where comp = ideq and sala = " + idsal + " and tipo <> 'S' and fuso = '" + fform + "' " ) ; 
            v = this.consultar(consulta, 1);        
            if ( v.size() > 0 ) {
                sal = (Vector) v.elementAt(0) ;
                cant = Integer.parseInt((String) sal.elementAt(0)) ;
                if (cant > 5)
                    return "0" ;
            }       
        }        
        return "1" ;
    }   

    public int insTurno(String idEst, String eqt, String fec, String hor, String soft, String tipo){
        String consulta = new String();        
        String fform = new String() ;
        String id = new String() ;

        fform = fec + " " + hor ;
        id = sigSecuencia("TURNOCOMP") ;
        consulta = new String("insert into registro.usocomp values (" + id + ", " +
                eqt + ", " + idEst + ", getdate(), '" + fform + "', '" + tipo + "'," + soft + " )" ) ; 
        return this.actualizar(consulta);                 
    }   
    
    public int cancTurno(String idEst, String idt){
        String consulta = new String();        

        consulta = new String("delete registro.usocomp " +
                " where idusu = " + idEst + " and iduso = " + idt ) ; 
        return this.actualizar(consulta);                 
    }   

    public int regPortatil(String idEst, String mac, String marca, String ref, String prc){
        String consulta = new String();        
        consulta = new String("insert into registro.portatiles values (" +
                idEst + ", '" + mac + "', '" + marca + "', '" + ref + "', '" + prc + "', getdate(), null )" ) ; 
        return this.actualizar(consulta);                 
    }   

    public String regPortatilN(String idEst, String mac, String marca, String ref, String prc){
        String consulta = new String();   
        String dip = new String() ;
        Vector vresp = new Vector(), tmp = new Vector() ;
        int ret ;
        
        consulta = "select min(dip) from registro.portatiles where idest is null " ;
        vresp = this.consultar(consulta, 1) ;
        tmp = (Vector) vresp.elementAt(0) ;
        dip = (String) tmp.elementAt(0) ;
        
        consulta = "update registro.portatiles " +
                " set idest = " + idEst + ", dmac = '" + mac + "', marc = '" + marca + 
                "', ref = '" + ref + "', prc = '" + prc + "', freg = getdate() " +
                " where idest is null and dip = '" + dip + "' " ;
        ret = this.actualizar(consulta);                 
        if (ret > 0 )
            return dip ;
        else
            return "ND" ;
    }  
    
    public Vector getlisActas(){
        String consulta = new String();        
        consulta = new String("select idac, fte, nro, convert(varchar(10), fecha, 101) " +
            " from registro.registro.resactas " +
            " order by fte, fecha " ) ; 
        return this.consultar(consulta, 4);                 
    }   
    
    public Vector getActa(String id){
        String consulta = new String();        
        consulta = new String("select  fte, nro, convert(varchar(10), fecha, 101) , res " +
            " from registro.registro.resactas " +
            " where idac = " + id + " " ) ; 
        return this.consultar(consulta, 4);                 
    }
    
    public Vector getDepartamentos(){
        String consulta = new String();        
        consulta = new String(" select cd_dpol, nom_dpol from registro.dep_pol " ) ; 
        return this.consultar(consulta, 2);                 
    }
    
    public Vector getMunicipio(String id_dpto){
        String consulta = new String();        
        consulta = new String(" select id_ciu, nom_ciu " +
                " from registro.ciudades " +
                " where id_dpol = " + id_dpto + " " ) ; 
        return this.consultar(consulta, 2);                 
    }
}