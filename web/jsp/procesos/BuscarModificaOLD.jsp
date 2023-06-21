<%-- 
    Document   : BuscarModifica
    Created on : 9/12/2010, 11:24:51 AM
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
        Vector lispre = est.Buscarprim(confEci.getPeriodoSig(), carnet, entrada);
        Vector credito = (Vector) est.getCreditos(carnet).elementAt(0);
        Vector periodo = est.getPeriodoAc(carnet);
        String cant = "";
        Vector pering = new Vector();
        pering = (Vector) periodo.elementAt(0);
        per = pering.elementAt(0).toString();
        nvoper = Integer.parseInt(per.substring(0, 4));

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
            //Limpiar Tabla
            //document.getElementById('buscar').style.visibility='hidden';
            var tabla=document.getElementById('asignaturas');
            var filas=tabla.rows;
            var identificador="",iden,cred, valor="",max=<%=totalcred%>, maxcred=<%=maxcred%>, valida,compara=0;
            var tam=filas.length,check;
            for(var i=1;i<tam;i++){
                if (navigator.appName=="Microsoft Internet Explorer") { // Mozilla, Safari,...
                    check = filas[i].childNodes[3].firstChild.checked;
                } else{
                    check = filas[i].childNodes[7].childNodes[1].checked;
                }

                if(check){
                    iden=filas[i].getAttribute('id');
                    identificador=identificador+iden+",";
                
                }
            }
     
                var strLen = identificador.length;
                identificador = identificador.slice (0, strLen-1);
                document.form1.action='ModificaPreinscripcion?identificador='+identificador+'&valor=1';
           
        }
    </script>

    <link href="css/comun.css" rel="stylesheet" type="text/css">
    <body>
        <div id="mensaje1" align="center" style="color: red;visibility:hidden">Sobrepasa la carga de créditos para preinscripción</div>
        <div id="mensaje" align="center" style="color: red;visibility:hidden">No ha visto los prerrequisitos para preinscribir esta asignatura</div>
        <table width="95%" border="1" class="tabla">
            <form name="form1">
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

    </body>
</html>
