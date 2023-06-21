package estudiantes.baseDatos;

import java.sql.*;
import java.net.*;
import java.util.*;
import java.io.*;

//import intraeci.Estudiante.Estudiante;
//import intraeci.util.Fecha;
//import intraeci.rechum.Empleado;
//import estudiantes.configuracion.configECI;

/** Esta clase ha sido creada para realizar consultas y actualizaciones
	a la tabla de Estudiantes. */
public class BdEstudianteadm extends BaseDatos {

    //configECI cfgEci = new configECI();  
     /** Crea una instancia del objeto base de datos para ser usada por otros
     * objetos. Coloca el numero de registros en -1 y no hay conexion aun :
     * conectado = false
     */
    public BdEstudianteadm () {
        super () ;
       // this.dbUrl = "jdbc:freetds:sqlserver://10.1.0.237/REGISTRO" ;
    }
       
    public Vector ConsultaEstReint(String idEst){
        String consulta = new String();
  
   
        consulta=new String(" select id_est, nom_est, tip_doc, doc_est, dir_corr, ciu_corr, tel_corr, " +
            "id_dpto, lug_exp, nom_acud, dir_acud, tel_acud, nom_otr, dir_otr, tel_otr, estado, dtur, clanum, tip_est, valren, sem_est, par_acud, bas_pru, emails, sem_est, tip_viv, avaluo_com, estrato, patrimonio "  +
            " from registro.registro.estudiante "  +
            " where doc_est = " + idEst + " or id_est= "+ idEst +" ");     
   
        return this.consultar(consulta, 29);                 
    }
 
/*    public Vector ConsultaResp(String idEst){
        String consulta = new String();
     
        consulta=new String(" select tip_res, vive_res " +
            " from registro.registro.responsable "  +
            " where id_est= "+ idEst +" ");     
   
        return this.consultar(consulta, 2);                 
    } */   
    
     public Vector ConsultaAdmitido(String docEst){
        String consulta = new String();
  
          consulta=new String(" select  nom_est, id_dpto, estado " +
            " from registro.registro.estudiante "  +
            " where doc_est = " + docEst + " and per_ing= '2003-2' ");     
   
        return this.consultar(consulta, 3);                 
    }
    
    public Vector ConsultaCiudad(String ciudad, String lugexp){
        String consulta = new String();     
       
        consulta=new String(" select nom_ciu "  +
            " from registro.registro.ciudades "  +
            " where id_ciu = " + ciudad + " or  id_ciu = " + lugexp + "  ");     
        
        return this.consultar(consulta, 1);                 
    }
     
    
    public Vector ConsultaPadres(String carnet){
        String consulta = new String();     
       
        consulta=new String(" select tip_res, nom_res, dir_res, tel_res, dir_acti, lug_res, tel_acti, ciu_tra, carg_res, edu_res, vive_res, id_res, ren_liq, ingreso "  +
            " from registro.registro.responsable "  +
            " where id_est = "+ carnet +" order by id_res ");     
        
        return this.consultar(consulta, 14);                 
    }   
    
  
    
    public Vector SecuenciaReint(){
        String consulta = new String();     
       
        consulta = new String(" select sig_sec  "  +
            " from registro.secuencias"  +
            " where registro.secuencias.nombre='NUM_SOLREINT' ");     
        
        return this.consultar(consulta, 1);                 
    }       
    
    
    public Vector ConsultaHorario(String periodoact, String carnet){
        String consulta = new String();     
       
        consulta=new String(" select registro.estudiante.nom_est, cod_asig,   " +
        " cod_sal, dia, hora_ini, hora_fin, num_grupo, estado  " +
	"  from  registro.estudiante, registro.registro, registro.grupo, registro.asignatura, " +
	"  registro.salones, registro.sal_grupo  " +
	"  where registro.grupo.id_grupo = registro.sal_grupo.id_grupo and " +
        " registro.sal_grupo.id_sal = registro.salones.id_sal and " +
 	" registro.grupo.per_acad = '" + periodoact + "'  and " +
	" registro.estudiante.id_est = registro.registro.id_est and   " +
	" registro.grupo.id_grupo = registro.registro.id_grupo and registro.estudiante.estado > 0 and   " +
	" registro.grupo.id_asig = registro.asignatura.id_asig and  " +
        " registro.registro.id_est = " + carnet  + "   order by  hora_ini, hora_fin, dia ");     
        
        return this.consultar(consulta, 8);                 
    }   
    

    public Vector ConsultaPeriodos(String carnet){
        String consulta = new String();     
       
        consulta=new String("select per_acad " +
            " from registro.biblia_def " +
            " where id_est = " + carnet  +
            " group by per_acad " +
            " order by per_acad " );    
        
        return this.consultar(consulta, 1);                 
    }       

