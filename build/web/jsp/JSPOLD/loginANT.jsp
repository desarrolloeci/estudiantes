<%@page contentType="text/html"%>
<%@page pageEncoding="iso-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%
            response.setHeader("Cache-Control", "no-cache");
            String nMsg = request.getParameter("msg");
            String mensaje = new String("");
            if (nMsg != null) {
                /* Si la sesion no existe */
                HttpSession sesion = request.getSession();
                sesion.invalidate();
                if (nMsg != null) {
                    if (nMsg.equals("0")) {
                        mensaje = "Faltan alguno de los campos";
                    } else if (nMsg.equals("1")) {
                        mensaje = "Usuario desconocido";
                    } else if (nMsg.equals("2")) {
                        mensaje = "El usuario no se ha autenticado correctamente";
                    } else if (nMsg.equals("3")) {
                        mensaje = "Este no es su D&iacute;a de Registro Acad&eacute;mico";
                        int drg = Integer.parseInt((String) request.getParameter("drg"));
                        if (drg == 1) {
                            mensaje = mensaje + "<br><b>Su d&iacute;a es el <i>" +
                                    "<font color='#FF0000'> XXX </font></i></b>";
                        } else if (drg == 2) {
                            mensaje = mensaje + "<br><b>Su d&iacute;a es el <i>" +
                                    "<font color='#FF0000'>LUNES 4 DE AGOSTO</font></i> </b>";
                        } else if (drg == 3) {
                            mensaje = mensaje + "<br><b>Su d&iacute;a es el <i>" +
                                    "<font color='#FF0000'>MARTES 5 DE AGOSTO</font></i> </b>";
                        } else if (drg == 4) {
                            mensaje = mensaje + "<br><b>Su d&iacute;a es el <i>" +
                                    "<font color='#FF0000'>MIERCOLES 6 DE AGOSTO</font></i> </b>";
                        } else if (drg == 5) {
                            mensaje = mensaje + "<br><b>Su d&iacute;a es el <i>" +
                                    "<font color='#FF0000'>MIERCOLES 6 DE AGOSTO, DESPUES DE LA 1:00 DE LA TARDE</font></i> </b>";
                        } else if (drg == 6) {
                            mensaje = mensaje + "<br><b>Su d&iacute;a es el <i>" +
                                    "<font color='#FF0000'>VIERNES 8 DE AGOSTO</font></i> </b>";
                        } else {
                            mensaje = mensaje + "<br><b>Verifique su situacion academica <i>" +
                                    "<font color='#FF0000'></font></i> </b>";
                        }
                    } else if (nMsg.equals("4")) {
                        mensaje = "Sesion Cerrada";
                    } else if (nMsg.equals("5")) {
                        mensaje = "Error del Servidor";
                    } else if (nMsg.equals("6")) {
                        mensaje = "No ha iniciado Sesion";
                    } else if (nMsg.equals("7")) {
                        mensaje = "<font color='#FF0000'>Ya existia una Sesion!</font> <i>Vuelva a autenticarse</i>";
                    } else if (nMsg.equals("9")) {
                        mensaje = "Ha ocurrido un error al cambiar su contraseña intente nuevamente";
                    } else if (nMsg.equals("10")) {
                        mensaje = "Ingrese con su nueva contraseña";
                    }
                }
            }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Inicio</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
        <link rel="stylesheet" href="css/comun.css" type="text/css" />
        <script language="JavaScript" type="text/JavaScript">
            <!--
            function MM_findObj(n, d) { //v4.01
                var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
                    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
                if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
                for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
                if(!x && d.getElementById) x=d.getElementById(n); return x;
            }

            function MM_changeProp(objName,x,theProp,theValue) { //v6.0
                var obj = MM_findObj(objName);
                if (obj && (theProp.indexOf("style.")==-1 || obj.style)){
                    if (theValue == true || theValue == false)
                        eval("obj."+theProp+"="+theValue);
                    else eval("obj."+theProp+"='"+theValue+"'");
                }
            }

            function CambiaProp(objName,x,theProp,theValue) { //v6.0
                var obj = document.getElementById(objName);
                if (obj && (theProp.indexOf("style.")==-1 || obj.style)){
                    if (theValue == true || theValue == false)
                        eval("obj.style."+theProp+"="+theValue);
                    else eval("obj.style."+theProp+"='"+theValue+"'");
                }
            }
            //-->
        </script>
    </head>
    <body id="public">
        <div id="container">
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td colspan="2"><img src="img/encabezado.jpg" width="770" height="100"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center" style="background-image: url(img/paises.gif);">
                            <h2><font color="#666666">
                                    <label id="msj">Estudiantes - Servicios Académicos</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td width="250">
                        
                        <div class="urbangreymenu">
                            
                            <h3 class="headerbar">Otros Vínculos</h3>
                            <ul>
                                <li><a href="http://virtual.escuelaing.edu.co/"><img src="img/campus.png" width="16" height="16" border="0"> Campus Virtual (Virtual)</a></li>
                                <li><a href="http://moodle.escuelaing.edu.co/"><img src="img/campus.png" width="16" height="16" border="0"> Campus Virtual (Moodle)</a></li>
                                <li><a href="http://correo.escuelaing.edu.co/"><img src="img/email.png" width="16" height="16" border="0"> Correo
                                    Electrónico</a></li>
                                <li><a href="http://practicas.escuelaing.edu.co/empresa"><img src="img/user_suit.png" width="16" height="16" border="0"> Prácticas Empresariales</a></li>
                                <li><a href="http://biblioserver.escuelaing.edu.co/"><img src="img/book.png" width="16" height="16" border="0"> Biblioteca</a></li>
                                <li><a href="#" onclick="window.open('http://tycho.escuelaing.edu.co/contenido/servicios/estudiantes/buscarhorasig/buscarhor.htm');return false"> <img src="img/application_view_list.png" width="16" height="16" border="0"> Horario de Asignaturas</a></li>
                            </ul>
                        </div>
                  </td>
                    <td valign="top">
					<form action="LoginEst" method="post" name="form1">
                        <div class="info" align="center" style="background-image: url(img/paises.gif);">
                            <h5><font color="#666666">
                                    <label id="msj"><%=mensaje%></label>
                            </font></h5>
                    </div>
                        <table width="350" border="0" align="center" cellpadding="0" cellspacing="0" id="usrpwd">
                            <tr>
                                <td  align="center">
                                    <div align="center" id="divusr" style="width:80%;height:25px;padding-top:10px;padding-right:10px;padding-bottom:10px;padding-left:10px;">Usuario:<span class="req">*</span>&nbsp;	&nbsp;	&nbsp;	
                                        <input name="carnet" id="carnet" type="text" onFocus="CambiaProp('divusr','','background','#FFF7C0')" onBlur="CambiaProp('divusr','','background','#FFFFFF')">
                                    </div>
                                    <div id="divcont" style="width:80%;height:25px;padding-top:10px;padding-right:10px;padding-bottom:10px;padding-left:10px;">Contraseña:<span class="req">*</span>
                                        <input name="passwd" id="passwd" type="password"  onFocus="CambiaProp('divcont','','background','#FFF7C0')" onBlur="CambiaProp('divcont','','background','#FFFFFF')">
                                </div>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center"></td>
                            </tr>
                            <tr>
                                <td><div align="center">
                                        <input type="submit" name="Submit" value="Aceptar" class="boton">
                                </div></td>
                            </tr>
                    </table>
					</form>
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
