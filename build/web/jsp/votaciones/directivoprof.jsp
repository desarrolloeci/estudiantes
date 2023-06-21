<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%  
    HttpSession sesion = request.getSession();
    String cedula = request.getParameter("cedula");
    Vector lista;
    if (cedula != null && !cedula.equals("")) {
	
%>
<html>
<head>
<title>Votación</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.textocom {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #666666;
	font-weight: bold;
}
-->
</style>
</head>
<body bgcolor="#FFFFFF">
<form method="post"
action="guardavotosprof">
<!-- Tabla externa -->
<table border="0" cellspacing="0" cellpadding="0" width="725" align="center">
    <tr>
      <td height="30" valign="top" width="725&quot;"><font face="Impact" size="3">Consejo
      Directivo&nbsp;&nbsp; <img src="img/rojo.gif" width="350" height="5"> </font></td>
    </tr>
    <tr>
      <td height="23" width="725"><span class="textocom">Seleccione un sólo candidato haciendo click en el círculo del <font color="#990000">cuadro
      rojo</font> correspondiente al candidato deseado y presionando al final el botón
      de enviar voto.</span>          <p>&nbsp;</td>
    </tr>
    <tr>
      <td height="120" width="725">
        <table border="1" width="752">
          <tr>
            <td width="241"> 
              <table border="0" width="241">
                <tr>
                  <td width="106" rowspan="2"><img src="img/Bateman.jpg" width="110" height="125"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
                  <td width="56" rowspan="2"><font size="1"><strong>JORGE BATEMAN WEBBER
                    <p><a href="html/propuesta1.htm" onClick="window.open(this.href, this.target); return false;"> VER PROPUESTA</a>
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
                  <td width="106" height="112"><img src="img/salazar.jpg" width="110" height="125"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
                  <td width="49" height="112"><font size="1"><strong>
<p>PATRICIA SALAZAR PERDOMO</p>
                    <p>
                    <a href="html/propuestaps.doc" onClick="window.open(this.href, this.target); return false;">VER 
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
                  <td width="106" rowspan="2"><img src="img/Otero.jpg" width="110" height="125"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
                  <td width="43" rowspan="2"><font size="1"><strong>RICARDO OTERO 
                    AREVALO 
                    <p>
                    <a href="html/propuesta3.htm" onClick="window.open(this.href, this.target); return false;">VER 
                    PROPUESTA</a></strong></font> </td>
                  <td width="55"><img src="img/nro3.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
            </tr>
            <tr>
                  <td width="55"> 
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
              <div align="left"> 
                <table border="0" width="232">
                  <tr> 
                    <td width="106" rowspan="2"><img src="img/Acosta.jpg" width="110" height="125"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
                    <td width="57" rowspan="2">
                      <p><font size="1"><strong>JUAN ANTONIO ACOSTA</strong></font></p>
                      <p><font size="1"><strong><a href="html/propuesta4.htm" onClick="window.open(this.href, this.target); return false;">VER 
                        PROPUESTA</a></strong></font> </p>
                    </td>
                    <td width="55"><img src="img/nro4.jpg" width="44" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
                  </tr>
                  <tr> 
                    <td width="55"> 
                      <table border="1" width="19%" bgcolor="#FF0000">
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
              </div>
            </td>
            <td width="234" align="center"> 
              <! - -  Tabla  interna  para el candidato No.5 - ->
              <div align="left"> 
                <table border="0" width="225">
                  <tr> 
                    <td width="116"><img src="img/Lievano.jpg" width="110" height="125"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
                    <td width="49"><font size="1">&nbsp;</font> 
                      <p><font size="1"><strong>BERNARDO LIEVANO LEON</strong></font></p>
                      <p> 
                      <p><font size="1"><strong><a href="html/propuesta5.htm" onClick="window.open(this.href, this.target); return false;">VER 
                        PROPUESTA</a></strong></font> 
                    </td>
                    <td width="46"> 
                      <div align="right"> 
                        <p align="left"><img src="img/nro5.jpg" width="44" height="57"
              alt="wpe1A3.jpg (1136 bytes)"></p>
                      </div>
                      <table border="1" width="19%" bgcolor="#FF0000">
                        <tr> 
                          <td width="100%"> 
                            <p> 
                              <input type="radio" name="R1" value="5">
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </div>
            </td>
            <td width="253" align="center"> 
              <! - -  Tabla  interna  para el candidato No.6 - ->
              <div align="left"> 
                <table border="0" width="241">
                  <tr> 
                    <td width="159" rowspan="2"> 
                      <p><img src="img/blanco.jpg"
              width="120" height="60" alt="wpe10C.jpg (1201 bytes)"> 
                    </td>
                    <td width="72" align="center"><img src="img/nro6.jpg" width="51" height="57"
              alt="wpe1A3.jpg (1136 bytes)"></td>
                  </tr>
                  <tr align="center"> 
                    <td width="72"> 
                      <table border="1" width="24%" bgcolor="#FF0000">
                        <tr> 
                          <td width="100%"> 
                            <p> 
                              <input type="radio" name="R1" value="6">
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
          <! - -  cierra Tabla  segunda fila de candidatos - ->
          <input type="hidden" name="R1" value="R1">
          <input type="hidden" name="nomcrp" value="vcd">
          <input type="hidden" name="codcrp" value="19">
          <input type="hidden" name="cedula" value="<%= cedula %>">
        </table>
      </td>
    </tr>
<tr align="center">
      <td height="65" valign="top" width="756"><div align="center"><center><p><blink><span class="textocom"><font color="#990000"><b>Una
                    vez seleccionado el candidato presione el botón&nbsp; ==========&gt;&nbsp;</b></font></span><b> </b></blink>
              <input
      type="submit" value="Enviar  voto" name="B1">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
      </center></div><p>&nbsp;</td>
    </tr>
    <tr align="center">
      <td height="66" valign="top" width="756"><p><font
      color="#CCCCCC" size="2"><a href="../../index.htm" target="_top"><font color="#999999" size="1" face="Verdana, Arial, Helvetica, sans-serif">Escuela
      Colombiana de Ingeniería</font></a><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><br>
      Avenida 13 No 205-59 Autopista Norte. Km 13 <br>
      Bogotá, D.C. - Colombia. Sur América<br>
      Webmaster: <a href="mailto:webmaster@escuelaing.edu.co"><font color="#999999">Home
      Page Escuela Colombiana de Ingeniería</font></a></font></font><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> </font></td>
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
<% response.sendRedirect("http://intraeci.escuelaing.edu.co/intraeci/jsp/inicio.jsp ") ;
	
    } 
%>