<%@page import="utiles.Correo"%>
<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%  try{
            response.setHeader("Cache-Control", "no-cache");
            String IdEst = new String((String) session.getAttribute("carnet"));
            String spar, color;
            PrintWriter oout = response.getWriter();
            Estudiante est = (Estudiante) session.getAttribute("estClase");
            int indice, linea, sem, tmp, par, n;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad�micos - Doble Plan de estudios</title>
        
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
                        <table border="1" cellspacing="0" width="100%" class="tabla">
        <tr> 
                        <%
            Vector plan = est.getDoblePlan(oout, IdEst);
            int lon = plan.size();
            Vector Detalleplan = (Vector) plan.elementAt(1);
            if (plan.size() <= 0) {
                out.println("No hay datos en la consulta");
            } else {
                for (indice = 1; indice <= 10; indice++) {
                    out.println("<td>" + (new Integer(indice)).toString() + "</td>");

                }
                linea = 0;
                sem = 11;
                for (indice = 0; indice < plan.size(); indice++) {
                    Vector Detalle = (Vector) plan.elementAt(indice);
                    tmp = (new Integer((String) Detalle.elementAt(2))).intValue();
                    if (linea != tmp) {
                        for (; sem <= 10; sem++) {
                            out.println("<td> &nbsp</td>");
                        }
                        out.println("</tr><tr>");
                        linea = tmp;
                        sem = 1;
                    }
                    tmp = (new Integer((String) Detalle.elementAt(3))).intValue();
                    String ident = ((String) Detalle.elementAt(0));
                    for (; sem < tmp; sem++) {
                        out.println("<td>&nbsp</td>");
                    }
                    Vector idasig = est.getdespidasig(IdEst, ident, 2);
                    int longi = idasig.size();
                    color = new String("#000000");
                    spar = new String("3");
                    if (longi > 0) {
                        //verde
                        color = new String("#009933");
                    } else {
                        Vector asig = est.getdespasig(oout, carnet, ident);
                        int longitud = asig.size();
                        if (longitud > 0) {
                            spar = new String("4");
                            //AZUL
                            color = new String("#3366FF");
                        }
                    }
                    out.println("<td><B><a href=\"JavaScript:openPop('prerreplandp?ident=" + ident + "&spar=" + spar + "' " + ") " + "\" > <font color=\"" + color + "\">" + Detalle.elementAt(1) + "</font></B></td>");
                    sem++;
                }
                for (; sem <= 10; sem++) {
                    out.println("<td> &nbsp</td>");
                }
                out.println("</tr></table><br>");
            }
                        %>
                    </td>
                </tr>
            </table>
        </div><!--container-->
           <footer style="position: static">
    <div class="container">
        <div class="row">
            <div class="col-8 oferta-academica">
                <ul>
                <h6>Oferta Educativa</h6>  
                   <li>Carreras profesionales</li>
                   <li>Especializaciones</li>
                   <li>Maestr�as</li>
                   <li>Doctorado</li>
                   <li>Educaci�n Continuada</li>
                   <li>Escuela Internacional de Verano</li> 
               </ul>
                
            </div>
            <div class="col localizacion-redes">
                <ul> 
                    <li><img width="60%" height="60%" src="img/Navegacion/acreditacion.png" class="img-fluid" alt="acreditaci�n institucional"></li><br>
                   <li>
                     <div class="row">
                         <div class="col-1 mr-2">
                            <img src="img/Navegacion/icono-localizacion.png" alt="localizacion">
                        </div>
                         <div class="col ml-1">
                             <p>AK. 45 n.� 205 - 59 (Autopista Norte)
                             <br>PBX: +57 (1) 668 3600 - Bogot�
                             <br>L�nea nacional gratuita: 018000112668</p>
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
                    Todos los derechos reservados �2011 - Escuela Colombiana de Ingenier�a Julio Garavito. Personer�a Jur�dica 086 de enero 19 de 1973. Renovaci�n de Acreditaci�n Institucional de Alta Calidad. Resoluci�n 002710 del 18 de marzo de 2019 (vigencia de 6 a�os). Vigilada por Mineducaci�n.
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
                correo.enviar("Plan Doble", e.getMessage());
            }
%>