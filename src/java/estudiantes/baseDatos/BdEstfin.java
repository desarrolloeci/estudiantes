/*
 * BdEstfin.java    
 *
 * Created on 17 de julio de 2006, 03:07 PM
 *
 * Contiene las sentencias a la base de datos para para las operaciones
 * financieras de los estudiantes.
 */

package estudiantes.baseDatos;

import java.util.Vector;

/**
 *
 * @author jgarcia
 */
public class BdEstfin extends BaseDatos {
    
    /** Creates a new instance of BdEstfin */
    public BdEstfin() {
    }

    public Vector getAsigPagar(String idEst){
        String consulta = new String();        
        consulta = new String("SELECT registro.asignatura.id_asig, cod_asig, nom_asig, " +
                " num_ulas_c * registro.defcoho.vrcred, registro.biblia_post.pag, nrref, id_bib  " +
                " FROM registro.asignatura, registro.biblia_post, registro.estudiante, " +
                "      registro.defcoho, registro.ordenes  " +
                " WHERE ( registro.asignatura.id_asig = registro.biblia_post.id_asig ) and  " +
                "       ( registro.ordenes.id_est = registro.estudiante.id_est ) and  " +
                "       ( registro.biblia_post.idord = registro.ordenes.id_ord ) and  " +
                "       ( registro.biblia_post.id_est = registro.estudiante.id_est ) and  " +
                "       ( registro.estudiante.id_plan = registro.defcoho.idplan ) and  " +
                "       ( registro.estudiante.semnv = registro.defcoho.nco ) and " +
                "       ( registro.estudiante.id_est = " + idEst + " ) and " +
                "       ( registro.biblia_post.pag in (0, -1) and val_pag = 0 )  " ) ; 
        return this.consultar(consulta, 7);                 
    }   
    
    public Vector getvalpagp(String idEst){
        String consulta = new String();        
        consulta = new String("SELECT doc_est, registro.estudiante.nom_est, registro.estudiante.id_est, " +
                " nrref, id_ord, convert(int, sum(num_ulas_c * registro.defcoho.vrcred)) ,  " +
                " datediff(day, fec_lim,  getdate()), convert(int, 1.05 * sum(num_ulas_c * registro.defcoho.vrcred)) " +
                " FROM registro.asignatura, registro.biblia_post, registro.estudiante, " +
                "      registro.defcoho, registro.ordenes  " +
                " WHERE ( registro.asignatura.id_asig = registro.biblia_post.id_asig ) and  " +
                "       ( registro.ordenes.id_est = registro.estudiante.id_est ) and  " +
                "       ( registro.biblia_post.idord = registro.ordenes.id_ord ) and  " +
                "       ( registro.biblia_post.id_est = registro.estudiante.id_est ) and  " +
                "       ( registro.estudiante.id_plan = registro.defcoho.idplan ) and  " +
                "       ( registro.estudiante.semnv = registro.defcoho.nco ) and " +
                "       ( registro.estudiante.id_est = " + idEst + " ) and " +
                "       ( registro.biblia_post.pag = 0 ) and (val_pag = 0 ) " +
                " GROUP BY doc_est, registro.estudiante.nom_est, registro.estudiante.id_est, " +
                "          nrref, id_ord , fec_lim " ) ; 
        return this.consultar(consulta, 8);                 
    }   
    
    public Vector getOrden(String idEst, String perOrd){
        String consulta = new String();        
        consulta = new String("SELECT doc_est, registro.estudiante.nom_est, registro.estudiante.id_est, nrref, id_ord, " +
                " convert(int, val_tot), datediff(day, fec_lim, getdate()), convert(int,(val_der * 1.05) + (val_tot - val_der)), " +
                " val_der - (por_dto + valfin), por_dto, valfin, blq " +
                " FROM registro.estudiante, registro.ordenes  " +
                " WHERE ( registro.ordenes.id_est = registro.estudiante.id_est ) and  " +
                "       ( registro.estudiante.id_est = " + idEst + " ) and " +
                "       ( estado > 0 or estado in (-60, -61) ) and " +
                "       ( per_acad = '" + perOrd + "' and val_pag = 0 ) and registro.estudiante.id_est not in " +
                "           (select idest from registro.saldopendiente) "  ) ; 
        return this.consultar(consulta, 12);                 
    }   

    public Vector getvalpagpse(String idEst){
        String consulta = new String();        
        consulta = new String("select per_acad, nrref, ret, trsta, fecban, bancod, val, nroaut " +
                " from registro.pagopse, registro.ordenes " +
                " where id_ord = idord and ret = 'Success' and id_est = " + idEst +
                " order by per_acad DESC ") ; 
        return this.consultar(consulta, 8);                 
    }   
    
    public int actpgasigp(String idEst, String id, String val){
        String consulta = new String();        
        consulta = new String("update registro.biblia_post " +
                "  set pag = " + val +
                "  where id_bib = " + id + " and id_est = " + idEst + " " ) ; 
        return this.actualizar(consulta);                 
    }   
    
    
    public Vector getValDerGrad(){
        String consulta = new String();
        consulta = new String(" select descpar from registro.parprogramas where idprg = 10000 ");
        return this.consultar(consulta, 1);
    }
    
