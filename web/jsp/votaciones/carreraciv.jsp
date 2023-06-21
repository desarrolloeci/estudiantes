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
  <! - - Tabla externa - ->
  <table border="0" cellspacing="0" cellpadding="0" width="700">
    <tr> 
      <td height="24" valign="top" width="700"><font face="Impact" size="5">Comité 
        de Carrera<img src="img/gris.jpg" width="320" height="3"> </font> 
        <p>&nbsp;
      </td>
    </tr>
    <tr> 
      <td height="23" width="700">Seleccione un sólo candidato haciendo click 
        en el círculo del cuadro rojo correspondiente al candidato deseado y presionando 
        al final el botón de enviar voto.</td>
    </tr>
    <tr> 
      <td height="23" width="700"> 
        <p>&nbsp; 
          <! - - Tabla que contiene los tres primeros candidatos- ->
        </p>
        <table border="1" align="left" width="600">
          <tr> 
            <td width="301" align="center"> 
              <table border="0" width="300">
                <tr> 
                  <td width="100" rowspan="2"><img src="img/Ibarra1.jpg" width="100" height="110"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
                  <td width="80" rowspan="2">&nbsp; 
                    <p><font size="1"><strong>NICOLAS IBARRA GRANADOS</strong></font></p>
                    <p>&nbsp; 
                  </td>
                  <td width="62"><img src="img/tarjet2.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
                </tr>
                <tr> 
                  <td width="62"> 
                    <div align="center"> 
                      <center>
                        <table border="1" cellspacing="4" width="48%"
              bgcolor="#FF0000">
                          <tr> 
                            <td width="100%"> 
                              <input type="radio" name="R1" value="1">
                            </td>
                          </tr>
                        </table>
                      </center>
                    </div>
                  </td>
                </tr>
              </table>
            </td>
            <td align="center" width="283"> 
              <table border="0" width="100%">
                <tr> 
                  <td width="203" rowspan="2"><img src="img/blanco.jpg" width="146" height="95"
              alt="wpe133.jpg (3748 bytes)" align="right"> 
                    <p>&nbsp; 
                  </td>
                  <td width="70"><img src="img/nro2.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"
              align="right"></td>
                </tr>
                <tr> 
                  <td width="70"> 
                    <div align="center"> 
                      <center>
                        <table border="1" cellspacing="4" width="48%"
              bgcolor="#FF0000">
                          <tr> 
                            <td width="100%"> 
                              <input type="radio" name="R1" value="2">
                            </td>
                          </tr>
                        </table>
                      </center>
                    </div>
                  </td>
                </tr>
                <input type="hidden" name="R1" value="R1">
                <input type="hidden" name="nomcrp" value="vprg1">
                <input  type="hidden" name="codcrp" value="13">
                <input type="hidden" name="carnet" value="<%= carnet %>">
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr align="center"> 
      <td height="24" valign="top" width="700">&nbsp;</td>
    </tr>
    <tr align="center"> 
      <td height="24" valign="top" width="700"> 
        <div align="center">
          <center>
            <p><strong><blink>Una vez seleccionado el candidato presione el botón&nbsp; 
              =========&gt;</blink></strong> 
              <input
      type="submit" value="Enviar  voto" name="B1">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
          </center>
        </div>
        <p>&nbsp;
      </td>
    </tr>
   
    <tr align="center"> 
      <td height="12" valign="top" width="700"> 
        <div align="center"></div>
      </td>
    </tr>
    <! - -  Cierra Tabla externa- ->
  </table>
</form>
</body>
</html>
<%
    } else {
%>
<% response.sendRedirect("http://localhost:8181/estudiantes/login?msg=4") ; 	
    } 
%>
