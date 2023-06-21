<%@page import="estudiantes.configuracion.configECI"%>
<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Actas.ActaJava" %>
<%  
        response.setHeader("Cache-Control","no-cache");
        String actfir = request.getParameter("actfir");
        int existe=0;
         Estudiante estud = (Estudiante) session.getAttribute("estClase") ;
          String per = request.getParameter("per");
          configECI confECI=new configECI();
       per=confECI.getPeriodoHor();
            ActaJava acta = new ActaJava() ;
             if(actfir != null){
            int actaint = acta.firmarActaIntermedio(carnet);
            
            if(actaint>0)
                session.setAttribute("mensaje", "Se ha firmado el acta satisfactoriamente") ;
            else
                session.setAttribute("mensaje", "Usted ya firmó el acta. Ingrese a la opción Elaboración de Horarios 2020-I") ;
            response.sendRedirect("menuServEstud");
        }
       
        String nombrest = new String((String)session.getAttribute("nombre"));
       existe = acta.getActaIntermedio(carnet, per);
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
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td>
                    
                    <jsp:include page="encabezado" flush="true">
                        <jsp:param name="anterior" value="menuServEstud" />
                    </jsp:include>
                    </td>
                </tr>
                <%if (existe > 0){
                    out.println("<tr><td>Usted ya firmó el acta. Ingrese a la opción Elaboración de Horarios 2020-I</td></tr>");
                }else{%>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Solicitud de Renovaci&oacute;n de Matricula y Acta</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td> <fieldset>
  <legend><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000"><b><font color="#666666">Escuela
  Colombiana de Ingenier&iacute;a</font></b></font><font color="#666666" size="2" face="Verdana, Arial, Helvetica, sans-serif"><b><b> -
  Solicitud de Renovaci&oacute;n de Matricula</b></b></font></legend>
  <p align="left" class="textocla">De acuerdo al art&iacute;culo No. 19 del Reglamento
    Estudiantil, por medio de la presente, solicito la renovaci&oacute;n de la
    matr&iacute;cula para
    el per&iacute;odo intersemestral del a&ntilde;o 2020, la cual estar&aacute; condicionada
    al pago de las asignaturas preinscritas y al resultado acad&eacute;mico obtenido
    en el primer per&iacute;odo del a&ntilde;o y el pago de asignaturas inscritas
    para el Intersemestral.</p>
  <p align="left" class="textocla">Renovaci&oacute;n de Matr&iacute;cula Intersemestral &#8211; <strong><%=per%></strong>
    Programa: <strong><%=datosEstud.elementAt(1)%></strong></p>
  <p align="left" class="textocla">Estudiante: <strong><%=nombrest%></strong></p>
  <p align="left"><span class="textocla">Autorizado a tomar las asignaturas,
      seg&uacute;n las condiciones indicadas
    en el art&iacute;culo  del Reglamento Estudiantil correspondiente a los &quot;Cursos
    del periodo Intersemestral&quot;. El resultado acad&eacute;mico
    no afectar&aacute; el estado del estudiante en lo referente a las condiciones
    de permanencia para el segundo per&iacute;odo del a&ntilde;o en curso, salvo
    en el caso de haber reprobado por tercera vez una asignatura.</span>  </p>
  <form name="form1" method="get" action="">
      <input type="hidden" name="actfir" value="firmar" id="actfir">
      <input name="Submit" type="submit" class="boton" value="Acepto las condiciones de renovación">
        </form>
</fieldset>
  </td>
                </tr>
                <%}%>
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
