<%@ page import = "javax.servlet.http.HttpSession" %>
<%  
    HttpSession sesion = request.getSession();
    String cedula= (String)session.getAttribute("cedula");

    if (cedula != null && !cedula.equals("")) {
%>
<html>

<head>
<title>Votación</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF">

<form method="post" action="guardavotosprof">
  <table border="0" cellspacing="0" cellpadding="0" width="700">
    <tr>
      <td height="10" valign="top" width="725"><font face="Impact" size="3">Consejo
      académico&nbsp;&nbsp; <img src="img/gris.jpg" width="380" height="3"> </font><p>&nbsp;</td>
    </tr>
    <tr>
      <td height="5" width="725">Seleccione un sólo candidato haciendo click en el circulo del
      cuadro rojo correspondiente al candidato deseado y presionando al final el botón de
      enviar voto.</td>
    </tr>
    <tr>
      <td height="5" width="500">
        <div align="left">&nbsp;</div>
        <table border="1" align="left" width="500">
          <tr>
          <td width="362" align="center"><table border="0" width="242">
            <tr>
              <td width="100" rowspan="2"><img src="img/Melendez.jpg" width="110" height="125"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
              <td width="80" rowspan="2">&nbsp;<p><font size="1"><strong>ALFONSO MELENDEZ ACUÑA.</strong></font></p>
              <p>&nbsp;</td>
              <td width="62"><img src="img/tarjet2.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
            </tr>
            <tr>
              <td width="62"><div align="center"><center><table border="1" cellspacing="4" width="48%"
              bgcolor="#FF0000">
                <tr>
                  <td width="100%"><input type="radio" name="R1" value="1"></td>
                </tr>
              </table>
              </center></div></td>
            </tr>
          </table>
          </td>
          <td width="363" align="center">
              <table border="0" width="242">
                <tr> 
                  <td rowspan="2"><strong><img src="img/blanco.jpg" width="146" height="95"
              alt="wpe133.jpg (3748 bytes)" align="right"></strong></td>
                  <td width="62"><img src="img/nro2.jpg" width="41" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
                </tr>
                <tr> 
                  <td width="62"> 
                    <div align="center"> 
                      <center>
                        <table border="1" cellspacing="4" width="48%"
              bgcolor="#FF0000">
                          <tr> 
                            <td width="100%"> 
                              <input type="radio" name="R1" value="2">
                            </td>
                          </tr>
                          <input type="hidden" name="R1" value="R1">
                          <input  type="hidden" name="codcrp" value="18">
                          <input type="hidden" name="nomcrp" value="vca">
                          <input type="hidden" name="cedula" value="<%= cedula %>">
                        </table>
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
    <tr>
      <td height="24" valign="top" width="725"></td>
    </tr>
    <tr align="center">
      <td height="24" valign="top" width="725"></td>
    </tr>
    <tr align="center">
      <td height="24" valign="top" width="725"><div align="center"><center><p><b><blink>Una vez
      seleccionado el candidato presione el botón&nbsp; =========&gt; </blink></b><input
      type="submit" value="Enviar  voto" name="B1">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
      </center></div><p>&nbsp;</td>
    </tr>
    <tr align="center">
      <td height="24" valign="top" width="725"><div align="center"><center><p><font
      color="#CCCCCC" size="2"><a href="../../index.htm" target="_top"><font color="#999999">Escuela
      Colombiana de Ingeniería</font></a><br>
      Avenida 13 No 205-59 Autopista Norte. Km 13 <br>
      Bogotá, D.C. - Colombia. Sur América<br>
      Webmaster: <a href="mailto:webmaster@escuelaing.edu.co"><font color="#999999">Home Page
      Escuela Colombiana de Ingeniería</font></a></font> </td>
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
<% response.sendRedirect("http://intraeci.escuelaing.edu.co/intraeci/jsp/inicio.jsp ") ;
	
    } 
%>