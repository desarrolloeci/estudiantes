<%-- 
    Document   : EncuestaPos
    Created on : 6/10/2011, 10:49:18 AM
    Author     : lrodriguez
--%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Encuesta Graduados Posgrados</title>
    </head>
    <body>
<form name="form1"  method="post"  action="Graduados">
              <table border="0" cellpadding="0" cellspacing="2" width="50%" align="center" class="textocom">
     <tr  bgcolor="#F3F3F3">
      <td  bgcolor="#F3F3F3" width="50%" height="38">
<div align="right">

          <p><strong><font size="2">Documento Identidad&nbsp; <br>
            (Sin puntos, ni comas, ni guiones):</font></strong>
        </div></td>
      <td  bgcolor="#F3F3F3" width="50%" height="38"><strong>
<input type="text" name="cedula" size="15" class="campotext"></strong></td>
    </tr>
       </table>
       <p>&nbsp;</p>
<div align="center">
    <input type="submit" name="Submit" value="Enviar Datos">
</div>
</form>
    </body>


</html>
