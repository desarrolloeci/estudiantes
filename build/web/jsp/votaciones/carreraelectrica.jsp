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
  <table border="0" cellspacing="0" cellpadding="0" width="666">
    <tr>
      <td height="24" valign="top" width="666"><font face="Impact" size="3">Comité 
        carrera&nbsp;&nbsp; <img src="img/gris.jpg" width="380" height="3"> </font>
<p>&nbsp;</td>
    </tr>
    <tr>
      <td height="23" width="666">Seleccione un sólo candidato haciendo click 
        en el círculo del cuadro rojo correspondiente al candidato deseado y presionando 
        al final el botón de enviar voto.</td>
    </tr>
    <tr>
      <td height="23" width="666">&nbsp; 
        <table border="1" width="658">
          <tr>
            <td width="342"> 
              <table border="0" width="256">
                <tr>
                  <td width="106" rowspan="2"><img src="img/diaz1.jpg" width="108"
              height="112" alt="wpe133.jpg (3748 bytes)" align="right"></td>
                  <td width="93" rowspan="2">&nbsp; 
                    <p><font size="1"><strong>JIMENA DIAZ DURAN </strong></font></p>
              <p>&nbsp;</td>
                  <td width="29"><img src="img/tarjet2.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
            </tr>
            <tr>
                  <td width="29"> 
                    <div align="center"><center><table border="1" cellspacing="4" width="48%"
              bgcolor="#FF0000">
                <tr>
                  <td width="100%"><input type="radio" name="R1" value="1"></td>
                </tr>
              </table>
              </center></div></td>
            </tr>
          </table>
          </td>
            <td width="300">&nbsp; 
              <table border="0" width="256">
                <tr>
                  <td width="175" rowspan="2"><img src="img/blanco.jpg" width="149" height="80"
              alt="wpe133.jpg (3748 bytes)" align="absbottom"> 
                    <p>&nbsp;</td>
                  <td width="57"><img src="img/nro2.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
            </tr>
            <tr>
                  <td width="57" height="49"> 
                    <div align="center"><center><table border="1" cellspacing="4" width="48%"
              bgcolor="#FF0000">
                <tr>
                  <td width="100%"><input type="radio" name="R1" value="2"></td>
                </tr>
              </table>
              </center></div></td>
            </tr>
          </table>
          </td>
        </tr>
  <input type="hidden" name="R1" value="R1">
<input type="hidden" name="nomcrp" value="vprg1">
<input type="hidden" name="codcrp" value="15">
<input type="hidden" name="carnet" value="<%= carnet %>">

      </table>
      </td>
    </tr>
    <tr align="center">
      <td height="24" valign="top" width="666"></td>
    </tr>
    <tr align="center">
      <td height="24" valign="top" width="666">
<div align="center"><center><p><b><blink>Una vez
      seleccionado el candidato presione el botón&nbsp; ==========&gt;&nbsp; </blink></b><input
      type="submit" value="Enviar  voto" name="B1">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
      </center></div><p>&nbsp;</td>
    </tr>
  
    <tr align="center">
      <td height="12" valign="top" width="666">
<div align="center"></div></td>
    </tr>
  </table>
</form>
</body>
</html>
<%
    } else {
%>
<% response.sendRedirect("../estudiantes/jsp/login?msg=4") ;	
    } 
%>
