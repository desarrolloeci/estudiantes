<%-- 
    Document   : BuscadorAsig
    Created on : 18/11/2010, 04:32:49 PM
    Author     : lrodriguez
--%>
<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties " %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
        Vector prei = new Vector();
        Vector preadic = new Vector();
        response.setHeader("Cache-Control", "no-cache");
        configECI confEci = new configECI();
        PrintWriter oout = response.getWriter();
        String entrada = request.getParameter("asigna");
        Estudiante est = new Estudiante(carnet, oout);
        int nvoper = 0, maxcred = 0;
        int i, crtot, cras, cradic, totalcred = 0;

        String nomas, prioas, color, cha = new String(), chb = new String(), per, asig = "", var = "marcar";
//DEBE SER ESTE PERO LA PROGRAMACION DE 2011-2 AUN NO ESTA POR ESTO DEJAMOS MIENTRAS PERACAD
//      Vector lispre = est.BuscarAsig(confEci.getPeriodoSig(), carnet, entrada);
        Vector lispre = est.BuscarAsig(confEci.getPeriodoActual(), carnet, entrada);
        Vector credito = (Vector) est.getCreditos(carnet).elementAt(0);
        Vector periodo = est.getPeriodoAc(carnet);
        String cant = "";
        Vector pering = new Vector();
        pering = (Vector) periodo.elementAt(0);
        per = pering.elementAt(0).toString();
        nvoper = Integer.parseInt(per.substring(0, 4));
        if (nvoper < 2010) {
            //esto estaba en 30 para la modificacion
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
        <title>Buscar Asignaturas</title>
    </head>
    <script language="JavaScript" type="text/JavaScript">
        var http_request = false;
        var identificadores=new Array();

        function preinscribir(){
            
            //
            //Limpiar Tabla
            //document.getElementById('buscar').style.visibility='hidden';
            var tabla=document.getElementById('asignaturas');
            var filas=tabla.rows;
            var identificador="",iden,cred, valor="",max=<%=totalcred%>, maxcred=<%=maxcred%>;
            var tam=filas.length,check;
            for(var i=1;i<tam;i++){
                if (navigator.appName=="Microsoft Internet Explorer") { // Mozilla, Safari,...
                    check = filas[i].childNodes[3].firstChild.checked;
                    cred= filas[i].childNodes[2].firstChild.firstChild.innerHTML;

                } else{
                    check = filas[i].childNodes[7].childNodes[1].checked;
                    cred =filas[i].childNodes[5].childNodes[1].childNodes[0].innerHTML;
                }
                if(check){
                    max=parseInt(max)+parseInt(cred);
                    iden=filas[i].getAttribute('id');
                    identificador=identificador+iden+",";
                }
            }
            if (max <= maxcred){
                var strLen = identificador.length;
                identificador = identificador.slice (0, strLen-1);
                document.form1.action='Preinscribe?identificador='+identificador+'&valor=1';
            } else{
                document.getElementById("mensaje").style.visibility='visible';
            }
        }
    </script>

    <link href="css/comun.css" rel="stylesheet" type="text/css">
    <body>
        <div id="mensaje" align="center" style="color: red;visibility:hidden">Sobrepasa la carga de créditos para preinscripción</div>
        <div id="mensaje1" align="center" style="color: red;visibility:hidden">Preinscripción Aceptada</div>
        <form name="form1" method="post" action="">
            <table width="95%" border="1" class="tabla">
                <tbody id="asignaturas">
                    <tr>
                        <td width="5%">Código</td>
                        <td width="70%">Nombre</td>
                        <td width="1%">Créditos</td>
                        <td width="2%">Seleccione</td>
                    </tr>
                    <% for (i = 0; i < lispre.size(); i++) {
            prei = (Vector) lispre.elementAt(i);%>

                    <tr id="<%=prei.elementAt(4)%>">
                        <td width="5%">
                            <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                                    <%=(String) prei.elementAt(0)%>
                                    <!--input type="text" name="<!%=nomas%>" size="5" value="<!%=(String) prei.elementAt(0)%>"-->
                            </font> </div>
                        </td>
                        <td width="70%">
                            <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                                    <%=(String) prei.elementAt(1)%>
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
                    <div align="right">
                        <h1><b>
                                <input type="hidden" name="id" id="id" value="<%=prei.elementAt(4)%>">
                                <input type="hidden" name="valor" value="1" >

                        </b> </h1>
                    </div>
                    <%}%>
                </tbody>
            </table>
            <table align="center">
                <tr>

                    <td colspan="4" valign="top">
                        <input type="submit" name="agregar" value="Agregar" class="boton" onclick="javascript: return preinscribir();">
                    </td>
                </tr>
            </table>

        </form>
    </body>
</html>
