<%@ include file="../secure.jsp" %>
<%@ page import="java.text.*, java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
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
    Vector infoEst = est.getDatosEst(carnet);
    Vector datosestud = (Vector)infoEst.elementAt(0) ;
        Vector despinfopar = new Vector();
        Vector infoPar = est.getParTramGrad("4");
        Vector despinfopar2 = est.getParTramGrad("6");
        for(i=0 ; i < infoPar.size() ; i++)
            despinfopar.addElement((String)((Vector)infoPar.elementAt(i)).elementAt(0));
%>
<html>
<head>
<title>Servicios Academicos - Grado Colectivo</title>
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
            document.form1.action = "SolicitudAprobGrado?imprimir=imp";
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
<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>     
    <td width="640" valign="top"> 
      <%if(impr == null){%>
      <jsp:include page="encabezado" flush="true"/>
      <%}%>
      <table width="100%" border="0" align="center" class="texto1">

        <tr> 
          <td valign="top">
                  <div align="center">            
                    <p>Bogot&aacute;, D. C. </p>
                  </div>              
                  <p>&nbsp;</p>
                  <p>Se&ntilde;ores<br>
                    <strong>CONSEJO DIRECTIVO<br>
                    ESCUELA COLOMBIANA DE INGENIER&Iacute;A<br>
                  JULIO GARAVITO</strong><br>
                  Bogot&aacute;, D. C.</p>
                  <p><br>
                  Estimados se&ntilde;ores:<br>              
                  </p>                  
                  <p>Muy comedidamente me permito presentar a su consideraci&oacute;n
                    la solicitud de aprobaci&oacute;n de mi grado de <strong><%=datosestud.elementAt(1)%></strong> , teniendo en cuenta que he terminado
                    satisfactoriamente el plan de estudios correspondiente y
                  he cumplido con los requisitos legales y reglamentarios exigidos.</p>              
                  <p>Manifiesto que me encuentro a paz y salvo por todo concepto
                    con la Instituci&oacute;n.</p>
                  <p>Agradezco su atenci&oacute;n a la presente.</p>
                  <p>Cordialmente,</p>
                  <p>&nbsp;</p>
                  <p>____________________________________<br>
                    Firma</p>
                  <p><%=datosestud.elementAt(0)%><br>
                    
                    <%=solicitud.elementAt(7)%> <%=solicitud.elementAt(6)%> <%=solicitud.elementAt(17)%><br>
                    Libreta Militar No.<%=solicitud.elementAt(8)%> <%=solicitud.elementAt(9)%><br>
                  </p>
                  <%if(impr == null){%>
                  <form name="form1" method="post" action="">
                    <div align="center">
                        <input name="imprimir" type="submit" id="imprimir" value="Imprimir" class="boton" onclick="javascript: return enviar();">
                    </div>
            </form>
            <%}%>
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