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
import java.util.StringTokenizer;

/**
 *
 * @author lucero.rodriguez 17 enero 2017
 */
public class autoevaluacionNuevo extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession(false);
        String id = new String(""), asig = new String("");
        String total = new String(""), idgrp = new String("");
        String confactor = new String("");
        String idenc = new String(""), cadena = new String("P"), factor = new String("factor"), identificador = new String("identifica");
        String obs = new String(""), nvacadena = new String(""), nomfactor = new String(""), comentario = new String("comentario");
        int i, x, ret = 0, acum = 0, ret1 = 0, ret2 = 0, totdatos, pregfactor;
        total = request.getParameter("total");
        confactor = request.getParameter("confactor");
        String grupo = "";
        String per = "";
        String datos = "";

        String CodFactor = request.getParameter("CodFactor");
        //   String comentario = request.getParameter("comentario");
        String nomfac = request.getParameter("nomfac");
        nomfactor = (String) factor.concat(CodFactor);
        String prog = request.getParameter("prog");
        String descripcion = request.getParameter("descripcion");
        String id_encuestado = request.getParameter("id_encuestado");
        //String flag = request.getParameter("flag"); 
        totdatos = Integer.parseInt(total);
        pregfactor = Integer.parseInt(confactor);
        id = request.getParameter("idenc");
        String tipo = request.getParameter("tipo");
        String valor, valor1, direccion = "";
        String asignatura = "";
        asignatura = request.getParameter("asignatura");
        String nro = request.getParameter("nro");
        String arreglo[] = new String[200];
        String var[] = new String[10];
        Estudiante est = (Estudiante) sesion.getAttribute("estClase");
        Estudiante emisc = new Estudiante();
        if (tipo.equals("A")) {

            grupo = request.getParameter("grupo");
            per = request.getParameter("per");
            datos = grupo + "*" + id + "*" + prog + "*" + id_encuestado + "*" + per + "*" + tipo + "*" + asignatura + "*" + nro;
            //direccion = "FormatoEncuestaPosgrados?iden=" + id + "&prog=" + prog + "&descripcion=" + descripcion + "&id_encuestado=" + id_encuestado ;
            direccion = "FormatoEncuestaPosgrados?datos=" + datos;
        } else {

            direccion = "EncuestaNuevo?iden=" + id + "&prog=" + prog + "&descripcion=" + descripcion + "&id_encuestado=" + id_encuestado;
        }
        for (i = 1; i <= pregfactor; i++) {
            String aspecto = "";

            valor = String.valueOf(i);
            String variable = (String) cadena.concat(CodFactor + valor);
            String comentarios = (String) comentario.concat(valor);
            String valcomentario = request.getParameter(comentarios);
            aspecto = request.getParameter("aspectos");

            String dato = request.getParameter(variable);
            String separa[] = new String[5];
            StringTokenizer st = new StringTokenizer(dato, "|");
            int k = 0;
            while (st.hasMoreTokens()) {
                separa[k] = st.nextToken();
                k = k + 1;
            }
            String dato1 = separa[0];
            String indice = separa[1];
            Vector valida = est.Validar(id, indice, id_encuestado);
            if (valida.size() > 0) {
                response.sendRedirect(direccion);
                break;
            } else {
                if (tipo.equals("A")) {
                    valcomentario = request.getParameter("comentarios");
                    if (i < pregfactor) {
                        ret = est.AutoevaluacionNvoPosgrados(id_encuestado, id, CodFactor, indice, dato1, grupo, per);
                    } else if (i == pregfactor) {
                        if (valcomentario.equals("")) {
                            valcomentario = "NULL";
                        }
                        if (aspecto.equals("")) {
                            aspecto = "NULL";
                        }
                        ret1 = est.PosgradosComentarios(id_encuestado, id, CodFactor, indice, dato1, valcomentario, aspecto, grupo, per);
                    }

                } else {
                    ret = est.AutoevaluacionNvo(id_encuestado, id, CodFactor, indice, dato1, valcomentario);
                }

            }
        }
        //  direccion = "EncuestaNuevo?iden=" + id + "&prog=" + prog + "&descripcion=" + descripcion +"&id_encuestado=" + id_encuestado;
        //response.sendRedirect(direccion);
        if (ret > 0) {
            out.println("<center><h2>");
            response.sendRedirect(direccion);
        } /*else {
         out.println("<center><h2>");
         out.println("Hubo algún problema diligenciando la encuesta. ");
         out.println("<center><h2><a href=\"../LogOutEst\"> Salir </a></h2></center>");
         out.println("</center></h2>");
         }*/


    }
}