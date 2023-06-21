<%-- 
    Document   : Polideportivo
    Created on : 05/03/2012, 8:42:14 AM
    Author     : lrodriguez
--%>

<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties, java.text.*, java.net.*, javax.naming.*, javax.rmi.PortableRemoteObject " %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%
        response.setHeader("Cache-Control", "no-cache");
          Estudiante est = (Estudiante) session.getAttribute("estClase") ;
//Fecha actual
        String error = request.getParameter("error");
        String fecuso = new String(""), dia = new String(""), capac = new String(""),
                descr = new String(""), msj = new String(""), ndia = new String("");
        if (error != null) {
            if (error.equals("formaerror")) {
                fecuso = new String((String) session.getAttribute("fecuso"));
                ndia = new String((String) session.getAttribute("ndia"));
                dia = new String((String) session.getAttribute("dia"));
                capac = new String((String) session.getAttribute("capac"));
                descr = new String((String) session.getAttribute("descr"));
                msj = "No existen recursos disponibles para esta solicitud<br>modifíquela y envíela nuevamente";
            }
        }

        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        Date currentTime_1 = new Date();
        String dateString = formatter.format(currentTime_1);
//Secuencia de solicitud de reserva de salon
/*  inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        BDintraeci.BDprofesorRemoteBusiness profesor = conEjb.lookupBDprofesorBean();
        Vector asignaturas = profesor.getAsignaturas(empleado.getPerHorario(), empleado.getIdProf());*/
        String sec = est.getSecuencia();
        session = request.getSession(true);
        session.setAttribute("sec", sec);
%>

