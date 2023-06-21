<%-- 
    Document   : RespuestaCreditosE
    Created on : 13/05/2015, 04:28:48 PM
    Author     : Lucero
--%>

<%@ include file="../secure.jsp" %>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    session = request.getSession(true);
    String mensaje = "";
    int ind = 0;
    String nombre = new String((String) session.getAttribute("nombre"));
    String ban = new String((String) session.getAttribute("ban"));
    String id_plan = new String((String) session.getAttribute("id_plan"));
    PrintWriter oout = response.getWriter();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    String cred = request.getParameter("creditos");
    String justif = request.getParameter("justif");
    Vector datosEst = est.getDatosEst(carnet), datosestud;
    configECI confEci = new configECI();
    Vector can = est.ConsultacredistosE(confEci.getPeriodoSig(), carnet);%>

<html>
    <head>
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Solicitud de créditos adicionales</title>
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
            </table>
        </div>
        <br>
        <%  if (can.size() > 0) {%>

        <b>Usted ya realizó esta solicitud. </b>

        <%} else {
            if (datosEst.size() > 0) {
                datosestud = (Vector) datosEst.elementAt(0);
                int sem = Integer.parseInt(datosestud.elementAt(3).toString());
            }
            
            int resp = est.CreditosExtras(carnet, confEci.getPeriodoSig(), cred, justif);
            
            if(resp==0){
            %>
            <center>
            YA REALIZÓ ESTA SOLICITUD!!!
            </center>
            <%
            }
        %>
        
    <center>
        "Esta solicitud está sujeta a la aprobación de su decano, la cual podrá ser consultada por medio de sus servicios académicos. <br>Con la aprobación de créditos adicionales, 
        la Escuela no está garantizando el cupo en las asignaturas".


    </center>
    <%}%>
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

