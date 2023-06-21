<%-- 
    Document   : MensajeIcetex
    Created on : 1/11/2016, 04:14:45 PM
    Author     : lucero.rodriguez
--%>
<%@page import="java.text.DateFormat"%>
<%@page import="utiles.Correo"%>
<%@ include file="secure.jsp" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*, javax.swing.*, javax.swing.Timer, java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    session = request.getSession(true);
    String mensaje = "";
    int ind = 0;
    String nombres = new String((String) session.getAttribute("nombre"));
    String nombre = "";
    String pilo = "";

    String fecha_cargue = "";
    eci.adjuntar adjuntar;
    PrintWriter oout = response.getWriter();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    String valormatricula = request.getParameter("valormatricula");
    String linea = "";
    String tipo = "";
    String documento = request.getParameter("documento");

    configECI confEci = new configECI();
    Vector icetex = est.Renovar_Icetex(carnet, confEci.getPeriodoSig());
    if (icetex.size() > 0) {
        for (int a = 0; a < icetex.size(); a++) {
            Vector dato = (Vector) icetex.elementAt(a);
            fecha_cargue = dato.elementAt(3).toString();
            linea = dato.elementAt(4).toString();
           // estado = dato.elementAt(1).toString();
            tipo = dato.elementAt(5).toString();

            
        }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Renovación Icetex</title>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function impresion(){
            document.getElementById("tablaboton").style.visibility='hidden';
            window.print();
            window.close();
            }
            -->
        </script>
    </head>
    <body>

        <div id="container">
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td>
                        <jsp:include page="encabezado" flush="true">
                            <jsp:param name="anterior" value="menuServEstud" />
                        </jsp:include></td>
                </tr>
            </table>
            <h23><center><p><b>Su archivo ha sido cargado. Después de la verificación por parte de la Oficina de Apoyo Financiero se publicará si ha sido recibido a 
                    satisfacción.  No olvide volver a ingresar a este menú para revisar el estado de recibido de la renovación.</b></p></center>
                <br>
                <table align="center" width="535" border="1" class="textoimpremas">
                    <tr> 
                        <td width="233"><b>Fecha de cargue:</b></td>
                        <td width="144"><%=fecha_cargue%></td>
                    </tr>
                    <tr> 
                        <td width="233"><b>Periodo a renovar</b></td>
                        <td width="144"><%=confEci.getPeriodoSig()%></td>
                    </tr>
                    <tr> 
                        <td width="233"><b>C&oacute;digo estudiante:</b></td>
                        <td width="144"><%=carnet%></td>
                    </tr>
                    <tr> 
                        <td width="233"><b>Documento:</b></td>
                        <td width="144"><%=est.getDocest()%></td>
                    </tr>
                    <tr> 
                        <td width="233"><b>Valor de la matr&iacute;cula:</b></td>
                        <td width="144"><%=valormatricula%></td>
                    </tr>
                    <tr> 
                        <td width="233"><b>L&iacute;nea de cr&eacute;dito:</b></td>
                        <td width="144"><%=linea%> </td>
                    </tr>
                    <tr> 
                        <td width="233"><b>Tipo de matrícula:</b></td>
                        <td width="144"> 
                            <%if (tipo.equals("MC")) {%>
                            MATRICULA COMPLETA
                            <%} else if (tipo.equals("MM")) {%>
                            MEDIA MATRICULA
                            <%} else if (tipo.equals("P")) {%>
                            PRACTICA PROFESIONAL
                            <%} else if (tipo.equals("M")) {%>
                            MOVILIDAD
                            <%}%>

                        </td>
                    </tr>
                </table>

                <br>
                Conserve este documento como constancia que entregó la hoja de actualización de datos de su crédito ICETEX</h3>
                <br>
                <table width="100%" border="0" id="tablaboton" >
                    <tr>
                        <td width="60%">
                            <div align="center">
                                <input name="imprimir" class="boton"  type="submit" id="imprimir3" value="Imprimir" onClick="impresion()">
                            </div>
                        </td>
                    </tr>
                </table>


                </body>
                </html>
                <%}%>