<html>
    <head>
        <title>Solicitud de Reserva Polideportivo</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            <!--
            #fecha {
                font-family: Verdana, Arial, Helvetica, sans-serif;
                font-size: 12px;
                color: #990000;
                font-weight: bold;
            }

            a:hover{color:#3366CC; }
            a{color: blue;}
            a:link, a:visited { text-decoration: none }
            .texto {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

            -->
        </style>
        <script language="JavaScript" src="js/solpolidep.js"></script>
        <script language="JavaScript" src="js/calendario.js"></script>
        <script language="JavaScript" src="js/overlib_mini.js"></script>
        <script language="Javascript" type="text/javascript" src="js/comun.js"></script>

        <link href="css/comun.css" rel="stylesheet" type="text/css">
    </head>
    <body background="img/fondo.gif" onLoad="preloadImg()">
        <table width="640" border="0" align="center" cellpadding="0" cellspacing="0" class="textocom">
            <tr>
                <td align="center" valign="top">
                    <jsp:include page="encabezado" flush="true"/>
                    <form name="form1" method="post" action="reservasPoli" onSubmit="return comprueba();" >
                        <input type="hidden" name="ndia" value="<%=ndia%>">
                        <font color="#990000" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><%=msj%>
                        </strong></font>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="textocom">
                            <tr>
                                <td colspan="2"><b><font size="2">N&uacute;mero: <font color="#990000"><%=sec%></font></font> </b></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fecha
                                        actual:</b>
                                        <script>fecha()</script>
                                </font></td>
                            </tr>
                            <tr>
                                <td width="23%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Fecha
                                Utilizaci&oacute;n:</b> </font></td>
                                <td width="33%">
                                    <input type="text" name="fecha" size="14" maxlength="10" onfocus="this.blur()" class="campotext" value="<%=fecuso%>">
                                    <a href="javascript:show_calendar('form1.fecha'); document.form1.fecha.focus();" onMouseOver="window.status='Elige fecha'; overlib('Pulsa para elegir la fecha de solicitud de reserva.'); return true;" onMouseOut="window.status=''; nd();  return true;">
                                <img src="img/calendar.gif" width=16 height=16 border=0></a></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>D&iacute;a
                                            utilizaci&oacute;n:
                                            <input type="text" name="dia" size="9" maxlength="9" onfocus="this.blur()" class="campotext" value="<%=dia%>">
                                        </b>
                                        <script>
                                            <!--
                                            function doIt() {
                                                var cad = document.form1.fecha.value;
                                                var i;
                                                var aux1="";
                                                var ja = new Array();
                                                ja = cad.split("-");
                                                //var dia =parseInt(ja[1]) - 1;
                                                var dia = ja[1]-1;
                                                var fechaAux = new Date(ja[2], dia, ja[0]);
                                                aux1 = Dia_semana(fechaAux.getDay());
                                                //var dia = parseInt(fechaAux.getDay()) +  1;
                                                var dia = parseInt(fechaAux.getDay());
                                                document.form1.dia.value=aux1;
                                                document.form1.ndia.value=dia;
                                                //document.write (Dia_semana(fechaAux.getDay()) )
                                            }
                                            
                                        </script>
                                </font> </td>
                            </tr>
                            <tr>
                            <td colspan="2">
                            <p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Tipo
                            de Uso:</b></font>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <input type="radio" name="tipo" value="C">
                                        Clase
                                        <input type="radio" name="tipo" value="L">
                                        Uso Libre
                                    </font>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Hora :</b>
                                        <input type="radio" name="hora" value="700">700
                                        <input type="radio" name="hora" value="800">800
                                        <input type="radio" name="hora" value="900">900
                                        <input type="radio" name="hora" value="1000">1000
                                        <input type="radio" name="hora" value="1100">1100
                                        <input type="radio" name="hora" value="1200">1200
                                        <input type="radio" name="hora" value="1300">1300
                                        <input type="radio" name="hora" value="1400">1400
                                        <input type="radio" name="hora" value="1500">1500
                                        <input type="radio" name="hora" value="1600">1600
                                        <input type="radio" name="hora" value="1700">1700
                                        <input type="radio" name="hora" value="1800">1800
                                    </font>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"><font face="Verdana, Arial, Helvetica, sans-serif" color="#CC0000"><b><font size="2">Caracter&iacute;sticas</font></b></font></td>
                            </tr>
                            <tr>
                                <td colspan="2"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <input type="radio" name="caracteris" value="L">
                                Cancha de baloncesto</font></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <input type="radio" name="caracteris" value="O" >
                                Sal&oacute;n de arte</font></td>
                            </tr>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <input type="radio" name="caracteris" value="S">
                                Cancha de squash</font></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <input type="radio" name="caracteris" value="J" >
                                Sal&oacute;n de espejos</font></td>
                            </tr>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <input type="radio" name="caracteris" value="V">
                                Cancha de voleibol</font></td>
                                <td width="44%" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <input type="radio" name="caracteris" value="M" >
                                Salas m&uacute;ltiples </font></td>
                            </tr>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <input type="radio" name="caracteris" value="U">
                                Futsal</font></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <input type="radio" name="caracteris" value="N" >
                                Tenis de Mesa </font></td>
                            </tr>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                        <input type="radio" name="caracteris" value="I" >
                                Gimnasio </font></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                </font></td>
                            </tr>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                </font></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">&nbsp;</font></td>
                            </tr>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                </font></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Capacidad:
                                            <input type="text" name="capacidad" size="4" maxlength="4"  class="campotext"  value="<%=capac%>">
                                </b></font></td>
                            </tr>
                            <tr>
                                <td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                </font></td>
                                <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Observaciones:</b>
                                        <b>
                                            <input type="text" name="observ" size="20" maxlength="70" class="campotext" value="<%=descr%>">
                                </b></font></td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                                <td width="44%" valign="bottom"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
                                </font></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <div align="center">
                                        <input type="submit" name="Submit" value="Solicitar Reserva" class="boton">
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td>
                    <div align="right">
                        <jsp:include page="piepag">
                            <jsp:param name="anterior" value="Polideportivo" />
                        </jsp:include>
                    </div>
                </td>
            </tr>
        </table>
        <div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
    <p>&nbsp;</p></body>
</html>

