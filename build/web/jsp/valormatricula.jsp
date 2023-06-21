<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%
        response.setHeader("Cache-Control", "no-cache");
        String nombre = new String((String) session.getAttribute("nombre"));
        PrintWriter oout = response.getWriter();
        Estudiante est = new Estudiante(carnet, oout);
        configECI cfgEci = new configECI();
        if (carnet != null && !carnet.equals("")) {

%>

<html>
    <head>
        <title>Servicios Academicos - Consulta de Notas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            <!--
            a{color: blue;}
            a:hover{color:#3366CC; }
            .texto {
                font-family: Verdana, Arial, Helvetica, sans-serif;
                font-size: 12px;
                font-style: normal;
                line-height: normal;
                font-weight: bold;
                font-variant: normal;
                text-transform: none;
                text-decoration: none;
                color: #666666;
            }

            -->
        </style>
    </head>

    <body bgcolor="#FFFFFF" text="#000000">

        <table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
            <tr>
                <td width="640" height="42" valign="top">
                    <jsp:include page="encabezado" flush="true"/>
                    <table width="100%" border="0" align="center">
                        <tr>
                            <%Vector estud = est.getInfoEstudiante();%>
                            <% for (int j = 0; j < estud.size(); j++) {
        Vector estudiante = (Vector) estud.elementAt(j);
                            %>
                            <td colspan="2" valign="top" class="texto"> <br>
                                <font face="Verdana, Arial, Helvetica, sans-serif" size="3" ><b><u>Valor
                                            matricula para el periodo <%=cfgEci.getPeriodoSig()%>: <font color="#B70404"><%=estudiante.elementAt(22)%>
                                </font></u></b></font>
                                <p> <b>Proceso de pago:</b><br>
                                    Las órdenes para el primer período del 2007 se entregarán los días
                                    <font color="#990000">14, 15 y 16 de noviembre de 2006</font> en
                                la sala de estudio del primer piso del bloque C.</p>
                                <p>La fecha límite para pago de órdenes ordinaria es el <font color="#990000">18
                                    de diciembre de 2006.</font><br>
                                    La fecha límite para pago de órdenes extraordinaria es
                                el <font color="#990000">10 de enero de 2007</font>. </p>
                                <p>Tenga en cuenta que si el valor de la matr&iacute;cula aqu&iacute; informado
                                    es menor que el valor impreso en la orden de matr&iacute;cula, esto se
                                    debe a un error en el proceso de impresi&oacute;n de las ordenes el cual
                                fu&eacute; detectado por la Escuela.</p>
                                <p>La Direcci&oacute;n Financiera de la Escuela Colombia de Ingeniera
                                    le ofrece disculpas por el inconveniente que esta situaci&oacute;n
                                le ocasione y le solicitamos proceder de la siguiente manera:</p>
                                <p>1) Si no ha realizado el pago de la Matricula , acercarse a la
                                    oficina de Apoyo Financiero con la orden de matricula para que
                                le sea cambiada por la orden de matricula corregida.</p>
                                <p>2) Si usted ya cancel&oacute; el valor de la matr&iacute;cula del semestre 2007-1,
                                    solicitar mediante comunicaci&oacute;n escrita del acudiente, la
                                    devoluci&oacute;n del mayor valor pagado. En caso de no recibir
                                    dicha solicitud este mayor valor cancelado se le abonar&aacute; para
                                la matr&iacute;cula del 2007-2.</p>
                                <p>Agradecemos mucho su colaboraci&oacute;n y entendimiento.</p>
                                <p>Cordialmente,</p>
                                <p>Alfredo Mosquera A.<br>
                                    Director Financiero<br>
                                    Escuela Colombiana de Ingenieria<br>
                            Tel:57.1.6683600 ext.202 </p></td>
                            <%}%>
                        </tr>
                        <tr>
                            <td valign="top" colspan="2">
                                <table width="45%" border="0" height="17" align="right">
                                    <tr>
                                        <td width="27%" height="14">
                                            <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">
                                            <a href="menuServEstud">ANTERIOR</a> </font></b></font></div>
                                        </td>
                                        <td width="4%" height="14" align="center" valign="middle">
                                            <div align="center">|</div>
                                        </td>
                                        <td width="22%" height="14">
                                            <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">
                                            <a href="menuServEstud">INICIO</a></font></b></font></div>
                                        </td>
                                        <td width="4%" height="14" align="center" valign="middle">
                                            <div align="center"><b>|</b></div>
                                        </td>
                                        <td width="43%" height="14">
                                            <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR
                                            SESION </a></font></b></font></div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td height="5"><img src="img/bararhoriz.gif" width="640" height="5"></td>
            </tr>
        </table>

    </body>
</html>
<%
} else {
%>
<jsp:forward page="login"/>
<%        }
%>
