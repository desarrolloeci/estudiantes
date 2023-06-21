<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Actas.ActaJava" %>
<%  
        response.setHeader("Cache-Control","no-cache");
        Estudiante estud = (Estudiante) session.getAttribute("estClase") ;
        String nombrest = new String((String)session.getAttribute("nombre"));
        String per = request.getParameter("per");
        Vector datosEstud = (Vector)estud.getDatosEst(carnet).elementAt(0);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos</title>
        
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
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/cabezote_interno.jpg" width="770" height="153"></td>
                </tr>
               
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Solicitud de Actualizaci&oacute;n
                                    de datos</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td> <fieldset>
  <legend><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><b><font color="#666666">Escuela
  Colombiana de Ingenier&iacute;a</font></b></font><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><b> -
  Solicitud de Actualizaci&oacute;n de datos</b></b></font></legend>
  <p align="left" class="textocla">Se&ntilde;or Estudiante.</p>
  <p>Usted ya cumpli&oacute; la mayor&iacute;a de edad, por lo tanto es su obligaci&oacute;n
    informar a la Secretar&iacute;a General de la Escuela Colombiana de Ingenier&iacute;a
    el n&uacute;mero
    de su nuevo documento de identidad, para lo cual deber&aacute; entregar en
    dicha oficina una fotocopia legible de su c&eacute;dula de ciudadan&iacute;a,
    antes de la finalizaci&oacute;n del semestre en curso.</p>
  <p>Cordialmente, </p>
  <p>Oficina de Registro.<br> <br>
  </p>
                    </fieldset>
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
