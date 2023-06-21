<%@ page import = "javax.servlet.http.HttpSession" %>
<%  
HttpSession sesion = request.getSession();
String carnet = (String)session.getAttribute("carnet");

if (carnet != null && !carnet.equals("")) {
%>
<html>
    <head>
        <title>Votación</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    </head>
    
    <body bgcolor="#FFFFFF">
        
        <form method="post" action="guardavotos">
            <table border="0" cellspacing="0" cellpadding="0" width="700">
                <tr>
                    <td height="10" valign="top" width="725"><font face="Impact" size="3">Consejo
                    Académico&nbsp;&nbsp; <img src="img/gris.jpg" width="380" height="3"> </font><p>&nbsp;</td>
                </tr>
                <tr>
                    <td height="5" width="725">Seleccione un sólo candidato haciendo click en el circulo del
                        cuadro rojo correspondiente al candidato deseado y presionando al final el botón de
                    enviar voto.</td>
                </tr>
                <tr>
                    <td height="5" width="500">&nbsp; <table border="1" align="center" width="500">
                            <tr>
                                <td width="724" align="center"><table border="0" width="100%">
                                        <tr>
                                            <td width="100" rowspan="2"><img src="img/Montoya1.jpg" width="110" height="125"
                                                                             alt="wpe133.jpg (3748 bytes)" align="right"></td>
                                            <td width="80" rowspan="2">
                                                <p><font size="1"><strong>CARLOS EDUARDO MONTOYA SANCHEZ </strong></font> 
                                                </p>
                                                <!--  <p><font size="1"><strong><A HREF="propuestajls.htm" onClick="window.open(this.href, this.target); return false;">VER PROPUESTA</a></strong></font></p>
                    <p>&nbsp;-->
                                            </td>
                                            <td width="62" height="68"><img src="img/tarjet2.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
                                        </tr>
                                        <tr>
                                            <td width="62">
                                                <div align="center">
                                                    <center>
                                                        <table border="1" cellspacing="4" width="48%"
                                                               bgcolor="#FF0000">
                                                            <tr>
                                                                <td width="100%"><input type="radio" name="R1" value="1"></td>
                                                            </tr>
                                                        </table>
                                                    </center>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="362" align="center">
                                    <table border="0" width="244">
                                        <tr>
                                            <td width="116" rowspan="2"><img src="img/Neira1.jpg" width="110" height="125"
                                                                             alt="wpe133.jpg (3748 bytes)" align="right"></td>
                                            <td width="59" rowspan="2"> <font size="1"><strong>PAULA ANDREA 
                                            NEIRA </strong></font><strong><font size="1">SABOYA</font></strong></td>
                                            <td width="55" height="75"><img src="img/nro2.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
                                        </tr>
                                        <tr>
                                            <td width="55">
                                                <div align="center"><center>
                                                        <table border="1" cellspacing="4" width="48%"
                                                               bgcolor="#FF0000" align="center">
                                                            <tr>
                                                                <td width="100%"><input type="radio" name="R1" value="2"></td>
                                                            </tr>
                                                        </table>
                                                    </center>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="363" align="center">
                                    <table border="0" width="100%" height="134">
                                        <tr> 
                                            <td width="66%" rowspan="2"><img src="img/blanco.jpg" width="146" height="89"
                                                                                 alt="wpe133.jpg (3748 bytes)" align="right"> 
                                                <p>&nbsp;
                                            </td>
                                            <td width="34%" height="76"><img src="img/nro3.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"
                                                                             align="right"></td>
                                        </tr>
                                        <tr> 
                                            <td width="62" height="51"> 
                                                <div align="center">
                                                    <center>
                                                        <table border="1" cellspacing="4" width="48%" 
                                                               bgcolor="#FF0000">
                                                            <tr> 
                                                                <td width="100%">
                                                                    <input type="radio" name="R1" value="3">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <input type="hidden" name="R1" value="R1">
                                                        <input type="hidden" name="nomcrp" value="vca">
                                                        <input  type="hidden" name="codcrp" value="10">
                                                        <input type="hidden" name="carnet"  value="<%= carnet %>">
                                                        
                                                        
                                                    </center>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr align="center">
                    <td height="24" valign="top" width="725">
                        
                    </td>
                </tr>
                <tr align="center">
                    <td height="24" valign="top" width="725"></td>
                </tr>
                <tr align="center">
                    <td height="24" valign="top" width="725"><div align="center"><center>
                                <p><b><blink>Una vez
                                    seleccionado el candidato presione el bot&oacute;n&nbsp; =========&gt; </blink></b>
                                    <input
                                        type="submit" value="Enviar  voto" name="B1">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
                    </center></div><p>&nbsp;</td>
                </tr>
                
                <tr align="center">
                    <td height="12" valign="top" width="91"><div align="center"></div></td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%
} else {
%>

<% response.sendRedirect("../estudiantes/login?msg=4") ;

} 
%>
