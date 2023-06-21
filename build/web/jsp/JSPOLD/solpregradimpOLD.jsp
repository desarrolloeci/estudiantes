<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudMisc" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
response.setHeader("Cache-Control","no-cache");
String nombre = new String((String)session.getAttribute("nombre"));
String igrad =  new String((String)session.getAttribute("igrad"));
String iddpto =  new String((String)session.getAttribute("iddpto"));
String ceremonia =  new String((String)session.getAttribute("ceremonia"));
String impr = request.getParameter("imprimir");
PrintWriter oout = response.getWriter() ;
Estudiante est = (Estudiante) session.getAttribute("estClase") ;
int estado, i;
estado = Integer.parseInt(est.getEstado());
if(!igrad.equals("C")){
    if(estado>0)
        response.sendRedirect("menuServEstud");
    else
        response.sendRedirect("menuServEstud1");
}else{
    Vector solicitud = est.getSolPreGrad(carnet);
    Vector despinfopar = new Vector();
    Vector infoEst = est.getDatosEst(carnet);
    Vector datosestud = (Vector)infoEst.elementAt(0) ;
    Vector datospar = est.getParProg(iddpto);
    String sel = "";
    String sel1 = "";
    Vector infoPar = est.getParTramGrad("4");
    for(i=0 ; i < infoPar.size() ; i++)
        despinfopar.addElement((String)((Vector)infoPar.elementAt(i)).elementAt(0));
%>
<html>
    <head>
        <title>Servicios Academicos - Ceremonia</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <style type="text/css">
            <!--
.boton{
        font-size:10px;
        font-family:Verdana,Helvetica;
        font-weight:bold;
        color:white;
		background-image:url(img/blue-background.gif);
        height:25px;
		border-color: 666699;
		border-width: 2;
       }
.texto1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-style: normal;
	line-height: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	text-decoration: none;
<%  if(impr != null){%>
        color: #333333;
<%  }else{%>
	color: #666666;
<%  }%>
}
a{color: blue;}
a:hover{color:#3366CC; }
            -->
        </style>
<script language="javascript">
        <!--
        function enviar() { 
            document.form1.target = "ventanaImp";
            document.form1.action = "ImprimirSolPreGrad?imprimir=imp";
            window.open("", "ventanaImp", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
            document.form1.submit();
            return false;
        }

        function imprim(){
<%  if(impr != null){%>
            window.focus();
            window.print();
            window.close();
<%  }%>  
        }
    -->
    </script>
    </head>
    <body bgcolor="#FFFFFF" text="#000000" onload="imprim()">
        <div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
        <table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
            <tr>     
                <td width="640" valign="top"> 
                <%if(impr == null){%>
      <jsp:include page="encabezado" flush="true"/>
      <%}%>
                <table width="100%" border="0" align="center" class="texto1">
                        <tr> 
                            <td valign="top">
                                <div align="left">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="texto1">
                                        <tr>
                                            <td width="15%" height="134"><img src="img/logo.gif" width="83" height="90"></td>
                                            <td width="65%"><div align="left"><strong>ESCUELA COLOMBIANA
                                                        DE INGENIER&Iacute;A &quot;JULIO GARAVITO&quot;<br>
                                                    SOLICITUD PRELIMINAR DE GRADO</strong><br>
                                                CEREMONIA: <strong><%=ceremonia%></strong> </div>
                                            </td>
                                            <td width="20%"><table width="100%" height="135" border="1" cellpadding="1" cellspacing="0">
                                                    <tr>
                                                        <td><div align="center">FOTO</div></td>
                                                    </tr>
                                            </table></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><p>PREGRADO EN: <strong><%=datosestud.elementAt(1)%></strong></p>
                                                <p>PROMOCI&Oacute;N O PER&Iacute;ODO ACAD&Eacute;MICO:<strong> <%=despinfopar.elementAt(5)%></strong></p>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="texto1">
                                                    <tr>
                                                        <td width="50%">NOMBRE COMPLETO GRADUANDO: </td>
                                                        <td width="30%">&nbsp;</td>
                                                        <td width="20%">C&Oacute;DIGO No.</td>
                                                    </tr>
                                                    <tr>
                                                      <td colspan="2"><strong><%=solicitud.elementAt(2)%> <%=solicitud.elementAt(3)%> <%=solicitud.elementAt(1)%>
                                                      </strong> </td>
                                                        <td><strong><%=carnet%></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3"><font color="#333333"><em>Nombres
                                                                    y Apellidos
                                                            (COMPLETOS igual
                                                            al de la c&eacute;dula,
                                                                    May&uacute;sculas y min&uacute;sculas y tildes). As&iacute; aparecer&aacute; en
                                                        su diploma<strong> </strong></em></font></td>
                                                    </tr>
                                                </table>                    
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="texto1">
                                                    <tr>
                                                        <td colspan="3"><hr></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Documento de Identidad:</td>
                                                        <td width="65%">&nbsp;</td>
                                                    </tr><tr>
                                                        <td colspan="2"><strong><%=solicitud.elementAt(7)%> <%=solicitud.elementAt(6)%></strong></td>
                                                        <td>Expedida en: <strong><%=solicitud.elementAt(17)%></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4"><font color="#333333"><em>Como
                                                            aparece en su Documento
                                                            de identidad y lugar
                                                        de expedici&oacute;n</em></font><em> </em></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="22%">Libreta
                                                          militar No:</td>
                                                        <td width="13%">DM:</td>
                                                        <td>Fecha de expedici&oacute;n: </td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong><%=solicitud.elementAt(8)%></strong></td>
                                                        <td><strong><%=solicitud.elementAt(9)%></strong></td>
                                                        <td>                                                               
                                                          <strong><%=solicitud.elementAt(10)%></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4"><hr></td>
                                                    </tr>
                                                </table>                    
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="texto1">
                                                    <tr>
                                                        <td colspan="2">Residencia:</td>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="9%">Direcci&oacute;n:&nbsp;&nbsp;</td>
                                                        <td width="30%"><strong><%=solicitud.elementAt(12)%></strong></td>
                                                        <td width="7%">Ciudad:&nbsp;&nbsp; 
                                                        </td>
                                                      <td width="54%"><strong><%=solicitud.elementAt(16)%></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        Tel&eacute;fono:&nbsp;&nbsp;                        </td>
                                                      <td><strong><%=solicitud.elementAt(13)%></strong></td>
                                                        <td>Celular:&nbsp;&nbsp;</td>
                                                        <td><strong><%=solicitud.elementAt(4)%></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>email:</td>
                                                        <td><strong><%=solicitud.elementAt(5)%></strong></td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>                    <p>NOTA: Si no puede asistir
                                                    a la ceremonia de entrega de diplomas, debe dar poder mediante
                                                    documento escrito, a un familiar o a su acudiente para
                                                    recibir el diploma. Esta comunicaci&oacute;n debe dirigirla
                                                    al Secretario General y entregarla en la Oficina de Coordinaci&oacute;n
                                                de Grados bloque A tercer piso.</p>
                                                <p>
                                                    NOTA: PARA PRESENTAR SU SOLICITUD DE GRADO DEBE CUMPLIR
                                                    CON LOS REQUISITOS EXIGIDOS EN LOS ART&Iacute;CULOS 105
                                                Y 106 DEL REGLAMENTO ESTUDIANTIL</p>
                                                <p>Declaro que conozco el procedimiento de grado y las fechas
                                                    establecidas y acepto que el incumplimiento de ellos conlleva
                                                    mi exclusi&oacute;n de la Ceremonia de Grados Colectiva
                                                    prevista para esta promoci&oacute;n. As&iacute; mismo,
                                                    acepto en su<br>
                                                    totalidad las calificaciones, que hasta la fecha est&aacute;n
                                                consignadas en mi registro acad&eacute;mico.</p>
                                                <p>&nbsp;</p>
                                                <p>____________________________________________<br>
                                                Firma</p>
                                                <p><br>
  Fecha actualizaci&oacute;n
                                                  datos: <%=solicitud.elementAt(15)%><p>
                                                <p align="center">
                                                  <%if(impr == null){%>
                <form name="form1" method="post" action="">
                    <div align="center">
                        <input name="imprimir" type="submit" id="imprimir" value="Imprimir" class="boton" onclick="javascript: return enviar();">
                    </div>
            </form>
            <%}%>
                                                  <br>
                                            </p>
                                          </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    <tr> 
                        <td valign="top" height="12"> 
                            <%if(impr == null){%>
            <table width="45%" border="0" align="right">
              <tr> 
                  <td width="27%" height="12"> 
                    <div align="center"> 
                      <font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="TramiteGrado">ANTERIOR</a> </font></b></font> 
                    </div>
                  </td>
                  <td width="4%" height="12" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="12"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">INICIO</a></font></b></font></div>
                  </td>
                  <td width="4%" height="12" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="43%" height="12"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
              </tr>
            </table>
          <%}%>
                        </td>
                        
                    </tr>
                </table>
            </tr>
            <%if(impr == null){%>
    <tr>
      <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
  <%}%>
        </table>
    </body>
</html>
<% }%>