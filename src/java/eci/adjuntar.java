/*
 * adjuntar.java
 *
 * Created on 16 de marzo de 2009, 02:19 PM
 */
package eci;

import java.io.*;
import java.rmi.RemoteException;
import java.text.DateFormat;
import java.util.*;
import java.lang.*;
import java.net.Authenticator;
import java.net.PasswordAuthentication;


public class adjuntar extends java.lang.Object {

    private String path = new String(); /*Path donde se crea el backup*/

    private String usuario; /*Nick Name del usuario*/

    private Vector archivos = new Vector(); /*Vector de archivos*/

    private Vector tamarch = new Vector();
    private Vector renameArchivo = new Vector();
    private Vector fecarch = new Vector();
    private File dirUsu;
   // String user = "docum";
    //String pass = "1docum321";

    public adjuntar(String nickName, String sPath) throws RemoteException {
        
        
        this.path = sPath;

        dirUsu = new File(path);
        //
        if (!dirUsu.exists()) {
            dirUsu.mkdir();
        } else {
            String[] archivos = dirUsu.list();
            for (int i = 0; i < archivos.length; i++) {
                /*  if (nickName.equals(archivos[i]) ){
                 rmArchivo(nickName);
                 }*/
                this.archivos.add(archivos[i]);
                File fichero = new File(path);
                Date fecha = new Date(fichero.lastModified());
                this.tamarch.add(Long.toString(fichero.length()));
                this.fecarch.add(Long.toString(fichero.lastModified()));
            }

        }
    }

    public adjuntar(String sPath) throws RemoteException {
        this.path = sPath;
        dirUsu = new File(path);
        if (!dirUsu.exists()) {
            dirUsu.mkdir();
        } else {
            String[] archivos = dirUsu.list();

            for (int i = 0; i < archivos.length; i++) {
                this.archivos.add(archivos[i]);
                File fichero = new File(path);
                Date fecha = new Date(fichero.lastModified());
                this.tamarch.add(Long.toString(fichero.length()));
                this.fecarch.add(Long.toString(fichero.lastModified()));
            }

        }
    }

    /**
     * @param int index Numero del Archivo
     * @return String Nombre del Archivo numero index
     * @exception Ninguna
     */
    /*RENOMBRAR EL ARCHIVO CON A SEGUIDO DEL NRODECARNET*/
    public String nomArchivo(String nombre) {
        /*File rmArch = new File(dirUsu.getAbsoluteFile() + "/" + archivos.elementAt(index));
         File na=new File(dirUsu.getAbsoluteFile() + "/" + newName);
         if(!na.exists()){
         boolean x = rmArch.renameTo(na);
         }*/
        File na = new File(dirUsu.getAbsoluteFile() + "/" + nombre);
        if (na.exists()) {
            return (nombre);
        } else {
            return "";
        }
        //return ((String)archivos.elementAt(index));
    }

    /**
     * @param void
     * @return int Numero de archivos que tiene el usuario para el backup
     * @exception Ninguna
     */
    public int nArchivos() {
        return archivos.size();
    }

    public void rmArchivo(String nomArch) {
        File rmArch = new File(dirUsu.getAbsoluteFile() + "/" + nomArch);
        rmArch.delete();
        archivos.remove(nomArch);
    }

    public void renameArchivo(String nomArch, String nickName) {
        File f1 = new File(nomArch);
        f1.renameTo(new File(nickName));
        // archivos.remove(nomArch);
    }

    public String tamarch(String nombre) {
        double tam;
        File na = new File(dirUsu.getAbsoluteFile() + "/" + nombre);
        if (na.exists()) {
            tam = na.length();
            tam = tam / 1024;
            if (tam > 1024) {
                tam = tam / 1024;
                tam = (double) Math.round(tam * 100) / 100;
                return Double.toString(tam) + " Mb";
            } else {
                tam = (double) Math.round(tam * 100) / 100;
                return Double.toString(tam) + " Kb";
            }
        } else {
            return "";
        }
        /*double tam;
         float dato = Integer.valueOf(tamarch.elementAt(index).toString()).intValue();
         tam = dato / 1024;
         tam = (double) Math.round(tam * 100) / 100;
         return Double.toString(tam);*/
    }

    public String tamarchH(int index) {
        double tam;
        float dato = Integer.valueOf(tamarch.elementAt(index).toString()).intValue();
        tam = dato / 1024;
        if (tam > 1024) {
            tam = tam / 1024;
            tam = (double) Math.round(tam * 100) / 100;
            return Double.toString(tam) + " Mb";
        } else {
            tam = (double) Math.round(tam * 100) / 100;
            return Double.toString(tam) + " Kb";
        }
    }

    public String tamtot() {
        double tam;
        float tot = 0;
        int i;
        for (i = 0; i < tamarch.size(); i++) {
            tot = tot + Integer.valueOf(tamarch.elementAt(i).toString()).intValue();
        }
        tam = tot / 1024;
        tam = (double) Math.round(tam * 100) / 100;
        return Double.toString(tam);
    }

    public String tamtotH() {
        double tam;
        float tot = 0;
        int i;
        for (i = 0; i < tamarch.size(); i++) {
            tot = tot + Integer.valueOf(tamarch.elementAt(i).toString()).intValue();
        }
        tam = tot / 1024;
        if (tam > 1024) {
            tam = tam / 1024;
            tam = (double) Math.round(tam * 1000) / 1000;
            return Double.toString(tam) + " Mb";
        } else {
            tam = (double) Math.round(tam * 100) / 100;
            return Double.toString(tam) + " Kb";
        }
    }

    public void totArchivo() {
        for (int i = 0; i < archivos.size(); i++) {
            File rmArch = new File(dirUsu.getAbsoluteFile() + "/" + archivos.elementAt(i));
            rmArch.delete();
        }
        //archivos.remove(archivos.elementAt(i));
    }

    public long fecArchivo(String nombre) {
        File na = new File(dirUsu.getAbsoluteFile() + "/" + nombre);
        long fecha;
        if (na.exists()) {
            fecha = na.lastModified();
            return fecha;
        } else {
            return 0;
        }

        //   return Long.parseLong(fecarch.elementAt(index).toString());
        //archivos.remove(archivos.elementAt(i));
    }

    public void setPath(String sPath) {
        this.path = sPath;
    }

    public String nomArchivo(int j) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    

    
}