    public Vector despNotas(String carnet, String per){
        String consulta = new String();     
       
        consulta=new String("	select registro.estudiante.nom_est,  cod_dpto, " +
        " cod_plan, sum_est * 0.1 / can_mat, sum_ult * 0.1 / can_ult, " +
        " sem_est,  per_acad, cod_asig, nom_asig, nota, nom, nomt " +
	"  from  registro.estudiante, registro.biblia_def, registro.asignatura, " +
	" registro.plan_estud, registro.departamento, registro.claves, registro.codigos " +
	"  where registro.estudiante.id_dpto = registro.departamento.id_dpto and " +
	"        registro.estudiante.id_plan = registro.plan_estud.id_plan and " +
	"        registro.estudiante.id_est = registro.biblia_def.id_est and " +
	"        registro.biblia_def.id_asig = registro.asignatura.id_asig and " +
        "        clave = cd  and prom = cdt and tipo = 'promt' and  " +
	"        registro.biblia_def.per_acad = '" + per  + "' and " +
	"        registro.biblia_def.id_est = " + carnet  + " ") ; 
        return this.consultar(consulta, 12);                 
    }           
    
    
     public Vector despNotasAct(String carnet, String per){
        String consulta = new String();        
            consulta = new String("select registro.estudiante.nom_est,  cod_dpto, " +
        " cod_plan, sum_est * 0.1 / can_mat, sum_ult * 0.1 / can_ult, " +
        " sem_est, cod_asig, nota1, nota2, nota3, nota_lab, nota,nom  " +
	" from  registro.estudiante, registro.registro, registro.grupo, registro.asignatura, " +
	" registro.plan_estud, registro.departamento, registro.claves " +
	" where registro.estudiante.id_dpto = registro.departamento.id_dpto and " +
	" registro.estudiante.id_plan = registro.plan_estud.id_plan and " +
	" registro.estudiante.id_est = registro.registro.id_est and " +
	" registro.grupo.id_grupo = registro.registro.id_grupo and " +
	" registro.grupo.id_asig = registro.asignatura.id_asig and " +
        " clave = cd  and tipo_asig='N' and " +
	" registro.registro.id_est = " + carnet  + " and registro.grupo.per_acad='" + per + "' ") ; 
        return this.consultar(consulta, 13);                 
    }           


