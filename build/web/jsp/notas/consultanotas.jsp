<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%
            response.setHeader("Cache-Control", "no-cache");
            String nombre = new String((String) session.getAttribute("nombre"));
            String ban = new String((String) session.getAttribute("ban"));
            PrintWriter oout = response.getWriter();
            Estudiante est = (Estudiante) session.getAttribute("estClase");
           //validar si ya contesto todas las encuestas académicas sino enviarlo a la encuesta.
            Vector CuantosEnc = est.AsignaEncuestaA(carnet);
            Vector cuantos = new Vector();
            cuantos = (Vector) CuantosEnc.elementAt(0);
            int total;
            //validar si ya contesto todas las encuestas académicas sino enviarlo a la encuesta.
            total= (Integer.parseInt((String) cuantos.elementAt(0)));  //cuantos debe contestar en la encuesta academica
           
            Vector contesto = est.ContestaEncuestaA(carnet);
            Vector valorcontesto = new Vector();
            valorcontesto = (Vector) contesto.elementAt(0);
            int totalcontesto;
            totalcontesto = (Integer.parseInt((String) valorcontesto.elementAt(0))); //cuantas asignaturas contesto
            //DESHABILITA SERVICIO SI NO CONTESTO ENCUESTAS
            //ESTE FALSE SE QUITA CUANDO LO SOLICITE LILIANA PEDRAZA
            if (false && total != totalcontesto){
                               response.sendRedirect("ListaEncuestas");
                          }else {
%>
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
                            <jsp:param name="anterior" value="menuServEstud" />
                        </jsp:include></td>
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
                        <center>
                            <legend><b>Consulta de Notas </b></legend> <b>Seleccione el periodo
                                académico a consultar:</b>
                        </center>

                        <form name="form1" method="post" action="notasestud">
                            <%Vector period = est.getInfoPeriodos();
                            Vector notas20201=est.getNotasAct(carnet, "2020-1");
                            %>
                            <center>
                                <select name="periodo">
                                    <%//ESTO SE DESCOMENTA CUANDO EL ESTUDIANTE SOLUCIONE SU SITUACION FINANCIERA CON LA ESCUELA
                                        if(!carnet.equals("2086541")){%>
                                    <option value="PA">Consulta Periodo Actual</option>
                                    <%
                                        if(!notas20201.isEmpty()){
                                            %>
                                            <option value="2020-1">Periodo 2020-1</option>
                                            <%
                                        }
                                    %>
                                    
                                    <%}%>
                                    <!--option value="2007-I">Consulta Periodo Actual</option-->
                                    <% for (int j = 0; j < period.size(); j++) {
                                        Vector periodos = (Vector) period.elementAt(j);
                                        if((!carnet.equals("2086541"))||(carnet.equals("2086541")&&!periodos.elementAt(0).equals("2018-2"))){
                                    %>
                                    <option value="<%=periodos.elementAt(0)%>">Período <%=periodos.elementAt(0)%></option>
                                    <%}}%>
                                </select>
                            </center>

                            <div align="center">
                                <p>&nbsp;</p>
                                <p><!--clave de confirmaci&oacute;n: --></p>
                                <!% String msg = request.getParameter("msg");
                                if (msg == null) {
                                msg = "&nbsp;";
                                }%>
                                <p><br>
                                </p>
                            </div>
                            <!--
                                                        <div align="center">Ingrese el código:<img src="Captcha" id="captcha">
                                                            <input name="seccode" size="08" type="text" maxlength="8">
                                                        <!%=msg%> </div>-->
                            <div align="center">
                                <input type="submit" name="Submit" value=" Consultar " size="2" class="boton">
                            </div>

                        </form>
                    </td>
                </tr>
                
                <%//CIERRE DE IF DE ENCUENTAS
            }
                %>
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
