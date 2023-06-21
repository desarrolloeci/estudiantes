<%@page contentType="text/html"%>
<html>
<head><title>Autenticación para Inscripción</title></head>
<body bgcolor="#FFFFFF" text="#000000">
  <table width="98%" border="0">
    <tr> 
      <td width="19%" height="69"><img src="../img/logo.gif" width="83" height="90"></td>
      <td width="2%" height="69">&nbsp;</td>
      <td width="79%" height="69"> 
        <div align="center">
          <p><b><font size="4" color="#CC0000">ESCUELA COLOMBIANA DE INGENIER&Iacute;A<br>
            &quot;JULIO GARAVITO&quot;</font></b></p>
          <p><b>SOLICITUD DE ADMISI&Oacute;N A LOS PROGRAMAS ACAD&Eacute;MICOS DE PREGRADO</b><br> 
          </p>
        </div>
      </td>
    </tr>
  </table>

<p>Para realizar la inscripción a alguno de los programas académicos de la Escuela Colombiana de
  Ingeniería, por favor registre el Número de referencia de pago de su inscripción y su Documento de Identidad
  registrado para realizar dicho pago</p>
<form method="POST" action="../servlet/nuevos.loginAsp">
  <table border="1" cellpadding="0" cellspacing="0" width="100%">
    <tr bgcolor="#F3F3F3">
      <td  bgcolor="#F3F3F3" width="50%"><div align="right"><p><strong>No.&nbsp;<BR> Referencia&nbsp; </strong></td>
      <td  bgcolor="#F3F3F3" width="50%"><strong><input type="text" name="ref" size="10"></strong></td>
    </tr>
    <tr  bgcolor="#F3F3F3">
      <td  bgcolor="#F3F3F3" width="50%"><div align="right"><p><strong>Documento Identidad&nbsp; <br>(Sin puntos, ni comas ni guiones)&nbsp; </strong></td>
      <td  bgcolor="#F3F3F3" width="50%"><strong><input type="text" name="doc" size="15"></strong></td>
    </tr>
  </table>
  <div align="center"><center><p><input type="submit" value="Enviar" name="B1"></p>
  </center></div>
</form>

</body>
</html>
