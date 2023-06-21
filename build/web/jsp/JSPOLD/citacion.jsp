<%
    String ref, nsol;
    HttpSession sesion;
    sesion = request.getSession(false);

    nsol = (String)sesion.getAttribute("nsol") ;
%>

<html>
<head>
<title>Información de Inscripción del Aspirante</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!--<link REL="stylesheet" TYPE="text/css" HREF="StyleSheet1.css">
<script language="JavaScript" src="DatGenPost_Valid.js" type="text/javascript"></script>-->
</head>

<body>
  <table width="98%" border="0">
    <tr> 
      <td width="19%" height="69"><img src="../img/logo.gif" width="83" height="90"></td>
      <td width="2%" height="69">&nbsp;</td>
      <td width="79%" height="69"> 
        <div align="center">
          <p><b><font size="4" color="#CC0000">ESCUELA COLOMBIANA DE INGENIER&Iacute;A<br>
            &quot;JULIO GARAVITO&quot;</font></b></p>
          <p><b>SOLICITUD DE INSCRIPCI&Oacute;N A LOS PROGRAMAS ACAD&Eacute;MICOS DE PREGRADO</b><br> 
          </p>
        </div>
      </td>
    </tr>
  </table>
<br>
<p align="center"><big><strong>Estimado Aspirante: Muchas Gracias. La información de Inscripción ya se encuentra registrada en nuestro sistema.</strong></big></p>
<p align="center">El número de su inscripción es: <big> <%=nsol%></big>. </p>
<p>Recuerde que debe presentarse en la fecha indicada en el momento de la inscripción, con la documentación requerida: <br>
Fotocopia legible del documento de identidad (Cédula de ciudadanía, Tarjeta de Identidad, Registro Civil o pasaporte)
<br>Un informe de los resultados del Examen de Estado expedido por el ICFES. 

<br><br>Para completar su inscripción y para efectos de la liquidación de la matrícula se requiere anexar según sea su caso:

<br>Fotocopia de una factura reciente de servicios públicos de su lugar de residencia (agua, energía, teléfono o gas domiciliario).
<br>Copia del último recibo de pago de pensión o certificación expedida por la institución donde 
terminó sus estudios de bachillerato, en la que se especifique el valor mensual cancelado durante el último año.
<br>Copia auténtica de la Declaración de Renta ó Certificado de Ingresos y Retenciones del año 
gravable 2002, de los miembros del grupo familiar del aspirante según sea su caso.

<br><br>Si los padres y/ó la persona que pagará sus estudios no devengan salario como empleados, y los ingresos recibidos por actividades independientes no ascienden al monto necesario para presentar declaración de renta, se debe presentar un Certificado de No Declarante y una Certificación de los ingresos recibidos durante el año 2002, certificada por un Contador Público, anexando fotocopia de la certificación de la matrícula profesional expedida por la Junta Central de Contadores.
<br>Si alguno de los padres no recibió ningún ingreso durante el año 2002, deberá presentar una certificación que acredite esta situación.
<br>Si el aspirante prefiere no presentar los documentos que acrediten el ingreso familiar, puede hacerlo, aceptando conjuntamente con el acudiente el pago de matrícula máxima. En ningún caso se aceptarán posteriormente los documentos correspondientes para la liquidación de los valores de matrícula.

<br><br>En caso que alguno de los padres haya fallecido, se debe adjuntar copia autenticada del certificado de defunción correspondiente.

<br><br>Si la sociedad conyugal de los padres no está vigente, se debe adjuntar copia autenticada del documento legal que lo acredite realizado ante la autoridad competente.
</p>
 
</body>
</html>
<%
    sesion = request.getSession(false) ;
    sesion.invalidate() ;
%>
