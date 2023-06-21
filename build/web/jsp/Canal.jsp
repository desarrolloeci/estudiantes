<%-- 
    Document   : Canal
    Created on : 18/12/2017, 11:30:26 AM
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
    String correo = "";
    String ban = new String((String) session.getAttribute("ban"));
    String dpto = new String((String) session.getAttribute("dpto"));
    PrintWriter oout = response.getWriter();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    Vector datosEst = est.getDatosEst(carnet), datosestud;
    configECI confEci = new configECI();
    String clave = (String) session.getAttribute("passwd");
    String usuario = (String) session.getAttribute("usuario");
    String ruta = new String();
    String estado = new String();
    // Vector can = est.ConsultacredistosE(confEci.getPeriodoActual(), carnet);
    Vector canal = est.Representantes(dpto);%>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <title>Canal de comunicación Estudiantil</title>
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
                        </jsp:include></td>
                </tr>
            </table>
            <a href="https://tycho.escuelaing.edu.co/contenido/canal-estudiantil/INSTRUCTIVO.pdf" target="blank_">Instructivo del Canal de Comunicaciones</a>
            <div align="center">
                <%nombre = ((Vector) canal.elementAt(0)).elementAt(0).toString();%>
                <%correo = ((Vector) canal.elementAt(0)).elementAt(1).toString();%>
                <p>&nbsp;</p><table width="434" border="0">
                    <tr> 
                        <td colspan="2">Datos del Representante</td>
                    </tr>
                    <tr> 
                        <td width="94">Nombres:</td>
                        <td width="289"><%=nombre%></td>
                    </tr>
                    <tr> 
                        <td width="94">Correo: </td>
                        <td width="289"><%=correo%></td>
                    </tr>
                </table>
                <td colspan="2" bgcolor="#EEEEEE"><img id="fotoRep" src="img/RepresentantesDeCarrera/<%=dpto%>.jpg" alt="" width="100" height="100" /></td>
                <p>&nbsp;</p>
                <table width="547" border="0">
                    <form name="form1" method="post" action="enviarcomunicacion">
                        <input name="clave" type="hidden" value="<%=clave%>">
                        <input name="usuario" type="hidden"  value="<%=usuario%>">
                        <input name="correo" type="hidden"  value="<%=correo%>">
                        <tr> 
                            <td colspan="3"> 

                                <p>1. Qu&eacute; quieres comunicarnos?</p>
                                <p>&nbsp;</p>
                                <textarea name="comunicado" cols="80" rows="4"></textarea>
                                <p>&nbsp;</p>
                                <p>2.Qu&eacute; propones?</p>
                                <textarea name="propuesta" cols="80" rows="4"></textarea>
                            </td>
                        </tr>
                        <tr> 
                            <td width="377"> 
                                <p>&nbsp;</p>
                                <p>Podemos contactarte en caso de requerir tu ayuda:</p>
                                <p>&nbsp;</p>
                            </td>
                            <td width="61"> 
                                <p>&nbsp;</p>
                                <p>Si 
                                    <input type="radio" name="contacto" value="S">
                                </p>
                                <p>&nbsp; </p>
                            </td>
                            <td width="95"> 
                                <p>&nbsp;</p>
                                <p>No 
                                    <input type="radio" name="contacto" value="N">
                                </p>
                                <p>&nbsp;</p>
                            </td>
                        </tr>
                        <tr> 
                            <td colspan="3"> 
                                <div align="center"> 
                                    <input type="submit" name="Submit2" value="Enviar">
                                </div>
                            </td>
                        </tr>

                    </form>
                </table>
                <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                   
                </table>

            </div>

        </div>
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
