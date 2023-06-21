<%-- 
    Document   : Graduados
    Created on : 6/10/2011, 09:59:48 AM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Encuesta Graduados Posgrados</title>
    </head>
    <body>
        <jsp:include page="encabezado">
            <jsp:param name="parametro" value="" />
            <jsp:param name="titulo" value="Encuesta Autoevaluación Graduados EGPs" />
        </jsp:include>
        <table border="0" cellpadding="0" cellspacing="2" width="50%" align="center" class="textocom">
     <tr  bgcolor="#F3F3F3">
      <td  bgcolor="#F3F3F3" width="50%" height="38">
<div align="right">

          <p><strong><font size="2">Documento Identidad&nbsp; <br>
            (Sin puntos, ni comas, ni guiones):</font></strong>
        </div></td>
      <td  bgcolor="#F3F3F3" width="50%" height="38"><strong>
<input type="text" name="doc" size="15" class="campotext"></strong></td>
    </tr>
       </table>
    </body>
     

</html>
