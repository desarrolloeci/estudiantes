<%
    String ref;
    HttpSession sesion;
    sesion = request.getSession(false);
%>

<html>
<head>
<title>Formulario Inscripción del Aspirante</title>
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
<p align="center"><big><strong>Estimado Aspirante: </strong></big></p>
<p align="center">Sus datos no estan completos. </p>
<p align="center">Por favor intente más tarde. </p>

</body>
</html>
<%
    sesion = request.getSession(false) ;
    sesion.invalidate() ;
%>
