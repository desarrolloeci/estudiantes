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
                hora = (Vector) (tiempo.elementAt(0));
                horas = hora.elementAt(0).toString();
                minuto = hora.elementAt(1).toString();
                segundo = hora.elementAt(2).toString();

            //}
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
                font-size: 11px;                /*background-image: url(img/fondo.gif);*/
            }

            .markrot {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 10px;
                color: #666666;
            }
        </style>
        <!-- JavaScript -->

        <script type="text/javascript">

            function enviar(){
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

            function mueveReloj(){
                segundo=segundo+1;
                if(segundo==60){
                    segundo=0;
                    minuto=minuto+1;
                    if(minuto==60){
                        minuto=0;
                        hora=hora+1;
                        if(hora==24){hora=0;}
                    }
                }
                horaImprimible = hora + " : " + minuto + " : " + segundo;
                document.form_reloj.reloj.value = horaImprimible;
                setTimeout("mueveReloj()",1000)
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
                    var fontColor = "";
                    //if(i==0)
                    //    fontColor = " style=\"color:#990000; font-weight:bold\"";
                    var m =link.lastIndexOf("estudiante");
                    if(m!=-1){
                        htmltexto = htmltexto + "<div align=\"left\"" + fontColor + ">&#8226; " + title + " </div>";
                        mi_fecha=new Date(fecha);
                        dia = mi_fecha.getDate();
                        mes = mi_fecha.getMonth() + 1;
                        annio = mi_fecha.getFullYear();
                        if (dia<10)
                            dia="0"+dia;
                        if (mes<10)
                            mes="0"+mes;
                        //htmltexto = htmltexto + "" + dia + "/" + mes + "/" + annio  + " ";
                        //htmltexto = htmltexto + "<br>" + description + " ";
                        htmltexto = htmltexto + "<br><a href=\"#\" onclick=\"MM_openBrWindow('" +link + "','noticias','toolbar=yes,location=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=800,height=600')\">[ Leer mas... ] </a><br><br>";
                    }
                }
                messageArea.innerHTML = htmltexto;
            }

            function getChildElementText(parentNode, childTagName){
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

        <script type="text/javascript">

            /***********************************************
             * Switch Menu script- by Martial B of http://getElementById.com/
             * Modified by Dynamic Drive for format & NS4/IE4 compatibility
             * Visit http://www.dynamicdrive.com/ for full source code
             ***********************************************/

            var persistmenu="yes" //"yes" or "no". Make sure each SPAN content contains an incrementing ID starting at 1 (id="sub1", id="sub2", etc)
            var persisttype="sitewide" //enter "sitewide" for menu to persist across site, "local" for this page only

            if (document.getElementById){ //DynamicDrive.com change
                document.write('<style type="text/css">\n')
                document.write('.submenu{display: none;}\n')
                document.write('</style>\n')
            }

            function SwitchMenu(obj){
                if(document.getElementById){
                    var el = document.getElementById(obj);
                    var ar = document.getElementById("masterdiv").getElementsByTagName("span"); //DynamicDrive.com change
                    if(el.style.display != "block"){ //DynamicDrive.com change
                        for (var i=0; i<ar.length; i++){
                            if (ar[i].className=="submenu") //DynamicDrive.com change
                                ar[i].style.display = "none";
                        }
                        el.style.display = "block";
                    }else{
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
                        if (end == -1) end = document.cookie.length;
                        returnvalue=unescape(document.cookie.substring(offset, end))
                    }
                }
                return returnvalue;
            }

            function onloadfunction(){
                if (persistmenu=="yes"){
                    var cookiename=(persisttype=="sitewide")? "switchmenu" : window.location.pathname
                    var cookievalue=get_cookie(cookiename)
                    if (cookievalue!="")
                        document.getElementById(cookievalue).style.display="block"
                }
            }

            function savemenustate(){
                var inc=1, blockid=""
                while (document.getElementById("sub"+inc)){
                    if (document.getElementById("sub"+inc).style.display=="block"){
                        blockid="sub"+inc
                        break
                    }
                    inc++
                }
                var cookiename=(persisttype=="sitewide")? "switchmenu" : window.location.pathname
                var cookievalue=(persisttype=="sitewide")? blockid+";path=/" : blockid
                document.cookie=cookiename+"="+cookievalue
            }

            if (window.addEventListener)
                window.addEventListener("load", onloadfunction, false)
            else if (window.attachEvent)
                window.attachEvent("onload", onloadfunction)
            else if (document.getElementById)
                window.onload=onloadfunction

            if (persistmenu=="yes" && document.getElementById)
                window.onunload=savemenustate
        </script>
    </head>
    <body id="public"  onLoad="refreshModelList();mueveReloj();">
        <!-- CONTENEDOR DE LA PAGINA -->
        <div id="container">
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img src="img/cabezote_estudiantes.jpg" width="770" height="189" border="0" usemap="#Map"></td>
                </tr>
                <tr>
                    
      <td width="250" valign="top"> 
        <div class="urbangreymenu">
<form action="correos" method="post" target="_top">
                                <div align="center">
                                    <center>
              </center>
                                </div>
                                </form>
                            
          <p><a href="http://copernico.escuelaing.edu.co/desarrollo/contenido/index.php?format=feed&type=rss"> 
            </a></p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>  <!-- Conocer correo -->
                            <!--form action="correos" method="post" target="_top">
                                <div align="center">
                                    <center>
                                        <b>Conozca
                                        su correo</b><br>
                                        <font color="#666666">Ingrese su n&uacute;mero
                                            de carn&eacute;<br>
                                        o documento</font><br>
                                        <input type="text" name="carnet" size="10" maxlength="15">
                                        <input name="enviar" type="submit"  value="Enviar">
                                        <input name="limpiar" type="reset" value="Borrar"-->
                                        <!-- FIN FORMULARIO	-->
                                    <!--/center>
                                </div-->
                                <!-- fin correo -->
                            <!--/form>
        </div>
                    </td>
                    <!-- fin otros vinculos -->
                    <td width="520" valign="top">
                        <form name="form_reloj">
                            <div align="right">
                                <input type="text" name="reloj" size="10" style="background-color : Black; color : White; font-family : Verdana, Arial, Helvetica; font-size : 8pt; text-align : center;" onfocus="window.document.form_reloj.reloj.blur()">
                            </div>
                        </form>

                        <form action="LoginEst" method="post" name="form1">
                            <p align="center">&nbsp;</p>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr align="left">
                                    <td width="60%" align="left" valign="top">
                                        <div class="info" align="left">
                                            
                                            
                  <h5><font color="#666666"><label id="msj">&nbsp;&nbsp;</label></font></h5>
                </div>
                                        
                <p><b><font size="2" color="#990000"><blink></blink></font></b><font color="#990000"> 
                  </font> </p>
                                    </td>
                                    <!-- Login, Reglamento, etc -->
                                    <td width="50%" align="left" valign="top">
                                        <table width="93%" border="0" align="center" cellpadding="0" cellspacing="0" id="usrpwd">
                                            <tr>
                                                <td width="40%"  align="center">
                                                    <div class="info" align="left">
                                                        <h5 class="markrot"><font color="#666666">
                                                                <label id="msj">&nbsp;&nbsp;</label>
                                                                <%=mensaje%>                              </font></h5>
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

                                                        <p><br><!--onclick="javascript: return enviar()"-->
                                                            <input type="submit" name="Submit" value="Aceptar" class="boton"  >
                                                            &nbsp; <img src="img/lock.png" width="16" height="16" border="0"><br>
                                                            <br>
                                                            <!--html/consultdia/consulta.htm
                                                            http://www.escuelaing.edu.co/servicios/estudiantes/consultdia/consulta.htm-->

                                                           <!--a href="http://tycho.escuelaing.edu.co/contenido/servicios/estudiantes/consultdia/consulta.htm">Consulte AQU&Iacute;
                                                                su dia de Registro</a-->&nbsp; </p>
                                                        <p>&nbsp;</p>
                                                    </div></td></tr>
                                            
                            </table>
                    </td>
                </tr>
            </table>
        </form>


        <!-- Fin Login Estud -->
    </td>
</tr>
<tr>
    <!-- Pie de pagina -->
    <td colspan="2"><div class="info" align="center">
            &nbsp;
        </div>
        <div align="center" class="piepag">Escuela
            Colombiana de Ingeniería Julio Garavito<br>
            AK. 45 No. 205-59 (Autopista Norte) / Contact Center: +57(1) 6683600 
            <br>
            Bogotá, D.C. , Colombia<br>&nbsp;
        </div>
    </td>
</tr>
<tr>
    <td colspan="2" bgcolor="#EEEEEE"><img src="img/bottom.gif" alt="" width="770" height="10" id="bottom" /></td>
</tr>
</table>
</div>
<!-- FIN container-->

<map name="Map">
    <area shape="rect" coords="3,2,127,32" href="http://www.escuelaing.edu.co/delcolegioalau.htm">
    <area shape="rect" coords="131,2,255,32" href="http://www.escuelaing.edu.co/aspirantesposgrado/aspirantes.htm">
    <area shape="rect" coords="385,3,513,34" href="http://egresados.escuelaing.edu.co/egresados">
    <area shape="rect" coords="516,4,640,32" href="http://empleados.escuelaing.edu.co/intraeci">
    <area shape="rect" coords="643,3,766,31" href="http://www.escuelaing.edu.co/entorno/relacion_entorno.htm">
    <area shape="rect" coords="3,124,165,186" href="http://www.escuelaing.edu.co">
</map>
</body>

</html>

