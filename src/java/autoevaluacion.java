/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Vector;
import estudiantes.Estudiante.Estudiante;
import estudiantes.Estudiante.EstudMisc;

/**
 *
 * @author lrodriguez
 */
public class autoevaluacion extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession(false);
        String id = new String(""), asig = new String("");
        String total = new String(""), idgrp = new String("");
        String idenc = new String(""), cadena = new String("P");
        String obs = new String(""), nvacadena = new String("");
        int i, x, ret = 0, acum = 0, totdatos, ret1 = 0;
        total = request.getParameter("total");
        String justif1 = request.getParameter("justif1");
        String justif10 = request.getParameter("justif10");
        String justif2 = request.getParameter("justif2");
        String justif3 = request.getParameter("justif3");
        String justif4 = request.getParameter("justif4");
        String justif5 = request.getParameter("justif5");
        String justif6 = request.getParameter("justif6");
        String justif7 = request.getParameter("justif7");
        String justif8 = request.getParameter("justif8");
        String justif9 = request.getParameter("justif9");
        String programa = request.getParameter("prog");
        String flag = request.getParameter("flag");

        id = request.getParameter("idenc");
        totdatos = Integer.parseInt(total);
        id = request.getParameter("idenc");
        String valor, valor1;
        String arreglo[] = new String[200];
        String var[] = new String[10];

        // idenc = request.getParameter("asig");

        obs = obs.replace("'", "");
        for (i = 1; i <= totdatos; i++) {
            valor = String.valueOf(i);
            String variable = (String) cadena.concat(valor);
            arreglo[i] = request.getParameter(variable);
            nvacadena = nvacadena + arreglo[i];
        }

        /*  String[] variables = {"justif1", "justif2", "justif3", "justif4", "justif5"};
         for (x = 0; x < 5; x++) {
         if (request.getParameter(variables[x]) != null) {
         var[x] = request.getParameter(variables[x]);
         } else {
         var[x] = "";
         }
         }*/

        Estudiante est = (Estudiante) sesion.getAttribute("estClase");
        Estudiante emisc = new Estudiante();
//HttpSession sesion = request.getSession(false);

        String cedula, direccion;
        Vector Datos = new Vector();
        Datos = est.Contesto(est.getIdEst(), id);
        if (Datos.size() > 0) {
            out.println("<center><b>Usted ya contestó la encuesta, gracias por su participación.</b></center>");
        } else if (id.equals("11") || id.equals("44")) {
            Object estudiante = sesion.getAttribute("estudiante");
            cedula = estudiante.toString();
            //   Datos = est.Contesto(cedula, id);
          /*  if (Datos.size() > 0) {
             out.println("<center><b>Usted ya contestó la encuesta, gracias por su participación.</b></center>");
             } else {*/
            ret = emisc.autoevaluacion(id, nvacadena, programa, cedula, justif1, justif2, justif3, justif4, justif5, justif6, justif7, justif8, justif9, justif10);
            /* if (flag.equals("1") && ret > 0) {
             ret1 = emisc.Encuestado(cedula, id);
             } else {
             ret1 = emisc.Encuestado2(cedula, id);
             }*/
            //}
        } else {
            //(id.equals("133") || id.equals("142") || id.equals("7"))id.equals("9") || id.equals("10") ||

            ret = emisc.autoevaluacion(id, nvacadena, programa, est.getIdEst(), justif1, justif2, justif3, justif4, justif5, justif6, justif7, justif8, justif9, justif10);
            // if (flag.equals("1") && ret > 0) {
            ret1 = emisc.Encuestado(est.getIdEst(), id);
            //
        /*} else {
             ret1 = emisc.Encuestado2(est.getIdEst(), id);
             }*/
            /* Datos = est.Contesto(est.getIdEst(), id);
             if (Datos.size() > 0) {
             out.println("<center><b>Usted ya contestó la encuesta, gracias por su participación.</b></center>");
             } else {*/


            //}
        }
        if (ret > 0) {
            // out.println("<center><h2>");
            out.println("Sus datos han sido registrados, muchas gracias por su participación. ");
            // out.println("<center><h2><a href=\"../estudiantes/login?msg=8\"> Salir </a></h2></center>");
            // out.println("</center></h2>");
        } else {
            sesion.setAttribute("mensaje", "Hubo algún problema diligenciando esta encuesta");
        }


    }
}
