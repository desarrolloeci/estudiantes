/*
 * BdActas.java
 *
 * Created on 12 de julio de 2006, 11:20 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package estudiantes.baseDatos;

import java.util.*;

import estudiantes.configuracion.configECI;
/**
 *
 * @author alexgz
 */
public class BdActas extends BaseDatos{
    
    configECI cfgEci = new configECI();
    /** Creates a new instance of BdActas */
    public BdActas() {
    }
    
    public Vector consInfoActa(String idEst){
        String consulta = new String();
        consulta=new String(" select clanum, cod_dpto, nom_dpto, nom_est, nom_acud, valren, firma, " +
                "paz_y_salvo, dtur, estado, pilopaga " +
                "from  registro.estudiante, registro.departamento, registro.actasmat " +
                "where registro.estudiante.id_dpto = registro.departamento.id_dpto and " +
                "registro.estudiante.id_est = registro.actasmat.id_est and " +
                "per_acad = '" + cfgEci.getPeriodoHor() + "' and registro.estudiante.id_est = " + idEst);
        return this.consultar(consulta, 11);
    }
    
    public int getActaIntermedio(String idEst, String per){
        
        String consulta = new String();
        
        Vector conact = new Vector() ;
        Vector datact = new Vector() ;
        consulta=new String(" select count(*) " +
                "from  registro.actasmat " +
                "where firma <> 'NF' and per_acad = '" + per + "' and id_est = " + idEst);
        conact = this.consultar(consulta, 1);  
        datact = (Vector)conact.elementAt(0);
        return Integer.parseInt(datact.elementAt(0).toString()) ;
    }
    
    public int actInfoActa(String codEst, String firma, String obs){
        String consulta = new String();
        consulta=" update registro.actasmat set firma = '" + firma + "-' + convert(varchar(20), getdate()), obse = '" + obs + "' " + "where id_est = " + codEst + " and per_acad = '" + cfgEci.getPeriodoHor() + "' ";
        return this.actualizar(consulta);                 
    }


    public int actInfoActaInter(String codEst, String per){
        String consulta = new String();
        consulta=" insert into registro.actasmat (id_est, per_acad, firma, obse) "+
     " values (" + codEst + ", '" + per + "', '100000--' + convert(varchar(20), getdate()), null) ";
        
        return this.actualizar(consulta);               
    }
    
    public long inserteCanc(String codEst, String codAsig, String razon){
        String consulta = new String();
        Vector datos = new Vector() ;
        Vector fila = new Vector() ;
        String razp = new String(""), res = new String("1") ;
        int rep = 0 ;
        long idAsig = 0, idReg = 0, idGrp = 0, asvis = 0;
        
        //Consultamos lainformación del registro a cancelar
        consulta=new String( "select registro.grupo.id_asig, id_reg, registro.grupo.id_grupo, as_vis " +
            " from registro.registro, registro.grupo, registro.asignatura " +
            " where registro.registro.id_grupo = registro.grupo.id_grupo and " +
            "   registro.grupo.id_asig = registro.asignatura.id_asig and cod_asig = '" + codAsig + "' " +
            "   and id_est = " + codEst + " " );
        datos =  this.consultar(consulta, 4);  
        if (datos.size() > 0) {
            fila = (Vector) datos.elementAt(0) ;
            idAsig = Long.parseLong((String) fila.elementAt(0)) ;
            idReg = Long.parseLong((String) fila.elementAt(1)) ;
            idGrp = Long.parseLong((String) fila.elementAt(2)) ;
           // asvis = Long.parseLong((String) fila.elementAt(3)) ;
        } else {
            return -1 ;
        }
            
        //Consultamos las repetidas o canceladas
        consulta=new String( "select count(nota) from registro.biblia_def " +
            " where (id_est = " + codEst + ") and (id_asig = " + idAsig + " or as_vis = " + idAsig + ") and " +
            "       ( nota < 30 and clave <> 'R' ) " );
        datos =  this.consultar(consulta, 1);  
        if (datos.size() > 0) {
            fila = (Vector) datos.elementAt(0) ;
            rep = Integer.parseInt((String) fila.elementAt(0)) ;
        }
        if (rep > 0) {
            razp = "Asignatura Cancelada o Repetida" ;
            res = "0" ;
        }
        if (asvis == 3211 || asvis == 3224 || asvis == 3324 || asvis == 3325 || asvis == 9059 || 
            asvis == 9060 || asvis == 8863 || asvis == 8864 || asvis == 8865 || asvis == 8866 ||
            asvis == 9334 || asvis == 9335 ) {
            razp = "Asignatura Electiva" ;
            res = "0" ;
        }
        
        consulta = new String("insert into registro.aprob_reg " +
            " (id_reg, id_est, id_grupo, per_acad, estado, tipapr, raz_est, respuesta, fec, razon) " +
            " values (" + idReg + ", " + codEst + ", " + idGrp + ", '" + cfgEci.getPeriodoActual() + 
            "', 0, 4, '" + razon + "', 'N', getdate(), '" + razp + "' )  ") ;
        int ret = this.actualizar(consulta);      
        if ( ret > 0 )
            return idReg;
        else
            return 0;
    }
    
