<%
    String ref, nsol;
    HttpSession sesion;
    sesion = request.getSession(false);

    nsol = (String)sesion.getAttribute("nsol") ;
%>

<html>
<head>
<title>Informaci�n de Inscripci�n del Aspirante</title>
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
<p align="center"><big><strong>Estimado Aspirante: Muchas Gracias. La informaci�n de Inscripci�n ya se encuentra registrada en nuestro sistema.</strong></big></p>
<p align="center">El n�mero de su inscripci�n es: <big> <%=nsol%></big>. </p>
<p>Recuerde que debe presentarse en la fecha indicada en el momento de la inscripci�n, con la documentaci�n requerida: <br>
Fotocopia legible del documento de identidad (C�dula de ciudadan�a, Tarjeta de Identidad, Registro Civil o pasaporte)
<br>Un informe de los resultados del Examen de Estado expedido por el ICFES. 

<br><br>Para completar su inscripci�n y para efectos de la liquidaci�n de la matr�cula se requiere anexar seg�n sea su caso:

<br>Fotocopia de una factura reciente de servicios p�blicos de su lugar de residencia (agua, energ�a, tel�fono o gas domiciliario).
<br>Copia del �ltimo recibo de pago de pensi�n o certificaci�n expedida por la instituci�n donde 
termin� sus estudios de bachillerato, en la que se especifique el valor mensual cancelado durante el �ltimo a�o.
<br>Copia aut�ntica de la Declaraci�n de Renta � Certificado de Ingresos y Retenciones del a�o 
gravable 2002, de los miembros del grupo familiar del aspirante seg�n sea su caso.

<br><br>Si los padres y/� la persona que pagar� sus estudios no devengan salario como empleados, y los ingresos recibidos por actividades independientes no ascienden al monto necesario para presentar declaraci�n de renta, se debe presentar un Certificado de No Declarante y una Certificaci�n de los ingresos recibidos durante el a�o 2002, certificada por un Contador P�blico, anexando fotocopia de la certificaci�n de la matr�cula profesional expedida por la Junta Central de Contadores.
<br>Si alguno de los padres no recibi� ning�n ingreso durante el a�o 2002, deber� presentar una certificaci�n que acredite esta situaci�n.
<br>Si el aspirante prefiere no presentar los documentos que acrediten el ingreso familiar, puede hacerlo, aceptando conjuntamente con el acudiente el pago de matr�cula m�xima. En ning�n caso se aceptar�n posteriormente los documentos correspondientes para la liquidaci�n de los valores de matr�cula.

<br><br>En caso que alguno de los padres haya fallecido, se debe adjuntar copia autenticada del certificado de defunci�n correspondiente.

<br><br>Si la sociedad conyugal de los padres no est� vigente, se debe adjuntar copia autenticada del documento legal que lo acredite realizado ante la autoridad competente.
</p>
 
</body>
</html>
<%
    sesion = request.getSession(false) ;
    sesion.invalidate() ;
%>
