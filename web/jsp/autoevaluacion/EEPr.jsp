<%-- 
    Document   : EEPr
    Created on : 5/10/2011, 08:45:04 AM
    Author     : lrodriguez
--%>
<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>

<%
        PrintWriter oout = response.getWriter();
        Estudiante est = (Estudiante) session.getAttribute("estClase");
        Vector Datos = est.Contesto(carnet, "9");
        if (Datos.size() > 0) {%>
<center><b>Usted ya contestó la encuesta, gracias por su participación.</b></center>
<%   } else {%>

<html>
<head>
<title>Encuesta a Estudiantes Pregrado EEPr</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<SCRIPT LANGUAGE="JavaScript">

    function comprueba( ){
        for(i=1; i<93; i++){
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
<style type="text/css"></style>
<div align="left"></div>
<form name="form1"  method="post"  onSubmit="return comprueba( );" action="Autoevaluacion">
<input type="hidden" name="total" value="92">
<input type="hidden" name="idenc" value="9">
    <p class="Centro"><center>EEPr</center></p>
    <div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela está realizando un proceso de<strong> Autoevaluación con fines de Acreditación Institucional</strong>. Su opinión es muy importante para precisar fortalezas y oportunidades mejoramiento sobre diferentes aspectos de la actividad universitaria. Le solicitamos responder todas las preguntas de la encuesta. Agradecemos su participación.
    <br />__________________________________________________________________________________________________________________________________________________________________________<br /><center>
      <p>En cada pregunta seleccione la casilla que a su juicio representa mejor su opinión. Sus respuestas serán tratadas de forma CONFIDENCIAL Y ANÓNIMA.</p>
    </center>
    __________________________________________________________________________________________________________________________________________________________________________<br /></font></p>
    <div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2"><u><strong>F</strong></u><strong><u>actor 1.  Misi&oacute;n y Proyecto Institucional</u></strong></font></p>
    </div>
    </div>
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">1</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">La misi&oacute;n se refleja en los logros institucionales de manera:</font></p></td>
                        <td height="23" width="17%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy Adecuada</strong></font></div>
                        </td>
                        <td height="23" width="12%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div>
                        </td>
                        <td height="23" width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente Adeacuada</strong></font></div>
                        </td>
                        <td height="23" width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco Adecuada</strong></font></div>
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
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela demuestra un decidido compromiso  Institucional con l<strong>a  calidad</strong><strong>:</strong></font></p></td>
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
                    <td rowspan="2" width="5%">
                            <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">3</font></div>
                      </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Las </strong>orientaciones del PEI <strong>se</strong> aplican <strong>para</strong> fomentar  la<strong> formaci&oacute;n integral.</strong></font></p></td>

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
    <div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 2.  Estudiantes</u></strong></font></p>
    </div>
    </div>
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">4</font></div>
        </td>
        <td rowspan="2" width="30%">     <div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><strong>La </strong>aplicaci&oacute;n del reglamento<strong> sobre </strong><strong>deberes,  derechos y participaci&oacute;n </strong>de los estudiantes<strong> en los &oacute;rganos directivos:</strong></font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">Es <strong>transparente.</strong></font></p></td>
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
                                    <input type="radio" name="P4" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" name="P4" value="6">
                          </font></div>
                        </td>
                        <td width="20%">
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
                    <td rowspan="2" width="5%">
                            <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">5</font></div>
                      </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Es eficiente</strong>.</font></p></td>

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

                   <td rowspan="2" width="5%">
                            <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">6</font></div>
                     </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Contribuye</strong> al cumplimiento de  la <strong>Misi&oacute;n Institucional.</strong></font></p></td>

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
    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">7</font></div>
        </td>
        <td rowspan="2" width="30%">     <div align="left"><font face="Arial, Helvetica, sans-serif" size="2"><strong>La</strong> aplicaci&oacute;n de la  reglamentaci&oacute;n sobre <strong>procesos de admisi&oacute;n,  permanencia en la instituci&oacute;n, promoci&oacute;n, traslado y grado</strong>:</font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">Es <strong>transparente.</strong></font></p></td>
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
                    <td rowspan="2" width="5%">
                            <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">8</font></div>
                      </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Es eficiente</strong>.</font></p></td>

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

                   <td rowspan="2" width="5%">
                            <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">9</font></div>
                     </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>Contribuye</strong> al cumplimiento de  la <strong>Misi&oacute;n Institucional.</strong></font></p></td>

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
    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">10</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">Los  procesos de admisi&oacute;n de los estudiantes se enmarcan en criterios acad&eacute;micos  establecidos.</font></p></td>
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
                                    <input type="radio" name="P10" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                                    <input type="radio" name="P10" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
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

    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">11</font></div>
        </td>
        <td rowspan="2" width="30%">     <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>pol&iacute;ticas de admisi&oacute;n</strong> de  estudiantes son:</font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Pertinentes</strong>.</font></p></td>
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
                    <td rowspan="2" width="5%">
                            <div align="center"></div>
                      </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Equitativas</strong>.</font></p></td>

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

                   <td rowspan="2" width="5%">
                            <div align="center"></div>
                     </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>c. Transparentes</strong>.</font></p></td>

                    </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P13" value="8">
                            </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P13" value="6">
                            </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P13" value="4">
                            </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P13" value="2">
                            </font></div>
                        </td>
                    </tr>
    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">12</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>procedimientos </strong>de matr&iacute;cula son:</font></p></td>
                        <td height="23" width="17%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div>
                        </td>
                        <td height="23" width="12%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div>
                        </td>
                        <td height="23" width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados </strong></font></div>
                        </td>
                        <td height="23" width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div>
                        </td>
      </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P14" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P14" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P14" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P14" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">13</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>permanencia d</strong>e los estudiantes en la  instituci&oacute;n<strong> </strong>se enmarca en <strong>criterios acad&eacute;micos</strong> establecidos.</font></p></td>
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
                            <input type="radio" name="P15" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P15" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P15" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P15" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">14</font></div>
        </td>
        <td rowspan="2" width="30%">     <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> de las <strong>pol&iacute;ticas de permanencia</strong> de los estudiantes es:</font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Equitativas</strong>.</font></p></td>
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
                            <input type="radio" name="P16" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P16" value="6">
                          </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P16" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P16" value="2">
                          </font></div>
                        </td>
                    </tr>
                    <td rowspan="2" width="5%">
                            <div align="center"></div>
                      </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Transparentes</strong>.</font></p></td>

                    </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P17" value="8">
                            </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P17" value="6">
                            </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P17" value="4">
                            </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P17" value="2">
                            </font></div>
                        </td>
                    </tr>
    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">15</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>procesos de seguimiento</strong> al  desarrollo integral de los estudiantes se enmarcan en &nbsp;<strong>criterios  acad&eacute;micos</strong> establecidos, de una<strong> manera:</strong></font></p></td>
                        <td height="23" width="17%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div>
                        </td>
                        <td height="23" width="12%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div>
                        </td>
                        <td height="23" width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada </strong></font></div>
                        </td>
                        <td height="23" width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div>
                        </td>
      </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P18" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P18" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P18" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P18" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">16</font></div>
        </td>
        <td rowspan="2" width="30%">     <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Las  <strong>pol&iacute;ticas de seguimiento</strong> al  desarrollo integral de los estudiantes son:</font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Equitativas</strong>.</font></p></td>
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
                            <input type="radio" name="P19" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P19" value="6">
                          </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P19" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P19" value="2">
                          </font></div>
                        </td>
                    </tr>
                    <td rowspan="2" width="5%">
                            <div align="center"></div>
                      </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Transparentes</strong>.</font></p></td>

                    </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P20" value="8">
                            </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P20" value="6">
                            </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P20" value="4">
                            </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P20" value="2">
                            </font></div>
                        </td>
                    </tr>
    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">17</font></div>
        </td>
        <td rowspan="2" width="30%">     <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>estudiantes</strong> tienen una <strong>adecuada participaci&oacute;n</strong> en:</font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a.</strong> Los  <strong>&oacute;rganos colegiados.</strong></font></p></td>
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
                            <input type="radio" name="P21" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P21" value="6">
                          </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P21" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P21" value="2">
                          </font></div>
                        </td>
                    </tr>
                    <td rowspan="2" width="5%">
                            <div align="center"></div>
                      </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. </strong>Las <strong>organizaciones estudiantiles.</strong></font></p></td>

                    </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P22" value="8">
                            </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P22" value="6">
                            </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P22" value="4">
                            </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P22" value="2">
                            </font></div>
                        </td>
                    </tr>

                   <td rowspan="2" width="5%">
                            <div align="center"></div>
                     </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>c. </strong>Los <strong>proyectos de liderazgo.</strong></font></p></td>

                    </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P23" value="8">
                            </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P23" value="6">
                            </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P23" value="4">
                            </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P23" value="2">
                            </font></div>
                        </td>
                    </tr>
    <td rowspan="2" width="5%">
                            <div align="center"></div>
      </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>d.</strong> La <strong>organizaci&oacute;n de grupos universitarios.</strong></font></p></td>

                    </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P24" value="8">
                            </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P24" value="6">
                            </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P24" value="4">
                            </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P24" value="2">
                            </font></div>
                        </td>
                    </tr>
    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">18</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">La  asignaci&oacute;n de <strong>becas y pr&eacute;stamos  contribuye </strong>a la <strong>permanencia</strong> de<strong> estudiantes</strong> acad&eacute;micamente destacados.</font></p></td>
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
                            <input type="radio" name="P25" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P25" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P25" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P25" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">19</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>criterios</strong> institucionales <strong>para el  otorgamiento de est&iacute;mulos </strong>(monitor&iacute;as, asistencia de investigaci&oacute;n, becas,  condonaci&oacute;n de cr&eacute;ditos u otros) a estudiantes destacados son:</font></p></td>
                        <td height="23" width="17%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div>
                        </td>
                        <td height="23" width="12%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div>
                        </td>
                        <td height="23" width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados </strong></font></div>
                        </td>
                        <td height="23" width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div>
                        </td>
      </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P26" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P26" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P26" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P26" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 3.  Profesores</u></strong></font></p>
    </div>
    </div>
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">20</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>cantidad de profesores</strong> para atender al  n&uacute;mero de estudiantes matriculados<strong> es</strong>:</font></p></td>
                        <td height="23" width="17%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div>
                        </td>
                        <td height="23" width="12%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div>
                        </td>
                        <td height="23" width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada </strong></font></div>
                        </td>
                        <td height="23" width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div>
                        </td>
      </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P27" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P27" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P27" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P27" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">21</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>nivel de formaci&oacute;n de los profesores</strong> de  tiempo completo y medio tiempo<strong> es</strong></font></p></td>
                        <td height="23" width="17%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div>
                        </td>
                        <td height="23" width="12%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div>
                        </td>
                        <td height="23" width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuado </strong></font></div>
                        </td>
                        <td height="23" width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div>
                        </td>
      </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P28" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P28" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P28" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P28" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">22</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La </strong>aplicaci&oacute;n <strong>del modelo de evaluaci&oacute;n de profesores </strong>es<strong> </strong>efectiva<strong> (genera impactos o efectos positivos)</strong></font></p></td>
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
                            <input type="radio" name="P29" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P29" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P29" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P29" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">23</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">El <strong>nivel</strong> de<strong> productividad intelectual </strong>del profesorado es:</font></p></td>
                        <td height="23" width="17%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div>
                        </td>
                        <td height="23" width="12%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div>
                        </td>
                        <td height="23" width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuado </strong></font></div>
                        </td>
                        <td height="23" width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div>
                        </td>
      </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P30" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P30" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P30" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P30" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 4.  Procesos Académicos</u></strong></font></p>
    </div>
    </div>
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">24</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">Las  concepciones institucionales sobre el mundo, el hombre, la sociedad y la  historia, orientan la formaci&oacute;n integral de manera:</font></p></td>
                        <td height="23" width="17%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy pertinente</strong></font></div>
                        </td>
                        <td height="23" width="12%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Pertinente</strong></font></div>
                        </td>
                        <td height="23" width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente pertinente </strong></font></div>
                        </td>
                        <td height="23" width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco pertinente</strong></font></div>
                        </td>
      </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P31" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P31" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P31" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P31" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">25</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n</strong> de las&nbsp; </strong>pol&iacute;ticas institucionales<strong> para:</strong><strong>:</strong></font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>promoci&oacute;n</strong> de la <strong>interdisciplinariedad,</strong> es:</font></p></td>
                        <td height="23" width="17%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div>
                        </td>
                        <td height="23" width="12%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div>
                        </td>
                        <td height="23" width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada </strong></font></div>
                        </td>
                        <td height="23" width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div>
                        </td>
      </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P32" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P32" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P32" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P32" value="2">
                          </font></div>
                        </td>
                    </tr>
                      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">26</font></div></td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>ense&ntilde;anza y la utilizaci&oacute;n de lenguas extranjeras,</strong> es:</font></p></td>

                    </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P33" value="8">
                            </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P33" value="6">
                            </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P33" value="4">
                            </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P33" value="2">
                            </font></div>
                        </td>
                    </tr>
                      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">27</font></div></td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La fundamentaci&oacute;n  cient&iacute;fica y &eacute;tica de conocimientos, </strong>es:</font></p></td>

                    </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P34" value="8">
                            </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P34" value="6">
                            </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P34" value="4">
                            </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P34" value="2">
                            </font></div>
                        </td>
                    </tr>
                      <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">28</font></div></td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La  flexibilizaci&oacute;n de</strong> los planes de estudio, es:</font></p></td>

                    </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P35" value="8">
                            </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P35" value="6">
                            </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P35" value="4">
                            </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P35" value="2">
                            </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">29</font></div>
        </td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
        <p><font face="Arial, Helvetica, sans-serif" size="2">La  incorporaci&oacute;n y manejo de <strong>las TICS</strong> tiene un alto impacto sobre el <strong>aprendizaje.</strong></font></p></td>
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
                            <input type="radio" name="P36" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P36" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P36" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P36" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font size="2" face="Arial, Helvetica, sans-serif">30</font></div>
        </td>
        <td rowspan="2" width="30%">     <div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas de formaci&oacute;n</strong> (pregrado y  posgrado) de la Escuela son:</font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Muy  pertinentes</strong>.</font></p></td>
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
                            <input type="radio" name="P37" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P37" value="6">
                          </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P37" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P37" value="2">
                          </font></div>
                        </td>
                    </tr>
                    <td rowspan="2" width="5%">
                            <div align="center"></div>
                      </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. De  alta calidad</strong></font></p></td>

                    </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P38" value="8">
                            </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P38" value="6">
                            </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P38" value="4">
                            </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P38" value="2">
                            </font></div>
                        </td>
                    </tr>
    </table>
    <br />
    <div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 5. Investigación</u></strong></font></p>
    </div>
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
         <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">31</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La  participaci&oacute;n de los estudiantes en actividades de investigaci&oacute;n formativa es:</strong></font></p></td>
                        <td height="23" width="17%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font></div>
                        </td>
                        <td height="23" width="12%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuada</strong></font></div>
                        </td>
                        <td height="23" width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuada </strong></font></div>
                        </td>
                        <td height="23" width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuada</strong></font></div>
                        </td>
      </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P39" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P39" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P39" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P39" value="2">
                          </font></div>
                        </td>
                    </tr>

    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr>
         <td rowspan="2" width="5%"> <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">32</font></div>
        </td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>investigaci&oacute;n formativa</strong> en  la Escuela tiene:</font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Niveles  de desarrollo:</strong></font></p></td>
                        <td height="23" width="17%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuados</strong></font></div>
                        </td>
                        <td height="23" width="12%">
                          <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div>
                        </td>
                        <td height="23" width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Medianamente adecuados </strong></font></div>
                        </td>
                        <td height="23" width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div>
                        </td>
      </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P40" value="8">
                          </font></div>
                        </td>
                        <td width="12%">
                    <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                    <input type="radio" name="P40" value="6">
                          </font></div>
                        </td>
                        <td width="19%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P40" value="4">
                          </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P40" value="2">
                          </font></div>
                        </td>
                    </tr>
                    <td rowspan="2" width="5%">
                            <div align="center"></div>
                      </td>
                        <td rowspan="2" width="30%">
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Mecanismos  de evaluaci&oacute;n</strong>:</font></p></td>

                    </tr>
                    <tr>
                        <td width="17%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P41" value="8">
                            </font></div>
                        </td>
                        <td width="12%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P41" value="6">
                            </font></div>
                        </td>
                        <td width="20%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P41" value="4">
                            </font></div>
                        </td>
                        <td width="16%">
                            <div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
                            <input type="radio" name="P41" value="2">
                            </font></div>
                        </td>


    </table>
    <br />

    <table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">33</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>La gestión y apoyo al desarrollo de las actividades investigativas es:</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficiente </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P42" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P42" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P42" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P42" value="2" />
        </font></div></td>
      </tr>
    </table>
    <br />

    <div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 6. Pertinencia e Impacto Social</u></strong></font><br />
    </p></div>

    <table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">34</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">La Escuela ejerce una <strong>influencia en el entorno:</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy positiva</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Positiva</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente positiva </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco positiva</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P43" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P43" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P43" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P43" value="2" />
        </font></div></td>
      </tr>
    </table>
    <br />
    <div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 7. Autoevaluación y Autorregulación</u></strong></font><br />
      </p>
    </div>
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">35</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">Son<strong> participativos y permanentes </strong>en  la Escuela los procesos de<strong> Autoevaluaci&oacute;n  y autorregulaci&oacute;n</strong></font><font size="2" face="Arial, Helvetica, sans-serif">.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P44" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P44" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P44" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P44" value="2" />
        </font></div></td>
      </tr>
    </table>
    <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">36</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>sistemas de informaci&oacute;n</strong> para sustentar la autoevaluaci&oacute;n, la planeaci&oacute;n y la toma de decisiones</font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. Son  eficientes.</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P45" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P45" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P45" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P45" value="2" />
        </font></div></td>
      </tr>
      <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>b. Son  efectivos.</strong></font></p></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P46" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P46" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P46" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P46" value="2" />
        </font></div></td>
      </tr>
    </table>
    <br>
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">37</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>aplicaci&oacute;n de los criterios de evaluaci&oacute;n</strong>&nbsp; de profesores, personal administrativo y  directivas <strong>tiene un impacto sobre la  calidad:</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy alto</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Alto</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente alto </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Bajo</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P47" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P47" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P47" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
            <input type="radio" name="P47" value="2" />
        </font></div></td>
      </tr>
    </table>
    <br />
    <div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 8. Bienestar Institucional</u></strong></font><br />
    </p></div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">38</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2"><strong>a. </strong>La <strong>Escuela</strong> mantiene un <strong>clima institucional</strong>:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuado</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuada </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuado</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P48" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P48" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P48" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P48" value="2" />
        </font></div></td>
      </tr>
      <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. La<strong> unidad</strong> a la cual pertenece  mantiene <strong>un clima institucional</strong>:</font></p></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P49" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P49" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P49" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P49" value="2" />
        </font></div></td>
      </tr>
</table>
    <br />
    <table width="98%" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">39</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los procedimientos de orientaci&oacute;n (inducci&oacute;n) para quienes ingresan por  primera vez a la Instituci&oacute;n&nbsp; (estudiantes,  profesores y personal administrativo), son:</font></div></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font><strong><font size="2" face="Arial, Helvetica, sans-serif">s</font></strong></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuados</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdos</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P50" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P50" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P50" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P50" value="2" />
        </font></div></td>
      </tr>
    </table>
    <br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">40</font></div></td>
        <td rowspan="2" width="30%"><p>&nbsp;</p>
          <p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>unidad</strong> encargada de planificar y ejecutar los programas y actividades del bienestar  institucional es:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy efectiva</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Efectiva</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente efectiva </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco efectiva</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P51" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P51" value="6" />
        </font></div></td>
        <td width="19%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P51" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P51" value="2" />
        </font></div></td>
      </tr>
</table>
  <br />
    <table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">41</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">Las <strong>actividades orientadas a la prevenci&oacute;n de  desastres y atenci&oacute;n de emergencias, </strong>son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuada</strong></font>s</div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuadas</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuadas </strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuadas</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P52" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P52" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P52" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P52" value="2" />
        </font></div></td>
      </tr>
</table>
    <br />
    <br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">42</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>programas</strong> y <strong>servicios de bienestar</strong> de la Escuela:</font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">a. Son &nbsp;de <strong>alta calidad</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P53" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P53" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P53" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P53" value="2" />
        </font></div></td>
      </tr>
      <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Tienen <strong>alto impacto</strong>.</font></p></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P54" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P54" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P54" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P54" value="2" />
        </font></div></td>
      </tr>
</table>
    <br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">43</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">La <strong>infraestructura, equipos y materiales&nbsp; </strong>para el desarrollo de los <strong>programas de bienestar institucional</strong> son:</font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">a. <strong>Adecuados.</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P55" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P55" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P55" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P55" value="2" />
        </font></div></td>
      </tr>
      <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Suficientes</strong></font></p></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P56" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P56" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P56" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
          <input type="radio" name="P56" value="2" />
        </font></div></td>
      </tr>
</table>
<div align="left">
      <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 9. Organización, Gestión y Administración</u></strong></font><br />
      </p></div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">44</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los  procesos de <strong>toma de decisiones</strong> en la  Escuela son:</font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">a.<strong>Transparentes.</strong></font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P57" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P57" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P57" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P57" value="2" />
        </font></div></td>
      </tr>
      <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b.<strong>Equitativos</strong></font></p></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P58" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P58" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P58" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P58" value="2" />
        </font></div></td>
      </tr>
</table>
    <br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">45</font></div></td>
        <td rowspan="2" width="30%"><div align="left"></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>sistemas de comunicaci&oacute;n e informaci&oacute;n</strong> (Web, bolet&iacute;n, notiweb, correo, etc.) de la Escuela son:</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficiente/s</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficiente/s</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficiente/s
</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficiente/s</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P59" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P59" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P59" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P59" value="2" />
        </font></div></td>
      </tr>
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">46</font></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2"><strong>El personal  administrativo </strong>de  la instituci&oacute;n es:</font></p></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P60" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P60" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P60" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P60" value="2" />
        </font></div></td>
      </tr>
</table>
    <br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">47</font></div></td>
        <td rowspan="2" width="30%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>directivos</strong> de la  instituci&oacute;n muestran:</font></div>
          <p><font face="Arial, Helvetica, sans-serif" size="2">a. Una buena capacidad de <strong>liderazgo</strong>.</font></p></td>
        <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
        <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
        <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
        <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P61" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P61" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P61" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P61" value="2" />
        </font></div></td>
      </tr>
      <tr>
        <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Integridad </strong>en el desarrollo de sus funciones</font><font size="2" face="Arial, Helvetica, sans-serif">.</font></p></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P62" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P62" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P62" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P62" value="2" />
        </font></div></td>
      </tr>
      <td rowspan="2" width="5%"><div align="center"></div></td>
        <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. <strong>Idoneidad</strong> en  el desarrollo de sus funciones</font><font size="2" face="Arial, Helvetica, sans-serif">.</font></p></td>
      </tr>
      <tr>
        <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P63" value="8" />
        </font></div></td>
        <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P63" value="6" />
        </font></div></td>
        <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P63" value="4" />
        </font></div></td>
        <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
        <input type="radio" name="P63" value="2" />
        </font></div></td>
      </tr>
</table>
    <br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">48</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Las actuaciones de los <strong>directivos  en relaci&oacute;n con </strong>la <strong>Misi&oacute;n y el  Proyecto Institucional </strong>son:</font></p></td>
    <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy
coherentes</strong></font></div></td>
    <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Coherentes</strong></font></div></td>
    <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente Coherentes</strong></font></div></td>
    <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco coherentes</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P64" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P64" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P64" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P64" value="2" />
    </font></div></td>
  </tr>
</table>
<div align="left">
  <p><font face="Arial, Helvetica, sans-serif" size="2"><strong><u>Factor 10. Recursos de Apoyo Académico y Planta Física</u></strong></font><br />
</p></div>
<table width="98%" border="1" cellspacing="0" cellpadding="0">
   <tr>
     <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">49</font></div></td>
     <td rowspan="2" width="30%"><div align="left"></div>
     <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>recursos bibliogr&aacute;ficos</strong> en las diferentes  &aacute;reas del conocimiento son:</font></p></td>
     <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy adecuado</strong></font>s</div></td>
     <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Adecuados</strong></font></div></td>
     <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente adecuados </strong></font></div></td>
     <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco adecuados</strong></font></div></td>
   </tr>
   <tr>
     <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
       <input type="radio" name="P65" value="8" />
     </font></div></td>
     <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
       <input type="radio" name="P65" value="6" />
     </font></div></td>
     <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
       <input type="radio" name="P65" value="4" />
     </font></div></td>
     <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
       <input type="radio" name="P65" value="2" />
     </font></div></td>
   </tr>
   <tr>
     <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">50</font></div></td>
     <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">El servicio de <strong>correo electr&oacute;nico</strong> y el acceso  a <strong>internet</strong> son:</font></p></td>
   </tr>
   <tr>
     <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
       <input type="radio" name="P66" value="8" />
     </font></div></td>
     <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
       <input type="radio" name="P66" value="6" />
     </font></div></td>
     <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
       <input type="radio" name="P66" value="4" />
     </font></div></td>
     <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
       <input type="radio" name="P66" value="2" />
     </font></div></td>
   </tr>
   <tr>
     <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">51</font></div></td>
     <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>equipos audiovisuales e inform&aacute;ticos</strong> son:</font></p></td>
   </tr>
   <tr>
     <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
       <input type="radio" name="P67" value="8" />
     </font></div></td>
     <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
       <input type="radio" name="P67" value="6" />
     </font></div></td>
     <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
       <input type="radio" name="P67" value="4" />
     </font></div></td>
     <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
       <input type="radio" name="P67" value="2" />
     </font></div></td>
   </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">52</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>recursos bibliogr&aacute;ficos</strong> en diferentes  &aacute;reas del conocimiento est&aacute;n:</font></p></td>
    <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmentea actualizados</strong></font></div></td>
    <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Actualizados</strong></font></div></td>
    <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente actualizados </strong></font></div></td>
    <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco actualizados</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P68" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P68" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P68" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P68" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">53</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los<strong> laboratorio y talleres</strong> est&aacute;n:</font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P69" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P69" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P69" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P69" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">54</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>servicios de c&oacute;mputo</strong> est&aacute;n:</font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P70" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P70" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P70" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P70" value="2" />
    </font></div></td>
  </tr>
  <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">55</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Las  <strong>tecnolog&iacute;as de informaci&oacute;n y  comunicaci&oacute;n</strong> para la interacci&oacute;n entre profesores y estudiantes est&aacute;n:</font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P71" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P71" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P71" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P71" value="2" />
    </font></div></td>
  </tr>
  <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">56</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>equipos audiovisuales e inform&aacute;ticos </strong>est&aacute;n:</font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P72" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P72" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P72" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P72" value="2" />
    </font></div></td>
  </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">57</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>recursos bibliogr&aacute;ficos</strong> en diferentes  &aacute;reas del conocimiento:</font></p></td>
    <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy Suficientes</strong></font></div></td>
    <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Suficientes</strong></font></div></td>
    <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente suficientes </strong></font></div></td>
    <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco suficientes</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P73" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P73" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P73" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P73" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">58</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios</strong> prestados por la <strong>biblioteca</strong> son:</font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P74" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P74" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P74" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P74" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">59</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">La <strong>dotaci&oacute;n</strong> de los <strong>laboratorios y talleres </strong>es:</font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P75" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P75" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P75" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P75" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">60</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>equipos audiovisuales e inform&aacute;ticos</strong> son:</font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P76" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P76" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P76" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P76" value="2" />
    </font></div></td>
  </tr>

</table>
<br />


<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">61</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los <strong>servicios</strong> prestados por la <strong>biblioteca</strong> son de alta calidad.</font></p></td>
    <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
    <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
    <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
    <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P77" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P77" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P77" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P77" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">62</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>servicios</strong> prestados para el uso de  los <strong>equipos audiovisuales e inform&aacute;ticos</strong> son de alta calidad.</font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P78" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P78" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P78" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P78" value="2" />
    </font></div></td>
  </tr>

</table>
<br />

<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">63</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2"> Los<strong> laboratorios y talleres </strong>tienen un<strong> buen mantenimiento</strong></font></p></td>
    <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
    <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
    <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
    <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P79" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P79" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P79" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P79" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">64</font></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">Los  <strong>servicios de c&oacute;mputo </strong>tienen un<strong> buen mantenimiento</strong></font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P80" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P80" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P80" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P80" value="2" />
    </font></div></td>
  </tr>
</table>
<br />

<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">65</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2"> Los<strong> servicios </strong>de <strong>equipos audiovisuales e inform&aacute;ticos</strong> son:</font></p></td>
    <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy oportunos</strong></font></div></td>
    <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Oportunos</strong></font></div></td>
    <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente oportunos</strong></font></div></td>
    <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco oportunos</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P81" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P81" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P81" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P81" value="2" />
    </font></div></td>
  </tr>

</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">66</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2"> Los<strong> servicios </strong>de <strong>c&oacute;mputo </strong>est&aacute;n:</font></p></td>
    <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente disponibles</strong></font></div></td>
    <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Disponibles</strong></font></div></td>
    <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente disponibles</strong></font></div></td>
    <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco disponibles</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P82" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P82" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P82" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P82" value="2" />
    </font></div></td>
  </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">67</font></div></td>
    <td rowspan="2" width="30%"><div align="left"></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2">Los sistemas de <strong>consulta  bibliogr&aacute;fica</strong> son: </font></p></td>
    <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Muy eficientes</strong></font></div></td>
    <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Eficientes</strong></font></div></td>
    <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente eficientes </strong></font></div></td>
    <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Poco eficientes</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P83" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P83" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P83" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P83" value="2" />
    </font></div></td>
  </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">68</font></div></td>
    <td rowspan="2" width="30%"><div align="left"><font size="2" face="Arial, Helvetica, sans-serif">La <strong>planta f&iacute;sica</strong> de la Escuela :</font></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2"> a. Es de <strong>calidad</strong>.</font></p></td>
    <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
    <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
    <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
    <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P84" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P84" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P84" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P84" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. Est&aacute;<strong> bien distribuida.</strong></font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P85" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P85" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P85" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P85" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. Es<strong> funcional.</strong></font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P86" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P86" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P86" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P86" value="2" />
    </font></div></td>
  </tr>
</table>
<br />
<table width="98%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td rowspan="2" width="5%"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif">69</font></div></td>
    <td rowspan="2" width="30%"><div align="left"><font size="2" face="Arial, Helvetica, sans-serif">La <strong>planta f&iacute;sica</strong> de la Escuela tiene buena:</font></div>
      <p><font face="Arial, Helvetica, sans-serif" size="2"> a. <strong>Accesibilidad</strong>.</font></p></td>
    <td height="23" width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Totalmente de acuerdo</strong></font></div></td>
    <td height="23" width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>De acuerdo</strong></font></div></td>
    <td height="23" width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>Parcialmente de acuerdo</strong></font></div></td>
    <td height="23" width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2"><strong>En desacuerdo</strong></font></div></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P87" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P87" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P87" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P87" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">b. <strong>Capacidad </strong>para el desarrollo de las actividades universitarias.</font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P88" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P88" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P88" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P88" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">c. <strong>Iluminaci&oacute;n.</strong></font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P89" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P89" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P89" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P89" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">d. <strong>Ventilaci&oacute;n.</strong></font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P90" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P90" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P90" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P90" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">e. <strong>Condiciones  de seguridad.</strong></font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P91" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P91" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P91" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P91" value="2" />
    </font></div></td>
  </tr>
  <tr>
    <td rowspan="2" width="5%"><div align="center"></div></td>
    <td rowspan="2" width="30%"><p><font face="Arial, Helvetica, sans-serif" size="2">f. <strong>Condiciones  de higiene.</strong></font></p></td>
  </tr>
  <tr>
    <td width="17%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P92" value="8" />
    </font></div></td>
    <td width="12%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P92" value="6" />
    </font></div></td>
    <td width="20%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P92" value="4" />
    </font></div></td>
    <td width="16%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="2">
      <input type="radio" name="P92" value="2" />
    </font></div></td>
  </tr>
</table>
<p>&nbsp;</p>
<center><input type="submit" name="Submit" value="Enviar Datos"></center>
</form>
<%}%>
</body>
    </html>
