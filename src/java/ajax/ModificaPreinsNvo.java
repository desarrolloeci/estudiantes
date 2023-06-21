/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ajax;

import estudiantes.Estudiante.Estudiante;
import estudiantes.baseDatos.BdEstudiante;
import estudiantes.configuracion.configECI;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Lucero
 */
public class ModificaPreinsNvo extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String consulta = new String();
        HttpSession session = request.getSession();
        PrintWriter pw = response.getWriter();
        configECI cfgEci = new configECI();
        BdEstudiante bd = new BdEstudiante();
        String identificador = request.getParameter("identificador");
        String carnet = (String) session.getAttribute("carnet");
        String valor = request.getParameter("valor");
        Estudiante actualiza = new Estudiante(carnet, pw);
        Vector dato = new Vector();
        String req = "";
        int ret, num, tamamo = 0;
        String val = "0";
        Vector retorno = new Vector();
        String respuesta = null;
        otros.rutas ruta = new otros.rutas();

        Vector sec = new Vector();
        //===

        if (valor.equals("1") && (!identificador.equals(""))) {
            String[] ident = identificador.split(",");
            
            //Se consulta el registro del simulador de transicion para saber si el estudiante se cambio o no de plan
            Vector step=(Vector) actualiza.VeriTransicion(carnet);
            //Se verifica si hubo resultados
            if(step.size()>0){
                step=(Vector) step.get(0);
            }else{
                if(actualiza.EstIngresoDespuesTransicion(carnet).size()>0){
                    //se asigna el step 0 de TIENE PLAN NUEVO DESDE EL PRINCIPIO porque debe ser un estudiante nuevo
                    step= new Vector();
                    step.add("0");
                }else{
                    step= new Vector();
                    step.add("6");
                }
            }
            //Obtenemos planes de estudio del estudiante, son dos en caso de intencion de doble programa
            Vector planes=(Vector) actualiza.getPlanEstud(carnet).get(0);
            String plan1=planes.get(0).toString().trim();
            String plan2=planes.get(1).toString().trim();
            
            //Aca se asigna el step a Biomedica y Ambiental NO SE CAMBIARON
            if((plan1.equals("314") || plan2.equals("314")) || (plan1.equals("334") || plan2.equals("334"))){
                step= new Vector();
                step.add("6");
            }
            
            
            //Esta variable detiene el proceso de preinscripción si alguna de las asignaturas de ident no se pudo preinscribir
            Boolean problemaPreinscripcion=false;
            
            //Se eliminan duplicados
            List temp=new ArrayList<String>();
            for (int i = 0; i < ident.length; i++) {
                Boolean found=false;
                for (int j = 0; j < temp.size()&&!found; j++) {
                    if(ident[i].equals(temp.get(j))){
                        found=true;
                    }
                }
                if(!found){
                    temp.add(ident[i]);
                }
            }
            String[] arrtemp=new String[temp.size()];
            for (int q = 0; q < temp.size(); q++) {
                arrtemp[q]=temp.get(q).toString();
            }
            //Se reasigna sin duplicados
            ident=arrtemp;
            
            for (int i = 0; i < ident.length && !problemaPreinscripcion; i++) {
                
                //Esta variable contendra la asignatura temporal en caso de estudiantes que inscriban asignaturas de 
                //planes nuevos pero sea necesario verificar requisitos de la asignatura del plan viejo equivalente
                //porque ya no se va a ofertar
                String idAsigTemp="";
                //Por si existe duplicado
                if (ident.length > 2) {
                    if (ident[i].equals(ident[i + 1])) {
                        i = (i + 1);
                    }
                }
                
                //Si el estudiante no se cambio de plan
                if(!step.get(0).toString().trim().equals("5")){
                    //Se busca la asignatura antigua correspondiente a la que va a preinscribir, suponiendo que el va a buscar la programada
                    Vector asignaturaVieja=actualiza.VeriPreinsNoProgramada(plan1, ident[i]);
                    if(asignaturaVieja.size()>0){
                        asignaturaVieja=(Vector) asignaturaVieja.get(0);
                        if(asignaturaVieja.size()>0){
                            idAsigTemp=asignaturaVieja.get(0).toString().trim();
                        }
                    }
                    if(idAsigTemp.length()==0){
                        if(!plan2.equals("No disponible")&&plan2.length()==3){
                            asignaturaVieja=actualiza.VeriPreinsNoProgramada(plan2, ident[i]);
                            if(asignaturaVieja.size()>0){
                                idAsigTemp=asignaturaVieja.get(0).toString().trim();
                            }
                        }
                    }
                }
                
                
                
                
                //idAsigTemp="";
                
                //Este procedimiento genera una respuesta a la preinscripción, se pasa la asignatura del plan viejo para estudiantes que no se hayan cambiado
                bd = new BdEstudiante();
                int proced;
                //Si el estudiante se cambió de plan o es nuevo y se le asignó un nuevo plan, se ejecuta el procedimiento de los nuevos planes
                if(step.get(0).toString().trim().equals("5")||step.get(0).toString().trim().equals("0")){
                    proced = bd.ProcedimientoAlumnoNuevosPlanes(carnet, (idAsigTemp.equals(""))?ident[i]:idAsigTemp, val);
                }else{
                    proced = bd.ProcedimientoAlumno(carnet, (idAsigTemp.equals(""))?ident[i]:idAsigTemp, val);
                }
                dato = actualiza.VeriPreins(carnet, ident[i]);
                if (dato.size() > 0) {
                    req = ((Vector) dato.elementAt(0)).elementAt(0).toString();
                }
                ret = actualiza.BorrarVeriPreins(carnet, ident[i]);
                
                
                //Se obtiene el nombre de la asignatura
                Vector contAsig=actualiza.getContenido(pw, (idAsigTemp.equals(""))?ident[i].toString():idAsigTemp);
                String nomAsig="";
                if(contAsig.size()>0){
                    nomAsig=((Vector) contAsig.get(0)).get(0).toString().trim();
                }
                
                /**ESTO NO SE HACE ACA, ES TAREA DEL PROCEDIMIENTO ALMACENADO
                
                //Se verifica si existen excepciones para su preinscripcion
                Vector excepciones = actualiza.VeriPreinsExcepciones(plan1, ident[i]);
                if(excepciones.size()>0){
                    excepciones=(Vector) excepciones.get(0);
                }
                //Se buscan excepciones de doble plan
                Vector excepcionesDP = new Vector();
                if(!plan2.equals("No disponible")&&plan2.length()==3){
                    excepcionesDP= actualiza.VeriPreinsExcepciones(plan2, ident[i]);
                    if(excepcionesDP.size()>0){
                        excepcionesDP= (Vector) excepcionesDP.get(0);
                    }
                }
                
                //Verificamos si el estudiante se cambio de plan y existen excepciones para esa materia: SE INVALIDA POR QUE SE VERIFICA EN EL PROCEDIMIENTO ALMACENADO
                if(false&&(excepciones.size()>0||excepcionesDP.size()>0)&&step.get(0).toString().trim().equals("5")&&!req.equals("-3")&&!req.equals("1")){
                    
                    //Si existen excepciones, se valida que esten cursados y aprobados esos requisitos
                    //Este entero es cero y se sumara uno por cada requisito en excepciones que el estudiante aprobo, asi, para que el estudiante pueda preinscribir la asignatura, es necesario que la suma sea igual a la longitud de excepciones
                    Integer aprobados=0;
                    for (int n=0; n<excepciones.size(); n++) {
                        Boolean aproboRequisito=false;
                        //Se obtiene la nota de cada una de las veces que el estudiante curso el requisito
                        Vector notasEnAsignatura=actualiza.getNotaAsig(carnet, excepciones.get(n).toString());
                        if(notasEnAsignatura.size()>0){
                            notasEnAsignatura=(Vector) notasEnAsignatura.get(0);
                        }
                        for (int not=0; not<notasEnAsignatura.size()&&!aproboRequisito; not++) {
                            String nota=notasEnAsignatura.get(not).toString().trim();
                            Integer notaInt=Integer.parseInt(nota);
                            if(notaInt>=30){
                                aproboRequisito=true;
                                aprobados+=1;
                            }
                        }
                    }
                    //cumple con los requisitos
                    if(aprobados>0&&aprobados>=excepciones.size()){
                        req="1";
                    }else{
                        //si no cumple con los requisitos para las excepciones del plan activo, se busca con el de doble programa, se realiza el mismo procedimiento
                        aprobados=0;
                        for (int n=0; n<excepcionesDP.size(); n++) {
                            Boolean aproboRequisito=false;
                            //Se obtiene la nota de cada una de las veces que el estudiante curso el requisito
                            Vector notasEnAsignatura=actualiza.getNotaAsig(carnet, excepcionesDP.get(n).toString());
                            if(notasEnAsignatura.size()>0){
                                notasEnAsignatura=(Vector) notasEnAsignatura.get(0);
                            }
                            for (int not=0; not<notasEnAsignatura.size()&&!aproboRequisito; not++) {
                                String nota=notasEnAsignatura.get(not).toString().trim();
                                Integer notaInt=Integer.parseInt(nota);
                                if(notaInt>=30){
                                    aproboRequisito=true;
                                    aprobados+=1;
                                }
                            }
                        }
                        //Si cumple los requisitos para su segundo programa, se preinscribe la asignatura.
                        if(aprobados>0&&aprobados>=excepcionesDP.size()){
                            req="1";
                        }
                    }
                }
                
                 * */
                
                

                // if (i == 0) {
                if(req.equals("1")){
                    sec = actualiza.SecuenciaPreinscrip();
                    String secu = new String();
                    secu = ((Vector) sec.elementAt(0)).elementAt(0).toString();
                    if (sec.size() > 0) {
                        ret = actualiza.ActSecuencia();
                    }
                    tamamo = actualiza.InsertaPreinsprim(carnet, secu, ident[i], cfgEci.getPeriodoActual());
                }else if (req.equals("-3")) {
                     pw.println("<html>");
                    pw.println("<center>Asignatura "+nomAsig+" vista y aprobada</center>");
                    pw.println("<p>");
                    pw.println("<table align=\"center\">");
                    pw.println("<tr>");
                    pw.println("<form action=ModificaPreins>");
                    pw.println(" <td colspan=\"4\" valign=\"top\">");
                    pw.println(" <div align=\"center\">");
                    pw.println("<input type=\"submit\" name=\"Salir\" value=\"Regresar\" class=\"boton\" >");
                    pw.println("</div>");
                    pw.println("</td>");
                    pw.println("</form>");
                    pw.println("</tr>");
                    pw.println("</table>");
                    pw.println("</html>");
                    problemaPreinscripcion=true;
                } else if (req.equals("-1")) {
                    pw.println("<html>");
                    pw.println("<center>Falta requisito en la asignatura "+nomAsig+"</center>");
                    pw.println("<p>");
                    pw.println("<table align=\"center\">");
                    pw.println("<tr>");
                    pw.println("<form action=ModificaPreins>");
                    pw.println(" <td colspan=\"4\" valign=\"top\">");
                    pw.println(" <div align=\"center\">");
                    pw.println("<input type=\"submit\" name=\"Salir\" value=\"Regresar\" class=\"boton\" >");
                    pw.println("</div>");
                    pw.println("</td>");
                    pw.println("</form>");
                    pw.println("</tr>");
                    pw.println("</table>");
                    pw.println("</html>");
                    problemaPreinscripcion=true;
                } else if (req.equals("-2")) {
                    pw.println("<html>");
                    pw.println("<center>Falta requisito especial de la asignatura "+nomAsig+"</center>");
                    pw.println("<p>");
                    pw.println("<table align=\"center\">");
                    pw.println("<tr>");
                    pw.println("<form action=ModificaPreins>");
                    pw.println(" <td colspan=\"4\" valign=\"top\">");
                    pw.println(" <div align=\"center\">");
                    pw.println("<input type=\"submit\" name=\"Salir\" value=\"Regresar\" class=\"boton\" >");
                    pw.println("</div>");
                    pw.println("</td>");
                    pw.println("</form>");
                    pw.println("</tr>");
                    pw.println("</table>");
                    pw.println("</html>");
                    problemaPreinscripcion=true;
                } else if (req.equals("-4")) {
                    pw.println("<html>");
                    pw.println("<center>Asignatura "+nomAsig+" adicional al plan o no ofrecida para este programa.</center>");
                    pw.println("<p>");
                    pw.println("<table align=\"center\">");
                    pw.println("<tr>");
                    pw.println("<form action=ModificaPreins>");
                    pw.println(" <td colspan=\"4\" valign=\"top\">");
                    pw.println(" <div align=\"center\">");
                    pw.println("<input type=\"submit\" name=\"Salir\" value=\"Regresar\" class=\"boton\" >");
                    pw.println("</div>");
                    pw.println("</td>");
                    pw.println("</form>");
                    pw.println("</tr>");
                    pw.println("</table>");
                    pw.println("</html>");
                    problemaPreinscripcion=true;
                } else if (req.equals("-5")) {
                    pw.println("<html>");
                    pw.println("<center>No tiene clasificación de inglés.</center>");
                    pw.println("<p>");
                    pw.println("<table align=\"center\">");
                    pw.println("<tr>");
                    pw.println("<form action=ModificaPreins>");
                    pw.println(" <td colspan=\"4\" valign=\"top\">");
                    pw.println(" <div align=\"center\">");
                    pw.println("<input type=\"submit\" name=\"Salir\" value=\"Regresar\" class=\"boton\" >");
                    pw.println("</div>");
                    pw.println("</td>");
                    pw.println("</form>");
                    pw.println("</tr>");
                    pw.println("</table>");
                    pw.println("</html>");
                    problemaPreinscripcion=true;
                }



                /* try {
                 conectar();
                 retorno = consultar(consulta, 2, 0);
                 numord = retorno.elementAt(0).toString();
                 } catch (Exception ex) {
                 mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
                 }
                 desconectarBD();*/

                //return ret;

            }
            if (req.equals("1")) {
                response.sendRedirect("ModificaPreins?valor=" + valor + "&id=" + identificador);
            }
        } else {
            if (!identificador.equals("")) {

                String[] ident = identificador.split(",");
                for (int i = 0; i < ident.length; i++) {

                    Vector registro = actualiza.PreinscripcionDefinitiva(ident[i], carnet);
                    if (registro.size() > 0) {
                        respuesta = "<root>ok</root>";
                        //response.sendRedirect("ModificaPreins?valor=" + valor + "&id=" + identificador);
                    } else {
                        tamamo = actualiza.Borrarpreins(ident[i], carnet);
                        try {
                            FileWriter arch = new FileWriter(ruta.valruta() + "preinscripcion20172.txt", true);
                            BufferedWriter arch1 = new BufferedWriter(arch);
                            PrintWriter entrada = new PrintWriter(arch1);
                            String datos = (String) carnet + "," + ident[i];
                            entrada.println(datos);
                            entrada.close();
                            arch.close();
                            arch1.close();
                        } catch (java.io.FileNotFoundException fnfex) {
                            System.out.println("Archivo no encontrado: " + fnfex);
                            pw.println("No pudo ser procesada su informacion en el archivo");

                        }

                        if (tamamo > 0) {
                            respuesta = "<root>ok</root>";
                            // response.sendRedirect("ModificaPreins?valor=" + valor + "&id=" + identificador);
                        } else {
                            respuesta = "<root>error</root>";
                        }
                        response.setContentType("text/html");
                        pw.write(respuesta);
                        pw.flush();
                        pw.close();
                    }
                }
            }
        }
    }
}
