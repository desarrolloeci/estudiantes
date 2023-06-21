<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%@ page import="estudiantes.Modreg.Operacion" %>
<%@ page import="java.awt.image.*"%>
<%@ page import="javax.imageio.ImageIO"%>

<%
    response.setHeader("Cache-Control", "no-cache");
    String nombre = new String((String) session.getAttribute("nombre"));
    String programa = new String((String) session.getAttribute("dpto"));
    /// out.println(programa);
    String valren;
    configECI cfgEci = new configECI();
    String perreg = cfgEci.getPeriodoHor();
    String prog = new String();
    PrintWriter oout = response.getWriter();
//        Estudiante est = new Estudiante(carnet,oout) ;
    Estudiante est = (Estudiante) session.getAttribute("estClase");
    Operacion op = new Operacion(carnet);
    Vector acta = est.FirmaActa(carnet, perreg);


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <title>Servicios Académicos - Elaboración de Horario</title>
        <%
            out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
            out.println("<!-- ");
            out.println("function openPop(pagename){");
            out.println("window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=400,width=620')} ");
            out.println("//-->");
            out.println("</SCRIPT>");
        %>
        <%
            out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
            out.println("<!-- ");
            out.println("function openPopHor(pagename){");
            out.println("window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=620,width=650')} ");
            out.println("//-->");
            out.println("</SCRIPT>");
        %>

        <script type="text/javascript">
            <!--
            var FEC_PREFIX = "fec-";
            var xmlHttp;
            var nombreasig = "";

            function createXMLHttpRequest() {
                if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                else if (window.XMLHttpRequest) {
                    xmlHttp = new XMLHttpRequest();
                }
            }

            function refreshModelList() {
                var i;
                var pagpost = "";
                for (i = 0; i < document.form1.elements.length; i++) {
                    pagpost = pagpost + "&" + document.form1.elements[i].name + "=" + document.form1.elements[i].value;
                }

                var url = "ServAjax?func=horasigest" + pagpost;
                createXMLHttpRequest();
                xmlHttp.onreadystatechange = handleStateChange;
                xmlHttp.open("POST", url, true);
                xmlHttp.send(null);

            }

            function refreshModelListIns() {
                var i;
                var pagpost = "";
                for (i = 0; i < document.form2.elements.length; i++) {
                    pagpost = pagpost + "&" + document.form2.elements[i].name + "=" + document.form2.elements[i].value;
                    //alert(document.form2.elements[i].name + "=" +document.form2.elements[i].value);
                }
                var url = "ServAjax?func=horasigestins" + pagpost;
                //document.getElementById("nadita").value = url;
                //alert(url);
                createXMLHttpRequest();
                xmlHttp.onreadystatechange = handleStateChangeIns;
                xmlHttp.open("POST", url, true);
                xmlHttp.send(null);
            }

            function handleStateChange() {
                if (xmlHttp.readyState == 4) {
                    if (xmlHttp.status == 200) {
                        updateList();
                        document.getElementById("tabla").style.visibility = 'visible';
                        document.getElementById("cargando").style.visibility = 'hidden';
                        document.getElementById("Submit1").disabled = false;
                        document.getElementById("Submit2").disabled = false;
                    } else if (xmlHttp.status == 500) {
                        alert("Sesion Finalizada");
                        document.location.reload();
                    }
                } else {
                    document.getElementById("Submit1").disabled = true;
                    document.getElementById("Submit2").disabled = true;
                    document.getElementById("tabla").style.visibility = 'hidden';
                    document.getElementById("cargando").style.visibility = 'visible';
                }
            }

            function handleStateChangeIns() {
                if (xmlHttp.readyState == 4) {
                    if (xmlHttp.status == 200) {
                        updateListIns();
                        document.getElementById("tabla2").style.visibility = 'visible';
                        document.getElementById("Submit2").style.visibility = 'visible';
                        document.getElementById("font1").style.visibility = 'visible';
                        document.getElementById("cargando2").style.visibility = 'hidden';
                        document.getElementById("Submit2").disabled = false;
                        document.getElementById("Submit1").disabled = false;
                        //alert("Bien");
                    } else if (xmlHttp.status == 500) {
                        alert("Sesion Finalizada");
                        document.location.reload();
                    }
                } else {
                    document.getElementById("tabla2").style.visibility = 'hidden';
                    document.getElementById("Submit1").disabled = true;
                    document.getElementById("Submit2").disabled = true;
                    document.getElementById("Submit2").style.visibility = 'hidden';
                    document.getElementById("font1").style.visibility = 'hidden';
                    document.getElementById("cargando2").style.visibility = 'visible';
                }
            }

            function updateList() {
                var mensaje, okmsj;
                //var List = document.getElementById("List");

                var results = xmlHttp.responseXML.getElementsByTagName("mensaje");
                var resultsok = xmlHttp.responseXML.getElementsByTagName("ok");
                mensaje = "";
                if (results.length > 0) {
                    for (var i = 0; i < results.length; i++) {
                        mensaje = results[i].firstChild.nodeValue;
                        okmsj = resultsok[i].firstChild.nodeValue;
                    }
                    alert(mensaje);
                    document.location = "mostrarhor";
                    //document.location.reload();
                    /*if(okmsj == "ok")
                     document.location.reload();*/
                } else {
                    alert("NO TENEMOS DATOS O EL CODIGO ES INCORRECTO");
                }
            }

            function updateListIns() {
                var mensaje, okmsj;
                var results = xmlHttp.responseXML.getElementsByTagName("mensaje");
                var resultsok = xmlHttp.responseXML.getElementsByTagName("ok");
                mensaje = "";
                if (results.length > 0) {
                    for (var i = 0; i < results.length; i++) {
                        mensaje = results[i].firstChild.nodeValue;
                        okmsj = resultsok[i].firstChild.nodeValue;
                    }
                    alert(mensaje);
                    // if(okmsj == "ok")
                    document.location = "mostrarhor";
                    //document.location.reload();
                } else {
                    alert("NO TENEMOS DATOS");
                }
            }
            -- ></script>
        <style type="text/css">
            <!--
            a  { text-decoration: none }
            .texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}
            .visibleflash {
                visibility: hidden;
            }
            -->
        </style>
    </head>
    <body id="public">
        <div id="container">
            <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
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
                                <label id="msj">Elaboraci&oacute;n de horario</label>
                                </font></h2>
                            <!--  <a href="JavaScript:openPopHor('http://tycho.escuelaing.edu.co/PagosenLinea/loginEst?id=2')">Para imprimir la orden o pagar en línea haga
                            <strong>click aquí
                    </strong></a> --></div></td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="67%"><font face="Verdana, Arial, Helvetica, sans-serif">
                                    <%if (programa.equals("13")) {%>
                                    <b><font size="-1">"Si usted necesita enviar un correo electrónico a su decano de  <a href="mailto:civilhorario@escuelaing.edu.co"> clik aquí</a></font></b>
                                        <%} else if (programa.equals("14")) {%>
                                    <b><font size="-1">"Si usted necesita enviar un correo electrónico a su decano de  <a href="mailto:decelectrica@escuelaing.edu.co"> clik aquí</a></font></b>
                                        <%} else if (programa.equals("15")) {%>
                                    <b><font size="-1">"Si usted necesita enviar un correo electrónico a su decano de  <a href="mailto:sistemashorario@escuelaing.edu.co"> clik aquí</a></font></b>
                                        <%} else if (programa.equals("16")) {%>
                                    <b><font size="-1">"Si usted necesita enviar un correo electrónico a su decano de  <a href="mailto:industrialhorario@escuelaing.edu.co"> clik aquí</a></font></b>
                                    </font></td><%} else if (programa.equals("17")) {%>
                            <b><font size="-1">"Si usted necesita enviar un correo electrónico a su decano de  <a href="mailto:electronica.horario@escuelaing.edu.co"> clik aquí</a></font></b>
                                <%} else if (programa.equals("18")) {%>
                            <b><font size="-1">"Si usted necesita enviar un correo electrónico a su decano de  <a href="mailto:economiahorario@escuelaing.edu.co"> clik aquí</a></font></b>
                                <%} else if (programa.equals("19")) {%>
                            <b><font size="-1">"Si usted necesita enviar un correo electrónico a su decano de  <a href="mailto:adminishorario@escuelaing.edu.co"> clik aquí</a></font></b>
                                <%} else if (programa.equals("20")) {%>
                            <b><font size="-1">"Si usted necesita enviar un correo electrónico a su decano de  <a href="mailto:matematicahorario@escuelaing.edu.co"> clik aquí</a></font></b>
                                <%} else if (programa.equals("260")) {%>
                            <b><font size="-1">"Si usted necesita enviar un correo electrónico a su decano de  <a href="mailto:mecanicahorario@escuelaing.edu.co"> clik aquí</a></font></b>
                                <%} else if (programa.equals("262")) {%>
                            <b><font size="-1">"Si usted necesita enviar un correo electrónico a su decano de  <a href="mailto:bio.horario@escuelaing.edu.co"> clik aquí</a></font></b>
                                <%}%>

                            <td width="2%">&nbsp;</td>
                            <td width="31%">
                                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><a href="JavaScript:openPopHor('horarioEstud')">Ver
                                            horario estudiante</a></b></font></div>
                            </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center" valign="top" colspan="2">
            <div id="Layer1">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="380" height="22" class="visibleflash" id="cargando">
                    <param name="movie" value="img/flash/barraload.swf">
                    <param name="quality" value="high">
                    <embed src="/img/flash/barraload.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="380" height="22"></embed>
                </object>
            </div>
            <form name="form1" method="post" action="">
                <br>
                <div align="center"><b>
                        <%  if (op.ejecutarOperacion()) {%>
                        <%
                            String texto[] = new String[200];
                            int k = 0, i = 0, ban = 0, s = 0, l = 0, n = 0;
                            //Aca se tokeniza la informacion que envia el servidor, la cual se almacena en el arreglo texto
                            //En la variable k se calcula el tamano del arreglo texto
                            StringTokenizer st = new StringTokenizer(op.getSolRespuesta(), ",");
                            //out.println(op.getSolRespuesta());
                            k = 0;
                            while (st.hasMoreTokens()) {
                                texto[k] = st.nextToken();%>
                        <!--VALOR DE CADA TOKEN:<%=texto[k]%><br>-->
                        <%k = k + 1;

                            }%>
                        <%  if (texto[0].equals("H") && acta.size() <= 0) {%>
                        <br>
                        <p>
                        <center>
                            <h4><font face="Verdana, Arial, Helvetica, sans-serif" size="2">USTED
                                DEBE PRIMERO FIRMAR SU ACTA DE MATRICULA <!--O SU DIA DE REGISTRO
                        NO ES HOY.--></font></h4>
                            <P>
                                <!-- <h3><font size="2"><a href="Temp/matriculaEstudJava"><font face="Verdana, Arial, Helvetica, sans-serif">Solicitud
                                                 de Renovación y Acta de Matricula</font></a></font></h3>-->
                        </center>
                        <%} else if (texto[0].equals("S")) {%>
                        <%   for (int j = 0; j < k; j++) {
                                //       if (((texto[j].equals("10")) || (texto[j].equals("11")) || (texto[j].equals("20")) || (texto[j].equals("21"))) && (!(texto[j].equals("fin")))){
                                //         i=i+1;
                                //   }
                                if (((texto[j].equals("30")) || (texto[j].equals("31"))) && (!(texto[j].equals("fin")))) {
                                    ban = ban + 1;
                                    s = s + 1;
                                }
                            }%>
                    </b> </div>
                <!--Tabla en la que se pinta en cada celda las tablas de preinscritas y otras permitidas y electivas-->
                <table width="640" border="0" cellspacing="0" cellpadding="0" align="center"  id="tabla">
                    <tr>
                        <td width="343">
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><font size="2">Preinscritas
                                    por el estudiante</font></b></font></div>
                        </td>
                        <td width="10"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;</font></td>
                        <td width="343">
                            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><font size="2">Otras
                                    preinscritas</font></b></font></div>
                        </td>
                    </tr>
                    <td width="696" valign="top">
                        <!--Tabla interna de asignaturas Preinscritas-->
                        <table width="300" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr bgcolor="#336699">
                                <td width="20">
                                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>P</b></font></div>
                                </td>
                                <td width="100">
                                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>ASIG</b></font></div>
                                </td>
                                <td width="60">
                                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>GR</b></font></div>
                                </td>
                                <td width="60">
                                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>LAB</b></font></div>
                                </td>
                                <td width="60">

                                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>AUX</b></font></div>
                                </td>
                            </tr>
                            <!--INICIA VALIDACION PARA PINTAR ASIGNATURAS PREINSCRITAS POR EL ESTUDIANTE-->
                            <% int j = 0;
                                String cadena = "var";
                                while (!(texto[j].equals("fin"))) {
                                    if (((texto[j].equals("10")) || (texto[j].equals("11")))) {
                                        //ACA SE ARMA EL NOMBRE DE LAS VARIABLES (Ejm: var0, var1), LA VARIABLE l ES LA QUE INDICA EL INDICE DE ESTA VARIABLE var.
                                        //ESTE NOMBRE SE ASIGNA A LOS INPUT HIDDEN Y A LOS INPUT TEXT. ESTO SE HACE EN CADA CELDA A PINTAR
                                        String var = (String) cadena.concat(String.valueOf(l));
                                        l = l + 1;
                            %>
                            <tr>
                                <td width="20"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <%if (texto[j].equals("10")) {%>
                                    </font>
                                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#CC0033">!</font></b></font></div>
                                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <input type="hidden" name="<%=var%>" size="7" value="<%=texto[j]%>">
                                    <%}%>
                                    <%if (texto[j].equals("11")) {%>
                                    </font>
                                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#CC0033">&nbsp;</font></b></font></div>
                                    <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <input type="hidden" name="<%=var%>" size="7" value="<%=texto[j]%>">
                                    <%}%>
                                    </font></td>
                                <td width="100">
                                    <!-- Aca se pinta el nombre de la Asignatura seguido del credito-->
                                    <%var = (String) cadena.concat(String.valueOf(l));
                                        l = l + 1;
                                        String nemonico1;
                                        nemonico1 = texto[j + 1].substring(0, texto[j + 1].indexOf(' '));
                                        /*    if (texto[j + 1].length() == 11) {
                                         nemonico1 = (String) texto[j + 1].substring(0, 4);
                                         } else if (texto[j + 1].length() == 13) {
                                         nemonico1 = (String) texto[j + 1].substring(0,5);
                                         } else if (texto[j + 1].length() == 14) {
                                         nemonico1 = (String) texto[j + 1].substring(0, 7);
                                         } else {
                                         nemonico1 = (String) texto[j + 1].substring(0, 4);
                                         }*/

                                        /* if (texto[j + 1].length() > 4) {
                                         nemonico1 = (String) texto[j + 1].substring(0, 7);
                                         } else {
                                         nemonico1 = (String) texto[j + 1].substring(0, 4);
                                         }
                                         */
                                        //String nemonico1 = (String) texto[j + 1].substring(0, 5);%>
                                    <!-- Aca se envia de tipo hidden el nemonico de la asignatura-->
                                    <input type="hidden" name="<%=var%>" size="7" style="text-transform: uppercase" value="<%=nemonico1%>">
                                    <div align="center"><a href="JavaScript:openPop('HorarioAsigEst?iden=<%=nemonico1%>')"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=texto[j + 1]%></font></a></div>
                                </td>
                                <td width="60">
                                    <!--Aca se pinta la casilla para digitar el Grupo-->
                                    <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <%var = (String) cadena.concat(String.valueOf(l));
                                            l = l + 1;%>
                                        <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                                        </font></div>
                                </td>
                                <td width="60">
                                    <!--Aca se pinta la casilla para digitar el Laboratorio-->
                                    <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <%var = (String) cadena.concat(String.valueOf(l));
                                            l = l + 1;%>
                                        <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                                        </font></div>
                                </td>
                                <td width="60">
                                    <!--Aca se pinta la casilla para digitar la Auxiliar-->
                                    <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <%var = (String) cadena.concat(String.valueOf(l));
                                            l = l + 1;%>
                                        <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                                        </font></div>
                                </td>
                            </tr>
                            <%}
                                    j = j + 1;
                                }%>
                            <!--SE CIERRA IF Y WHILE-->
                        </table>
                        <font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                        <!---ACA FINALIZA IMPRESION ASIG INSCRITAS POR ESTUDIANTES-->
                        </font></td>
                    <td width="10"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;</font></td>
                    <td width="343" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                        <!--ACA INICIA TABLA DE OTRAS ASIGNATURAS Y DE ELECTIVAS-->
                        </font>
                        <div align="center">
                            <!--Tabla interna de otras permitidas - Otras asignaturas y electivas-->
                            <table width="300" border="0" cellspacing="0" cellpadding="0" align="center">
                                <tr>
                                    <td width="20" bgcolor="#336699">
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>P</b></font></div>
                                    </td>
                                    <td width="100" bgcolor="#336699">
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>ASIG</b></font></div>
                                    </td>
                                    <td width="60" bgcolor="#336699">
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>GR</b></font></div>
                                    </td>
                                    <td width="60" bgcolor="#336699">
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>LAB</b></font></div>
                                    </td>
                                    <td width="60" bgcolor="#336699">
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>AUX</b></font></div>
                                    </td>
                                </tr>
                                <% j = 0;
                                    while (!(texto[j].equals("fin"))) {
                                        if (((texto[j].equals("20")) || (texto[j].equals("21")))) {
                                            //ACA SE SIGUE GENERANDO EL NOMBRE DE LAS VARIABLES AL CONCATENAR EL STRING CADENA QUE ES IGUAL A "var" Y EL VALOR DE LA VARIABLE l, ESTO SE HACE EN CADA CELDA A PINTAR.
                                            String var = (String) cadena.concat(String.valueOf(l));
                                %>
                                <tr>
                                    <td width="20"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <!--Aca se pinta la celda P, en este caso se pinta el signo !-->
                                        <%if (texto[j].equals("20")) {%>
                                        </font>
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#CC0033">!</font></b></font></div>
                                        <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <%var = (String) cadena.concat(String.valueOf(l));
                                            l = l + 1;%>
                                        <input type="hidden" name="<%=var%>" size="7" value="<%=texto[j]%>">
                                        <%}%>
                                        <%if (texto[j].equals("21")) {%>
                                        <!--Aca se pinta la celda P, en este caso no se pinta el signo, ya que texto sub j es igual a 21-->
                                        </font>
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#CC0033">&nbsp;</font></b></font></div>
                                        <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <%var = (String) cadena.concat(String.valueOf(l));
                                            l = l + 1;%>
                                        <input type="hidden" name="<%=var%>" size="7" value="<%=texto[j]%>">
                                        <%}%>
                                        </font></td>
                                        <%//if (!((texto[j+1]).equals("ZZZZ"))){%>
                                    <td width="100">
                                        <%var = (String) cadena.concat(String.valueOf(l));
                                            l = l + 1;
                                            //ACA SE HACE EL SUBSTRING PARA SACAR EL NEMONICO Y ENVIARLO DE TIPO HIDDEN
                                            String nemonico2;
                                            nemonico2 = texto[j + 1].substring(0, texto[j + 1].indexOf(' '));
                                            /*   if (texto[j + 1].length() == 11) {
                                             nemonico2 = (String) texto[j + 1].substring(0, 4);
                                             } else if (texto[j + 1].length() == 13) {
                                             nemonico2 = (String) texto[j + 1].substring(0, 5);
                                             } else if (texto[j + 1].length() == 14) {
                                             nemonico2 = (String) texto[j + 1].substring(0, 7);
                                             } else {
                                             nemonico2 = (String) texto[j + 1].substring(0, 4);
                                             }*/
                                            /* if (texto[j + 1].length() > 4) {
                                             nemonico2 = (String) texto[j + 1].substring(0, 7);
                                             } else {
                                             nemonico2 = (String) texto[j + 1].substring(0, 4);
                                             }*/
                                        %>
                                        <input type="hidden" name="<%=var%>" size="7" style="text-transform: uppercase" value="<%=nemonico2%>">
                                        <!-- Aca se pinta el nombre de la Asignatura seguido del credito, con un link que muestra el horario de la asignatura-->
                                        <div align="center"><a href="JavaScript:openPop('HorarioAsigEst?iden=<%=nemonico2%>')"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=texto[j + 1]%></font></a></div>
                                    </td>
                                    <td width="60">
                                        <!--Aca se pinta la casilla para digitar el Grupo-->
                                        <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                            <%var = (String) cadena.concat(String.valueOf(l));
                                                l = l + 1;%>
                                            <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                                            </font></div>
                                    </td>
                                    <td width="60">
                                        <!--Aca se pinta la casilla para digitar el Laboratorio-->
                                        <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                            <%var = (String) cadena.concat(String.valueOf(l));
                                                l = l + 1;%>
                                            <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                                            </font></div>
                                    </td>
                                    <td width="60">
                                        <!--Aca se pinta la casilla para digitar la Auxiliar-->
                                        <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                            <%var = (String) cadena.concat(String.valueOf(l));
                                                l = l + 1;%>
                                            <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                                            </font></div>
                                    </td>
                                    <%//}%>
                                </tr>
                                <%}
                                        j = j + 1;
                                    }%>
                                <!--SE CIERRA IF Y WHILE-->
                                <tr>
                                    <td colspan="5">
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;</font></div>
                                    </td>
                                <tr>

                                    <!--  <td colspan="5">
                                        <p><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Si
                                          va a inscribir GEST(M) inscr&iacute;bala con el c&oacute;digo
                                          GEST.</font></b></p>
                                        <p><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>Si
                                          va a inscribir GOTE(M) inscr&iacute;bala con el c&oacute;digo
                                          GOTE</b></font><b>.</b></p>
                                      <BR>
                                        </td>-->
                                </tr>
                                <!--ACA SE PINTAN LAS CASILLAS DE OTRAS ASIGNATURAS Y ELECTIVAS-->
                                <tr>
                                    <td colspan="5">
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><font size="2">

                                                <%
                                                    if (perreg.contains("I")) {%>
                                                Utilice estas casillas para inscribir las asignaturas del periodo intermedio
                                                <%} else {%>
                                                Otras asignaturas y electivas
                                                <%}%></font></b></font></div>
                                    </td>
                                </tr>
                                <tr bgcolor="#336699">
                                    <td width="20">
                                        <div align="center"><font color="#FFFFFF"><font size="2"></font></font></div>
                                    </td>
                                    <td width="60">
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>ASIG</b></font></div>
                                    </td>
                                    <td width="60">
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>GR</b></font></div>
                                    </td>
                                    <td width="60">
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>LAB</b></font></div>
                                    </td>
                                    <td width="60">
                                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>AUX</b></font></div>
                                    </td>
                                </tr>
                                <%for (int p = 0; p < 3; p++) {
                                        //ACA SE SIGUE ARMANDO EL NOMBRE DE LAS VARIABLES, CON LA SECUENCIA l, ESTO SE HACE EN CADA CELDA A PINTAR.
                                        String var = (String) cadena.concat(String.valueOf(l));
                                        l = l + 1;%>
                                <tr>
                                    <td width="20" height="18">
                                        <div align="center"><font size="2">
                                            <!--En esta celda no se pinta nada esta es equivalente a las anteriores a la de P y se envia la variable hidden con valor cero-->
                                            <input type="hidden" name="<%=var%>" value="0" size="7" maxlength="7">
                                            </font></div>
                                    </td>
                                    <td width="60" height="18">
                                        <!--Aca se pinta la celda para digitar la Asignatura-->
                                        <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                            <% var = (String) cadena.concat(String.valueOf(l));
                                                l = l + 1;%>
                                            <input type="text" name="<%=var%>" style="text-transform: uppercase" size="7" maxlength="7">
                                            </font></div>
                                    </td>
                                    <td width="60" height="18">
                                        <!--Aca se pinta la celda para digitar el Grupo-->
                                        <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                            <% var = (String) cadena.concat(String.valueOf(l));
                                                l = l + 1;%>
                                            <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                                            </font></div>
                                    </td>
                                    <td width="60" height="18">
                                        <!--Aca se pinta la celda para digitar el Laboratorio-->
                                        <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                            <%var = (String) cadena.concat(String.valueOf(l));
                                                l = l + 1;%>
                                            <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                                            </font></div>
                                    </td>
                                    <td width="60" height="18">
                                        <!--Aca se pinta la celda para digitar la Auxiliar-->
                                        <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                            <% var = (String) cadena.concat(String.valueOf(l));
                                                l = l + 1;%>
                                            <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                                            </font></div>
                                    </td>
                                </tr>
                                <%}%>
                            </table>
                        </div>
                    </td>
                    <div align="center">
                        <p>&nbsp;</p>
                        <p><!--clave de confirmaci&oacute;n: --></p>

                        <p><br>
                        </p>
                    </div>
                    <tr align="center">
                        <td colspan="3">
                            <% String cod = request.getParameter("cod");
                                if (cod == null) {
                                    cod = "&nbsp;";
                                }%>

                            <div align="center">Ingrese el código:<img id="imgCaptcha" src="Captcha" id="captcha">
                                <input name="seccode"  size="08" type="text" maxlength="8">
                                <!%=cod%> </div>
                            <div align="center"><br>
                                <font face="Verdana, Arial, Helvetica, sans-serif" size="1">
                                <input type="button" name="Submit" class="boton" value="Enviar Solicitud" onclick="refreshModelList();" id="Submit1">
                                </font> </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <hr size="3">
                        </td>
                    </tr>
                </table>
            </form>
            <!--Si la variable ban es igual a cero quiere decir que el estudiante no tiene en registro ninguna asignatura
por lo tanto no se pinta nada en la parte inferior, pero si es diferente si se pintan las asignaturas que
que ya tiene en registro.-->
            <%if (ban != 0) {%>
            <div id="Layer2">
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="380" height="22" class="visibleflash" id="cargando2">
                    <param name="movie" value="Temp/img/flash/barraload.swf">
                    <param name="quality" value="high">
                    <embed src="Temp/img/flash/barraload.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="380" height="22"></embed>
                </object>
            </div>
            <form name="form2" method="post" action="">
                <div align="center">
                    <p><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" id="font1">Asignaturas
                            Inscritas</font></b> </p>
                    <table width="450" border="0" cellspacing="0" cellpadding="0" align="center" id="tabla2">
                        <tr bgcolor="#336699">
                            <td width="90">
                                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Operaci&oacute;n</b></font></div>
                            </td>
                            <td width="240">
                                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>ASIG</b></font></div>
                            </td>
                            <td width="90">
                                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>GR</b></font></div>
                            </td>
                            <td>
                                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>LAB</b></font></div>
                            </td>
                            <td>
                                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>AUX</b></font></div>
                            </td>
                        </tr>
                        <%Vector Retiradas = est.AsignaturasPI(carnet, perreg);
                            String asignatura1 = "";
                            if (Retiradas.size() > 0) {
                                Vector ret = new Vector();
                                for (int m = 0; m < Retiradas.size(); m++) {
                                    ret = (Vector) Retiradas.elementAt(m);
                                    asignatura1 = ret.elementAt(3).toString();

                                if (asignatura1.equals("0")) {%>

                        <!--INICIA VALIDACION PARA ASIGNATURAS YA INSCRITAS-->
                        <%String nomvar = "campo";
                            j = 0;
                            while (!(texto[j].equals("fin"))) {
                                if (((texto[j].equals("30")) || (texto[j].equals("31")))) {
                                    //ACA SE ARMA EL NOMBRE DE LA VARIABLE EN ESTE CASO ES campo0, campo1, ... EL INDICE SE CONTROLA CON n
                                    //ESTO SE HACE EN CADA CELDA A PINTAR
                                    String variable = (String) nomvar.concat(String.valueOf(n));
                                    n = n + 1;%>

                        <tr>
                            <td width="90">
                                <!--Aca se pinta el select de las opciones de cambio y retiro de grupo-->
                                <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <select name="<%=variable%>">
                                        <option value="N">Ninguna</option>
                                        <option value="M">Cambio Grupo</option>
                                        <option value="R">Retiro Materia</option>
                                    </select>
                                    </font></div>
                            </td>
                            <td width="240"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                <!--Aca se pinta el nombre de la asignatura seguido del grupo y el credito
        Aca se hace un substring para enviar hidden el nemonico de la asignatura y se hace un link al horario de la signatura-->
                                <%              variable = (String) nomvar.concat(String.valueOf(n));
                                    n = n + 1;
                                    String nemonico;
                                    nemonico = texto[j + 1].substring(0, texto[j + 1].indexOf(' '));
                                    /*  if (texto[j + 1].length() == 18) {
                                     nemonico = (String) texto[j + 1].substring(0, 4);
                                     } else if (texto[j + 1].length() == 13) {
                                     nemonico = (String) texto[j + 1].substring(0, 5);
                                     } else if (texto[j + 1].length() == 14) {
                                     nemonico = (String) texto[j + 1].substring(0, 7);
                                     } else {
                                     nemonico = (String) texto[j + 1].substring(0, 4);
                                     }*/
                                    /* if (texto[j + 1].length() > 4) {
                                     nemonico = (String) texto[j + 1].substring(0, 7);
                                     } else {
                                     nemonico = (String) texto[j + 1].substring(0, 4);
                                     }*/%>
                                </font>
                                <div align="center"><a href="JavaScript:openPop('HorarioAsigEst?iden=<%=nemonico%>')"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=texto[j + 1]%>
                                        </font></a></div>
                                <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                <input type="hidden" name="<%=variable%>" style="text-transform: uppercase" size="7" value="<%=nemonico%>">
                                </font></td>
                            <td width="90">
                                <!--Aca se pinta la casilla para escribir el grupo-->
                                <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <%variable = (String) nomvar.concat(String.valueOf(n));
                                        n = n + 1;%>
                                    <input type="text" name="<%=variable%>" size="7" maxlength="7" value="0">
                                    </font></div>
                            </td>
                            <td>
                                <!--Aca se pinta la casilla para escribir el laboratorio-->
                                <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <%variable = (String) nomvar.concat(String.valueOf(n));
                                        n = n + 1;%>
                                    <input type="text" name="<%=variable%>" size="7" maxlength="7" value="0">
                                    </font></div>
                            </td>
                            <td>
                                <!--Aca se pinta la casilla para escribir la auxiliar-->
                                <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                    <%variable = (String) nomvar.concat(String.valueOf(n));
                                        n = n + 1;%>
                                    <input type="text" name="<%=variable%>" size="7" maxlength="7" value="0">
                                    </font></div>
                            </td>
                        </tr>
                        <%}
                                j = j + 1;
                            }%>
                        <!--SE CIERRA IF Y WHILE-->
                        <tr>
                            <td width="90"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></td>
                            <td width="240">
                                <div align="center"><font size="2"><font size="2"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></div>
                            </td>
                            <td width="90">
                                <div align="center"><font size="2"><font size="2"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></div>
                            </td>
                            <td>
                                <div align="center"><font size="2"><font size="2"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></div>
                            </td>
                            <td>
                                <div align="center"><font size="2"><font size="2"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></div>
                            </td>
                        </tr>

                        <font face="Verdana, Arial, Helvetica, sans-serif" size="1"><br>
                        </font> </div>


                        <%}
                                }
                            }
                        %>
                    </table>
                    <div align="center">

                    </div>
                    <div align="center">Ingrese el código:<img src="Captcha" id="captcha">
                        <input name="seccode" size="08" type="text" maxlength="8">
                        <!%=msg%> </div>
                    <div align="center">
                        <input type="button" name="Submit2" value="Enviar Solicitud"  onclick="refreshModelListIns();" id="Submit2">
                    </div>
            </form>
            <%}%>
            <!--SE CIERRA IF DE BAND-->
            <%} else if (texto[0].equals("B")) {%>
            <p>
            <h4><font face="Verdana, Arial, Helvetica, sans-serif" size="2">EL
                ESTUDIANTE NO ESTA AUTORIZADO PARA MODIFICAR EL HORARIO.</font></h4>
                <%} else {%>
            <p>
            <h4><font face="Verdana, Arial, Helvetica, sans-serif" size="2">EL
                SERVIDOR SE ENCUENTRA OCUPADO O USTED NO HA FIRMADO EL ACTA. POR FAVOR INTENTE MAS TARDE. GRACIAS
                </font></h4>
                <%}%>
                <%
                    HttpSession sesion;
                    sesion = request.getSession(true);
                    sesion.setAttribute("nombre", nombre);
                    sesion.setAttribute("cont", String.valueOf(l));
                    sesion.setAttribute("cont1", String.valueOf(n));
                %>
            <!--este es el cierre del if (op.ejecutarOperacion())-->
            <%} else {%>

            <h4><font face="Verdana, Arial, Helvetica, sans-serif" size="2">ERROR
                EN LA OPERACION. O EL SERVIDOR SE ENCUENTRA OCUPADO</font></h4>
            <br>
            <%}%>
        </td>
    </tr>
    <tr>
        <td><div class="info" align="center">
                &nbsp;
            </div>
            <div align="center" class="piepag">Escuela
                Colombiana de Ingeniería Julio Garavito<br>
                AK. 45 No. 205-59 (Autopista Norte) / Contact Center: +57(1) 6683600 
                <br>
                Bogotá, D.C. , Colombia<br>&nbsp;
            </div></td>
    </tr>
    <tr>
        <td bgcolor="#EEEEEE"><img src="/Temp/img/bottom.gif" alt="" width="770" height="10" id="bottom" /></td>
    </tr>
</table>

</div><!--container-->
</body>

</html>

