/*
 * monitor.java
 *
 * Created on July 3, 2003, 3:16 PM
 */

package estudiantes.Estudiante;

/**
 *
 * @author  Administrador
 * @version 
 */
import java.util.* ;
import estudiantes.baseDatos.BdMonitor;
import estudiantes.configuracion.configECI;
import java.io.* ;


public class monitor {

    
    protected String numsol ; /* Solicitud */     
    protected Vector datosNumSol, IdAsig ; 
    protected Vector id_asig = new Vector();
    protected String idasig;
      
  public monitor () {
        numsol = new String() ;         
    }

     public monitor (String carnet, PrintWriter out) {
        BdMonitor  bdMon = new BdMonitor() ;
        configECI cfgEci = new configECI();
        bdMon.conectar(cfgEci.getUsuarioBdApolo(), cfgEci.getPasswdBdApolo());        
        this.datosNumSol = bdMon.Consultanumsol(carnet) ;
        bdMon.desconectar() ;
        
        if (datosNumSol.size() > 0){
            numsol = (String)((Vector)datosNumSol.elementAt(0)).elementAt(0) ;
                
        }
        else
            numsol = "0";
         //out.println("Monitor Datos: " + datosNumSol + "<br>") ;
     }
    
    public Vector getIdAsig( String idasig, PrintWriter out) {   
        BdMonitor  bdMon = new BdMonitor() ;
        configECI cfgEci = new configECI();  
        bdMon.conectar(cfgEci.getUsuarioBdApolo(), cfgEci.getPasswdBdApolo());        
        this.IdAsig = bdMon.Consultaidasig(idasig) ;
        bdMon.desconectar() ;
        /*if (IdAsig.size() == 0){
            id_asig.add("0");
            //id_asig  = "0";
            IdAsig = (Vector)id_asig;
           
                
        }*/
        //out.println("Tamano Idasigggg: " + IdAsig.size() + "<br>") ;
     return this.IdAsig;  
        }                   
     
  
     
   public String getNumSol(){
        return this.numsol ;
    }           
        
           
   public void setNumSol(String numsol){
        this.numsol = numsol ;
    }   
    
    
   
    
    
}



