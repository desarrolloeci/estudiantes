<%@page contentType="text/html"%>
<%@page pageEncoding="iso-8859-1"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.baseDatos.BaseDatos" %>

<%
    response.setHeader("Cache-Control", "no-cache");
    String nMsg = request.getParameter("msg");
    String mensaje = new String("Bienvenidos");
    PrintWriter oout = response.getWriter();
    //Estudiante est = (Estudiante) session.getAttribute("estClase");
    String carnet = (String) session.getAttribute("carnet");
    Estudiante est = new Estudiante();
    // Vector tiempo = new Vector();
    Vector hora = new Vector();
    String horas = null;
    String minuto = null;
    String segundo = null;

    Vector tiempo = est.getFechas();
    if (tiempo.size() > 0) {
        hora = (Vector) (tiempo.elementAt(0));
        horas = hora.elementAt(0).toString();
        minuto = hora.elementAt(1).toString();
        segundo = hora.elementAt(2).toString();

    }
    //if (nMsg != null) {
        /* Si la sesion no existe */
    //HttpSession sesion = request.getSession();
    //sesion.invalidate();
    if (nMsg != null) {%>
         <script language="JavaScript">	
       <% if (nMsg.equals("0")) {
            mensaje = "Faltan alguno de los campos";
        } else if (nMsg.equals("1")) {
            mensaje = "Usuario desconocido";
        } else if (nMsg.equals("2")) {
            mensaje = "El usuario no se ha autenticado correctamente";
        } else if (nMsg.equals("3")) {
            /* Vector datos = est.getEdad(carnet);
             String fechasis =(String) ((Vector) datos.elementAt(0)).elementAt(1);
             Vector restafechas = est.restafechas(fechasis);
             out.println(restafechas);*/
            mensaje = "Este no es su D&iacute;a de Registro Acad&eacute;mico";
            int drg = Integer.parseInt((String) request.getParameter("drg"));

// Especificar el día de elaboración de Horario
/*if (drg == 1) {
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
             }*/
            /*mensaje = mensaje + "<br><b>Servicio inhabilitado por proceso de horario estudiantes nuevos <i>" +
             " </b>";*/
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
        } else if (nMsg.equals("11")) {
            mensaje = "El código captcha es incorrecto verifique e intente nuevamente.";
        } else if (nMsg.equals("8")) {
            HttpSession sesion = request.getSession();
            sesion.invalidate();%>
            alert("Ha cerrado su sesión correctamente");
            window.close();

<% }%>

    <%}%>
         </script>

