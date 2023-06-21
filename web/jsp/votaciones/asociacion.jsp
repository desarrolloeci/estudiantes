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
<table border="0" cellspacing="0" cellpadding="0" width="725">
    <tr>
      <td height="30" valign="top" width="725&quot;"><font face="Impact" size="3">asociaci&oacute;n 
        Estudiantes Administraci&oacute;n&nbsp;&nbsp; <img src="img/gris.jpg" width="350" height="3"> 
        </font></td>
    </tr>
    <tr>
      <td height="23" width="725">Seleccione un sólo candidato haciendo click en el círculo del cuadro
      rojo correspondiente al candidato deseado y presionando al final el botón de enviar voto.<p>&nbsp;</td>
    </tr>
    <tr>
      <td height="120" width="725">
        <table border="1" width="752">
          <tr>
            <td width="241"> 
              <table border="0" width="241">
                <tr>
                  <td width="106" rowspan="2"><img src="img/CatalinaDiaz.jpg" width="93" height="120"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
                  <td width="56" rowspan="2">
                    <p><font size="1"><strong>CATALINA DIAZ </strong></font></p>
                    <font size="1"><strong><p><a href="propuesta1.htm" onClick="window.open(this.href, this.target); return false;"> VER PROPUESTA</a>
                    </strong></font></td>
                  <td width="65"><img src="img/tarjet2.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
            </tr>
            <tr>
                  <td width="65"> 
                    <table border="1" width="28%" bgcolor="#FF0000">
                      <tr>
                  <td width="100%">
<p><input type="radio" name="R1" value="1"></td>
                </tr>
              </table>
              </td>
            </tr>
          </table>
          </td>
            <td width="229" align="center"> 
              <table border="0" width="229" height="90">
                <tr>
                  <td width="106" height="112"><img src="img/carolinaacosta.jpg" width="110" height="125"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
                  <td width="49" height="112"><font size="1"><strong>
                    <p>CAROLINA ACOSTA</p>
                    <p>
                    <a href="propuesta2.htm" onClick="window.open(this.href, this.target); return false;">VER 
                    PROPUESTA</a></strong></font></td>
                  <td width="60" height="112">
                    <div align="center"><img src="img/nro2.jpg" width="51" height="57"
                    alt="wpe1A3.jpg (1136 bytes)"> </div>
                    <table border="1" width="21%" bgcolor="#FF0000">
                      <tr> 
                        <td width="100%"> 
                          <p align="center"> 
                            <input type="radio" name="R1" value="2">
                        </td>
                      </tr>
                    </table>
              </td>
            </tr>
          </table>
          </td>
            <td width="287" align="center"> 
              <table border="0" width="218">
                <tr>
                  <td width="106" rowspan="2"><img src="img/JuanPabloB.jpg" width="101" height="118"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
                  <td width="59" rowspan="2"><font size="1"><strong>JUAN PABLO 
                    BARAHONA 
                    <p>&nbsp; 
                    </strong></font> </td>
                  <td width="51"><img src="img/nro3.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
            </tr>
            <tr>
                  <td width="51"> 
                    <table border="1" width="21%" bgcolor="#FF0000">
                      <tr>
                  <td width="100%">
<p><input type="radio" name="R1" value="3"></td>
                </tr>
              </table>
              </td>
            </tr>
          </table>
          </td>
        </tr>
<! - -  cierra Tabla  primera fila de candidatos - ->
      </table>
      </td>
    </tr>
    <tr align="center">
      <td height="134" valign="top" width="725"> 
        <div align="left"></div>
        <table border="1" width="751">
          <tr> 
            <td width="242"> 
              <! - -  Tabla  interna  para el candidato No.4 - ->
              <table border="0" width="237">
                <tr> 
                  <td width="159" rowspan="2"> 
                    <p><img src="img/blanco.jpg"
              width="120" height="60" alt="wpe10C.jpg (1201 bytes)"> 
                  </td>
                  <td width="68" align="center"><img src="img/nro4.jpg" width="51" height="57"
              alt="wpe1A3.jpg (1136 bytes)"></td>
                </tr>
                <tr align="center"> 
                  <td width="68"> 
                    <table border="1" width="24%" bgcolor="#FF0000">
                      <tr> 
                        <td width="100%"> 
                          <p> 
                            <input type="radio" name="R1" value="4">
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
              <div align="left"></div>
            </td>
            <td align="center"> 
              <! - -  Tabla  interna  para el candidato No.5 - ->
              <div align="left"> </div>
              <! - -  Tabla  interna  para el candidato No.6 - ->
              <div align="left"> </div>
            </td>
          </tr>
          <! - -  cierra Tabla  segunda fila de candidatos - ->
          <input type="hidden" name="R1" value="R1">
          <input type="hidden" name="nomcrp" value="vprg2">
          <input type="hidden" name="codcrp" value="9">
          <input type="hidden" name="carnet" value="<%= carnet %>">
        </table>
      </td>
    </tr>
    <tr align="center">
      <td height="65" valign="top" width="756"><div align="center"><center><p><blink><b>Una vez
      seleccionado el candidato presione el botón&nbsp; ==========&gt;&nbsp; </blink></b><input
      type="submit" value="Enviar  voto" name="B1">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
      </center></div><p>&nbsp;</td>
    </tr>
    <tr align="center">
      <td height="66" valign="top" width="756"><div align="center"><center><p><font
      color="#CCCCCC" size="2"><a href="../../index.htm" target="_top"><font color="#999999">Escuela
      Colombiana de Ingeniería</font></a><br>
      Avenida 13 No 205-59 Autopista Norte. Km 13 <br>
      Bogotá, D.C. - Colombia. Sur América<br>
      Webmaster: <a href="mailto:webmaster@escuelaing.edu.co"><font color="#999999">Home Page
      Escuela Colombiana de Ingeniería</font></a></font> </td>
    </tr>
    <tr align="center">
      <td height="22" valign="top" width="91"><div align="center"></div></td>
    </tr>
<! - -  cierra Tabla  externa - ->
  </table>
</form>
</body>
</html>
<%
    } else {
%>
<% response.sendRedirect("http://estudiantes.escuelaing.edu.co/estudiantes/login?msg=4") ;	
    } 
%>
