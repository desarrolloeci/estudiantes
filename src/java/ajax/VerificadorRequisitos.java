/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ajax;

import estudiantes.Estudiante.Estudiante;
import estudiantes.baseDatos.BdEstudiante;
import estudiantes.configuracion.configECI;
import java.util.Vector;
import javax.servlet.http.HttpSession;

/**
 *
 * @author andres.rojas
 */
public class VerificadorRequisitos {
    
    configECI cfgEci = new configECI();
    BdEstudiante base_datos = new BdEstudiante();
    
    public Boolean cumpleRequisitos(String id_est, String id_asig, HttpSession sesion){
        
        
        Vector dato = new Vector();
        String req = "";
        Integer ret=0;
        String val = "0";
        Estudiante bd = (Estudiante) sesion.getAttribute("estClase");
        
        //Se consulta el registro del simulador de transicion para saber si el estudiante se cambio o no de plan
        
        Vector step=(Vector) bd.VeriTransicion(id_est);
        Vector ingreso_despues_transicion=bd.EstIngresoDespuesTransicion(id_est);
        Vector planes=(Vector) bd.getPlanEstud(id_est).get(0);
        String plan1=planes.get(0).toString().trim();
        String plan2=planes.get(1).toString().trim();
        Vector asignaturaVieja=bd.VeriPreinsNoProgramada(plan1, id_asig);

        
        
        //Se verifica si hubo resultados
        if(step.size()>0){
            step=(Vector) step.get(0);
        }else{
            
            //bd.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
            //Vector ingreso_despues_transicion=bd.EstIngresoDespuesTransicion(id_est);
            //bd.desconectar();
            
            if(ingreso_despues_transicion.size()>0){
                //se asigna el step 0 de TIENE PLAN NUEVO DESDE EL PRINCIPIO porque debe ser un estudiante nuevo
                step= new Vector();
                step.add("0");
            }else{
                step= new Vector();
                step.add("6");
            }
        }
        //Obtenemos planes de estudio del estudiante, son dos en caso de intencion de doble programa
        //bd.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        //Vector planes=(Vector) bd.getPlanEstud(id_est).get(0);
        //bd.desconectar();
        

        //Aca se asigna el step a Biomedica y Ambiental NO SE CAMBIARON
        if((plan1.equals("314") || plan2.equals("314")) || (plan1.equals("334") || plan2.equals("334"))){
            step= new Vector();
            step.add("6");
        }
        
        
        Boolean ans=false;
        
        //Esta variable contendra la asignatura temporal en caso de estudiantes que inscriban asignaturas de 
        //planes nuevos pero sea necesario verificar requisitos de la asignatura del plan viejo equivalente
        //porque ya no se va a ofertar
        String idAsigTemp="";
        //Por si existe duplicado

        //Si el estudiante no se cambio de plan
        if(!step.get(0).toString().trim().equals("5")){
            //Se busca la asignatura antigua correspondiente a la que va a preinscribir, suponiendo que el va a buscar la programada
            //bd.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
            //Vector asignaturaVieja=bd.VeriPreinsNoProgramada(plan1, id_asig);
            //bd.desconectar();
            if(asignaturaVieja.size()>0){
                asignaturaVieja=(Vector) asignaturaVieja.get(0);
                if(asignaturaVieja.size()>0){
                    idAsigTemp=asignaturaVieja.get(0).toString().trim();
                }
            }
            if(idAsigTemp.length()==0){
                if(!plan2.equals("No disponible")&&plan2.length()==3){
                    asignaturaVieja=bd.VeriPreinsNoProgramada(plan2, id_asig);
                    if(asignaturaVieja.size()>0){
                        idAsigTemp=asignaturaVieja.get(0).toString().trim();
                    }
                }
            }
        }




        //idAsigTemp="";

        //Este procedimiento genera una respuesta a la preinscripción, se pasa la asignatura del plan viejo para estudiantes que no se hayan cambiado
        int proced;
        //Si el estudiante se cambió de plan o es nuevo y se le asignó un nuevo plan, se ejecuta el procedimiento de los nuevos planes
        if(step.get(0).toString().trim().equals("5")||step.get(0).toString().trim().equals("0")){
            proced = base_datos.ProcedimientoAlumnoNuevosPlanes(id_est, (idAsigTemp.equals(""))?id_asig:idAsigTemp, val);
        }else{
            proced = bd.ProcedimientoAlumno(id_est, (idAsigTemp.equals(""))?id_asig:idAsigTemp, val);
        }
        dato = bd.VeriPreins(id_est, id_asig);
        if (dato.size() > 0) {
            req = ((Vector) dato.elementAt(0)).elementAt(0).toString();
        }
        ret = bd.BorrarVeriPreins(id_est, id_asig);

        
       return req.equals("1");
    }
}
