<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudMisc" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    String nombre = new String((String) session.getAttribute("nombre"));
    //String ban = new String((String)session.getAttribute("ban"));

    session.setAttribute("ban", "0");
    PrintWriter oout = response.getWriter();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    EstudMisc emisc = new EstudMisc(est.getIdEst());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad�micos - Encuesta acad�mica</title>

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
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                <label id="msj">Encuesta acad&eacute;mica</label>
                                </font></h2>
                        </div></td>
                </tr>
                <tr>
                    <td>
                        <p><font face="Arial, Helvetica, sans-serif" size="2">Apreciado Estudiante:</font></p>
                        <p><font face="Arial, Helvetica, sans-serif" size="2"><br>
                            Para la Escuela Colombiana de Ingenier�a Julio Garavito es muy importante conocer su opini�n con respecto a los procesos acad�micos y sobre los actores (profesores y cursos) involucrados en ellos.  Por tal raz�n, le solicitamos diligenciar la encuesta acad�mica para todos los cursos en los cuales est� inscrito en el periodo actual.

</font></p>
                        <p><font face="Arial, Helvetica, sans-serif" size="2">Tenga en cuenta que esta encuesta es an�nima, por lo tanto sus datos personales no quedan relacionados con las respuestas.</font></p>
                    </td>
                </tr>
                <tr>


                    <td>
                        <fieldset>
                            <font color="#336699" face="Verdana, Arial, Helvetica, sans-serif" ><center>
                                <legend><font color="#666666" size="2"></font></legend> 
                                    <%          Vector encuestas = emisc.getlisEncuestas();
                                        if (encuestas.size() > 0) {
                                    %>
                                <b><font size="2">Seleccione el Grupo para diligenciar su encuesta</font></b> 
                            </center>
                            </font> 
                            <form name="form1" method="post" action="FormaEncuesta">
                                <center>
                                    <select name="grupo">
                                        <% for (int j = 0; j < encuestas.size(); j++) {
                                                Vector enc = (Vector) encuestas.elementAt(j);
                                        %>
                                        <option value="<%=enc.elementAt(0)%>"><%=enc.elementAt(2)%> - <%=enc.elementAt(1)%></option>
                                        <%}%>
                                    </select>
                                </center>
                                <br>
                                <div align="center"> 
                                    <input type="submit" name="Submit" value=" Ir a la Encuesta " size="2" class="boton">
                                </div>
                            </form>
                            <%         } else {
                                if (emisc.getNumSorteo().equals("No disponible")) {
                                    emisc.setNumSorteo();
                                }
                            %>
                            <br><br><b><font size="2">Gracias por participar activamente en la
                                Encuesta acad�mica.<br><!--Usted participar� en el sorteo correspondiente.--> 
                                <%//=emisc.getNumSorteo()%>
                                </font></b> 
                                <%          }
                                %>
                        </fieldset>                    </td>
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
</html>
