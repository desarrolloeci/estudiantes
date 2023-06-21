<%-- 
    Document   : EGPR
    Created on : 25/10/2011, 03:23:53 PM
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
            sesion.setAttribute("estudiante", cedula);
            Vector Datos = est.Contesto(cedula, "44");
            Vector Graduados = est.GraduadosPos(cedula);
            if (Graduados.size() <= 0) {%>
<center><b>Su documento no se encuentra registrado en nuestra base de datos por favor verifiquelo.</b></center>

<%} else if (Datos.size() > 0) {%>
<center><b>Usted ya contestó la encuesta, gracias por su participación.</b></center>
<%   } else {%>

<html>
    <head>
        <title>Encuesta Graduados Pregrado EEPr</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <SCRIPT LANGUAGE="JavaScript">

            function comprueba( ){
                for(i=1; i<15; i++){
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

        <style type="text/css"></style>
    <div align="left"></div>
    <p class="Centro"><strong>ENCUESTA GRADUADOS PREGRADO</strong></p>
    <div align="left">
        <p>
            <font face="Arial, Helvetica, sans-serif" size="2">La  Escuela est&aacute; realizando un proceso de autoevaluaci&oacute;n con fines de acreditaci&oacute;n  institucional. La informaci&oacute;n que usted proporcione es muy importante para precisar fortalezas y oportunidades de mejoramiento. Por favor, dedique unos  pocos minutos a completar esta encuesta.<br />__________________________________________________________________________________________________________________________________________________________________________<center>
                    <p align="center">&nbsp;</p>

                    <div align="center"></div>
                </center>
            </font></div>
    <form name="form1"  method="post"  onSubmit="return comprueba( );" action="Autoevaluacion">
        <input type="hidden" name="total" value="14">
        <input type="hidden" name="idenc" value="44">
        <table width="98%" border="1" cellspacing="0" cellpadding="0">
            <tr>
                <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
                </td>
                <td rowspan="2" width="30%"><p>&nbsp;</p>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>programa</strong> que realiz&oacute; en la Escuela<strong> contribuye </strong>a la <strong>soluci&oacute;n de problemas y a la atenci&oacute;n de necesidades del  contexto</strong> de realidad nacional.</font></p></td>
                <td height="23" width="17%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En alto  grado</strong></font></div>
                </td>
                <td height="23" width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En mediano  grado</strong></font></div>
                </td>
                <td height="23" width="20%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En bajo  grado</strong></font></div>
                </td>
                <td height="23" width="16%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En ning&uacute;n  grado</strong></font></div>
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
                <td rowspan="2" width="30%"><div align="left"></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>programa </strong>&nbsp;que usted realiz&oacute; en la Escuela es  de alta calidad acad&eacute;mica:</font></p></td>
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
                <td width="20%">
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

        </table>
        <br />
        <table width="98%" border="1" cellspacing="0" cellpadding="0">
            <tr>
                <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">3</font></div></td>
                <td rowspan="2" width="30%"><div align="left"></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>formaci&oacute;n recibida</strong> le ha permitido desarrollar adecuadamente las  competencias necesarias para <strong>desempe&ntilde;arse  en su campo laboral</strong>.</font></p></td>
                <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
                <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
                <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
                <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
            </tr>
            <tr>
                <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P3" value="8" />
                        </font></div></td>
                <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P3" value="6" />
                        </font></div></td>
                <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P3" value="4" />
                        </font></div></td>
                <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P3" value="2" />
                        </font></div></td>
            </tr>
        </table>
        <br />
        <table width="98%" border="1" cellspacing="0" cellpadding="0">
            <tr>
                <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">4</font></div></td>
                <td rowspan="2" width="30%"><div align="left"></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La Escuela ofrece </strong>informaci&oacute;n actualizada<strong> sobre posibilidades de </strong>empleo<strong> para sus graduados</strong>.</font></p></td>
                <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Siempre</strong></font></div></td>
                <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Casi  siempre</strong></font></div></td>
                <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pocas  veces</strong></font></div></td>
                <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Nunca</strong></font></div></td>
            </tr>
            <tr>
                <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P4" value="8" />
                        </font></div></td>
                <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P4" value="6" />
                        </font></div></td>
                <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P4" value="4" />
                        </font></div></td>
                <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P4" value="2" />
                        </font></div></td>
            </tr>
        </table>
        <br />
        <br />
        <table width="98%" border="1" cellspacing="0" cellpadding="0">
            <tr>
                <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">5</font></div></td>
                <td rowspan="2" width="30%"><div align="left"></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>capacitaci&oacute;n</strong> <strong>en&nbsp;  lenguas extranjeras </strong>que usted recibi&oacute; durante sus<strong> </strong>estudios en la<strong> Escuela</strong>, fue:</font></p></td>
                <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div></td>
                <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div></td>
                <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada</strong></font></div></td>
                <td height="23"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div></td>
            </tr>
            <tr>
                <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P5" value="8" />
                        </font></div></td>
                <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P5" value="6" />
                        </font></div></td>
                <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P5" value="4" />
                        </font></div></td>
                <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P5" value="2" />
                        </font></div></td>
            </tr>

        </table>
        <br />

        <table width="98%" border="1" cellspacing="0" cellpadding="0">
            <tr>
                <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">6</font></div></td>
                <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los siguientes <strong>servicios que ofrece la  Escuela</strong> a sus graduados son:</font></div>
                    <p><font face="Arial, Helvetica, sans-serif" size="2">a. Informaci&oacute;n  institucional y de inter&eacute;s acad&eacute;mico a trav&eacute;s de boletines electr&oacute;nicos.</font></p></td>
                <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
                <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
                <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuado</strong></font></div></td>
                <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
            </tr>
            <tr>
                <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P6" value="8" />
                        </font></div></td>
                <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P6" value="6" />
                        </font></div></td>
                <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P6" value="4" />
                        </font></div></td>
                <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P6" value="2" />
                        </font></div></td>
            </tr>
            <tr>
                <td rowspan="2" width="5%">&nbsp;</td>
                <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Informaci&oacute;n  institucional a trav&eacute;s de la web de la Escuela.</font></p></td>
            </tr>
            <tr>
                <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P7" value="8" />
                        </font></div></td>
                <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P7" value="6" />
                        </font></div></td>
                <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P7" value="4" />
                        </font></div></td>
                <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P7" value="2" />
                        </font></div></td>
            </tr>
            <tr>
                <td rowspan="2" width="5%">&nbsp;</td>
                <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. Atenci&oacute;n  personalizada, v&iacute;a correo electr&oacute;nico y telef&oacute;nica.</font></p></td>
            </tr>
            <tr>
                <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P8" value="8" />
                        </font></div></td>
                <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P8" value="6" />
                        </font></div></td>
                <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P8" value="4" />
                        </font></div></td>
                <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P8" value="2" />
                        </font></div></td>
            </tr>
            <tr>
                <td rowspan="2" width="5%">&nbsp;</td>
                <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">d. Actualizaci&oacute;n  de datos en l&iacute;nea.</font></p></td>
            </tr>
            <tr>
                <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P9" value="8" />
                        </font></div></td>
                <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P9" value="6" />
                        </font></div></td>
                <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P9" value="4" />
                        </font></div></td>
                <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P9" value="2" />
                        </font></div></td>
            </tr>
            <tr>
                <td rowspan="2" width="5%">&nbsp;</td>
                <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">e.Facilidad  de interacci&oacute;n a trav&eacute;s de la Red Social de Graduados de la Escuela en  Facebook.</font></p></td>
            </tr>
            <tr>
                <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P10" value="8" />
                        </font></div></td>
                <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P10" value="6" />
                        </font></div></td>
                <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P10" value="4" />
                        </font></div></td>
                <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P10" value="2" />
                        </font></div></td>
            </tr>
            <tr>
                <td rowspan="2" width="5%">&nbsp;</td>
                <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">f. Capacitaci&oacute;n  para la inserci&oacute;n al mercado laboral.</font></p></td>
            </tr>
            <tr>
                <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P11" value="8" />
                        </font></div></td>
                <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P11" value="6" />
                        </font></div></td>
                <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P11" value="4" />
                        </font></div></td>
                <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P11" value="2" />
                        </font></div></td>
            </tr>
            <tr>
                <td rowspan="2" width="5%">&nbsp;</td>
                <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">g. Capacitaci&oacute;n  a trav&eacute;s de talleres en Ub&iacute;kate: orientaci&oacute;n para la b&uacute;squeda de empleo.</font></p></td>
            </tr>
            <tr>
                <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P12" value="8" />
                        </font></div></td>
                <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P12" value="6" />
                        </font></div></td>
                <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P12" value="4" />
                        </font></div></td>
                <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P12" value="2" />
                        </font></div></td>
            </tr>
            <tr>
                <td rowspan="2" width="5%">&nbsp;</td>
                <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">h. Oportunidades  de empleo a trav&eacute;s de la Feria  laboral.</font></p></td>
            </tr>
            <tr>
                <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P13" value="8" />
                        </font></div></td>
                <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P13" value="6" />
                        </font></div></td>
                <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P13" value="4" />
                        </font></div></td>
                <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P13" value="2" />
                        </font></div></td>
            </tr>
            <tr>
                <td rowspan="2" width="5%">&nbsp;</td>
                <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">i. Interacci&oacute;n  a trav&eacute;s del Encuentro  de Graduados</font></p></td>
            </tr>
            <tr>
                <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P14" value="8" />
                        </font></div></td>
                <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P14" value="6" />
                        </font></div></td>
                <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P14" value="4" />
                        </font></div></td>
                <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P14" value="2" />
                        </font></div></td>
            </tr>
        </table>
        <p>&nbsp;</p>
        <center><input type="submit" name="Submit" value="Enviar Datos"></center>
    </form>
    <%}%>
</body>
</html>
