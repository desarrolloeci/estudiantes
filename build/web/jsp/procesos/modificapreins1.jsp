<%-- 
    Document   : modificapreins
    Created on : 2/12/2010, 11:17:13 AM
    Author     : lrodriguez
--%>

<%@ include file="../secure.jsp" %>
<%@page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties,java.lang.reflect.Array " %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
        Vector prei = new Vector();
        Vector preadic = new Vector();
        response.setHeader("Cache-Control", "no-cache");
        String nombre = new String((String) session.getAttribute("nombre"));
        String dpto = new String((String) session.getAttribute("dpto"));
        String estado = new String((String) session.getAttribute("estado"));
        String nomas, prioas, color, cha = new String(), chb = new String(), per, asig = "";
        String respuesta = request.getParameter("respuesta");
        int nvoper = 0, maxcred = 0;
        int i, crtot, cras, cradic, totalcred = 0;
        String prog = new String();
        configECI confEci = new configECI();
        PrintWriter oout = response.getWriter();
        Estudiante est = new Estudiante(carnet, oout);
        Vector lispre = est.getModificaPreins(carnet);
        String cant = "";%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Modificaciones a la Preinscripción</title>
    </head>
    <script language="JavaScript" type="text/JavaScript">

        function ventanaSecundaria (URL){
            var asigna=document.form1.asigna.value;
            window.open("BuscarMod?asigna="+ asigna, "form1","width=700,height=600, scrollbars=yes,top=550,left=200");
        }
        var identificadores=new Array();

        function conectar(url,funcion){
            // Obtener la instancia del objeto XMLHttpRequest
            http_request = false;
            if (window.XMLHttpRequest) { // Mozilla, Safari,...
                http_request = new XMLHttpRequest();
                if (http_request.overrideMimeType) {
                    http_request.overrideMimeType('text/xml');
                }
            } else if (window.ActiveXObject) { // IE
                try {
                    http_request = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        http_request = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {}
                }
            }
            if (!http_request) {
                alert('No se Instanciado el Objeto XMLHttpRequest');
                return false;
            }

            //Preparar funcion de respuesta
            http_request.onreadystatechange = funcion;

            //Enviar Peticion
            http_request.open('POST', url, true);
            http_request.send(null);
        }

        function desPreinscribir(){
            var tabla=document.getElementById('preinscritas');
            var filas=tabla.rows;
            var identificador="",iden,valor="";
            var tam=filas.length,check;
            for(var i=1;i<tam;i++){
                if (navigator.appName=="Microsoft Internet Explorer") { // Mozilla, Safari,...
                    check = filas[i].childNodes[2].firstChild.checked;
                }else{
                    check = filas[i].childNodes[5].childNodes[1].checked;
                }
                if(check){
                    iden=filas[i].getAttribute('id');
                    identificadores.push(iden);
                    identificador=identificador+iden+",";
                }
            }
            var strLen = identificador.length;
            identificador = identificador.slice (0, strLen-1);
            var url='ModificaPreinscripcion?identificador='+identificador+'&valor=0';
            conectar(url,resDesPreinscribir);
        }


        function resDesPreinscribir(){
            if(http_request.readyState == 4) {
                if(http_request.status == 200) {
                    var xmldoc = http_request.responseXML;
                    var root_node = xmldoc.getElementsByTagName('root').item(0);
                    if(root_node.firstChild.data=="ok"){
                        var tabla=document.getElementById('preinscritas'),fila, cred;
                        for(var i=0;i<identificadores.length;i++){
                            fila=document.getElementById(identificadores[i]);
                            var fil=identificadores[i];
                            if (navigator.appName=="Microsoft Internet Explorer") { // Mozilla, Safari,...
                                fila.childNodes[2].firstChild.checked=false;
                            }else{
                                fila.childNodes[5].childNodes[1].checked=false;

                            }
                            hijo=fila;
                            tabla.removeChild(fila);
                            //  document.getElementById("mensaje1").style.visibility='hidden';
                        }
                        // document.getElementById("mensaje").style.visibility='hidden';

                        identificadores=new Array();
                    }
                }
            }
        }

    </script>
    <body>
        <div id="container">
        <table width="10" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
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
<!--|| (estado.equals("3") || estado.equals("7"))-->
        <%if (dpto.equals("15") ) {%>
       
        <table width="77%" border="0" align="center" class="tabla">
            <tr>
                <td width="68%" valign="top"> <b>
                        <center>
                            <font color="red">Asignaturas Preinscritas</font>
                        </center>
                    </b>
                    <table width="53%" border="1" class="tabla" align="center">
                        <tbody id="preinscritas">
                            <tr>
                                <td width="14%">Código</td>
                                <td width="31%">Nombre</td>
                            </tr>
                            <% for (i = 0; i < lispre.size(); i++) {
        preadic = (Vector) lispre.elementAt(i);%>
                            <tr id="<%=preadic.elementAt(2)%>">
                                <td width="14%">
                                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                                        <%=(String) preadic.elementAt(0)%> </font>
                                        <!--  <input type="text" name="" size="5" value="<!%=(String) preadic.elementAt(0)%>"-->
                                    </div>
                                </td>
                                <td width="31%">
                                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                                            <%=(String) preadic.elementAt(1)%>
                                            <!--input type="text" name="" size="35" value="<!%=(String) preadic.elementAt(4)%>"-->
                                    </font> </div>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <%} else {%>
            <tr>
            <td colspan="2">
                <div class="info" align="center">
                    <h2><font color="#666666"> <label id="msj">Preinscripci&oacute;n <%=confEci.getPeriodoSig()%></label>
                    </font></h2><font color="red"><br> Verifique que cumple con los requisitos de las asignaturas, en caso contrario serán retiradas.</font>
            </div></td>
        </tr>
        <tr>
        <td>
        <div id="mensaje" align="center" style="color: red;visibility:hidden">Sobrepasa la carga de créditos para preinscripción</div>
                    <table width="77%" border="0" align="center" class="tabla">
                        <tr>

                            <td width="68%" valign="top"> <b>
                                    <center>
                                        <font color="red">Asignaturas Preinscritas</font>
                                    </center>
                                </b>

                                <table width="96%" border="1" class="tabla">
                                    <tbody id="preinscritas">
                                        <tr>
                                            <td width="14%">Código</td>

                                            <td width="67%">Nombre</td>

                                            <td width="19%">Seleccione</td>
                                        </tr>
                                        <% for (i = 0; i < lispre.size(); i++) {
        preadic = (Vector) lispre.elementAt(i);%>

                                        <tr id="<%=preadic.elementAt(2)%>">

                                            <td width="14%">
                                                <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                                                    <%=(String) preadic.elementAt(0)%> </font>
                                                    <!--  <input type="text" name="" size="5" value="<!%=(String) preadic.elementAt(0)%>"-->
                                                </div>
                                            </td>

                                            <td width="67%">
                                                <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                                                        <%=(String) preadic.elementAt(1)%>
                                                        <!--input type="text" name="" size="35" value="<!%=(String) preadic.elementAt(4)%>"-->
                                                </font> </div>
                                            </td>


                                            <td width="19%" id="columna">
                                                <input type="checkbox" name="checkbox22">
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </td>

                            <td width="7%">
                                <input type="button" name="Submit2" value="    Quitar -> " onClick="desPreinscribir();" id="Submit1">
                            </td>

                        </tr>
                        <tr>

                            <td width="68%" valign="top"> </td>

                            <td width="7%">Buscar
                            <td width="25%" valign="top">
                                <form name="form1" method="get" action="javascript:ventanaSecundaria('BuscarAsig')">
                                    <input type="text" name="asigna" size="20" maxlength="20">
                                    <input type="submit" name="" value="Enviar" >
                                </form>
                            </td>
                        </tr>
                    </table>

                    <div align="center"> </div>
                </td>
            </tr>
        </table>
        <%}
        %>

    </body>

</html>