<html>
    <head>
          <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge; IE=11; IE=10; IE=EmulateIE10; IE=9; IE=EmulateIE9; IE=8; IE=EmulateIE8; IE=7; IE=EmulateIE7; IE=5">
    <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <meta charset="iso-8859-1">
        <meta http-equiv="cache-control" content="max-age=0" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0" />
        <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
        <meta http-equiv="pragma" content="no-cache" />
        <title>Servicios Académicos Estudiantes</title>

        <script type="text/javascript">

            function enviar() {
                alert("La Oficina de Registro Académico informa que durante los días 07, 08 y 09 de enero no habrá servicio de elaboración de horarios por internet en el horario de 3:00 a 6:00 p.m.");
                document.form1.action = "LoginEst";
                return true;
                //  window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=350,width=550')
            }

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

            hora = <%=horas%>;
            minuto = <%=minuto%>;
            segundo = <%=segundo%>;

            function mueveReloj() {
                segundo = segundo + 1;
                if (segundo == 60) {
                    segundo = 0;
                    minuto = minuto + 1;
                    if (minuto == 60) {
                        minuto = 0;
                        hora = hora + 1;
                        if (hora == 24) {
                            hora = 0;
                        }
                    }
                }
                horaImprimible = hora + " : " + minuto + " : " + segundo;
                document.form_reloj.reloj.value = horaImprimible;
                setTimeout("mueveReloj()", 1000)
            }


            function handleStateChange() {
                if (xmlHttp.readyState == 4) {
                    if (xmlHttp.status == 200) {
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
                for (var i = 0; i < results.length; i++) {
                    title = getChildElementText(results[i], "title");
                    link = getChildElementText(results[i], "link");
                    description = getChildElementText(results[i], "description");
                    fecha = getChildElementText(results[i], "pubDate");
                    var messageArea = document.getElementById("dateMessage");
                    var fontColor = "";
                    //if(i==0)
                    //    fontColor = " style=\"color:#990000; font-weight:bold\"";
                    var m = link.lastIndexOf("estudiante");
                    if (m != -1) {
                        htmltexto = htmltexto + "<div align=\"left\"" + fontColor + ">&#8226; " + title + " </div>";
                        mi_fecha = new Date(fecha);
                        dia = mi_fecha.getDate();
                        mes = mi_fecha.getMonth() + 1;
                        annio = mi_fecha.getFullYear();
                        if (dia < 10)
                            dia = "0" + dia;
                        if (mes < 10)
                            mes = "0" + mes;
                        //htmltexto = htmltexto + "" + dia + "/" + mes + "/" + annio  + " ";
                        //htmltexto = htmltexto + "<br>" + description + " ";
                        htmltexto = htmltexto + "<br><a href=\"#\" onclick=\"MM_openBrWindow('" + link + "','noticias','toolbar=yes,location=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')\">[ Leer mas... ] </a><br><br>";
                    }
                }
                messageArea.innerHTML = htmltexto;
            }

            function getChildElementText(parentNode, childTagName) {
                var childtag = parentNode.getElementsByTagName(childTagName);
                return childtag[0].firstChild.nodeValue;
            }
        </script>
        <script type="text/javascript">

            /***********************************************
             * Cross browser Marquee II- © Dynamic Drive (www.dynamicdrive.com)
             * This notice MUST stay intact for legal use
             * Visit http://www.dynamicdrive.com/ for this script and 100s more.
             ***********************************************/

            var delayb4scroll = 2000 //Specify initial delay before marquee starts to scroll on page (2000=2 seconds)
            var marqueespeed = 1 //Specify marquee scroll speed (larger is faster 1-10)
            var pauseit = 1 //Pause marquee onMousever (0=no. 1=yes)?

            ////NO NEED TO EDIT BELOW THIS LINE////////////

            var copyspeed = marqueespeed
            var pausespeed = (pauseit == 0) ? copyspeed : 0
            var actualheight = ''

            function scrollmarquee() {
                if (parseInt(cross_marquee.style.top) > (actualheight * (-1) + 8))
                    cross_marquee.style.top = parseInt(cross_marquee.style.top) - copyspeed + "px"
                else
                    cross_marquee.style.top = parseInt(marqueeheight) + 8 + "px"
            }

            function initializemarquee() {
                cross_marquee = document.getElementById("vmarquee")
                cross_marquee.style.top = 0
                marqueeheight = document.getElementById("marqueecontainer").offsetHeight
                actualheight = cross_marquee.offsetHeight
                if (window.opera || navigator.userAgent.indexOf("Netscape/7") != -1) { //if Opera or Netscape 7x, add scrollbars to scroll and exit
                    cross_marquee.style.height = marqueeheight + "px"
                    cross_marquee.style.overflow = "scroll"
                    return
                }
                setTimeout('lefttime=setInterval("scrollmarquee()",30)', delayb4scroll)
            }

            if (window.addEventListener)
                window.addEventListener("load", initializemarquee, false)
            else if (window.attachEvent)
                window.attachEvent("onload", initializemarquee)
            else if (document.getElementById)
                window.onload = initializemarquee


        </script>
        <!-- CSS -->
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

        <script type="text/javascript">

            /***********************************************
             * Switch Menu script- by Martial B of http://getElementById.com/
             * Modified by Dynamic Drive for format & NS4/IE4 compatibility
             * Visit http://www.dynamicdrive.com/ for full source code
             ***********************************************/

            var persistmenu = "yes" //"yes" or "no". Make sure each SPAN content contains an incrementing ID starting at 1 (id="sub1", id="sub2", etc)
            var persisttype = "sitewide" //enter "sitewide" for menu to persist across site, "local" for this page only

            if (document.getElementById) { //DynamicDrive.com change
                document.write('<style type="text/css">\n')
                document.write('.submenu{display: none;}\n')
                document.write('</style>\n')
            }

            function SwitchMenu(obj) {
                if (document.getElementById) {
                    var el = document.getElementById(obj);
                    var ar = document.getElementById("masterdiv").getElementsByTagName("span"); //DynamicDrive.com change
                    if (el.style.display != "block") { //DynamicDrive.com change
                        for (var i = 0; i < ar.length; i++) {
                            if (ar[i].className == "submenu") //DynamicDrive.com change
                                ar[i].style.display = "none";
                        }
                        el.style.display = "block";
                    } else {
                        el.style.display = "none";
                    }
                }
            }

            function get_cookie(Name) {
                var search = Name + "="
                var returnvalue = "";
                if (document.cookie.length > 0) {
                    offset = document.cookie.indexOf(search)
                    if (offset != -1) {
                        offset += search.length
                        end = document.cookie.indexOf(";", offset);
                        if (end == -1)
                            end = document.cookie.length;
                        returnvalue = unescape(document.cookie.substring(offset, end))
                    }
                }
                return returnvalue;
            }

            function onloadfunction() {
                if (persistmenu == "yes") {
                    var cookiename = (persisttype == "sitewide") ? "switchmenu" : window.location.pathname
                    var cookievalue = get_cookie(cookiename)
                    if (cookievalue != "")
                        document.getElementById(cookievalue).style.display = "block"
                }
            }

            function savemenustate() {
                var inc = 1, blockid = ""
                while (document.getElementById("sub" + inc)) {
                    if (document.getElementById("sub" + inc).style.display == "block") {
                        blockid = "sub" + inc
                        break
                    }
                    inc++
                }
                var cookiename = (persisttype == "sitewide") ? "switchmenu" : window.location.pathname
                var cookievalue = (persisttype == "sitewide") ? blockid + ";path=/" : blockid
                document.cookie = cookiename + "=" + cookievalue
            }

            if (window.addEventListener)
                window.addEventListener("load", onloadfunction, false)
            else if (window.attachEvent)
                window.attachEvent("onload", onloadfunction)
            else if (document.getElementById)
                window.onload = onloadfunction

            if (persistmenu == "yes" && document.getElementById)
                window.onunload = savemenustate
        </script>
    </head>

    <body id="public"  onLoad="refreshModelList();
                            mueveReloj();">
          <div class="container">
<div class="row">
    <div class="col-2">
        <a href="https://escuela.aguayo.co/es/"><img src="img/Navegacion/logo-escuela.svg" alt="logo escuela"></a>
    </div>
    <div class="col">
        <div class="row">
            <div class="col-12">
                    <nav class="audiencias">
                        <ul class="nav nav-justified justify-content-center">
                            <li><a href="https://escuela.aguayo.co/es/estudiantes/" class="nav-item nav-link item uno">Estudiantes</a></li>
                            <li><a href="https://escuela.aguayo.co/es/profesores-y-administrativos/" class="nav-item nav-link item uno">Profesores y administrativos</a></li>
                            <li><a href="https://escuela.aguayo.co/es/graduados/" class="nav-item nav-link item uno">Graduados</a></li>
                            <li><a href="https://escuela.aguayo.co/es/padres-o-acudientes/" class="nav-item nav-link item uno">Padres o acudientes</a></li>
                            <li><a href="https://escuela.aguayo.co/es/empresa/" class="nav-item nav-link item uno">Empresa</a></li>                            
                            <li><a href="https://escuela.aguayo.co/es/donantes/" class="nav-item nav-link item uno">Donantes</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col align-self-center">
                    <nav class="navbar navbar-expand-lg productos">
                      <div class="collapse navbar-collapse" id="main_nav">

                        <ul class="navbar-nav">
                            <li class="nav-item"> <a href="https://escuela.aguayo.co/es/campus/" class="nav-link item dos" href="#">CAMPUS</a> </li>
                            <li class="nav-item dropdown has-megamenu">
                                <a class="nav-link dropdown-toggle item dos" href="#" data-toggle="dropdown">OFERTA ACADÉMICA</a>
                                <div class="dropdown-menu megamenu" role="menu">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="col-megamenu">
                                                <h6 class="title">Carreras profesionales</h6>
                                                <ul class="list-unstyled">
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-civil/">Ingeniería Civil</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-electrica/">Ingeniería Electrica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-de-sistemas/">Ingeniería de Sistemas</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-industrial/">Ingeniería Industrial</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-de-electronica/">Ingeniería Eléctronica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/economia/">Economía</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/administracion-de-empresas/">Administración de Empresas</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/matematicas/">Matemáticas</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-mecanica/">Ingeniería Mecánica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenier%C3%ADa-biom%C3%A9dica/">Ingeniería Biomédica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/ingenieria-ambiental/">Ingeniería Ambiental</a></li>
                                                </ul>
                                            </div>  <!-- col-megamenu.// -->
                                        </div><!-- end col-3 -->
                                        <div class="col-md-3">
                                            <div class="col-megamenu">
                                                <h6 class="title">Especializaciones</h6>
                                                <ul class="list-unstyled">
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-economia-para-ingenieros/">Especialización en Economía para Ingenieros</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-gerencia-de-operaciones/">Especialización en Gerencia de Operaciones</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-desarrollo-y-gerencia-integral-de-proyectos/">Especialización en Desarrollo y Gerencia Integral de Proyectos</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-diseno-construccion-y-conservacion-de-vias/">Especialización en Diseño, Construcción y Conservación de Vías</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-estructuras/">Especialización en Estructuras</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-gestion-integrada-de-la-seguridad-y-salud-en-el-trabajo-calidad-y-medioambiente/">Especialización en Gestión Integrada de la Seguridad y Salud en el Trabajo, Calidad y Medioambiente</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-ingenieria-de-fundaciones/">Especialización en Ingeniería de Fundaciones</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-recursos-hidraulicos-y-medioambiente/">Especialización en Recursos Hidráulicos y Medioambiente</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/especializacion-en-saneamiento-ambiental/">Especialización en Saneamiento Ambiental</a></li>
                                                </ul>
                                            </div>  <!-- col-megamenu.// -->
                                        </div><!-- end col-3 -->
                                        <div class="col-md-3">
                                            <div class="col-megamenu">
                                                <h6 class="title">Maestrías</h6>
                                                <ul class="list-unstyled">
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-gestion-de-informacion/">Maestría en Gestión de Información</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ciencias-actuariales/">Maestría en Ciencias Actuariales</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-desarrollo-y-gerencia-integral-de-proyectos/">Maestría en Desarrollo y Gerencia Integral de Proyectos</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-informatica/">Maestría en Informática</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ingenieria-civil/">Maestría en Ingeniería Civil</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ingenieria-electronica/">Maestría en Ingeniería Electrónica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ingenieria-electrica/">Maestría en Ingeniería Eléctrica</a></li>
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/maestria-en-ingenieria-industrial/">Maestría en Ingeniería Industrial</a></li>
                                                </ul>
                                            </div>  <!-- col-megamenu.// -->
                                        </div>    
                                        <div class="col-md-3">
                                            <div class="col-megamenu">
                                                <h6 class="title">Doctorado</h6>
                                                <ul class="list-unstyled">
                                                    <li class="let"><a href="https://escuela.aguayo.co/es/programas/doctorado-en-ingenieria/">Doctorado en Ingeniería</a></li>
                                                </ul>
                                            </div>  <!-- col-megamenu.// -->
                                        </div><!-- end col-3 -->
                                    </div><!-- end row --> 
                                </div> <!-- dropdown-mega-menu.// -->
                            </li>
                            <li><a href="https://escuela.aguayo.co/es/admisiones/" class="nav-link item dos">ADMISIONES</a></li>
                            <li><a href="https://escuela.aguayo.co/es/investigacion-e-innovacion/" class="nav-link item dos">INVESTIGACIÓN E INNOVACIÓN</a></li>
                            <li><a href="https://escuela.aguayo.co/es/la-escuela/" class="nav-link item dos">LA ESCUELA</a></li>
                            <li><a href="https://escuela.aguayo.co/es/noticias/" class="nav-link item dos">NOTICIAS</a></li>
                            <li><a href="#" class="nav-link item dos">EVENTOS</a></li>
                        </ul>
                    </div> <!-- navbar-collapse.// -->
                </nav>
            </div>
        </div>
    </div>
</div>

</div>
         <div class="container contenidos-x" style="padding-bottom: 5px" align="center">
            <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h2>SERVICIOS ACADEMICOS ESTUDIANTES</h2>
                <div class=" col-xs-3 col-sm-3 col-md-3 col-lg-3"></div><br><br>
                <div class="shadow p-3 mb-5 bg-white rounded form-group col-xs-6 col-sm-6 col-md-6 col-lg-6">
      
                        <form name="form_reloj">

                            <input type="text" name="reloj" size="10" style="background-color : White; color : #990000; font-family : Verdana, Arial, Helvetica; font-size : 8pt; text-align : center; border:0px" onfocus="window.document.form_reloj.reloj.blur()">

                        </form>
                    
                    <!--ListaProgramasEstud-->
                    <form action="ListaProgramasEstud" method="post" name="form1">
                        <h5><font color="#666666"><label id="msj"></label></font></h5>

                        <p><b><font size="2" color="#990000"><blink></blink></font></b><font color="#990000"> 
                            </font> </p>

                        <!-- Login, Reglamento, etc -->

                        <div class="info" align="center">
                            <h5 class="markrot"><font color="#666666">
                                <label id="msj">&nbsp;</label>
                                <%=mensaje%>    
                                </font></h5>
                        </div>
                        <div align="center">
                            <label>Usuario</label>
                            <input class="form-control" name="usuario" type="text" value="" placeholder="Usuario correo"/>
                            <label>Contraseña</label>
                            <input class="form-control" name="passwd" type="password" value=""  maxlength="30" placeholder="Contraseña correo"/>

                            <p style="font-family:'Trebuchet MS', Arial, Helvetica, sans-serif; font-size:12px; color:#999">Todos los campos son obligatorios</p>
                        </div>
                        <div align="center">
                            <p style="font-family:'Trebuchet MS', Arial, Helvetica, sans-serif; font-size:12px; color:#999">
                                &nbsp;&nbsp;Ingrese el código:<img src="Captcha" id="captcha">
                                <input class="form-control" name="seccode" size="08" type="text" maxlength="8">
                        </div>
                        </p>

                        <input class="btn btn-danger" style="background-color: #990000;border-color: #990000" name="boton" type="submit" value="Enviar"/>
                        </p>
                        </tr>

                    </form>
                </div>
            </div>
                                </div>
            </div>
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
             <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="Navegacion/js/popper.min.js"></script>
    <script src="Navegacion/js/bootstrap.min.js"></script>
    <script src="Navegacion/js/bootstrap.bundle.min.js"></script>
 <script>
	// jQuery code
// Prevent closing from click inside dropdown
$(document).on('click', '.dropdown-menu', function (e) {
  e.stopPropagation();
});
</script> 
    </body>
</html>
