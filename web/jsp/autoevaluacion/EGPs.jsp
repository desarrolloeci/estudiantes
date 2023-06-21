<%-- 
    Document   : EGPs
    Created on : 5/10/2011, 08:45:35 AM
    Author     : lrodriguez
--%>

<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%
        PrintWriter oout = response.getWriter();
        Estudiante est = new Estudiante();
         HttpSession sesion;
        sesion = request.getSession(true);
        String cedula = request.getParameter("cedula");
        Vector Datos = est.Contesto(cedula, "11");
        sesion.setAttribute ("estudiante", cedula);

        Vector Graduados = est.GraduadosPos(cedula);
        if (Graduados.size() <= 0) {%>
<center><b>Su documento no se encuentra registrado en nuestra base de datos por favor verifiquelo.</b></center>

<%} else if (Datos.size() > 0) {%>
<center><b>Usted ya contestó la encuesta, gracias por su participación.</b></center>
<%   } else {%>

<html>
<head>
    <title>Encuesta a Graduados</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <SCRIPT LANGUAGE="JavaScript">

        function comprueba( ){
            for(i=1; i<14; i++){
                nombre = new String("P" + i);

                if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked) {
                    alert("Por favor responda todos los campos de la encuesta");
                    document.forms.form1[nombre][0].style.backgroundColor= '#ffcc00';
                    document.forms.form1[nombre][0].focus();
                     return false;
                }
            }

            return true;
        }
    </SCRIPT>
</HEAD>
<style type="text/css"></style>
<div align="left"></div>
<p class="Centro"><center><strong>EGPs</strong></center></p>
<div align="left">
    <p>
        <font face="Arial, Helvetica, sans-serif" size="2">La Escuela está realizando un proceso de <strong>Autoevaluación con fines de Acreditación Institucional</strong>. Su opinión es muy  importante para precisar  fortalezas y oportunidades de mejoramiento sobre diferentes aspectos de la  actividad universitaria. Le solicitamos responder todas las preguntas de la  encuesta. Agradecemos su participación.
            <br />__________________________________________________________________________________________________________________________________________________________________________<center>
                <p align="center">En cada pregunta seleccione la casilla que a su juicio representa mejor su opinión. Sus respuestas serán  tratadas de forma CONFIDENCIAL Y ANÓNIMA.    </p>
            </center>
    __________________________________________________________________________________________________________________________________________________________________________<br /></font></p>
</div>
<form name="form1"  method="post"  onSubmit="return comprueba( );"  action="Autoevaluacion">
<input type="hidden" name="total" value="13">
<input type="hidden" name="idenc" value="11">

<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicación</strong> de las  <strong>políticas institucionales</strong> para la <strong>enseñanza y la utilización  de lenguas extranjeras,</strong> es:</font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada</strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P1" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P1" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P1" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P1" value="2">
            </font></div>
        </td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">2</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas de formación</strong> (pregrado y  posgrado) de la Escuela son:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. <strong>Muy  pertinentes</strong></font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P2" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P2" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P2" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P2" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>De  alta calidad</strong></font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P3" value="2">
            </font></div>
        </td>
    </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">3</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los siguientes <strong>servicios que ofrece la  Escuela</strong> a sus graduados son:</font></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">a. Información  institucional y de interés académico a través de boletines electrónicos.</font></p></td>
        <td height="23" width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div>
        </td>
        <td height="23" width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div>
        </td>
        <td height="23" width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuado</strong></font></div>
        </td>
        <td height="23" width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div>
        </td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="6">
            </font></div>
        </td>
        <td width="19%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P4" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Información  institucional a través de la web de la Escuela.</font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P5" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P5" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P5" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P5" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. Atención  personalizada, vía correo electrónico y telefónica.</font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P6" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">d. Actualización  de datos en línea.</font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P7" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P7" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P7" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P7" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">e.Facilidad  de interacción a través de la Red Social de Graduados de la Escuela en  Facebook.</font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P8" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">f. Capacitación  para la inserción al mercado laboral.</font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P9" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">g. Capacitación  a través de talleres en Ubíkate: orientación para la búsqueda de empleo.</font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P10" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P10" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P10" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P10" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">h. Oportunidades  de empleo a través de la Feria  laboral.</font></p></td>

    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P11" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P11" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P11" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P11" value="2">
            </font></div>
        </td>
    </tr>
    <td rowspan="2" width="5%">&nbsp;</td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">i. Interacción  a través del Encuentro  de Graduados</font></p></td>
    </tr>
    <tr>
        <td width="17%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="8">
            </font></div>
        </td>
        <td width="12%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="6">
            </font></div>
        </td>
        <td width="20%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="4">
            </font></div>
        </td>
        <td width="16%">
            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P12" value="2">
            </font></div>
        </td>
    </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">4</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>formación recibida</strong> por los graduados les ha  permitido desarrollar adecuadamente las competencias necesarias para <strong>desempeñarse en su campo laboral</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
    </tr>
    <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P13" value="2" />
        </font></div></td>
    </tr>
</table>
<p>&nbsp;</p>
<center>
<div align="center">
    <input type="submit" name="Submit" value="Enviar Datos">
</div>
</center>
</form>
</body>
</html>
<%        }%>
