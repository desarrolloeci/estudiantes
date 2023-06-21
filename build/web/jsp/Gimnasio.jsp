<%-- 
    Document   : Coliseo
    Created on : 24/11/2016, 09:28:54 AM
    Author     : lucero.rodriguez
--%>
<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%
    HttpSession sesion;
    PrintWriter oout = response.getWriter();
    Estudiante est = new Estudiante();
    configECI confEci = new configECI();
    //Se bloquean los estudiantes que estén en la tabla bloqueados_gimnasio
    //para desbloquear o bloquear el servicio de reserva de gimnasio, actualizar el campo bloqueado en select * from registro.bloqueados_gimnasio where per_acad=<<PERIODOACTUAL>> and doc='0000000000'
    //donde bloqueado es 1 y desbloqueado es 0
    if(!est.desbloqueadoServicioGimnasio(confEci.getPeriodoHor())||est.bloqueadoGimnasio(carnet, confEci.getPeriodoHor())){
        response.sendRedirect("ServicioNoDisponible");
    }

%>
    

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Académicos - Reserva Coliseo</title>

        <!-- JavaScript -->
        <script>
        

            function validar() {
        if (form1.antiguedad.value == "0") {
                    alert("Por favor seleccione si ingresará por primera vez o nó al gimnasio");
                    document.form1.antiguedad.style.backgroundColor = '#ffcc00';
                    document.form1.antiguedad.focus();
                    return false;
               }        
            }
        </script>

        <!-- CSS -->
        <link rel="stylesheet" href="css/comun.css" type="text/css" />
        <script language="JavaScript" type="text/JavaScript">
        </script>
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
    </table>
    <form name="form1" method="post" action="ReservaGimnasio">
        <div align="center">
    <p><font color="#800000">Luego de tener su número de inscripción, deben acercarse 
      al gimnasio para reservar su horario. </font></p>
    <table width="765" border="0" height="79" class="tabla">
      <tr>
        <td>
          <p align="center"><b>REGLAMENTO INSCRIPCIONES AL GIMNASIO</b></p>
          <p>A continuaci&oacute;n encontrar&aacute; los puntos a tener en cuenta 
            al momento de inscribirse. </p>
          <p><b>C&oacute;digos de reserva para usuarios nuevos por medio de servicios 
            acad&eacute;micos:</b> Son considerados usuarios nuevos quienes tengan 
            m&aacute;s de un a&ntilde;o de no asistir al gimnasio y quienes no 
            hayan hecho uso del mismo.</p>
          <p>1. El c&oacute;digo de reserva es personal e intransferible.<br>
            2. El estudiante tendr&aacute; una semana para formalizar la inscripci&oacute;n 
            al gimnasio. Pasado este tiempo se dispondr&aacute; del c&oacute;digo 
            de reserva.</p>
          <p><b>C&oacute;digos de reserva usuarios antiguos al coliseo el Oto&ntilde;o</b>: 
            Son considerados usuarios antiguos quienes hayan utilizado el gimnasio 
            el a&ntilde;o anterior.</p>
          <p><br>
            1. Quien formalice su inscripci&oacute;n y no asista al gimnasio quedar&aacute; 
            sancionado al uso de este por un a&ntilde;o.</p>
          <p>2. Quien tenga m&aacute;s de tres fallas injustificadas durante el 
            semestre no se le permitir&aacute; la inscripci&oacute;n en el semestre 
            siguiente.</p>
          <p>3. Fechas de asignaci&oacute;n de c&oacute;digos de reserva y horarios 
            se publicaran en el Notiweb.</p>
          <p>Nota: para iniciar actividades en el gimnasio se requiere la evaluaci&oacute;n 
            f&iacute;sica.</p>
    </td>
      </tr>
    </table>
    <p><b> Seleccione si va a ingresar por PRIMERA VEZ al gimnasio: </b> 
      <select name="antiguedad">
        <option value="0">Seleccione</option>
        <option value="PRIMERA VEZ GIMNASIO">SI</option>
        <option value="ANTIGUO EN GIMNASIO">NO</option>
      </select>
    </p>
    <p><br>
      <b>Desea realizar la inscripción al gimnasio para el periodo <%=confEci.getPeriodoHor()%> ? </b> <br>
      <br>
      <input type="submit" name="Submit" value="Reservar" onClick="javascript: return validar();">
    </p>
  </div>
</form>
         
     
     
     
     