    public String inserteCance(String codEst, String codAsig, String razon){
        String consulta = new String();
        String consulta1 = new String();
        Vector datos = new Vector() ;
        Vector fila = new Vector() ;
        String razp = new String(""), res = new String("1") ;
        int rep = 0 ;
        long idAsig = 0, idReg = 0, idGrp = 0, asvis = 0;
        
        //Consultamos lainformación del registro a cancelar
        consulta=new String( "select registro.grupo.id_asig, id_reg, registro.grupo.id_grupo, as_vis " +
            " from registro.registro, registro.grupo, registro.asignatura " +
            " where registro.registro.id_grupo = registro.grupo.id_grupo and " +
            "   registro.grupo.id_asig = registro.asignatura.id_asig and cod_asig = '" + codAsig + "' " +
            "   and id_est = " + codEst + " " );
        datos =  this.consultar(consulta, 4);  
        if (datos.size() > 0) {
            fila = (Vector) datos.elementAt(0) ;
            idAsig = Long.parseLong((String) fila.elementAt(0)) ;
            idReg = Long.parseLong((String) fila.elementAt(1)) ;
            idGrp = Long.parseLong((String) fila.elementAt(2)) ;
            asvis = Long.parseLong((String) fila.elementAt(3)) ;
        } else {
            return consulta;//"-1" ;
        }
        consulta1 = consulta;  
        //Consultamos las repetidas o canceladas
        consulta=new String( "select count(nota) from registro.biblia_def " +
            " where (id_est = " + codEst + ") and (id_asig = " + idAsig + " or as_vis = " + idAsig + ") and " +
            "       ( nota < 30 and clave <> 'R' ) " );
        datos =  this.consultar(consulta, 1);  
        if (datos.size() > 0) {
            fila = (Vector) datos.elementAt(0) ;
            rep = Integer.parseInt((String) fila.elementAt(0)) ;
        }
        consulta1 = consulta1 + "<br>***" + consulta;
        if (rep > 1) {
            razp = "Asignatura Cancelada o Repetida" ;
            res = "0" ;
        }
        if (asvis == 3211 || asvis == 3224 || asvis == 3324 || asvis == 3325 || asvis == 9059 || 
            asvis == 9060 || asvis == 8863 || asvis == 8864 || asvis == 8865 || asvis == 8866 ||
            asvis == 9334 || asvis == 9335 ) {
            razp = "Asignatura Electiva" ;
            res = "0" ;
        }
        
        consulta = new String("insert into registro.aprob_reg " +
            " (id_reg, id_est, id_grupo, per_acad, estado, tipapr, raz_est, respuesta, fec, razon) " +
            " values (" + idReg + ", " + codEst + ", " + idGrp + ", '" + cfgEci.getPeriodoActual() + 
            "', '0', 4, '" + razon + "', 'N', getdate(), '" + razp + "' )  ") ;
        consulta1 = consulta1 + "<br>***" + consulta;
        return consulta1;                 
    }
}
