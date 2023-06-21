/*
 * procpreinscripcion.java
 *
 * Created on 2 de marzo de 2004, 11:26 AM
 */

import java.io.*;
import java.io.IOException ;
import javax.servlet.*;
import javax.servlet.http.* ;
import java.util.Vector;
import estudiantes.Estudiante.Estudiante;

/**
 *
 * @author  Administrador
 * @version 
 */
public class InsAsigPos extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        	throws IOException, ServletException {

        Estudiante          est ;
        PrintWriter         out = response.getWriter();
        HttpSession         sesion;            
        Vector              vresp ;
        String[] checEli;
        Vector verif ;
        Vector cup ;
        Vector cupd ;
        Vector cuppreg ;
        sesion = request.getSession(true);
        //Vector infasig ;
        //Vector asig ;
        //sesion = request.getSession(false);
        HttpSession session = request.getSession();
        String carnet = (String) session.getAttribute("carnet");
        String per = (String) session.getAttribute("perinsc");
        String idplan = (String) session.getAttribute("idplan");
        String valor = request.getParameter("valor");
        String ban = request.getParameter("ban");
        String grp = "", peso = "", ngrp = "-1", cadena = "", codasig = "", mensaje = "", tipo = "" ;
        int tamamo = 0, b = 0, cupo = 0, insc = 0, longChec = 0, inscpreg = 0, cupopreg = 0, log = 0;
        
      if (session == null) {
            response.sendRedirect("login?msg=7") ;
        }
        else {
           est = (Estudiante) session.getAttribute("estClase") ;
           String idprog = est.getIdprog() ;
           checEli = request.getParameterValues("checEli");
           if(checEli == null){
             response.sendRedirect("InscripcionPos?ind=-2");
            //out.println("<p><b>No se selecciono asignatura a eliminar de la solicitud.</b></p>");
           }
           else{
           longChec = checEli.length;
           for ( int i=0 ; i < longChec ; i++ ){
               cadena = checEli[i] ;
               String[] result = cadena.split(",");
        
            if (checEli[i].compareTo("null")!= 0){                      
               
               if(valor.equals("0")) {
                peso = result[2];
                grp = result[1];
                ngrp = result[3];
                codasig = result[5];
                cupo = Integer.parseInt(result[4]); //Cupo de las asignatura
                //==Busco cuantos hay inscritos en el grupo de posgrado
                cup = est.VerifCupo(grp, per);
                if (cup.size()>0){
                   cupd = (Vector) cup.elementAt(0);
                   insc = Integer.parseInt(cupd.elementAt(0).toString());
                }
                //==Busco cupo si asig es de pregrado
                cuppreg = est.VerifCupoPreg(grp, per);
                if (cuppreg.size()>0){
                   cuppreg = (Vector) cup.elementAt(0);
                   inscpreg = Integer.parseInt(cuppreg.elementAt(0).toString());
                }
                if((insc >= cupo) || (inscpreg >= cupo)) {
                    mensaje = mensaje + "No hay cupo para asignatura: " + codasig +"/";
                       // out.println("window.open('Respuesta?ind=1','','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=400,width=620') ");
                    //window.open("URL de la página que se mostrará en la nueva ventana", "pruebanueva ventana", "directories=no, menubar =yes,status=no,toolbar=no,location=no,scrollbars=yes,fullscreen=no,height=50,width=50,left=50,top=50");
                }else{
                   //== Verifico que si existe registro en biblia lo elimino e inserto el nuevo
                    verif = est.VerifAsig(result[0], carnet, per);
                    if(verif.size() > 0){
                        //==Actualizo registro o borrar???
                        tamamo = est.ActualInsPos(result[0], carnet, per, grp, ngrp, ban);
                        if(tamamo > 0 ){
                            mensaje = mensaje + "Solicitud aceptada para asignatura: " + codasig +"/";
                            //Inserta Log_audit
                            tipo = "U";
                            log = est.Log_Audit(result[0], carnet, per, grp, ngrp, tipo);
                        }
                        else{
                            //Cambio por mensaje de error que no debia aparecer, descomentar al cierre de inscripción asignaturas posgrado
                            //mensaje = mensaje + "No se proceso la solicitud para la asignatura: " + codasig +"/";
                        }
                        b = 1;
                    } else{
                        //==Se hace el insert
                        codasig = result[5];
                        tamamo = est.InsertInsPos(result[0], carnet, ngrp, per, peso, grp, ban);
                        if(tamamo > 0 ){
                            mensaje = mensaje + "Solicitud aceptada para asignatura: " + codasig +"/";
                            //Inserta Log_audit
                            tipo = "I";
                            log = est.Log_Audit(result[0], carnet, per, grp, ngrp, tipo);
                        } else{
                            //Cambio por mensaje de error que no debia aparecer, descomentar al cierre de inscripción asignaturas posgrado
                            //mensaje = mensaje + "No se proceso la solicitud para la asignatura: " + codasig +"/";
                        }
                        b = 1 ;
                       // if (tamamo > 0)
                         //   mensaje = mensaje + "Solicitud aceptada para asignatura: " + codasig +",";
                    }
                  }//ELSE DE CUPO
                  
                }else{ //if de valor
                   //Borro registros de biblia_post                
                   tamamo = est.BorraInsPos(result[0], carnet, per);
                   if(tamamo > 0 ){
                        mensaje = mensaje + "Solicitud aceptada para asignatura: " + result[2] +"/";
                        //Inserta Log_audit
                        tipo = "D";
                        log = est.Log_Audit(result[0], carnet, per, result[1], ngrp, tipo);
                   } else{
                       mensaje = mensaje + "La asignatura " +  result[2]  + " no se puede eliminar, puede que tenga pago o nota registrada."+"/";}
                   b = 2 ;
                }
             }
            }
          /* if (tamamo > 0 && ban.equals("0")) {
                 mensaje = mensaje + "Solicitud aceptada para asignatura: " + codasig +",";
               } else{
                   mensaje = mensaje + "Solicitud no aceptada o no registrada para asignatura: " + codasig + ",";
               }*/

           //==
            /* if(tamamo > 0 && ban.equals("1")){
                response.sendRedirect("Respuesta?ind=1");
             }else
                 if(tamamo < 0 && ban.equals("1")){
                response.sendRedirect("Respuesta?ind=0");
             }else
               if (tamamo > 0 && ban.equals("0")) {
               if (b == 1)
                   // response.sendRedirect("InscripcionPos?ind=2");
                    response.sendRedirect("InscripcionPos?ind="+longChec);
               else
                    response.sendRedirect("InscripcionPos?ind=4");
            } else {
               response.sendRedirect("InscripcionPos?ind="+longChec); //ind = 3
            }*/
           //==
            
        }

        }     
    sesion.setAttribute("mensajer", mensaje);
    if (ban.equals("0"))
        response.sendRedirect("InscripcionPos?ind="+longChec);
    else
        response.sendRedirect("Respuesta?ind="+longChec);
     }
}
