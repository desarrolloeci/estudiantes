<%-- 
    Document   : nuevapreinscripcion
    Created on : 28/10/2010, 11:33:11 AM
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
        String nomas, prioas, color, cha = new String(), chb = new String(), per, asig = "";
        int nvoper = 0, maxcred = 0;
        int i, crtot, cras, cradic, totalcred = 0;
        String prog = new String();
        configECI confEci = new configECI();
        PrintWriter oout = response.getWriter();
        Estudiante est = new Estudiante(carnet, oout);
        int  tamamo = est.ActualFecha(carnet);                                                         
        Vector lispre = est.getPreinscripcion(carnet);
        Vector adiciona = est.getAdicionaPreinsc(carnet);
        Vector credito = (Vector) est.getCreditos(carnet).elementAt(0);
        Vector periodo = est.getPeriodoAc(carnet);
        String cant = "";
        Vector pering = new Vector();
        pering = (Vector) periodo.elementAt(0);
        per = pering.elementAt(0).toString();
        nvoper = Integer.parseInt(per.substring(0, 4));
       if (nvoper < 2010) {
            maxcred = 30;
        } else {
            maxcred = 30;
        }
       if (!credito.elementAt(0).equals("No disponible")) {
            cant = (String) credito.elementAt(0);
            totalcred = Integer.parseInt(cant);
        }
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Preinscripciones</title>
    </head>

    <script language="JavaScript" type="text/JavaScript">


        function ventanaSecundaria (URL){
            var asigna=document.form1.asigna.value;
            window.open("BuscarAsig?asigna="+ asigna, "form1","width=500,height=400, scrollbars=yes,top=550,left=300");
        }

        var http_request = false;
        var identificadores=new Array();
        var maxcred = <%=maxcred%>;
        var totalcred = <%=totalcred%>;
        var max = totalcred;
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

        function preinscribir(){
            //Limpiar Tabla
            //document.getElementById('buscar').style.visibility='hidden';
            var tabla=document.getElementById('asignaturas');
            var filas=tabla.rows;
            var identificador="",iden,cred, valor="";
            var tam=filas.length,check;
            for(var i=1;i<tam;i++){
                if (navigator.appName=="Microsoft Internet Explorer") { // Mozilla, Safari,...
                    check = filas[i].childNodes[3].firstChild.checked;
                    cred= filas[i].childNodes[2].firstChild.firstChild.innerHTML;

                }else{
                    check = filas[i].childNodes[7].childNodes[1].checked;
                    cred =filas[i].childNodes[5].childNodes[1].childNodes[0].innerHTML;
                }
                if(check){
                    max=parseInt(max)+parseInt(cred);
                    iden=filas[i].getAttribute('id');
                    identificadores.push(iden);
                    identificador=identificador+iden+",";
                }
            }
            if (max <= maxcred){
                var strLen = identificador.length;
                identificador = identificador.slice (0, strLen-1);
                var url='Preinscribe?identificador='+identificador+'&valor=0';
                document.getElementById("mensaje1").style.visibility='visible';
                document.getElementById("mensaje").style.visibility='hidden';
                conectar(url,resPreinscribir);
            } else{
                document.getElementById("mensaje").style.visibility='visible';
                document.getElementById("mensaje1").style.visibility='hidden';
                identificadores=new Array();
                max =totalcred;
            }

        }

        function desPreinscribir(){
            //Limpiar Tabla
            //document.getElementById('buscar').style.visibility='hidden';
            var tabla=document.getElementById('preinscritas');
            var filas=tabla.rows;
            var identificador="",iden,valor="";
            var tam=filas.length,check;
            for(var i=1;i<tam;i++){
                if (navigator.appName=="Microsoft Internet Explorer") { // Mozilla, Safari,...
                    check = filas[i].childNodes[3].firstChild.checked;
                }else{
                    check = filas[i].childNodes[7].childNodes[1].checked;
                }
                if(check){
                    iden=filas[i].getAttribute('id');
                    identificadores.push(iden);
                    identificador=identificador+iden+",";
                }
            }
            var strLen = identificador.length;
            identificador = identificador.slice (0, strLen-1);
            var url='Preinscribe?identificador='+identificador+'&valor=0';
            conectar(url,resDesPreinscribir);
        }

        function resPreinscribir(){
            if(http_request.readyState == 4) {
                if(http_request.status == 200) {
                    var xmldoc = http_request.responseXML;
                    var root_node = xmldoc.getElementsByTagName('root').item(0);
                    if(root_node.firstChild.data=="ok"){
                        var filasPreInscritas=document.getElementById('preinscritas'),hijo,filas;
                        var tabla=document.getElementById('asignaturas'),fila;
                        for(var i=0;i<identificadores.length;i++){
                            fila=document.getElementById(identificadores[i]);
                            var fil=identificadores[i];
                            if (navigator.appName=="Microsoft Internet Explorer") { // Mozilla, Safari,...
                                fila.childNodes[3].firstChild.checked=false;
                            }else{
                                fila.childNodes[7].childNodes[1].checked=false;
                            }
                            hijo=fila;
                            tabla.removeChild(fila);
                            filasPreInscritas.appendChild(hijo);
                            document.getElementById("mensaje1").style.visibility='visible';
                        }
                        totalcred = max;
                        identificadores=new Array();

                        document.getElementById("mensaje").style.visibility='hidden';

                    }
                }
            }
        }

        function resDesPreinscribir(){
            if(http_request.readyState == 4) {
                if(http_request.status == 200) {
                    var xmldoc = http_request.responseXML;
                    var root_node = xmldoc.getElementsByTagName('root').item(0);
                    if(root_node.firstChild.data=="ok"){
                        var filasPreInscritas=document.getElementById('asignaturas'),hijo;
                        var tabla=document.getElementById('preinscritas'),fila, cred;
                        for(var i=0;i<identificadores.length;i++){
                            fila=document.getElementById(identificadores[i]);
                            var fil=identificadores[i];
                            if (navigator.appName=="Microsoft Internet Explorer") { // Mozilla, Safari,...
                                cred= fila.childNodes[2].firstChild.firstChild.innerHTML;
                                fila.childNodes[3].firstChild.checked=false;
                            }else{
                                fila.childNodes[7].childNodes[1].checked=false;
                                cred =fila.childNodes[5].childNodes[1].childNodes[0].innerHTML;
                            }
                            totalcred = parseInt(totalcred)- parseInt(cred);
                            max = totalcred;
                            hijo=fila;
                            tabla.removeChild(fila);
                            filasPreInscritas.appendChild(hijo);
                            document.getElementById("mensaje1").style.visibility='hidden';
                        }
                        document.getElementById("mensaje").style.visibility='hidden';

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
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666"> <label id="msj">Preinscripci&oacute;n <!%=confEci.getPeriodoSig()%></label>
                            </font></h2><font  color="red">Seleccione de la lista de asignaturas aquellas de desee preinscribir.<br> Verifique que cumple con los requisitos de las asignaturas, en caso contrario serán retiradas.</font>
                            <br>
                            <br>
                            <br>
                            <br>
                    </div></td>
                </tr>
                <tr>
                    <td>
                    <div id="mensaje" align="center" style="color: red;visibility:hidden">Sobrepasa la carga de créditos para preinscripción</div>
                    <div id="mensaje1" align="center" style="color: red;visibility:hidden">
          <p>Preinscripción Aceptada</p>
        </div>
  <table width="100%" border="0" align="center" class="tabla">
          <tr> 
            <td width="45%" valign="top"><b><font color="red"> <font size="2"><!--Los
              estudiantes de primer semestre deben tambi&eacute;n preisncribir 
              las asignaturas que le corresponden en su ciclo de fundamentaci&oacute;n.--></font></font></b></td>
            <td width="4%">&nbsp;
            <td width="45%" valign="top"> <b>Buscar asignaturas que no estan en 
              la lista de asignaturas disponibles. </b> 
              <form name="form1" method="get" action="javascript:ventanaSecundaria('BuscarAsig')">
                <input type="text" name="asigna" size="20" maxlength="20">
                <input type="submit" name="" value="Enviar" >
              </form>
            </td>
          </tr>
          <tr> 
            <td width="60%" valign="top"> <b> 
              <center>
                <font color="red">Asignaturas Preinscritas</font> 
              </center>
              </b> 
              <table width="100%" border="1" class="tabla">
                <tbody id="preinscritas"> 
                <tr> 
                  <td width="5%">Código</td>
                  <td width="70%">Nombre</td>
                  <td width="1%">Créditos</td>
                  <td width="2%">Seleccione</td>
                </tr>
                <%  crtot = 0;
        cradic = 0;
        for (i = 0; i < adiciona.size(); i++) {
            preadic = (Vector) adiciona.elementAt(i);
            nomas = "as" + i;
            prioas = "pr" + i;
            cras = (Integer.valueOf((String) preadic.elementAt(2))).intValue();
            if (((String) preadic.elementAt(3)).equals("A")) {
                cradic = cradic + cras;
            } else {
                crtot = crtot + cras;
            }
            if (((String) preadic.elementAt(1)).equals("0")) {
                cha = "checked";
                chb = "";
            } else {
                chb = "checked";
                cha = "";
            }%>
                <% if (preadic.elementAt(6).equals("1") || preadic.elementAt(6).equals("11")) {%>
                <tr id="<%=preadic.elementAt(5)%>"> 
                  <td width="5%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) preadic.elementAt(0)%> </font> 
                      <!--  <input type="text" name="" size="5" value="<!%=(String) preadic.elementAt(0)%>"-->
                    </div>
                  </td>
                  <td width="70%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) preadic.elementAt(4)%> 
                      <!--input type="text" name="" size="35" value="<!%=(String) preadic.elementAt(4)%>"-->
                      </font> </div>
                  </td>
                  <td width="1%"> 
                    <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) preadic.elementAt(2)%> </font> 
                  </td>
                  <td width="28%" id="columna"> 
                    <input type="checkbox" name="checkbox22">
                  </td>
                </tr>
                <%} else if (preadic.elementAt(6).equals("2")) {%>
                <tr id="<%=preadic.elementAt(5)%>"> 
                  <td width="5%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) preadic.elementAt(0)%> </font> 
                      <!--  <input type="text" name="" size="5" value="<!%=(String) preadic.elementAt(0)%>"-->
                    </div>
                  </td>
                  <td width="70%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) preadic.elementAt(4)%> 
                      <!--input type="text" name="" size="35" value="<!%=(String) preadic.elementAt(4)%>"-->
                      </font> </div>
                  </td>
                  <td width="1%"> 
                    <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) preadic.elementAt(2)%> </font> 
                  </td>
                  <td width="28%" id="columna"> 
                    <input type="checkbox" name="checkbox22">
                  </td>
                </tr>
                <%} else if (preadic.elementAt(6).equals("3")) {%>
                <tr id="<%=preadic.elementAt(5)%>"> 
                  <td width="5%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) preadic.elementAt(0)%> 
                      <!--input type="text" name="<!%=nomas%>" size="5" value="<!%=(String) prei.elementAt(0)%>"-->
                      </font> </div>
                  </td>
                  <td width="70%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) preadic.elementAt(4)%> 
                      <!--input type="text" name="<!%=nombre%>" size="35" value="<!%=(String) prei.elementAt(4)%>"-->
                      </font> </div>
                  </td>
                  <td width="1%"> 
                    <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) preadic.elementAt(2)%></font> 
                  </td>
                  <td width="28%"> 
                    <input type="checkbox" name="marcar" value="checkbox" id="check">
                  </td>
                </tr>
                <%} else if (preadic.elementAt(6).equals("4") || preadic.elementAt(6).equals("5") || preadic.elementAt(6).equals("6") || preadic.elementAt(6).equals("7")) {%>
                <tr id="<%=preadic.elementAt(5)%>"> 
                  <td width="5%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) preadic.elementAt(0)%> 
                      <!--input type="text" name="<!%=nomas%>" size="5" value="<!%=(String) prei.elementAt(0)%>"-->
                      </font> </div>
                  </td>
                  <td width="70%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) preadic.elementAt(4)%> 
                      <!--input type="text" name="<!%=nombre%>" size="35" value="<!%=(String) prei.elementAt(4)%>"-->
                      </font> </div>
                  </td>
                  <td width="1%"> 
                    <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) preadic.elementAt(2)%></font> 
                  </td>
                  <td width="28%"> 
                    <input type="checkbox" name="marcar" value="checkbox" id="check">
                  </td>
                </tr>
                <%}
        }%>
                </tbody> 
              </table>
              <%
        if (request.getParameterValues("marcar") != null) {
            String[] recoger = new String[10];
            recoger = request.getParameterValues("marcar");

            for (int x = 0; x < recoger.length; x++) {
                out.print(recoger[x]);
            }
        }%>
              <p>&nbsp;</p>
            </td>
            <td width="4%"> 
              <input type="button" name="Submit" value="<-Preinscribir" onClick="preinscribir();" id="Submit1">
              <input type="button" name="Submit2" value="    Quitar -> " onClick="desPreinscribir();" id="Submit1">
            <td width="45%" valign="top"> <b> 
              <center>
                <font color="red">Asignaturas disponibles que puede preinscribir 
                </font> 
              </center>
              </b> 
              <table width="100%" border="1" class="tabla">
                <tbody id="asignaturas"> 
                <tr> 
                  <td width="5%">Código</td>
                  <td width="70%">Nombre</td>
                  <td width="1%">Créditos</td>
                  <td width="2%">Seleccione</td>
                </tr>
                <%  crtot = 0;
        cradic = 0;
        for (i = 0; i < lispre.size(); i++) {
            prei = (Vector) lispre.elementAt(i);
            nomas = "as" + i;
            prioas = "pr" + i;
            cras = (Integer.valueOf((String) prei.elementAt(2))).intValue();
            if (((String) prei.elementAt(3)).equals("A")) {
                cradic = cradic + cras;
            } else {
                crtot = crtot + cras;
            }
            if (((String) prei.elementAt(1)).equals("0")) {
                cha = "checked";
                chb = "";
            } else {
                chb = "checked";
                cha = "";
            }%>
                <% if (prei.elementAt(6).equals("-1")) {%>
                <tr id="<%=prei.elementAt(5)%>"> 
                  <td width="5%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) prei.elementAt(0)%> 
                      <!--input type="text" name="<!%=nomas%>" size="5" value="<!%=(String) prei.elementAt(0)%>"-->
                      </font> </div>
                  </td>
                  <td width="70%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) prei.elementAt(4)%> 
                      <!--input type="text" name="<!%=nombre%>" size="35" value="<!%=(String) prei.elementAt(4)%>"-->
                      </font> </div>
                  </td>
                  <td width="1%"> 
                    <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) prei.elementAt(2)%></font> 
                  </td>
                  <td width="28%"> 
                    <input type="checkbox" name="marcar" value="checkbox" id="check">
                  </td>
                </tr>
                <%} else if (prei.elementAt(6).equals("-2")) {%>
                <tr id="<%=prei.elementAt(5)%>"> 
                  <td width="5%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) prei.elementAt(0)%> 
                      <!--input type="text" name="<!%=nomas%>" size="5" value="<!%=(String) prei.elementAt(0)%>"-->
                      </font> </div>
                  </td>
                  <td width="70%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) prei.elementAt(4)%> 
                      <!--input type="text" name="<!%=nombre%>" size="35" value="<!%=(String) prei.elementAt(4)%>"-->
                      </font> </div>
                  </td>
                  <td width="1%"> 
                    <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) prei.elementAt(2)%></font> 
                  </td>
                  <td width="28%"> 
                    <input type="checkbox" name="marcar" value="checkbox" id="check">
                  </td>
                </tr>
                <%} else if (prei.elementAt(6).equals("-3")) {%>
                <tr id="<%=prei.elementAt(5)%>"> 
                  <td width="5%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) prei.elementAt(0)%> 
                      <!--input type="text" name="<!%=nomas%>" size="5" value="<!%=(String) prei.elementAt(0)%>"-->
                      </font> </div>
                  </td>
                  <td width="70%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) prei.elementAt(4)%> 
                      <!--input type="text" name="<!%=nombre%>" size="35" value="<!%=(String) prei.elementAt(4)%>"-->
                      </font> </div>
                  </td>
                  <td width="1%"> 
                    <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) prei.elementAt(2)%></font> 
                  </td>
                  <td width="28%"> 
                    <input type="checkbox" name="marcar" value="checkbox" id="check">
                  </td>
                </tr>
                <%} else if (prei.elementAt(6).equals("-4") || prei.elementAt(6).equals("-5") || prei.elementAt(6).equals("-6") || prei.elementAt(6).equals("-7")) {%>
                <tr id="<%=prei.elementAt(5)%>"> 
                  <td width="5%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) prei.elementAt(0)%> 
                      <!--input type="text" name="<!%=nomas%>" size="5" value="<!%=(String) prei.elementAt(0)%>"-->
                      </font> </div>
                  </td>
                  <td width="70%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) prei.elementAt(4)%> 
                      <!--input type="text" name="<!%=nombre%>" size="35" value="<!%=(String) prei.elementAt(4)%>"-->
                      </font> </div>
                  </td>
                  <td width="1%"> 
                    <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000"> 
                      <%=(String) prei.elementAt(2)%></font> 
                  </td>
                  <td width="28%"> 
                    <input type="checkbox" name="marcar" value="checkbox" id="check">
                  </td>
                </tr>
                <%}
        }%>
                </tbody> 
              </table>
              <div align="center"> 
                <p>&nbsp;</p>
                <p>&nbsp;</p>
              </div>
            </td>
          </tr>
        </table>
                </tr>
            </table>
        </div>
        <h1>&nbsp;</h1>
    </body>
</html>