    public int confordp(String ord, String retc, String trsta, String fecb, String codb, String nach, 
                        String naut, String val){
        String consulta = new String(); 
        int    ret, valdg ;
        consulta = new String("insert into registro.pagopse " +
                "  (idord, ret, trsta, fecban, bancod, nach, val, nroaut) " +
                "  values (" + ord + ", '" + retc + "', '" + trsta + "', '" + fecb + "', '" + codb + "', " +
                " '" + nach + "', " + val + ", " + naut + ") " ) ; 
        ret = this.actualizar(consulta);
        consulta = new String(" select idinsc from registro.pginscrip " +
                " where idinsc = '" + ord + "' " ) ; 
        Vector insc = this.consultar(consulta, 1);
        //Pago derechos de grado
        String numcarne = ord.substring(0, ord.length() - 1);
        consulta = new String(" select id_est from registro.estudiante " +
                " where igrad = 'O' and id_est = '" + numcarne + "' " ) ; 
        Vector dergrad = this.consultar(consulta, 1);
        ///
        if(insc.size()>0){
            if ( (retc.toLowerCase()).equals("success") && (trsta.toLowerCase()).equals("ok") ) {
                consulta = new String("update registro.pginscrip set vrpag = " + val + " , fecp = getdate() " +
                        "  where idinsc = '" + ord + "' and vrpag = 0 " ) ; 
                ret = this.actualizar(consulta);
            }
        }else{
            if(dergrad.size()>0){
                Vector valderg = getValDerGrad();
                valderg = (Vector)valderg.elementAt(0);
                int valdergrad = Integer.parseInt(valderg.elementAt(0).toString());
                if ( (retc.toLowerCase()).equals("success") && (trsta.toLowerCase()).equals("ok") ) {
                    consulta = new String(" insert into registro.pagodg " +
                        "  (idpago, idest, valor, lugpago, fecpago, banco, feclocal) " +
                        "  values (" + ord + ", " + numcarne + ", '" + val + "', 'PSE', '" + fecb + "', '" + codb + "', getdate() ) " ) ; 
                    ret = this.actualizar(consulta);
                    valdg = Integer.parseInt(val);
                    if(valdg >= valdergrad ){
                        consulta = new String("update registro.estudiante set igrad = 'P' " + 
                            "  where id_est = " + numcarne + " " ) ; 
                        ret = this.actualizar(consulta);
                    }
                }
            }else{
                if ( (retc.toLowerCase()).equals("success") && (trsta.toLowerCase()).equals("ok") ) {
                    consulta = new String("update registro.biblia_post set pag = " + naut +
                            "  where idord = " + ord + " and pag = 0 " ) ; 
                    ret = this.actualizar(consulta);  
                    consulta = new String("update registro.ordenes set val_pag = " + val + " , lug_pago = 'PSE'  " +
                            "  where id_ord = " + ord  ) ; 
                    ret = this.actualizar(consulta);  
                    consulta = new String("update registro.plan_pagos set val_real = " + val + " , lug = 'P',  " +
                            " fec_real = getdate(), val_ban = " + val + " , v_efe = " + val + 
                            " where cuota = 1 and id_ord = " + ord  ) ; 
                    ret = this.actualizar(consulta);  
                }
            }
        }
        return ret;
    }
    
    public int confpagoonline(String ord, String retc, String trsta, String fecb, String codb, String nach, 
                        String naut, String val, String mediopg, String cus){
        String consulta = new String(); 
        int    ret, valdg, retn ;
        consulta = new String("insert into registro.pagopse " +
                "  (idord, ret, trsta, fecban, bancod, nach, val, nroaut, mediopg, cus) " +
                "  values (" + ord + ", '" + retc + "', '" + trsta + "', '" + fecb + "', '" + codb + "', " +
                " '" + nach + "', " + val + ", " + naut + ", " + mediopg + ", '" + cus + "') " ) ; 
        ret = this.actualizar(consulta);
        
        String nada = consulta;
        nada.replace("'", "*");
        retn = this.actualizar(" insert into registro.logadmitidos (idlog, texto) values ('3', '" + nada + "') ");
        
        consulta = new String(" select idinsc from registro.pginscrip " +
                " where idinsc = '" + ord + "' " ) ; 
        Vector insc = this.consultar(consulta, 1);
        //Pago derechos de grado
        String numcarne = ord.substring(0, ord.length() - 1);
        consulta = new String(" select id_est from registro.estudiante " +
                " where igrad = 'O' and id_est = '" + numcarne + "' " ) ; 
        Vector dergrad = this.consultar(consulta, 1);
        ///
        if(insc.size()>0){
            if ( retc.equals("4")) {
                consulta = new String("update registro.pginscrip set vrpag = " + val + " , fecp = getdate() " +
                        "  where idinsc = '" + ord + "' and vrpag = 0 " ) ; 
                ret = this.actualizar(consulta);
            }
        }else{
            if(dergrad.size()>0){
                Vector valderg = getValDerGrad();
                valderg = (Vector)valderg.elementAt(0);
                int valdergrad = Integer.parseInt(valderg.elementAt(0).toString());
                if ( retc.equals("4") ) {
                    consulta = new String(" insert into registro.pagodg " +
                        "  (idpago, idest, valor, lugpago, fecpago, banco, feclocal) " +
                        "  values (" + ord + ", " + numcarne + ", '" + val + "', 'PSE', '" + fecb + "', '" + codb + "', getdate() ) " ) ; 
                    ret = this.actualizar(consulta);
                    valdg = Integer.parseInt(val);
                    if(valdg >= valdergrad ){
                        consulta = new String("update registro.estudiante set igrad = 'P' " + 
                            "  where id_est = " + numcarne + " " ) ; 
                        ret = this.actualizar(consulta);
                    }
                }
            }else{
                if ( retc.equals("4") ) {
                    consulta = new String("update registro.biblia_post set pag = " + naut +
                            "  where idord = " + ord + " and pag = 0 " ) ; 
                    ret = this.actualizar(consulta);  
                    consulta = new String("update registro.ordenes set val_pag = " + val + " , lug_pago = 'PSE'  " +
                            "  where id_ord = " + ord  ) ; 
                    ret = this.actualizar(consulta);  
                    consulta = new String("update registro.plan_pagos set val_real = " + val + " , lug = 'P',  " +
                            " fec_real = getdate(), val_ban = " + val + " , v_efe = " + val + 
                            " where cuota = 1 and id_ord = " + ord  ) ; 
                    ret = this.actualizar(consulta);  
                }
            }
        }
        return ret;
    }
    
