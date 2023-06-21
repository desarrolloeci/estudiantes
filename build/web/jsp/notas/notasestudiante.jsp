<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    String periodo = request.getParameter("periodo");
    String ban = new String((String) session.getAttribute("ban"));
    String notad;
    PrintWriter oout = response.getWriter();
    configECI cfgEci = new configECI();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    //   Estudiante est = (Estudiante) sesion.getAttribute("estClase");
    String msg = "";
    String secHash = "";
    String originalHash = "";
    String seccode = request.getParameter("seccode");
    System.out.println("Valor caja texto : " + seccode);
    if (!(seccode == null || seccode.equals("null"))) {
        originalHash = (String) session.getAttribute("keycap");
        System.out.println(originalHash);
        System.out.println("Valor de captcha sesion : " + originalHash);
        secHash = seccode;
        if (originalHash.equals(secHash)) {
            msg = "Correcto";
        } else {%>
<jsp:forward page="consultnotas?msg=Error en el código"/>
<%  }
    }%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Consultar Notas</title>

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
                            <jsp:param name="anterior" value="consultnotas" />
                        </jsp:include>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                <label id="msj">Consulta de Notas</label>
                                </font></h2>
                        </div></td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" align="center" class="tabla">
                            <%Vector notas = est.getNotasAnt(carnet, periodo);
                                Vector notasact = est.getNotasAct(carnet, cfgEci.getPeriodoActual());
                                //El periodo 2020-1 quemado solamente se deja mientras haya periodos paralelos por coronavirus
                                Vector notas20201 = est.getNotasAct(carnet, "2020-1");
                                //Esto solo ocurre mientras 2020-1 y 2020-i transcurran en paralelo por coronavirus
                                if(!notas20201.isEmpty()&&periodo.equals("2020-1")){
                                    notasact=notas20201;
                                    periodo="PA";
                                }
                            %>
                            <%if ((notas.size() > 0) || (notasact.size() > 0)) {%>
                            <%
                                if (!(periodo.equals("PA"))) {%>
                            <% for (int j = 0; j < 1; j++) {
                                    Vector notasant = (Vector) notas.elementAt(j);%>
                            <tr>
                                <td height="6" valign="top">
                                    <%if (!est.getPerIng().equals(periodo)) {%>
                                    <%if (notasant.elementAt(14).equals("P")) {
                                            Vector Promedio = est.PromedioPos(carnet);%>
                                    <b>Pr. Acum: <%=Promedio.elementAt(0)%></b>
                                    <%} else {%>
                                    <b>Pr. Acum: <%=notasant.elementAt(3)%></b>
                                    <%}
                                        }%>
                                    <br>
                                    <!--  <font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Pr.
                                    Ult. Sem: <font color="#000000"><!%=notasant.elementAt(4)%></font></b> -->
                                    <b>Datos para el Periodo: <%=notasant.elementAt(6)%></b> </td>
                            </tr>
                            <%if (notasant.elementAt(14).equals("P")) {%>
                            <b>El promedio acumulado corresponde al promedio ponderado de todas las asignaturas que tienen calificaciones.
                            </b>

                            <%}
                                }%>
                            <%} else {%>
                            <!--else si periodo es actual-->
                            <% for (int j = 0; j < 1; j++) {
                                    Vector notasactual = (Vector) notasact.elementAt(j);
                            %>
                            <tr>
                                <td height="38" valign="top">
                                    <%if (!est.getPerIng().equals(cfgEci.getPeriodoActual())) {%>
                                    <b>Pr. Acum:
                                        <%
                                            if (notasactual.elementAt(3).toString().equals("0E-7")) {
                                                out.println(" ---- ");
                                            } else {
                                                out.println(notasactual.elementAt(3));
                                            }
                                        %></b>
                                        <%}%>
                                    <br>
                                    <!--<font face="Verdana, Arial, Helvetica, sans-serif" color="#336699" font size="2"><b>Pr.
            Ult. Sem: <font color="#000000"><!%=notasactual.elementAt(4)%></font></b>
                                </font>--></td>
                            </tr>
                            <%}%>
                            <%}%>
                            <!--fin else-->
                            <%
                                
                                if (!(periodo.equals("PA"))) {%>
                            <tr>
                                <td valign="top">
                                    <table width="100%" border="1" align="center" bordercolor="#666666" class="tabla">
                                        <tr bgcolor="#666666">
                                            <td>
                                                <div align="center"><font color="#FFFFFF"><b>Código</b></font></div>
                                            </td>
                                            <td>
                                                <div align="center"><font color="#FFFFFF"><b>Nombre</b></font></div>
                                            </td>
                                            <% Vector notasant = (Vector) notas.elementAt(0);
                                                 if (notasant.elementAt(14).equals("P")) {%>
                                            <td>
                                                <div align="center"><font color="#FFFFFF"><b>Créditos</b></font></div>
                                            </td>
                                            <%}%>
                                            <td>
                                                <div align="center"><font color="#FFFFFF"><b>Nota</b></font></div>
                                            </td>
                                            <td>
                                                <div align="center"><font color="#FFFFFF"><b>Clave</b></font></div>
                                            </td>
                                            <td>
                                                <div align="center"><font color="#FFFFFF"><b>Observaciones</b></font></div>
                                            </td>
                                        </tr>
                                        <% for (int j = 0; j < notas.size(); j++) {
                                                notasant = (Vector) notas.elementAt(j);
                                                notad = notasant.elementAt(9).toString();
                                                if (!notasant.elementAt(12).toString().equals("N")) {
                                                    if (notad.equals("No disponible")) {
                                                        notad = "No disponible";
                                                    } else if (notad.compareTo("3.0") >= 0) {
                                                        notad = "Aprobado";
                                                    } else {
                                                        notad = "No aprobado";
                                                    }
                                                }%>
                                        <tr>
                                            <td>
                                                <div align="center"><%=notasant.elementAt(7)%></div>
                                            </td>
                                            <td>
                                                <div align="center"><%=notasant.elementAt(8)%></div>
                                            </td>
                                            <% if (notasant.elementAt(14).equals("P")) {%>
                                            <td>
                                                <div align="center"><%=notasant.elementAt(13)%></div>
                                            </td>
                                            <%}%>
                                            <td>
                                                <div align="center"><%=notad%></div>
                                            </td>
                                            <td>
                                                <div align="center">&nbsp;<%=notasant.elementAt(10)%></div>
                                            </td>
                                            <td>
                                                <div align="center"><%=notasant.elementAt(11)%></div>
                                            </td>
                                        </tr>
                                        <%}%>
                                    </table>
                                </td>
                            </tr>
                            <%} else {%>
                            <!--cierra if de periodo diferente PA-->
                            <tr>
                                <td valign="top" >
                                    <table width="100%" border="1" align="center" bordercolor="#CCCCCC" class="tabla">
                                        <tr bgcolor="#cc0000">
                                            <td bgcolor="#666666">
                                                <div align="center"><font color="#FFFFFF"><b>Código</b></font></div>
                                            </td>
                                            <td bgcolor="#666666">
                                                <div align="center"><font color="#FFFFFF"><b>Nota
                                                        1</b></font></div>
                                            </td>
                                            <td bgcolor="#666666">
                                                <div align="center"><font color="#FFFFFF"><b>Nota
                                                        2</b></font></div>
                                            </td>
                                            <td bgcolor="#666666">
                                                <div align="center"><font color="#FFFFFF"><b>Nota
                                                        3</b></font></div>
                                            </td>
                                            <td bgcolor="#666666">
                                                <div align="center"><font color="#FFFFFF"><b>Lab ó Not4</b></font></div>
                                            </td>
                                            <td bgcolor="#666666">
                                                <div align="center"><font color="#FFFFFF"><b>Nota5
                                                    </b></font></div>
                                            </td>
                                            <td bgcolor="#666666">
                                                <div align="center"><font color="#FFFFFF"><b>Nota</b></font></div>
                                            </td>
                                            <td bgcolor="#666666">
                                                <div align="center"><font color="#FFFFFF"><b>Clave</b></font></div>
                                            </td>
                                        </tr>
                                        <% for (int j = 0; j < notasact.size(); j++) {
                                                Vector notasactual = (Vector) notasact.elementAt(j);%>
                                        <tr>
                                            <td>
                                                <div align="center"><%=notasactual.elementAt(6)%></div>
                                            </td>
                                            <%          if (notasactual.elementAt(7).equals("No disponible")) {%>
                                            <td>
                                                <div align="center">&nbsp;</div>
                                            </td>
                                            <%          } else {%>
                                            <td>
                                                <div align="center"><%=notasactual.elementAt(7)%></div>
                                            </td>
                                            <%          }%>
                                            <%          if (notasactual.elementAt(8).equals("No disponible")) {%>
                                            <td>
                                                <div align="center">&nbsp;</div>
                                            </td>
                                            <%          } else {%>
                                            <td>
                                                <div align="center"><%=notasactual.elementAt(8)%></div>
                                            </td>
                                            <%          }%>
                                            <%          if (notasactual.elementAt(9).equals("No disponible")) {%>
                                            <td>
                                                <div align="center">&nbsp;</div>
                                            </td>
                                            <%          } else {%>
                                            <td>
                                                <div align="center"><%=notasactual.elementAt(9)%></div>
                                            </td>
                                            <%          }%>
                                            <%          if (notasactual.elementAt(10).equals("No disponible")) {%>
                                            <td>
                                                <div align="center">&nbsp;</div>
                                            </td>
                                            <%          } else {%>
                                            <td>
                                                <div align="center"><%=notasactual.elementAt(10)%></div>
                                            </td>
                                            <%          }%>
                                            <%          if (notasactual.elementAt(14).equals("No disponible")) {%>
                                            <td>
                                                <div align="center">&nbsp;</div>
                                            </td>
                                            <%          } else {%>
                                            <td>
                                                <div align="center"><%=notasactual.elementAt(14)%></div>
                                            </td>
                                            <% }%>

                                            <%          if (notasactual.elementAt(11).equals("No disponible")) {%>
                                            <td>
                                                <div align="center">&nbsp;</div>
                                            </td>
                                            <%          } else {%>
                                            <td>
                                                <div align="center"><%=notasactual.elementAt(11)%></div>
                                            </td>
                                            <% }%>
                                            <td>
                                                <div align="center">&nbsp;<%=notasactual.elementAt(12)%></div>
                                            </td>

                                        </tr>
                                        <%}%>
                                    </table>
                                </td>
                            </tr>
                            <%}%>
                            <%} else {%>
                            <tr>
                                <td >&nbsp;</td>
                            </tr>
                            <tr>
                                <td >
                                    <p><b>NO EXISTEN DATOS PARA ESTE PERIODO</b></p>
                                </td>
                            </tr>
                            <%}%>
                            <tr>
                                <td >&nbsp;</td>
                            </tr>
                            <tr>
                                <td ><div align="center" class="texto">
                                        <p><font color="#666666">Este documento
                                            no es v&aacute;lido como certificado
                                            oficial de la Escuela Colombiana de Ingenier&iacute;a<br>
                                            Secretar&iacute;a General</font></p>
                                    </div></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!%}
            }%>
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

