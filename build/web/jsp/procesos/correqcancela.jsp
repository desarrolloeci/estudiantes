<%-- 
    Document   : correqcancela
    Created on : 24/08/2011, 03:01:26 PM
    Author     : lrodriguez
--%>

<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    otros.rutas ruta = new otros.rutas();
    String nombre = new String((String) session.getAttribute("nombre"));
    int ind = 0;
    configECI confEci = new configECI();
    String ban = new String((String) session.getAttribute("ban"));
    String clanum = new String((String) session.getAttribute("clanum"));
    String id_plan = new String((String) session.getAttribute("id_plan"));
    String codigo = request.getParameter("codigo");
    String obs = request.getParameter("observ");
    String totalcancelar = request.getParameter("totalcancelar");
    int totcancela = Integer.parseInt(totalcancelar);
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
    Vector correq = est.getCorreqcancela(idcor, id_plan);
    Vector Veces = est.CancelaVeces(carnet, idcor);
    Vector acancelado = est.CuentaAsignaturasCan(carnet, confEci.getPeriodoActual());
    String totalcancelo = ((Vector) acancelado.elementAt(0)).elementAt(0).toString();
    int total = Integer.parseInt(totalcancelo);

    //   Vector acancelado = est.CuantasCancela(carnet, confEci.getPeriodoActual());
    // int totalcancelo = acancelado.size();



//long resp = est.CanceleAsig(carnet, cod, obs);
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

    </head>
    <body id="public" style="background-color: white">
        <div id="container">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                <form name="form1" method="post"  action="RespuestaCancelacion">
                    <input type="hidden" name="obs" value="<%=obs%>">
                    <input type="hidden" name="codigo" value="<%=codigo%>">
                    <tr>
                        <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top"/>
                        </td>
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
                            <% if (total == 1) {%>
                    <center><b> <font color=#800000 size=2>Debe realizar el proceso de cancelación voluntaria de la matrícula ante la Secretaría General.</font></b></center>
                            <%} else if (Veces.size() >= 2) {%>
                    <center><b> <font color=#800000 size=2>No puede solicitar la cancelación de esta asignatura por tercera vez.</font></b></center>


                    <%} else if (correq.size() > 0) {
                        String nomasig = (String) ((Vector) correq.elementAt(0)).elementAt(1);%>
                    <input type="hidden" name="codigo1" value="<%=nomasig%>">
                    <%   out.println("<center<b><font color=#800000 size=2> La asignatura " + cod + " es correquisito de " + nomasig + ", al cancelarla se enviará la solicitud de cancelación de las dos asignaturas. Por favor verifique si desea cancelarlas haciendo click en Aceptar cancelación.</font></b></center>");
                    %>
                    </td>
                    <tr>
                        <td>
                            <div align="center">
                                <p>&nbsp;</p><p><input name="Submit" type="submit" class="boton" value="Aceptar cancelación">
                                </p></div>
                        </td>
                    </tr>

                    <%} else {
                        out.println("<center<b><font color=#800000 size=>Usted solicitará la cancelación de la asignatura " + cod + " si esta seguro haga click Aceptar cancelación</font></b></center>");
                    %>
                    </td>
                    <tr>
                        <td>
                            <div align="center">
                                <p>&nbsp;</p><p><input name="Submit" type="submit" class="boton" value="Aceptar cancelación">
                                </p></div>
                        </td>
                    </tr>
                    <%}%>

                </form>
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
