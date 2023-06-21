<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
            response.setHeader("Cache-Control", "no-cache");
            String carnet = (String) session.getAttribute("carnet");
            if (!(carnet != null && !carnet.equals(""))) {
%>
<jsp:forward page="login?msg=6"/>
<%} else {
    configECI cfgEci = new configECI();
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    String estado = est.getEstado();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Inicio</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function Validar(form) {
                var NvPw = form.nvcont;
                var cNvPw = form.cnvcont;
                var cNum = form.clavenum;
                if(NvPw.value.length < 6){
                    alert ("La contraseña nueva no debe tener menos de 6 caracteres");
                    return false;
                }
                if(NvPw.value == "" || cNvPw.value == "" || cNum.value == "")
                {
                    alert ("Ningún campo puede estar vacio");
                    return false;
                }
                if (NvPw.value != cNvPw.value) {
                    alert ("Las contraseñas no coinciden");
                    return false;
                }else{
                    return true;
                }
            }
            //-->
        </script>
    </head>
  <body id="public" style="background-color: white">
        <div id="container">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" >
                <tr>
                    <td bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td><img src="img/cabezote_interno.jpg" width="770" height="153"></td>
                </tr>
                <tr>
                    <td>
                        <div class="info" align="center" style="background-image: url(img/paises.gif);">
                            <h2><font color="#666666">
                                    <label id="msj">Servicios Académicos</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
					   <strong><a href="menuServEstud"><font size="2"><< Regresar </font></a><br>
					   </strong>				      <fieldset class="texto"> 
                                <legend><b>Cambiar Contrase&ntilde;a</b></legend> 
                            <br>
                            <div align="center"><font color="#990000">La contrase&ntilde;a no debe
                                    ser menor a 6 caracteres <br>
                                    Procure que sea alfanum&eacute;rica<br>
                                No use su documento de identidad como clave</font>
                            </div>
                            <form name="form1" method="post" action="CambiarPwd"> 
                                <table width="100%" border="0" class="tabla">
                                    <tr>
                                        <td><div align="right">Ingrese Antigua contrase&ntilde;a:</div></td>
                                        <td>&nbsp;</td>
                                        <td><input name="clavenum" type="password" id="clavenum" size="20" maxlength="20"></td>
                                    </tr>
                                    <tr>
                                        <td width="48%"><div align="right">Nueva Contrase&ntilde;a:</div></td>
                                        <td width="4%">&nbsp;</td>
                                        <td width="48%"><input name="nvcont" type="password" id="nvcont" size="20" maxlength="20"></td>
                                    </tr>
                                    <tr>
                                        <td><div align="right">Confirme Nueva Contrase&ntilde;a:</div></td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <p><input name="cnvcont" type="password" id="cnvcont" size="20" maxlength="20">
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                                <div align="center"> <br>
                                    <input type="submit" name="Submit" value="Cambiar Contrase&ntilde;a" size="2" class="boton" onClick="javascript: return Validar(this.form);">
                                </div>
                            </form>
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
<%}
%>