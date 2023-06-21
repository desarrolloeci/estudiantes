<%@page import="utiles.Correo"%>
<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<% try {
        response.setHeader("Cache-Control", "no-cache");
        String IdEst = new String((String) session.getAttribute("carnet"));
        String spar, color;
        PrintWriter oout = response.getWriter();
        Estudiante est = (Estudiante) session.getAttribute("estClase");
        int indice, linea, sem, tmp, par, n, dp;
        //validar si ya contesto todas las encuestas académicas sino enviarlo a la encuesta.
        Vector CuantosEnc = est.AsignaEncuestaA(carnet);
        Vector cuantos = new Vector();
        cuantos = (Vector) CuantosEnc.elementAt(0);
        int total;
        //validar si ya contesto todas las encuestas académicas sino enviarlo a la encuesta.
        total = (Integer.parseInt((String) cuantos.elementAt(0)));  //cuantos debe contestar en la encuesta academica

        Vector contesto = est.ContestaEncuestaA(carnet);
        Vector valorcontesto = new Vector();
        valorcontesto = (Vector) contesto.elementAt(0);
        int totalcontesto;
        totalcontesto = (Integer.parseInt((String) valorcontesto.elementAt(0))); //cuantas asignaturas contesto
        //false&& DESHABILITA SERVICIO SI NO CONTESTO ENCUESTAS LILIANA PEDRAZA
        if (false && total != totalcontesto){
         response.sendRedirect("ListaEncuestas");
         }else {
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Plan de Estudios</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>

        <!-- CSS -->
         <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function openPop(pagename){
            window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=350,width=550')
            }
            //-->
        </script>
    </head>
  <body id="public" style="background-color: white">
        <div id="container">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td>
                        <jsp:include page="encabezado" flush="true">
                            <jsp:param name="anterior" value="menuServEstud" />
                        </jsp:include>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                <label id="msj">Plan de Estudios</label>
                                </font></h2>
                        </div></td>
                </tr>
                <tr>
                    <td>
                        <%
                            Vector plan = est.getDetallePlan(IdEst, oout);
                            String idplan= new String();
                            if (plan.size() <= 0) {
                                out.println("No hay datos en la consulta");
                            } else {
                                dp = 1;
                                int lon = plan.size();
                                Vector Detalleplan = (Vector) plan.elementAt(1);

                                if (((String) Detalleplan.elementAt(7)).equals("No disponible")) {
                                    dp = 0;
                                }
                        %>
                        <p>El número entre paréntesis corresponde al número de créditos de la asignatura. </p>
                        <table border="1" cellspacing="0" width="100%" class="tabla">
                            <tr>
                                <%
                                    for (indice = 1; indice <= 11; indice++) {
                                        if (indice == 1) {%>

                                <td> Fundamentación </td>
                                <% } else {%>
                                <td>&nbsp
                                </td>
                                <%}
                                            //  out.println("<td>" + (new Integer(indice)).toString() + "</td>");
                                        }
                                        linea = 0;
                                        sem = 11;
                                        String nivel= new String();
                                        
                                        for (indice = 0; indice < plan.size(); indice++) {
                                            Vector Detalle = (Vector) plan.elementAt(indice);
                                            tmp = (new Integer((String) Detalle.elementAt(2))).intValue();
                                            if (linea != tmp) {
                                                for (; sem <= 10; sem++) {
                                                    out.println("<td>&nbsp</td>");
                                                }
                                                out.println("</tr><tr>");
                                                linea = tmp;
                                                sem = 0;
                                            }
                                            tmp = (new Integer((String) Detalle.elementAt(3))).intValue();
                                            String ident = ((String) Detalle.elementAt(0));
                                            idplan = ((String) Detalle.elementAt(9));
                                            for (; sem < tmp; sem++) {
                                                out.println("<td> &nbsp</td>");
                                            }
                                            Vector idasig = est.getdespidasig(IdEst, ident, 1);
                                            int longi = idasig.size();
                                            color = new String("#000000");
                                            spar = new String("3");
                                            if (longi > 0) {
                                                color = new String("#009933");
                                            } else {
                                                Vector asig = est.getdespasig(oout, carnet, ident);
                                                int longitud = asig.size();
                                                if (longitud > 0) {
                                                    spar = new String("4");
                                                    color = new String("#3366FF");
                                                }
                                            }
                                            Vector niveles = est.Nivel(idplan, ident);
                                            if (niveles.size() > 0) {
                                             nivel = (((Vector) niveles.elementAt(0)).elementAt(0).toString());
                                            }
                                            if (nivel.equals("1")) {
                                                out.println("<td bgcolor=\"#E0FBDD\"><B><a href=\"JavaScript:openPop('prerreplan?ident=" + ident + "&spar=" + spar + "&idplan=" + idplan + "' " + ") " + "\" > <font color=\"" + color + "\">" + Detalle.elementAt(1) + "</font></B></td>");
                                            } else if (nivel.equals("2")) {
                                                out.println("<td bgcolor=\"#0DFF86\"><B><a href=\"JavaScript:openPop('prerreplan?ident=" + ident + "&spar=" + spar + "&idplan=" + idplan + "' " + ") " + "\" > <font color=\"" + color + "\">" + Detalle.elementAt(1) + "</font></B></td>");
                                            } else if (nivel.equals("3")) {
                                                out.println("<td bgcolor=\"#00C600\"><B><a href=\"JavaScript:openPop('prerreplan?ident=" + ident + "&spar=" + spar + "&idplan=" + idplan + "' " + ") " + "\" > <font color=\"" + color + "\">" + Detalle.elementAt(1) + "</font></B></td>");
                                            } else {
                                                out.println("<td><B><a href=\"JavaScript:openPop('prerreplan?ident=" + ident + "&spar=" + spar + "&idplan=" + idplan + "' " + ") " + "\" > <font color=\"" + color + "\">" + Detalle.elementAt(1) + "</font></B></td>");

                                            }
                                            sem++;
                                        }
                                        for (; sem <= 10; sem++) {
                                            out.println("<td> &nbsp</td>");
                                        }
                                        out.println("</tr></table><br>");
                                        //}
                                        Vector creditos = est.getCreditos(IdEst, est.getidplan(), oout);
                                        out.println("<b>Total de créditos aprobados:</b>");
                                        Vector crediplan = (Vector) creditos.elementAt(0);
                                        out.println(crediplan.elementAt(0));
                                        if (dp == 1) {
                                            out.println("<a href=\"plandoble" + "\" > <center><b>VER DOBLE PLAN</b> </center></font></a>");
                                        }
                                    }
                                %>
                        </table>
                        <%if (idplan.equals("334")) {%>
            <table width="20%" align="center" class="tabla">
                <tr><td bgcolor="#E0FBDD" width="45">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Nivel I</td></tr>
            </table>
            
            <table width="20%" align="center" class="tabla">
                <tr><td bgcolor="#0DFF86" width="45">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Nivel II</td></tr>
            </table>
            
            <table width="20%" align="center" class="tabla">
                <tr><td bgcolor="#00C600" width="45">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Nivel III</td></tr>
            </table>
            <%}%>
                    </td>
                </tr>
            </table>

            <%//IF DE CONTESTO ENCUESTAS
        }
            %>
        </div><!--container-->
           <footer style="position: static">
    <div class="container">
        <div class="row">
            <div class="col-8 oferta-academica">
                <ul>
                <h6>Oferta Educativa</h6>  
                   <li>Carreras profesionales</li>
                   <li>Especializaciones</li>
                   <li>Maestrías</li>
                   <li>Doctorado</li>
                   <li>Educación Continuada</li>
                   <li>Escuela Internacional de Verano</li> 
               </ul>
                
            </div>
            <div class="col localizacion-redes">
                <ul> 
                    <li><img width="60%" height="60%" src="img/Navegacion/acreditacion.png" class="img-fluid" alt="acreditación institucional"></li><br>
                   <li>
                     <div class="row">
                         <div class="col-1 mr-2">
                            <img src="img/Navegacion/icono-localizacion.png" alt="localizacion">
                        </div>
                         <div class="col ml-1">
                             <p>AK. 45 n.º 205 - 59 (Autopista Norte)
                             <br>PBX: +57 (1) 668 3600 - Bogotá
                             <br>Línea nacional gratuita: 018000112668</p>
                         </div>
                     </div>
                   </li>
                   <li>
                       <ul class="list-inline">
                           <li class="list-inline-item"><a href="https://www.facebook.com/EscuelaIng/" target="_blank"><img src="img/Navegacion/icono-facebook.png" class="img-fluid" alt="facebook"></a></li>
                           <li class="list-inline-item"><a href="https://twitter.com/Escuelaing" target="_blank"><img src="img/Navegacion/icono-twitter.png" class="img-fluid" alt="twitter"></a></li>
                           <li class="list-inline-item"><a href="https://www.linkedin.com/school/escuela-colombiana-de-ingenieria/" target="_blank"><img src="img/Navegacion/icono-linkedin.png" class="img-fluid" alt="linkedin"></a></li>
                           <li class="list-inline-item"><a href="https://www.instagram.com/somoscivilescuelaing/" target="_blank"><img src="img/Navegacion/icono-instagram.png" class="img-fluid" alt="instagram"></a></li>
                           <li class="list-inline-item"><a href="https://www.youtube.com/user/escuelacolingenieria" target="_blank"><img src="img/Navegacion/icono-youtube.png" class="img-fluid" alt="youtube"></a></li>
                       </ul>
                   </li>
               </ul>
            </div>
            <div class="col-12 derechos-reservados">
                <p>
                    Todos los derechos reservados ©2011 - Escuela Colombiana de Ingeniería Julio Garavito. Personería Jurídica 086 de enero 19 de 1973. Renovación de Acreditación Institucional de Alta Calidad. Resolución 002710 del 18 de marzo de 2019 (vigencia de 6 años). Vigilada por Mineducación.
                </p>
            </div>
        </div>
    </div>
</footer>
    </body>
</html>
<%
    } catch (Exception e) {
        Correo correo = new Correo();
        correo.enviar("Plan Estudio", e.getMessage());
    }
%>