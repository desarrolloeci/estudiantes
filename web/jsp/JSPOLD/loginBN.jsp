<%@ page import = "javax.servlet.http.HttpSession" %>
<%@ page import = "estudiantes.Estudiante.Estudiante" %>
<%@ page session="false" %>
<%
    response.setHeader("Cache-Control","no-cache"); 

    /* Si la sesion no existe */
    String nMsg = (String)request.getParameter("msg") ;
    String mensaje = new String() ;

    if ( nMsg != null ) {
        if ( nMsg.equals("0") ){
            mensaje = "Faltan alguno de los campos" ;
        }else if ( nMsg.equals("1") ){
            mensaje = "Usuario desconocido" ;
        }else if ( nMsg.equals("2") ){
            mensaje = "El usuario no se ha autenticado correctamente" ;
        }else if ( nMsg.equals("3") ){
            mensaje = "Este no es su D&iacute;a de Registro Acad&eacute;mico" ;
            int drg = Integer.parseInt((String)request.getParameter("drg")) ;
            if (drg == 1){
                mensaje = mensaje + "<br><b>Su d&iacute;a es el <i>" +
                    "<font color='#FF0000'> XXX </font></i></b>" 
;
            }else if (drg == 2){
                mensaje = mensaje + "<br><b>Su d&iacute;a es el <i>" +
                    "<font color='#FF0000'>MARTES 17 DE ENERO</font></i> </b>" ;
            }else if (drg == 3){
                mensaje = mensaje + "<br><b>Su d&iacute;a es el <i>" +
                    "<font color='#FF0000'>MIERCOLES 18 DE ENERO</font></i> </b>" ;
            }else if (drg == 4){
                mensaje = mensaje + "<br><b>Su d&iacute;a es el <i>" +
                    "<font color='#FF0000'>JUEVES 19 DE ENERO</font></i> </b>" ;
            }else if (drg == 5){
                mensaje = mensaje + "<br><b>Su d&iacute;a es el <i>" +
                    "<font color='#FF0000'>JUEVES 19 DE ENERO, EN HORAS DE LA TARDE</font></i> </b>" ;
            }else
            {
                mensaje = mensaje + "<br><b>Verifique su situacion academica <i>" +
                    "<font color='#FF0000'></font></i> </b>" ;
            }
        }else if ( nMsg.equals("4") ){
            mensaje = "Sesion Cerrada" ;
        }else if ( nMsg.equals("5") ){
            mensaje = "Error del Servidor" ;
        }else if ( nMsg.equals("6") ){
            mensaje = "No ha iniciado Sesion" ;
        }else if ( nMsg.equals("7") ){
            mensaje = "<font color='#FF0000'>Ya existia una Sesion!</font> <i>Vuelva a autenticarse</i>" ;
        }
    }
%>
<html>
<head>
<title>Servicios Acad&eacute;micos - Escuela Colombiana de Ingenier&iacute;a &quot;Julio Garavito&quot;</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
 <p align="center"><img src="../img/Escudo.gif" width="125" height="126"></p>
 <P align="center"><FONT face=Arial size=2><b><%=mensaje%></b></FONT> 
 <FORM action="../servlet/LoginEst" id=FORM1 method=post name=FORM1>
  <div align="center"></div>
  <table align=center 
		border=0 bordercolor=white cellpadding=0 cellspacing=2 
		width=274 height=109 style="HEIGHT: 109px; WIDTH: 209px">
    <tr> 
      <td align=left colspan="2" height="18" bgcolor="#336699"> 
        <div align="center"><strong><em><font face="Verdana, Arial, Helvetica, sans-serif" color="#FFFFFF">
          Servicios Acad&eacute;micos</font></em></strong> 
        </div>
      </td>
    </tr>
    <tr> 
      <td align=left height="33" width="50%" > 
        <div align="left"><strong><em><font face="Arial" size="2">Carnet</font><font face="Arial" size="3"> 
          </font></em></strong></div>
      </td>
      <td align=left height="33" width="50%"> 
        <div align="center"> 
          <input name=carnet maxlength=10 style="HEIGHT: 22px; WIDTH: 110px">
        </div>
      </td>
    </tr>
    <tr> 
      <td align=left height="33" width="50%"> 
        <div align="left"><strong><em><font face="Arial" size="2">Contrase&ntilde;a</font></em></strong></div>
      </td>
      <td align=left height="33" width="50%"> 
        <div align="center"> 
          <input name=passwd type=password maxlength=15 style="HEIGHT: 22px; WIDTH: 110px">
        </div>
      </td>
    </tr>
    <tr> 
      <td align=left height="39" width="50%"> 
        <div align="center"> 
          <input id=submit1 name=Aceptar style="HEIGHT: 27px; LEFT: 200px; TOP: 99px; WIDTH: 110px" type=submit value=Aceptar title=Aceptar tabindex="Yes">
        </div>
      </td>
      <td align=left height="39" width="50%"> 
        <div align="center"> 
          <input id=submit1 name=Limpiar style="HEIGHT: 27px; LEFT: 200px; TOP: 99px; WIDTH: 110px" type=reset value=Limpiar title=Limpiar>
        </div>
      </td>
    </tr>
  </table>
  <p></P>
 </FORM>
 <div align="center"><img src="../img/puntoAz.gif" width="580" height="2"></div>
  <p align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Avenida 
    13 No 205-59 - Kilómetro 13 Autopista Norte <br>
    Santafé de Bogotá - Colombia - Sur América <br>
    Contact Center: +57(1)6762666 / 57(1)6763888. Fax: 57(1)6762340 <br>
    <a href="mailto:webmaster@escuelaing.edu.co">Webmaster</a></font> 
  </p>
</body>
</html>
