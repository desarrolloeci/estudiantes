<%@page contentType="text/html"%>
<%@page pageEncoding="iso-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%
            response.setHeader("Cache-Control", "no-cache");
            String nMsg = request.getParameter("msg");
            String mensaje = new String("Bienvenidos");
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
        <style type="text/css">
            #marqueecontainer{
                position: relative;
                width: 95%;
                height: 300px;
                background-color: white;
                overflow: hidden;
                border-left: 1px dotted #ccc;
                border-right: 1px dotted #ccc;
                padding: 2px;
                padding-left: 4px;
                
                background-image:url('img/fondonews.gif');
                background-repeat:no-repeat;
                /*background-attachment:fixed;*/
                background-position:bottom;
                /*background-image: url(img/fondo.gif);*/
            }
            
            .markrot {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 10px;
                color: #666666;
            }
        </style>
        <!-- JavaScript -->
        <script type="text/javascript">
            <!--
            var xmlHttp;
            var EMP_PREFIX = "emp-";

            function createXMLHttpRequest() {
                if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                } 
                else if (window.XMLHttpRequest) {
                    xmlHttp = new XMLHttpRequest();
                }
            }
    
            function refreshModelList() {
                var url = "NewsEci";
                createXMLHttpRequest();
                xmlHttp.onreadystatechange = handleStateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
    
            function handleStateChange() {
                if(xmlHttp.readyState == 4) {
                    if(xmlHttp.status == 200) {
                        //document.getElementById("cargando").style.visibility='hidden';
                        updateModelsList();
                    }
                }/*else{
        document.getElementById("cargando").style.visibility='visible';
    }*/
            }

            function updateModelsList() {
                var results = xmlHttp.responseXML.getElementsByTagName("item");
                var title, link, description, htmltexto, fecha;
                var option = null;
                var mi_fecha, mes, annio, dia;
                htmltexto = "";
                for(var i = 0; i < results.length; i++) {
                    title = getChildElementText(results[i], "title");
                    link = getChildElementText(results[i], "link");
                    description = getChildElementText(results[i], "description");
                    fecha = getChildElementText(results[i], "pubDate");
                    var messageArea = document.getElementById("dateMessage");
                    var fontColor = "red";
                    htmltexto = htmltexto + "<div align=\"left\">&#8226; " + title + " </div>";
                    mi_fecha=new Date(fecha);
                    dia = mi_fecha.getDate();
                    mes = mi_fecha.getMonth() + 1;
                    annio = mi_fecha.getFullYear();
                    if (dia<10)
                        dia="0"+dia;
                    if (mes<10)
                        mes="0"+mes;
                    htmltexto = htmltexto + "" + dia + "/" + mes + "/" + annio  + " ";
                    //htmltexto = htmltexto + "<br>" + description + " ";
                    htmltexto = htmltexto + "<br><a href=\"#\" onclick=\"MM_openBrWindow('" +link + "','noticias','toolbar=yes,location=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')\">[ Leer mas... ] </a><br><br>";
                }
                messageArea.innerHTML = htmltexto;
            }

            function getChildElementText(parentNode, childTagName){
                var childtag = parentNode.getElementsByTagName(childTagName);
                return childtag[0].firstChild.nodeValue;
            }

            -->
        </script>

<script type="text/javascript">

/***********************************************
* Cross browser Marquee II- © Dynamic Drive (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit http://www.dynamicdrive.com/ for this script and 100s more.
***********************************************/

var delayb4scroll=2000 //Specify initial delay before marquee starts to scroll on page (2000=2 seconds)
var marqueespeed=1 //Specify marquee scroll speed (larger is faster 1-10)
var pauseit=1 //Pause marquee onMousever (0=no. 1=yes)?

////NO NEED TO EDIT BELOW THIS LINE////////////

var copyspeed=marqueespeed
var pausespeed=(pauseit==0)? copyspeed: 0
var actualheight=''

function scrollmarquee(){
if (parseInt(cross_marquee.style.top)>(actualheight*(-1)+8))
cross_marquee.style.top=parseInt(cross_marquee.style.top)-copyspeed+"px"
else
cross_marquee.style.top=parseInt(marqueeheight)+8+"px"
}

function initializemarquee(){
cross_marquee=document.getElementById("vmarquee")
cross_marquee.style.top=0
marqueeheight=document.getElementById("marqueecontainer").offsetHeight
actualheight=cross_marquee.offsetHeight
if (window.opera || navigator.userAgent.indexOf("Netscape/7")!=-1){ //if Opera or Netscape 7x, add scrollbars to scroll and exit
cross_marquee.style.height=marqueeheight+"px"
cross_marquee.style.overflow="scroll"
return
}
setTimeout('lefttime=setInterval("scrollmarquee()",30)', delayb4scroll)
}

if (window.addEventListener)
window.addEventListener("load", initializemarquee, false)
else if (window.attachEvent)
window.attachEvent("onload", initializemarquee)
else if (document.getElementById)
window.onload=initializemarquee


</script>
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
            
            function MM_openBrWindow(theURL,winName,features) { //v2.0
                window.open(theURL,winName,features);
            }
            //-->
        </script>
    </head>
    <body id="public"  onLoad="refreshModelList();">
        
        <div id="container">
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td colspan="2">				  <img src="img/cabezote_estudiantes.jpg" width="770" height="189"></td>
                </tr>
                <tr>
                    <td width="250" valign="top">
                        
                        <div class="urbangreymenu">
                            
                            <h3 class="headerbar">Otros Vínculos</h3>
                            <ul>
                                <li><a href="http://virtual.escuelaing.edu.co/"><img src="img/campus.png" width="16" height="16" border="0"> Campus Virtual (Virtual)</a></li>
                                <li><a href="http://correo.escuelaing.edu.co/"><img src="img/email.png" width="16" height="16" border="0"> Correo
                                Electrónico</a></li>
                                <li><a href="#" onclick="window.open('http://copernico.escuelaing.edu.co/desarrollo/contenido/index.php?option=com_content&view=category&layout=blog&id=1&Itemid=50');return false"> <img src="img/newspaper.png" width="16" height="16" border="0"> 
                                Noticias</a></li>
                                <li><a href="#" onclick="window.open('http://copernico.escuelaing.edu.co/desarrollo/contenido/index.php?option=com_content&view=category&layout=blog&id=27&Itemid=57');return false"> <img src="img/reginfo.png" width="16" height="16" border="0"> 
                                Oficina de Registro Informa</a></li>
                                <li><a href="http://practicas.escuelaing.edu.co/empresa"><img src="img/user_suit.png" width="16" height="16" border="0"> Prácticas Empresariales</a></li>
                                <li><a href="#" onclick="window.open('http://copernico.escuelaing.edu.co/desarrollo/contenido/index.php?option=com_content&view=category&layout=blog&id=37&Itemid=59');return false"> <img src="img/tick.png" width="16" height="16" border="0"> 
                                Procedimientos Acad&eacute;micos</a></li>
                                <li><a href="#" onclick="window.open('http://copernico.escuelaing.edu.co/desarrollo/contenido/index.php?option=com_content&view=category&layout=blog&id=37&Itemid=59');return false"> <img src="img/becas.png" width="16" height="16" border="0"> 
                                Becas en la Escuela</a></li>
                                <li><a href="http://biblioserver.escuelaing.edu.co/"><img src="img/book.png" width="16" height="16" border="0"> Biblioteca</a></li>
                                <li><a href="#" onclick="window.open('http://tycho.escuelaing.edu.co/contenido/servicios/estudiantes/buscarhorasig/buscarhor.htm');return false"> <img src="img/application_view_list.png" width="16" height="16" border="0"> Horario de Asignaturas</a></li>
                                <li><a href="#" onclick="window.open('http://copernico.escuelaing.edu.co/desarrollo/contenido/index.php?option=com_weblinks&view=category&id=36&Itemid=58');return false"> <img src="img/asousers.png" width="16" height="16" border="0"> Asociaciones
                                Estudiantiles</a></li>
								<li><a href="http://moodle.escuelaing.edu.co/"><img src="img/campus.png" width="16" height="16" border="0"> Campus Virtual (Moodle)</a></li>
                            </ul>
                        </div>
                  </td>
                    <td width="520" valign="top">
                        <form action="LoginEst" method="post" name="form1">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr align="left">
                                <td width="60%" align="left" valign="top">
                                            <div class="info" align="left">
							<h5><font color="#666666"><label id="msj">&nbsp;&nbsp;Noticias: </label>
                                </font></h5>
                            </div>                   
						<table width="95%" height="150" border="0" class="markrot" align="right">
                            <tr align="left">
                                <td align="left" valign="top">
                                    <%
        out.println("<div id=\"marqueecontainer\" onMouseover=\"copyspeed=pausespeed\" onMouseout=\"copyspeed=marqueespeed\"> " +
                " <div id=\"vmarquee\" style=\"position: absolute; width: 98%;\"> " +
                " <div id=\"dateMessage\" align=\"left\"></div> " +
                " </div> </div>");   
                                    %>           
                              </td>
                            </tr>
                      </table>
                              </td>
                                <td width="50%" align="left" valign="top">
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="usrpwd">
                                <tr>
                                    <td width="40%"  align="center">                                      
									
                            <div class="info" align="left">
                              <h5><font color="#666666">
                            <label id="msj">&nbsp;&nbsp;<%=mensaje%></label>
                                </font></h5>
                            </div>
									<div align="right">Usuario:<span class="req">*</span>                                        
                                            <input name="carnet" type="text" id="carnet" class="campotext" onFocus="CambiaProp('divusr','','background','#FFF7C0')" onBlur="CambiaProp('divusr','','background','#FFFFFF')" size="15" maxlength="15">
                                        &nbsp;&nbsp;<br>
                                            <br>
                                            Contraseña:<span class="req">*
                                            </span> <input name="passwd" type="password" id="passwd" class="campotext"  onFocus="CambiaProp('divcont','','background','#FFF7C0')" onBlur="CambiaProp('divcont','','background','#FFFFFF')" size="15" maxlength="25">
                                  &nbsp;&nbsp;</div></td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div align="right">
                                            <a href="http://moodle.escuelaing.edu.co/"><img src="img/lock.png" width="16" height="16" border="0"></a>
                                            <input type="submit" name="Submit" value="Aceptar" class="boton">&nbsp;&nbsp;
                                </div></td></tr>
                                <tr>
                                  <td>&nbsp;</td>
                                </tr>
                            </table>
								</td>
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