    /*public int confpagoonline(String usid, String estado_pol, String riesgo, String codigo_respuesta_pol, String ref_venta, String ref_pol, 
                String firma, String extra1, String extra2, String medio_pago, String tipo_medio_pago, String cuotas, String valor, 
                String valorAdicional, String moneda, String fecha_transaccion, String codigo_autorizacion, String cus, 
                String banco_pse, String iva){
        String consulta = new String(); 
        int    ret = 0, valdg ;
        consulta = new String("insert into registro.pagopse " +
                "  (idord, ret, trsta, fecban, bancod, nach, val, nroaut) " +
                "  values (" + ord + ", '" + retc + "', '" + trsta + "', '" + fecb + "', '" + codb + "', " +
                " '" + nach + "', " + val + ", " + naut + ") " ) ; 
        ret = this.actualizar(consulta);
        consulta = new String(" select idinsc from registro.pginscrip " +
                " where idinsc = '" + ord + "' " ) ; 
        Vector insc = this.consultar(consulta, 1);
        //Pago derechos de grado
        String numcarne = ord.substring(0, ord.length() - 1);
        consulta = new String(" select id_est from registro.estudiante " +
                " where igrad = 'O' and id_est = '" + numcarne + "' " ) ; 
        Vector dergrad = this.consultar(consulta, 1);
        ///
        if(insc.size()>0){
            if ( (retc.toLowerCase()).equals("success") && (trsta.toLowerCase()).equals("ok") ) {
                consulta = new String("update registro.pginscrip set vrpag = " + val + " , fecp = getdate() " +
                        "  where idinsc = '" + ord + "' and vrpag = 0 " ) ; 
                ret = this.actualizar(consulta);
            }
        }else{
            if(dergrad.size()>0){
                Vector valderg = getValDerGrad();
                valderg = (Vector)valderg.elementAt(0);
                int valdergrad = Integer.parseInt(valderg.elementAt(0).toString());
                if ( (retc.toLowerCase()).equals("success") && (trsta.toLowerCase()).equals("ok") ) {
                    consulta = new String(" insert into registro.pagodg " +
                        "  (idpago, idest, valor, lugpago, fecpago, banco, feclocal) " +
                        "  values (" + ord + ", " + numcarne + ", '" + val + "', 'PSE', '" + fecb + "', '" + codb + "', getdate() ) " ) ; 
                    ret = this.actualizar(consulta);
                    valdg = Integer.parseInt(val);
                    if(valdg >= valdergrad ){
                        consulta = new String("update registro.estudiante set igrad = 'P' " + 
                            "  where id_est = " + numcarne + " " ) ; 
                        ret = this.actualizar(consulta);
                    }
                }
            }else{
                if ( (retc.toLowerCase()).equals("success") && (trsta.toLowerCase()).equals("ok") ) {
                    consulta = new String("update registro.biblia_post set pag = " + naut +
                            "  where idord = " + ord + " and pag = 0 " ) ; 
                    ret = this.actualizar(consulta);  
                    consulta = new String("update registro.ordenes set val_pag = " + val + " , lug_pago = 'PSE'  " +
                            "  where id_ord = " + ord  ) ; 
                    ret = this.actualizar(consulta);  
                    consulta = new String("update registro.plan_pagos set val_real = " + val + " , lug = 'P',  " +
                            " fec_real = getdate(), val_ban = " + val + " , v_efe = " + val + 
                            " where cuota = 1 and id_ord = " + ord  ) ; 
                    ret = this.actualizar(consulta);  
                }
            }
        }
        return ret;
    }*/
}
