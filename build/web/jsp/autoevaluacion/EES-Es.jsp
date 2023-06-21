<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
        PrintWriter oout = response.getWriter();
        Estudiante est = (Estudiante) session.getAttribute("estClase");
        String programa = request.getParameter("prog");
        String flag =   request.getParameter("flag");
        %>

<SCRIPT LANGUAGE="JavaScript">

    function comprueba( ){
        for(i=1; i<55; i++){
            nombre = new String("P" + i);
            if (i==5 || i==11 || i== 15 || i==16 || i==17 || i==18 || i==19 || i==20 || i== 21 || i== 22 || i== 28 ||i==38 || i==39){
                if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked && !document.forms.form1[nombre][5].checked) {
                alert("Por favor responda todos los campos de la encuesta");
                document.forms.form1[nombre][0].style.backgroundColor= '#ffcc00';
                document.forms.form1[nombre][0].focus();
                return false;
            }
                
            } else if (!document.forms.form1[nombre][0].checked && !document.forms.form1[nombre][1].checked && !document.forms.form1[nombre][2].checked && !document.forms.form1[nombre][3].checked && !document.forms.form1[nombre][4].checked) {
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
<p class="Centro" align="center"><strong>Encuesta Estudiantes-Es</strong></p>

	<form name="form1"  method="post" onSubmit="return comprueba( );" action="Autoevaluacion">
	<input type="hidden" name="total" value="54">
	<input type="hidden" name="idenc" value="142">
        <input type="hidden" name="programa" value="<%=programa%>">
        <input type="hidden" name="flag" value="<%=flag%>">
        
     
  <table width="98%" border="1" cellspacing="0" cellpadding="0">
    <tr> 
      <td rowspan="2" width="2%">1</td>
      <td rowspan="2" width="38%">Su nivel de conocimiento del Proyecto Educativo 
        Institucional (PEI) de la Escuela es:</td>
      <td width="11%" align="center">Muy bueno</td>
      <td width="11%" align="center">Bueno</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Malo</td>
      <td width="12%" align="center" colspan="2">Nulo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P1" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P1" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P1" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P1" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P1" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">2</td>
      <td rowspan="2" width="38%">Su nivel de conocimiento de la Misi&oacute;n 
        de la Escuela es:</td>
      <td width="11%" align="center">Muy bueno</td>
      <td width="11%" align="center">Bueno</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Malo</td>
      <td width="12%" align="center" colspan="2">Nulo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P2" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P2" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P2" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P2" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P2" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">3</td>
      <td rowspan="2" width="38%">Su nivel de conocimiento del Proyecto de Formaci&oacute;n 
        del programa es:</td>
      <td width="11%" align="center">Muy bueno</td>
      <td width="11%" align="center">Bueno</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Malo</td>
      <td width="12%" align="center" colspan="2">Nulo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P3" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P3" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P3" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P3" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P3" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">4</td>
      <td rowspan="2" width="38%">Su nivel de conocimiento del Reglamento Estudiantil 
        es: </td>
      <td width="11%" align="center">Muy bueno</td>
      <td width="11%" align="center">Bueno</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Malo</td>
      <td width="12%" align="center" colspan="2">Nulo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P4" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P4" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P4" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P4" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P4" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">5</td>
      <td rowspan="2" width="38%">El proceso de asignaci&oacute;n de tutores y 
        el apoyo que estos ofrecen a los estudiantes es: (estudiantes)</td>
      <td width="11%" align="center">Muy efectivos</td>
      <td width="11%" align="center">Efectivos</td>
      <td width="11%" align="center">Medianamente efectivos</td>
      <td width="11%" align="center">Poco efectivos</td>
      <td width="6%" align="center">Nada efectivos</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P5" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P5" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P5" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P5" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P5" value="1">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P5" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">6</td>
      <td rowspan="2" width="38%">El Reglamento Estudiantil de la Escuela es: 
      </td>
      <td width="11%" align="center">Muy claro</td>
      <td width="11%" align="center">Claro</td>
      <td width="11%" align="center">Medianamente claro</td>
      <td width="11%" align="center">Poco claro</td>
      <td width="12%" align="center" colspan="2">Nada claro</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P6" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P6" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P6" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P6" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P6" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">7</td>
      <td rowspan="2" width="38%">Los criterios y mecanismos para la evaluaci&oacute;n 
        de los profesores es:</td>
      <td width="11%" align="center">Muy pertinentes</td>
      <td width="11%" align="center">Pertinentes</td>
      <td width="11%" align="center">Medianamente pertinentes</td>
      <td width="11%" align="center">Poco pertinentes</td>
      <td width="12%" align="center" colspan="2">Nada pertinentes</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P7" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P7" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P7" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P7" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P7" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">8</td>
      <td rowspan="2" width="38%"> La calidad del profesorado propio del Programa 
        en relaci&oacute;n con los aspectos acad&eacute;mico profesionales (su 
        conocimiento disciplinar) es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="12%" align="center" colspan="2">Muy mala</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P8" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P8" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P8" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P8" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P8" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">9</td>
      <td rowspan="2" width="38%">La calidad del profesorado propio del Programa 
        en relaci&oacute;n con los aspectos pedag&oacute;gicos es: </td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="12%" align="center" colspan="2">Muy mala</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P9" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P9" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P9" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P9" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P9" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">10</td>
      <td rowspan="2" width="38%"> La calidad del profesorado propio del Programa 
        en relaci&oacute;n con los aspectos investigativos es: </td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="12%" align="center" colspan="2">Muy mala</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P10" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P10" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P10" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P10" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P10" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">11</td>
      <td rowspan="2" width="38%">La calidad del proceso de acompa&ntilde;amiento 
        de los directores del trabajo de grado es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P11" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P11" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P11" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P11" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P11" value="1">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P11" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">12</td>
      <td rowspan="2" width="38%"> Los directivos del programa muestran idoneidad 
        en el desarrollo de sus funciones:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P12" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P12" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P12" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P12" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P12" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">13</td>
      <td rowspan="2" width="38%"> Los directivos del programa muestran eficiencia 
        en el desarrollo de sus funciones:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P13" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P13" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P13" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P13" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P13" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">14</td>
      <td rowspan="2" width="38%">Los directivos del programa muestran liderazgo 
        en la gesti&oacute;n del programa:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P14" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P14" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P14" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P14" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P14" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">15</td>
      <td rowspan="2" width="38%"> La calidad del apoyo administrativo prestado 
        por secretarias que soportan al programa es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P15" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P15" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P15" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P15" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P15" value="1">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P15" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">16</td>
      <td rowspan="2" width="38%"> La calidad del apoyo administrativo prestado 
        por T&eacute;cnicos de los laboratorios relacionados con el programa es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P16" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P16" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P16" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P16" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P16" value="1">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P16" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">17</td>
      <td rowspan="2" width="38%"> La calidad del apoyo administrativo prestado 
        al programa por la oficina de admisiones es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P17" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P17" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P17" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P17" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P17" value="1">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P17" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">18</td>
      <td rowspan="2" width="38%"> La calidad del apoyo administrativo prestado 
        al programa por la oficina de Registro es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P18" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P18" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P18" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P18" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P18" value="1">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P18" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">19</td>
      <td rowspan="2" width="38%">La calidad del apoyo administrativo prestado 
        al programa por la oficina de apoyo financiero es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P19" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P19" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P19" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P19" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P19" value="1">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P19" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">20</td>
      <td rowspan="2" width="38%">La calidad del apoyo administrativo prestado 
        al programa por la Unidad de Gesti&oacute;n Externa es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P20" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P20" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P20" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P20" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P20" value="1">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P20" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">21</td>
      <td rowspan="2" width="38%"> La calidad del apoyo administrativo prestado 
        al programa por Osiris (Oficina de sistemas y recursos inform&aacute;ticos) 
        es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P21" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P21" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P21" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P21" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P21" value="1">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P21" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">22</td>
      <td rowspan="2" width="38%"> La calidad del apoyo administrativo prestado 
        al programa por la Oficina de Audiovisuales es:</td>
      <td width="11%" align="center">Excelente</td>
      <td width="11%" align="center">Buena</td>
      <td width="11%" align="center">Regular</td>
      <td width="11%" align="center">Mala</td>
      <td width="6%" align="center">Muy mala</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P22" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P22" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P22" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P22" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P22" value="1">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P22" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">23</td>
      <td rowspan="2" width="38%">Las pol&iacute;ticas y criterios de evaluaci&oacute;n 
        de los estudiantes se aplican.</td>
      <td width="11%" align="center">Siempre</td>
      <td width="11%" align="center">Casi siempre</td>
      <td width="11%" align="center">Algunas veces</td>
      <td width="11%" align="center">Casi nunca</td>
      <td width="12%" align="center" colspan="2">Nunca</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P23" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P23" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P23" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P23" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P23" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">24</td>
      <td rowspan="2" width="38%">La formaci&oacute;n recibida hasta la fecha 
        ha contribuido al desarrollo o fortalecimiento de las siguiente competencia 
        propia de su profesi&oacute;n: Cognitiva (procesos de pensamiento, manejo 
        de informaci&oacute;n: indagaci&oacute;n, comprensi&oacute;n y an&aacute;lisis, 
        entre otros).</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P24" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P24" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P24" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P24" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P24" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">25</td>
      <td rowspan="2" width="38%"> La formaci&oacute;n recibida hasta la fecha 
        ha contribuido al desarrollo o fortalecimiento de las siguiente competencia 
        propia de su profesi&oacute;n: Comunicativa (interpretar, argumentar, 
        proponer; expresi&oacute;n oral y escrita).</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P25" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P25" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P25" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P25" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P25" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">26</td>
      <td rowspan="2" width="38%"> La formaci&oacute;n recibida hasta la fecha 
        ha contribuido al desarrollo o fortalecimiento de las siguiente competencia 
        propia de su profesi&oacute;n: T&eacute;cnica (aplicaci&oacute;n y utilizaci&oacute;n 
        pr&aacute;ctica de los conocimientos).</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P26" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P26" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P26" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P26" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P26" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">27</td>
      <td rowspan="2" width="38%"> La formaci&oacute;n recibida hasta la fecha 
        ha contribuido al desarrollo o fortalecimiento de las siguiente competencia 
        propia de su profesi&oacute;n: Socioafectiva (capacidad de relacionarse 
        con otros, de trabajar en equipo, de interactuar con otros, ser consecuent</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P27" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P27" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P27" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P27" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P27" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">28</td>
      <td rowspan="2" width="38%">Las relaciones de cooperaci&oacute;n acad&eacute;mica 
        han incidido en el enriquecimiento de la calidad del programa:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="6%" align="center">En total desacuerdo</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P28" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P28" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P28" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P28" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P28" value="1">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P28" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">29</td>
      <td rowspan="2" width="38%">Las l&iacute;neas de investigaci&oacute;n relacionadas 
        con el programa y los proyectos que desarrolla para el pa&iacute;s son 
        pertinentes:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P29" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P29" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P29" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P29" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P29" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">30</td>
      <td rowspan="2" width="38%"> Las l&iacute;neas de investigaci&oacute;n relacionadas 
        con el programa y los proyectos que desarrolla para el pa&iacute;s son 
        innovadores:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P30" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P30" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P30" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P30" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P30" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">31</td>
      <td rowspan="2" width="38%">Las l&iacute;neas de investigaci&oacute;n relacionadas 
        con el programa y los proyectos que desarrolla para el pa&iacute;s han 
        generado impacto positivo:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P31" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P31" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P31" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P31" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P31" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">32</td>
      <td rowspan="2" width="38%">Las funciones y procesos administrativos son 
        eficientes:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P32" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P32" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P32" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P32" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P32" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">33</td>
      <td rowspan="2" width="38%">Las funciones y procesos administrativos son 
        eficaces:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P33" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P33" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P33" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P33" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P33" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">34</td>
      <td rowspan="2" width="38%"> Las funciones y procesos administrativos son 
        claros:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P34" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P34" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P34" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P34" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P34" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">35</td>
      <td rowspan="2" width="38%"> Los sistemas de informaci&oacute;n y de comunicaci&oacute;n 
        con que cuenta el programa para la gesti&oacute;n acad&eacute;mica del 
        Programa y la divulgaci&oacute;n de sus resultados, son pertinentes:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P35" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P35" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P35" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P35" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P35" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">36</td>
      <td rowspan="2" width="38%"> Los sistemas de informaci&oacute;n y de comunicaci&oacute;n 
        con que cuenta el programa para la gesti&oacute;n acad&eacute;mica del 
        Programa y la divulgaci&oacute;n de sus resultados, son actualizados:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P36" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P36" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P36" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P36" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P36" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">37</td>
      <td rowspan="2" width="38%"> Los sistemas de informaci&oacute;n y de comunicaci&oacute;n 
        con que cuenta el programa para la gesti&oacute;n acad&eacute;mica del 
        Programa y la divulgaci&oacute;n de sus resultados, son suficientes:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P37" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P37" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P37" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P37" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P37" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">38</td>
      <td rowspan="2" width="38%"> Los mecanismos para recoger, sistematizar y 
        divulgar informaci&oacute;n requerida para el logro de los prop&oacute;sitos 
        del programa son suficientes: </td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="6%" align="center">En total desacuerdo</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P38" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P38" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P38" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P38" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P38" value="1">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P38" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">39</td>
      <td rowspan="2" width="38%">b. Los mecanismos para recoger, sistematizar 
        y divulgar informaci&oacute;n requerida para el logro de los prop&oacute;sitos 
        del programa son eficaces:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="6%" align="center">En total desacuerdo</td>
      <td width="6%" align="center">No aplica</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P39" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P39" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P39" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P39" value="2">
      </td>
      <td width="6%" align="center"> 
        <input type="radio" name="P39" value="1">
      </td>
      <td width="6%" align="center">
        <input type="radio" name="P39" value="0">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">40</td>
      <td rowspan="2" width="38%">Ha participado en algunas de las siguientes 
        actividades o servicios que ofrece Bienestar Universitario: consulta m&eacute;dica, 
        consulta odontol&oacute;gica, atenci&oacute;n psicol&oacute;gica, actividades 
        deportivas, actividades recreativas, actividades culturales.</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P40" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P40" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P40" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P40" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P40" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">41</td>
      <td rowspan="2" width="38%">a. Los servicios de bienestar universitario 
        tienen amplia divulgaci&oacute;n:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P41" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P41" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P41" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P41" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P41" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">42</td>
      <td rowspan="2" width="38%">b. Los servicios de bienestar universitario 
        son de alta calidad:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P42" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P42" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P42" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P42" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P42" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">43</td>
      <td rowspan="2" width="38%">c. Los servicios de bienestar universitario 
        son efectivos:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P43" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P43" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P43" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P43" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P43" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">44</td>
      <td rowspan="2" width="38%">a. La accesibilidad de los espacios f&iacute;sicos 
        de la Escuela, utilizados para la operaci&oacute;n del Programa, es:</td>
      <td width="11%" align="center">Muy adecuada</td>
      <td width="11%" align="center">Adecuada</td>
      <td width="11%" align="center">Parcialmente adecuada</td>
      <td width="11%" align="center">Poco adecuada</td>
      <td width="12%" align="center" colspan="2">Nada adecuada</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P44" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P44" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P44" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P44" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P44" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">45</td>
      <td rowspan="2" width="38%">b. La capacidad de los espacios f&iacute;sicos 
        de la Escuela, utilizados para la operaci&oacute;n del Programa, es:</td>
      <td width="11%" align="center">Muy adecuada</td>
      <td width="11%" align="center">Adecuada</td>
      <td width="11%" align="center">Parcialmente adecuada</td>
      <td width="11%" align="center">Poco adecuada</td>
      <td width="12%" align="center" colspan="2">Nada adecuada</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P45" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P45" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P45" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P45" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P45" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">46</td>
      <td rowspan="2" width="38%">c. La iluminaci&oacute;n de los espacios f&iacute;sicos 
        de la Escuela, utilizados para la operaci&oacute;n del Programa,es:</td>
      <td width="11%" align="center">Muy adecuada</td>
      <td width="11%" align="center">Adecuada</td>
      <td width="11%" align="center">Parcialmente adecuada</td>
      <td width="11%" align="center">Poco adecuada</td>
      <td width="12%" align="center" colspan="2">Nada adecuada</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P46" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P46" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P46" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P46" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P46" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">47</td>
      <td rowspan="2" width="38%">d. La ventilaci&oacute;n de los espacios f&iacute;sicos 
        de la Escuela, utilizados para la operaci&oacute;n del Programa,es:</td>
      <td width="11%" align="center">Muy adecuada</td>
      <td width="11%" align="center">Adecuada</td>
      <td width="11%" align="center">Parcialmente adecuada</td>
      <td width="11%" align="center">Poco adecuada</td>
      <td width="12%" align="center" colspan="2">Nada adecuada</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P47" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P47" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P47" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P47" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P47" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">48</td>
      <td rowspan="2" width="38%">e. La seguridad e higiene de los espacios f&iacute;sicos 
        de la Escuela, utilizados para la operaci&oacute;n del Programa, es:</td>
      <td width="11%" align="center">Muy adecuada</td>
      <td width="11%" align="center">Adecuada</td>
      <td width="11%" align="center">Parcialmente adecuada</td>
      <td width="11%" align="center">Poco adecuada</td>
      <td width="12%" align="center" colspan="2">Nada adecuada</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P48" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P48" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P48" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P48" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P48" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">49</td>
      <td rowspan="2" width="38%">La capacidad de los laboratorios, talleres y 
        espacios para pr&aacute;ctica (con simuladores, por ejemplo) para atender 
        el n&uacute;mero de estudiantes del programa es suficiente. </td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P49" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P49" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P49" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P49" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P49" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">50</td>
      <td rowspan="2" width="38%">El material bibliogr&aacute;fico disponible 
        en la biblioteca (libros, publicaciones peri&oacute;dicas, suscripciones 
        y bases de datos), es suficiente en relaci&oacute;n con la cantidad de 
        usuarios. </td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P50" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P50" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P50" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P50" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P50" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">51</td>
      <td rowspan="2" width="38%">Los servicios bibliotecarios de pr&eacute;stamo 
        y de consulta bibliogr&aacute;fica para estudiantes y profesores del Programa 
        son de alta calidad.</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P51" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P51" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P51" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P51" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P51" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">52</td>
      <td rowspan="2" width="38%">a. Los recursos inform&aacute;ticos (computadores, 
        software, conexi&oacute;n a redes) para apoyar el desarrollo de las actividades 
        acad&eacute;micas del Programa son adecuados: </td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P52" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P52" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P52" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P52" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P52" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">53</td>
      <td rowspan="2" width="38%">b. Los recursos inform&aacute;ticos (computadores, 
        software, conexi&oacute;n a redes) para apoyar el desarrollo de las actividades 
        acad&eacute;micas del Programa son actualizados:</td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P53" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P53" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P53" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P53" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P53" value="1">
      </td>
    </tr>
    <tr> 
      <td rowspan="2" width="2%">54</td>
      <td rowspan="2" width="38%">Los equipos y materiales de los laboratorios 
        y espacios para pr&aacute;cticas (incluye simuladores virtuales) son adecuados 
        con la naturaleza y las exigencias acad&eacute;micas del Programa. </td>
      <td width="11%" align="center">Totalmente de acuerdo</td>
      <td width="11%" align="center">De acuerdo</td>
      <td width="11%" align="center">Parcialmente de acuerdo</td>
      <td width="11%" align="center">En desacuerdo</td>
      <td width="12%" align="center" colspan="2">En total desacuerdo</td>
    </tr>
    <tr> 
      <td width="11%" align="center"> 
        <input type="radio" name="P54" value="5">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P54" value="4">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P54" value="3">
      </td>
      <td width="11%" align="center"> 
        <input type="radio" name="P54" value="2">
      </td>
      <td width="12%" align="center" colspan="2"> 
        <input type="radio" name="P54" value="1">
      </td>
    </tr>
  </table>

<p>&nbsp;</p>
  <div align="center">
    <input type="submit" name="Submit" value="Enviar Datos">
  </div>
</form>
</body>
</html>

