<%
    String ref;
    HttpSession sesion;
    sesion = request.getSession(false);

    ref = (String)sesion.getAttribute("ref") ;
%>

<html>
<head>
<title>Informaci�n de Pago de Inscripci�n del Aspirante</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!--<link REL="stylesheet" TYPE="text/css" HREF="StyleSheet1.css"><script language="JavaScript" src="DatGenPost_Valid.js" type="text/javascript"></script>-->

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
<p align="center"><big><strong>Estimado Aspirante: Muchas Gracias.  Su informaci�n ya se ha procesado en nuestro sistema.</strong></big></p>
<p align="center">Usted debe realizar el pago de los derechos de Inscripci�n ($ 62.000.oo en efectivo) en cualquier oficina del Banco de Occidente. </p>
<p align="center">El n�mero de referencia para realizar dicho pago es: <big> <%=ref%></big> y el n�mero de la cuenta corriente es <big> 255 03548 7</big>  </big>. </p>
<p align="center">Este es un ejemplo de como debe diligenciar el formulario de Pago Nacional de Cuotas del Banco de Occidente </big>.

<img src="../img/consig.jpg" width="700" height="450">  </p>
<p align="center">Al siguiente d�a h�bil de realizado el pago, usted podr� realizar la inscripci�n al programa Acad�mico deseado, para lo cual
el sistema le solicitar� este n�mero de referencia: <big> <%=ref%>  </big>.</p>
</body>
</html>
<%
    sesion = request.getSession(false) ;
    sesion.invalidate() ;
%>
