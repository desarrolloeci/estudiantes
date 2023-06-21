<%-- 
    Document   : InscripIcfes
    Created on : 27/07/2010, 09:18:55 AM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


<html>
    <head>
    <body id="public">
        <table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
            <tr>
                <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
            </tr>
            <tr>
                <td>
                    <jsp:include page="encabezado" flush="true">
                        <jsp:param name="anterior" value="menuServEstud" />
                </jsp:include></td>
            </tr>
        </table>
        <form method="POST" action="ConfirmaDatos">
            <table border="0" align="center" cellpadding="0" cellspacing="2" width="50%" class="textocom">
                <tr bgcolor="#F3F3F3">
                    <td  bgcolor="#F3F3F3" width="50%" height="31">
                        <h5 align="right"><strong><font face="Arial, Helvetica, sans-serif"><br>
                        Documento de Identidad</font></strong> </h5>
                    </td>
                    <td bgcolor="#F3F3F3" width="50%" height="31"><strong>
                            <input type="text" name="doc" size="10" class="campotext">
                    </strong></td>
                </tr>
                <tr  bgcolor="#F3F3F3">
                    <td  bgcolor="#F3F3F3" width="50%" height="39">
                        <h5 align="right"><strong><font face="Arial, Helvetica, sans-serif">Número&nbsp;
                        de celular&nbsp;</font> </strong> </h5>
                    </td>
                    <td  bgcolor="#F3F3F3" width="50%" height="39"><strong>
                            <input type="text" name="celular" size="15" class="campotext">
                    </strong></td>
                </tr>

            </table>
            <div align="center"><center><p><input type="submit" value="Enviar" name="B1" class="boton"></p>
            </center></div>
        </form>

    </body>
</html>