     public Vector HorarioExamen(String carnet, String per){
        String consulta = new String();        
        consulta = new String("select registro.estudiante.nom_est, cod_asig,   " +
        " desf,  hora_ex,cod_sal, sal_ex,dia_ex   " +
	"  from  registro.estudiante, registro.registro, registro.grupo, " +
        "  registro.asignatura, registro.salones, registro.fechas " +
	"  where  registro.grupo.per_acad = '" + per + "'  and " +
	" registro.estudiante.id_est = registro.registro.id_est and   " +
	" registro.grupo.id_grupo = registro.registro.id_grupo and   " +
	" registro.grupo.id_asig = registro.asignatura.id_asig and  " +
        " registro.salones.id_sal= registro.grupo.sal_ex and " +
        " registro.grupo.dia_ex= registro.fechas.idf and " +
        " registro.registro.id_est = " + carnet  + "  order by dia_ex, hora_ex, sal_ex " ) ; ; 
        return this.consultar(consulta, 7);                 
    }               
    
    
     public Vector despInfAsi(PrintWriter out, String carnet, String ident) {
        String consulta = new String();
        consulta = new String("select nom_asig, nom_est " +
        "FROM registro.asignatura, registro.estudiante " + 
       "WHERE id_asig = " + ident + " and id_est = " + carnet);
        return this.consultar(consulta, 2);                 
    }
    
    
     public Vector despDetallePlan(  String carnet, PrintWriter out) {
	String consulta = new String(),  prog = new String();			
        Vector  lisnom = new Vector();
		
        consulta = new String("select  registro.asignatura.id_asig,cod_asig,  " +
             "linea, semestre,  nom_prog, cod_plan, registro.estudiante.nom_est, id_dpplan, nom_asig  " +
             "FROM registro.asignatura, registro.asig_plan, registro.estudiante, registro.programas, registro.plan_estud " + 
             "WHERE registro.asignatura.id_asig = registro.asig_plan.id_asig and " +
             " registro.asig_plan.id_plan = registro.estudiante.id_plan and " + 
             " registro.plan_estud.id_plan = registro.estudiante.id_plan and " + 
             " registro.programas.id_prog = registro.plan_estud.id_prog and " +           
             " linea > 0 and semestre > 0 and semestre < 12 and " +
             " id_est = " + carnet +"  order by linea, semestre ") ;
             return this.consultar(consulta, 9);       
     }
     
      
     public Vector despDoblePlan(PrintWriter out, String carnet) {
	String consulta = new String();
        consulta = new String("select  registro.asignatura.id_asig,cod_asig,  " +
             "linea, semestre,  nom_prog, cod_plan, registro.estudiante.nom_est, null " +
             "FROM registro.asignatura, registro.asig_plan, registro.estudiante, registro.programas, registro.plan_estud " + 
             "WHERE registro.asignatura.id_asig = registro.asig_plan.id_asig and " +
             " registro.asig_plan.id_plan = registro.estudiante.id_dpplan and " + 
             " registro.plan_estud.id_plan = registro.estudiante.id_dpplan and " + 
             " registro.programas.id_prog = registro.plan_estud.id_prog and " +           
             " linea > 0 and semestre > 0 and semestre < 12 and " +
             " id_est = " + carnet + "  order by linea, semestre ");        
         return this.consultar(consulta, 8);       
       
        }
    
       
     public Vector despidasig(PrintWriter out, String carnet, String ident){
         String consulta = new String();
         consulta=new String ("select id_asig from registro.biblia_def " +
         "where id_est = " + carnet + " and nota >= 30 and clave not in ('C', 'R')  and " +
         " (id_asig = " + ident + "or visdp = " + ident +" )" );
         return this.consultar(consulta, 1);   
        }
        
        
     public Vector despasig(PrintWriter out, String carnet, String ident){
             String consulta = new String();
             consulta = new String("select id_asig from registro.registro, registro.asignatura " +
                        "where as_vis = id_asig and id_est = " + carnet + " and  "  +
                        "id_asig =  "+ ident +" ") ;
             return this.consultar(consulta, 1);
        
        }
        
        
        public Vector despPrerreq(PrintWriter out, String carnet, String ident) {
        String consulta = new String();
	        
        consulta=new String("select distinct nom_asig " +
           " from registro.estudiante, registro.asig_plan aspA,  " +
	    " registro.req_plan, registro.asignatura, registro.asig_plan aspB " +
            " where (registro.estudiante.id_plan = aspA.id_plan or registro.estudiante.id_dpplan = aspA.id_plan ) and  " +
	    " aspA.id_asig_plan = id_asig_plan1 and " +
	    " aspB.id_asig_plan = id_asig_plan2 and " +
	    " registro.asignatura.id_asig = aspB.id_asig and " +
	    " id_est = " + carnet + "   and aspA.id_asig = " + ident + " ");
            return this.consultar(consulta, 1);
        }
        
    
      public Vector despCorreq(PrintWriter out, String carnet, String ident) {
        String consulta = new String();
	        
        consulta=new String("select distinct nom_asig,  registro.asignatura.id_asig, id_cor " +
        "from registro. asignatura, registro.coreq  , registro.estudiante " +
        "  where  registro.asignatura.id_asig= registro.coreq.id_cor " +
        " and  id_est= "+ carnet +" and registro.coreq.id_asig= "+ ident +"  ");
       return this.consultar(consulta,3 );
        }
    
         
    public Vector despBiblia(PrintWriter out, String carnet, String ident) {
          String consulta = new String();
	  consulta = new String("select nom_asig, per_acad, nota, nom " +
             "FROM registro.asignatura, registro.biblia_def, registro.claves " + 
             "WHERE registro.asignatura.id_asig = registro.biblia_def.as_vis and " +
             "  id_est = " + carnet + " and clave = cd and registro.biblia_def.id_asig = " + ident + 
             " order by per_acad") ; 
             return this.consultar(consulta,4 );
        }
    
    
    public Vector despRegistro(PrintWriter out,  String carnet, String ident) {
        String consulta = new String(), prog = new String() ;			
    	Vector  lisnom = new Vector() ;
        consulta = new String("select nom_asig,  nota1, nota2, nota3, nota_lab, nom " +
             "FROM registro.asignatura, registro.grupo, registro.registro, registro.claves " + 
             "WHERE registro.asignatura.id_asig = registro.grupo.id_asig and " +
             " registro.grupo.id_grupo = registro.registro.id_grupo and clave = cd and " +
             "  id_est = " + carnet + " and as_vis = " + ident + " ") ; 
          return this.consultar(consulta,6 );
    }
     

    public Vector consulSec(String nom) {
        String consulta = new String();
        
        consulta = new String(" select sig_sec  "  +
            " from registro.secuencias"  +
            " where registro.secuencias.nombre = '" + nom + "' ");   
        
          return this.consultar(consulta,1 );
    }    

  public Vector consulCiudades() {
        String consulta = new String();
        
        consulta = new String(" select id_ciu, nom_ciu from registro.ciudades order by nom_ciu ");   
        return this.consultar(consulta,2 );
    }    
}
