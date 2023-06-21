<%-- 
    Document   : horarioEstudPos
    Created on : 30/01/2012, 04:23:28 PM
    Author     : lrodriguez
--%>
<%@ include file="../secure.jsp" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Actas.ActaJava" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    session = request.getSession(true);
    String nombre = new String((String) session.getAttribute("nombre"));
    String ban = new String((String) session.getAttribute("ban"));
    PrintWriter oout = response.getWriter();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    configECI confEci = new configECI();
    Vector vh;
    String maximo;
    Vector periodo = est.getMaxPeriodoPos();%>


<%!  Vector iniMatriz() {
        int i, j;
        Integer h;
        String vacia = new String(" "), cad;
        Vector horario = new Vector();
        Vector horas = new Vector();

        for (i = 600, j = 0; i <= 2000; i = i + 100, j++) {
            h = new Integer(i);
            cad = new String(h.toString(i) + "-" + h.toString(i + 30) + "     ");
            horas.addElement(cad);
            cad = new String(h.toString(i + 30) + "-" + h.toString(i + 100) + "     ");
            horas.addElement(cad);
        }
        horario.addElement(horas);
        for (i = 1; i < 7; i++) {
            horas = new Vector();
            for (j = 0; j < 29; j++) {
                horas.addElement(vacia);
            }
            horario.addElement(horas);
        }
        return horario;
    }
%>


<%! void marqueHora(Vector horas, Vector reg) {
        int horaini, horafin, pdia, inicio, fin, i;
        Vector dia;
        String cadhor;
        horaini = (new Integer((String) reg.elementAt(4))).intValue();
        horafin = (new Integer((String) reg.elementAt(5))).intValue();
        pdia = (new Integer((String) reg.elementAt(3))).intValue();
        cadhor = new String(reg.elementAt(1) + "-" + reg.elementAt(6) + " (" + reg.elementAt(2) + ")");
        dia = (Vector) horas.get(pdia);
        inicio = (horaini / 100) * 2 - 12;
        if (horaini % 100 > 0) {
            inicio++;
        }
        fin = (horafin / 100) * 2 - 12;
        if (horafin % 100 > 0) {
            fin++;
        }
        for (i = inicio; i < fin; i++) {
            String temp = dia.elementAt(i).toString();
            if (temp.equals(" ")) {
                dia.setElementAt(cadhor, i);
            } else {
                dia.setElementAt(temp + "<br>" + cadhor, i);
            }
        }
        horas.setElementAt(dia, pdia);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Horario de Estudiantes</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>

        <!-- CSS -->
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
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
                <% if (periodo.size() > 0) {
                        //   ((Vector) consulta.elementAt(0)).elementAt(6).toString();
                        maximo = ((Vector) periodo.elementAt(0)).elementAt(0).toString();
                        Vector horario = est.getInfoHorarioPos(maximo);

                        Vector horarioest = new Vector();
                %>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                <label id="msj">Horario de Clase</label>
                                </font></h2>
                        </div></td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" align="center" class="tabla">
                            <tr>
                                <td align="center" valign="top" colspan="2">
                                    <%if ((horario.size()) > 0) {%>

                                    <%Vector horas;
                                        horas = iniMatriz();
                                        for (int j = 0; j < horario.size(); j++) {
                                            horarioest = (Vector) horario.elementAt(j);
                                            marqueHora(horas, horarioest);
                                            // out.println(horarioest);
                                        }
                                    %>
                                    <table width="100%" border="1" bordercolor="#CCCCCC" class="tabla">
                                        <tr bgcolor="#666666">
                                            <td width="14%">
                                                <div align="center"><b><font color="#FFFFFF">Horas</font></b></div>
                                            </td>
                                            <td width="14%">
                                                <div align="center"><b><font color="#FFFFFF">Lunes</font></b></div>
                                            </td>
                                            <td width="14%">
                                                <div align="center"><b><font color="#FFFFFF">Martes</font></b></div>
                                            </td>
                                            <td width="14%">
                                                <div align="center"><b><font color="#FFFFFF">Miercoles</font></b></div>
                                            </td>
                                            <td width="14%">
                                                <div align="center"><b><font color="#FFFFFF">Jueves</font></b></div>
                                            </td>
                                            <td width="14%">
                                                <div align="center"><b><font color="#FFFFFF">Viernes</font></b></div>
                                            </td>
                                            <td width="14%">
                                                <div align="center"><b><font color="#FFFFFF">S&aacute;bado</font></b></div>
                                            </td>
                                        </tr>
                                        <%
                                            //try{
                                            for (int j = 0; j < 29; j++) {%>
                                        <tr>
                                            <%for (int i = 0; i < 7; i++) {%>
                                            <td>
                                                <div align="center">
                                                    <%vh = (Vector) horas.elementAt(i);%>

                                                    &nbsp;<%=(String) vh.elementAt(j)%>&nbsp;&nbsp; </div>

                                            </td>
                                            <%}%>
                                        </tr>
                                        <%}

                                            /*}catch(Exception e){
                                             out.println(e.getMessage());
                                             }*/%>
                                    </table>

                                    <%} else {%>
                                    <p>&nbsp;</p><p align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">No tiene horario asignado para este periodo</font></b></p>
                                            <%}
                                                }%>
                                    <p>&nbsp;</p>
                                </td>
                            </tr>
                        </table>
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
</html>
