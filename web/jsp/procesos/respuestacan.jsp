<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%
        response.setHeader("Cache-Control", "no-cache");
        otros.rutas ruta = new otros.rutas();
        String nombre = new String((String) session.getAttribute("nombre"));
        String ban = new String((String) session.getAttribute("ban"));
        String clanum = new String((String) session.getAttribute("clanum"));
        String codigo = request.getParameter("codigo");
        String codigo1 = request.getParameter("codigo1");
        String obs = request.getParameter("obs");
        obs = obs.replace("'", "");
        PrintWriter oout = response.getWriter();
        StringTokenizer st = new StringTokenizer(codigo, "*");
        int k = 0;
        String texto[] = new String[2000];
        while (st.hasMoreTokens()) {
            texto[k] = st.nextToken();
            k = k + 1;
        }
        String cod = (String) texto[0];
        String grp = (String) texto[1];
        String idcor = (String) texto[2];
        session = request.getSession(true);
        cod = cod.toUpperCase();
%>
<!-- GUARDA EN ARCHIVO-->
<%
        try {
            FileWriter arch = new FileWriter(ruta.valruta() + "cancelaciones.txt", true);
            BufferedWriter arch1 = new BufferedWriter(arch);
            PrintWriter entrada = new PrintWriter(arch1);
            String datos = (String) carnet + "," + (String) cod + "," + (String) grp + "," + (String) obs.toUpperCase();
            entrada.println(datos);
            entrada.close();
            arch.close();
            arch1.close();
        } catch (java.io.FileNotFoundException fnfex) {
            System.out.println("Archivo no encontrado: " + fnfex);%>
<p>&nbsp;</p>	  
<p class="texto">No pudo ser procesada su información en el archivo</p>
<%
        }
        Estudiante est = (Estudiante) session.getAttribute("estClase");
        long resp = est.CanceleAsig(carnet, cod, obs);
        long resp1 = 0;
        if (codigo1 != null) {
            resp1 = est.CanceleAsig(carnet, codigo1, obs);
        }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad&eacute;micos - Cancelaciones</title>

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
                            <h2><font color="#666666">Respuesta de cancelaci&oacute;n</font><font color="#666666">
                                    <label id="msj"></label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                        <div align="left">
                            <%  if (resp > 0 && resp1 > 0) {
                            %>
                            <span><b>La solicitud de cancelación para las asignaturas: <font color="#336699"><%=cod%> y <%=codigo1%></font>
                                    <!-- grupo: --><font color="#336699"><!%=grp%> </font>fueron recibidas.<br> <br>
                                    <u>Los número de su cancelación son <%=resp%> y <%=resp1%> respectivamente, conserve estos
                                    números como prueba de su solicitud de cancelación.</u>

                                </b>
                            </span>
                            <p><span class="texto"><b>Pendiente
                                aprobación del decano </b>
                            </span>
                            <p><b>Recuerde:
                                    Debe asistir a clase hasta que el decano apruebe la cancelación. <br>
                            Esta respuesta aparece al cierre del proceso de cancelación.</b></p>
                            <%} else if (resp > 0) {%>
                            <span><b>La solicitud de cancelación para la asignatura: <font color="#336699"><%=cod%></font>
                                    grupo: <font color="#336699"><%=grp%> </font>fue recibida.<br> <br>
                                    <u>El número de su cancelación es <%=resp%>, conserve este
                                    número como prueba de su solicitud de cancelación.</u>
                                </b>
                            </span>
                            <p><span class="texto"><b>Pendiente aprobación del decano </b>
                            </span>
                            <p><b>Recuerde:
                                    Debe asistir a clase hasta que el decano apruebe la cancelación. <br>
                            Esta respuesta aparece al cierre del proceso de cancelación.</b></p>
                            <%} else {%>
                            <b>El servidor se encuentra ocupado. Por favor intente más tarde.</b>
                            <%}%>
                        </div>
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
