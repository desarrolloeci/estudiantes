/*
 * Documento.java
 *
 * Created on 7 de julio de 2006, 02:42 PM
 */

package eci.servlets.documentos ;

import java.io.* ;

public class Documento {
    private String nomDoc;   
    private String nomResp;   
    private java.sql.Date fecCre;   
    private java.sql.Date fecUlt; 
    private String camino;   
    private String titulo;   
    private String resumen;   
    private String nomDep; 
	
    public Documento (	String nom_doc, String nom_resp,   
                        String camino, String titulo,   
                        String resumen, String nom_dep,
                        java.sql.Date fec_cre,
                        java.sql.Date fec_ult) {
        nomDoc = new String(nom_doc) ;
        nomResp = new String(nom_resp) ;
        fecCre = fec_cre ;
        fecUlt = fec_ult ;
        this.camino = new String(camino) ;
        this.titulo = new String(titulo) ;
        this.resumen = new String(resumen) ;
        nomDep = new String(nom_dep) ;	
    }

    public String getNombre () {
        return nomDoc ;
    }

    public String getDependencia () {
        return nomDep ;
    }

    public String getTitulo () {
        return titulo ;
    }
    public String getCamino () {
        return camino ;
    }
    public String getResumen () {
        return resumen ;
    }

    public java.sql.Date getCreacion () {
        return fecCre ;
    }

    public java.sql.Date getModificacion () {
        return fecUlt ;
    }
}