<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String igrad =  new String((String)session.getAttribute("igrad"));
    String iddpto =  new String((String)session.getAttribute("iddpto"));
String ceremonia =  new String((String)session.getAttribute("ceremonia"));
    String impr = request.getParameter("imprimir");
    PrintWriter oout = response.getWriter() ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    int estado, i;
    estado = Integer.parseInt(est.getEstado());
    if(!igrad.equals("C") && !igrad.equals("O")){
        if(estado>0)
            response.sendRedirect("menuServEstud");
        else
            response.sendRedirect("menuServEstud1");
    }else{
        Vector solicitud = est.getSolPreGrad(carnet);
    Vector infoEst = est.getDatosEst(carnet);
    Vector datosestud = (Vector)infoEst.elementAt(0) ;
        Vector despinfopar = new Vector();
        Vector infoPar = est.getParTramGrad("4");
        Vector despinfopar2 = est.getParTramGrad("6");
        for(i=0 ; i < infoPar.size() ; i++)
            despinfopar.addElement((String)((Vector)infoPar.elementAt(i)).elementAt(0));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad&eacute;micos - Grado Colectivo</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
		
<%  if(impr != null){%>
		<style type="text/css">
<!--
.boton{
        font-size:10px;
        font-family:Verdana,Helvetica;
        font-weight:bold;
        color:white;
		background-image:url(img/blue-background.gif);
        height:25px;
		border-color: 666699;
		border-width: 2;
       }
.texto1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-style: normal;
	line-height: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	text-decoration: none;
        color: #333333;
}
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
<%  }else{%>
         <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
<%  }%>
        <script language="javascript">
        <!--
        function enviar() { 
            document.form1.target = "ventanaImp";
            document.form1.action = "SolicitudAprobGradoIndiv?imprimir=imp";
            window.open("", "ventanaImp", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
            document.form1.submit();
            return false;
        }

        function imprim(){
        <%  if(impr != null){%>
            window.focus();
            window.print();
            window.close();
        <%  } %>
        }
    -->
    </script>
    </head>
    <body id="public"  onload="imprim()" style="background-color: white;">
        <div id="container">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><%if(impr == null){%><img src="img/top.gif" alt="" width="770" height="10" id="top" /><%}%></td>
                </tr>
                <tr>
                    <td>
                    
      <%if(impr == null){%>
                    <jsp:include page="encabezado" flush="true">
                        <jsp:param name="anterior" value="menuServEstud" />
                    </jsp:include>
					<%}%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Grado Individual</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                                  
                    <fieldset>
                    <div align="right">
                      <legend>Bogotá, D. C.. </legend>
                      &nbsp;
                    </div>
                    <p>Se&ntilde;ores<br>
                    <strong>CONSEJO DIRECTIVO<br>
                    ESCUELA COLOMBIANA DE INGENIER&Iacute;A<br>
                  JULIO GARAVITO</strong><br>
                  Bogot&aacute;, D. C.</p>
                  <p><br>
                  Estimados se&ntilde;ores:<br>              
                  </p>                  
                  <p>Muy comedidamente me permito presentar a su consideraci&oacute;n
                    la solicitud de aprobaci&oacute;n de mi grado de <strong><%=datosestud.elementAt(1)%></strong> , teniendo en cuenta que he terminado
                    satisfactoriamente el plan de estudios correspondiente y
                  he cumplido con los requisitos legales y reglamentarios exigidos.</p>              
                  <p>Manifiesto que me encuentro a paz y salvo por todo concepto
                    con la Instituci&oacute;n.</p>
                  <p>Agradezco su atenci&oacute;n a la presente.</p>
                  <p>Cordialmente,</p>
                  <p>&nbsp;</p>
                  <p>____________________________________<br>
                    Firma</p>
                  <p><%=datosestud.elementAt(0)%><br>
                    
                    <%=solicitud.elementAt(7)%> <%=solicitud.elementAt(6)%> <%=solicitud.elementAt(17)%><br>
                    Libreta Militar No.<%=solicitud.elementAt(8)%> <%=solicitud.elementAt(9)%><br>
                  </p>
                  <%if(impr == null){%>
                  <form name="form1" method="post" action="">
                    <div align="center">
                        <input name="imprimir" type="submit" id="imprimir" value="Imprimir" class="boton" onclick="javascript: return enviar();">
                    </div>
            </form>
            <%}%></fieldset> </td>
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
<% }%>