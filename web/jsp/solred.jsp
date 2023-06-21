<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%
        response.setHeader("Cache-Control", "no-cache");
        String nombre = new String((String) session.getAttribute("nombre"));
        String ban = new String((String) session.getAttribute("ban"));
        PrintWriter oout = response.getWriter();
//        Estudiante est = new Estudiante(carnet,oout) ;
        Estudiante est = (Estudiante) session.getAttribute("estClase");
%>

<html>
    <head>
        <title>Solicitud Red</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            <!--
            a  { text-decoration: none }
            .texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

            -->
        </style>

        <SCRIPT LANGUAGE="JavaScript">
            function comprueba( ){

                if ( document.forms.form1.mac.value == '') {
                    alert("Usted debe proporcionar la MAC de su tarjeta.");
                    return false;
                }

                return true;
            }
        </SCRIPT>
    </head>

    <body bgcolor="#FFFFFF" text="#000000">

        <table width="580" border="0" cellpadding="0" align="center" cellspacing="0">
            <tr>
                <td width="8"><img src="../img/arbIzqAz.gif" width="24" height="24"></td>
                <td width="564" valign="top"><img src="../img/puntoAz.gif" width="564" height="2.5" align="absmiddle"></td>
                <td width="8"><img src="../img/arbDerAz.gif" width="24" height="24"></td>
            </tr>
            <tr>
                <td width="8" height="42"></td>

                <td width="564" height="42" valign="top">
                    <jsp:include page="encabezado.jsp" flush="true"/>
                    <table width="100%" border="0" align="center">
                        <tr>
                            <td height="6" >
                                <div> <br>
                                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><font size="4"><u>Solicitud Red Inalámbrica</u></font></font></div>
                                </div>
                            </td>
                        </tr>
                        <tr>

                            <td align="center" valign="top">
                                <br>
                                <div align="left">
                                    <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Estimado
                                            estudiante para que usted pueda tener acceso a la red inal&aacute;mbrica
                                    es necesario que nos proporcione el siguiente dato de su tarjeta de red:</font></p>
                                    <form name="form1" method="post" onSubmit="return comprueba( );" action="registraSol.jsp">
                                        <div align="center">
                                            <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>MAC:
                                                </b></font>
                                                <input type="text" name="mac" size="17" maxlength="17">
                                            </p>
                                            <p>
                                                <input type="submit" name="Submit" value="Enviar">
                                            </p>
                                        </div>
                                    </form>

                                </div>
                            </td>

                        </tr>
                        <tr>
                            <td align="left" valign="top">&nbsp;</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <div align="right">
                                    <table width="45%" border="0" height="17">
                                        <tr>
                                            <td width="27%" height="14">
                                                <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">
                                                <a href="menuServEstud.jsp">ANTERIOR</a> </font></b></font></div>
                                            </td>
                                            <td width="4%" height="14" align="center" valign="middle">
                                                <div align="center">|</div>
                                            </td>
                                            <td width="22%" height="14">
                                                <%if (ban.equals("0")) {%>
                                                <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">
                                                <a href="menuServEstud.jsp">INICIO</a></font></b></font></div>
                                                <%} else {%>
                                                <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif">
                                                <a href="menuServEstud1.jsp">INICIO</a></font></b></font></div>
                                                <%}%>
                                            </td>
                                            <td width="4%" height="14" align="center" valign="middle">
                                                <div align="center"><b>|</b></div>
                                            </td>
                                            <td width="43%" height="14">
                                                <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="../servlet/LogOutEst/">CERRAR
                                                SESION </a></font></b></font></div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="8" height="42" align="right"></td>
            </tr>
            <tr>
                <td width="8"><img src="../img/abaIzqAz.gif" width="24" height="24"></td>
                <td width="564" valign="bottom"><img src="../img/puntoAz.gif" width="564" height="2.5"></td>
                <td width="8"><img src="../img/abaDerAz.gif" width="24" height="24"></td>
            </tr>
        </table>

    </body>
</html>
