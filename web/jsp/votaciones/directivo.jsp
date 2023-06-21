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
<table border="0" cellspacing="0" cellpadding="0" width="650">
    <tr>
      <td height="24" valign="top" width="650"><font face="Impact" size="5">Consejo
      directivo&nbsp;&nbsp; <img src="img/gris.jpg" width="320" height="3"> </font><p>&nbsp;</td>
    </tr>
    <tr>
      <td height="23" width="650">Seleccione un sólo candidato haciendo click en el círculo
      del cuadro rojo correspondiente al candidato deseado y presionando al final el botón de
      enviar voto.</td>
    </tr>
    <tr>
      <td height="23" width="725">
        <div align="left">&nbsp; 
          <! - - Tabla que contiene los tres primeros candidatos- ->
        </div>
        <table border="1" align="left" width="500">
          <tr> 
            <td width="724" align="center">
              <table border="0" width="98%" height="150">
                <tr> 
                  <td width="116" rowspan="2"><img src="img/Sarmiento1.jpg" width="110" height="115"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
                  <td width="59" rowspan="2">
<p><font size="1"><strong>EDGAR MAURICIO SARMIENTO RIVEROS </strong></font></p>
                   <!-- <p><font size="1"><strong><a href="propuestacmm.htm" onClick="window.open(this.href, this.target); return false;">VER 
                      PROPUESTA</a></strong></font></p> -->
                    </td>
                  <td width="47" height="59"><img src="img/tarjet2.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
                </tr>
                <tr> 
                  <td width="47" height="78"> 
                    <div align="center">
                      <center>
                        <table border="1" cellspacing="4" width="48%" bgcolor="#FF0000">
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
            <td width="362" align="center">
              <table border="0" width="242" height="150">
                <tr> 
                  <td width="100" rowspan="2"><img src="img/Chaustre1.jpg" width="100" height="115"
              alt="wpe133.jpg (3748 bytes)" align="right"></td>
                  <td width="80" rowspan="2">
<p><font size="1"><strong>FELIX GUSTAVO DEL RIO CHAUSTRE </strong></font></p>
                    <!--<p><font size="1"><strong><A HREF="propuestacv.htm" onClick="window.open(this.href, this.target); return false;">VER 
                      PROPUESTA</A></strong></font></p> -->
                    </td>
                  <td width="62" height="62"><img src="img/nro2.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"></td>
                </tr>
                <tr> 
                  <td width="62" height="77"> 
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
              </table>
            </td>
            <td width="363" align="center"> 
              <table border="0" height="138">
                <tr> 
                  <td width="152" rowspan="2"><img src="img/blanco.jpg" width="146" height="95"
              alt="wpe133.jpg (3748 bytes)" align="right"> 
                    <p>&nbsp; 
                  </td>
                  <td width="58" height="60"><img src="img/nro3.jpg" width="51" height="57" alt="wpe1A3.jpg (1136 bytes)"
              align="right"></td>
                </tr>
                <tr> 
                  <td width="58" height="56"> 
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
                      </center>
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <input type="hidden" name="R1" value="R1">
         <input type="hidden" name="nomcrp" value="vcd">
         <input type="hidden" name="codcrp" value="11">
         <input type="hidden" name="carnet"  value="<%= carnet %>">


      </td>
    </tr>
    <tr align="center">
      <td height="12" valign="top" width="725">&nbsp; <! - -  Tabla segunda fila de candidatos- -> </td>
    </tr>
    <tr align="center">
      <td height="24" valign="top" width="725"></td>
    </tr>
    <tr align="center">
      <td height="24" valign="top" width="725"><div align="center"><center><p><strong><blink>Una
      vez seleccionado el candidato presione el botón&nbsp; =========&gt;</blink></strong> <input
      type="submit" value="Enviar  voto" name="B1">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
      </center></div><p>&nbsp;</td>
    </tr>
   
    <tr align="center">
      <td height="12" valign="top" width="91"><div align="center"></div></td>
    </tr>
<! - -  Cierra Tabla externa- ->
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
