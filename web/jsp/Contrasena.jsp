<%-- 
    Document   : Contraseña
    Created on : 1/02/2017, 08:56:41 AM
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
    String linea = "";
    String valormatricula = "";
    eci.adjuntar adjuntar;
    String ban = new String((String) session.getAttribute("ban"));
    String id_plan = new String((String) session.getAttribute("id_plan"));
    PrintWriter oout = response.getWriter();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
  //  Vector datosEst = est.getDatosEst(carnet), datosestud;
    configECI confEci = new configECI();
    String ruta = new String();
    String estado = new String();
    String operacion = "n";
    
    %>
    
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Gestionar contraseña de correo</title>
         <link href="css/estilo-resultadoconocimiento.css" rel="stylesheet" type="text/css" media="all">
         </head>

    <body>

        <div id="container">
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="textoimpremas">
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
            <p></p>
            <section>
                <div id="formulario">
                    <table  align="center" width="150%" border="0">
                        <tr>
                            <td><font face="Times New Roman, Times, serif"><a href="http://tycho.escuelaing.edu.co/contenido/documentos/Manualcambiocontrasenas.pdf" TARGET="blank">1. Consulte el manual para gestionar el cambio de contraseña</a></font></td>
                        </tr>
                       
                        <tr>
                            <td><font face="Times New Roman, Times, serif"><a href="https://gestorpasswd.escuelaing.edu.co/" TARGET="blank">2. Cambie su contraseña</a></font></td>
                        </tr>
                     
                    </table>
                      </table>
            </section>
          
               <footer>
                <span class="programa">
                    Escuela Colombiana de Ingeniería Julio Garavito
                </span>
                <span class="direccion">
                    AK.45 No.205-59 (Autopista Norte)<br/>
                    Contact Center: +57(1) 668 3600<br/>
                    Call Center: +57(1) 668 3600<br/>
                    Línea Nacional Gratuita: 018000112668<br/>
                    www.escuelaing.edu.co<br/>
                    Bogotá, D.C. - Colombia<br/>
                </span>
            </footer>
                                          </div>

             </body>
</html>