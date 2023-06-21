<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudMisc" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%
        response.setHeader("Cache-Control", "no-cache");
        String nombre = new String((String) session.getAttribute("nombre"));
        String ban = new String((String) session.getAttribute("ban"));
        PrintWriter oout = response.getWriter();
        Estudiante est = (Estudiante) session.getAttribute("estClase");

        Vector solicitud = est.getSolPreGrad(est.getIdEst());
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad&eacute;micos - Actualizar Datos</title>

        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>

        <!-- CSS -->
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="JavaScript" type="text/JavaScript">
            <!--

            function validarform(){
                
               /* if(document.getElementById("doc_est").value == ""){
                    alert("Ingrese la información completa de su documento de identidad");
                    return false;
                }*/

                if(document.getElementById("dir_cor").value == "" || document.getElementById("tel_cor").value == ""){
                    alert("Ingrese la información completa de su lugar de residencia");
                    return false;
                }
                if(document.getElementById("email_otro").value == "" || document.getElementById("celular").value == ""){
                    alert("Ingrese la información de su email y número de celular");
                    return false;
                }
                
                document.getElementById("form1").submit();
                return true;
            }
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
                                    <label id="msj"><strong>Actualizar datos</strong></label>
                                    <strong>                                    </strong></font></h2>
                    </div></td>
                </tr>
                <tr>
                <td>
                <!--Enviar a GuardarActDatos al pulsar GUARDAR -->
                <form name="form1" id="form1" method="post" action="GuardarActDatos">
                    <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                        <tr>
                            <td width="31%"><div align="right">Direcci&oacute;n :</div></td>
                            <td width="5%"><label></label></td>
                            <td width="64%"><input name="dir_cor" type="text" id="dir_cor" size="50" maxlength="50" value="<%=solicitud.elementAt(19)%>"></td>
                        </tr>
                        <tr>
                            <td height="23"><div align="right">Tel&eacute;fono :</div></td>
                            <td>&nbsp;</td>
                            <td><input name="tel_cor" type="text" id="tel_cor" size="30" maxlength="15" value="<%=solicitud.elementAt(20)%>"></td>
                        </tr>
                        <!--tr>
                            <td rowspan="2"><div align="right">Documento Identidad :</div></td>
                            <td rowspan="2">&nbsp;</td>
                            <td height="25"><p><select name="tip_doc" id="tip_doc">
                                <option value="C" <%/*if (solicitud.elementAt(7).equals("C")) {
                                                out.println("selected");
                                                }*/%>>CC
                              <option value="T" </*%if (solicitud.elementAt(7).equals("T")) {
                                                out.println("selected");
                                                }*/%>>TI
                              <option value="R" <%/*if (solicitud.elementAt(7).equals("R")) {
                                                out.println("selected");
                                                }*/%>>RC
                              <option value="P" <%/*if (solicitud.elementAt(7).equals("P")) {
                                                out.println("selected");
                                                }*/%>>PS
                              </select>
                                    <input name="doc_est" type="text" id="doc_est" size="20" maxlength="15" value="<%//=solicitud.elementAt(6)%>">
                            </p>
                          </td>
                        </tr>
                        <tr>
                          <td height="57"><div align="justify"><font color="#CC0000"><strong>Por
                                  favor escriba su n&uacute;mero de identificaci&oacute;n tal
                              como aparece en su documento de identidad, de no
                                  ser asi podr&aacute; tener inconvenientes con los
                                  diferentes
                            tr&aacute;mites requeridos en la instituci&oacute;n.</strong></font></div></td>
                        </tr-->
                        <tr>
                            <td height="25"><div align="right">Celular :</div></td>
                            <td>&nbsp;</td>
                            <td><input name="celular" type="text" id="celular" size="30" maxlength="15" value="<%=solicitud.elementAt(4)%>"></td>
                        </tr>
                        <tr>
                            <td><div align="right">Email :<br>
                            (Diferente al de la ECI)</div></td>
                            <td>&nbsp;</td>
                            <td><input name="email_otro" type="text" id="email_otro" size="50" maxlength="50" value="<%=solicitud.elementAt(5)%>"></td>
                        </tr>
                    </table>

                    <br>
                    <br>
                    <label>
                        <div align="center">
                            <!--<input type="button" name="Submit" id="button" value="Guardar" onclick="javascript: return validarform();">-->
                            <input type="button" name="Submit" value="Guardar"  class="boton"  onclick="javascript: return validarform();">
                        </div>
                    </label>
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
