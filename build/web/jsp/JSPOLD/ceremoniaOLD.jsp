<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String igrad =  new String((String)session.getAttribute("igrad"));
    String iddpto =  new String((String)session.getAttribute("iddpto"));
    PrintWriter oout = response.getWriter() ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    int estado;
    estado = Integer.parseInt(est.getEstado());
    if(!igrad.equals("C")){
        if(estado>0)
            response.sendRedirect("menuServEstud");
        else
            response.sendRedirect("menuServEstud1");
    }else{
        Vector infoEst = est.getDatosEst(carnet);
        Vector datosestud = (Vector)infoEst.elementAt(0) ;
        Vector datospar = est.getParProg(iddpto);
        Vector verifIngles = est.getExIngEgre(carnet);
        Vector paregre = est.getParGraduado(carnet);
        String sel = "";
        String sel1 = "";
        if(paregre.size()>0){
            if(((Vector)paregre.elementAt(0)).elementAt(1).equals("0"))
                sel1 = "checked";
            else
                sel = "checked";
        }
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
	color: #666666;
}
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
    <script language="javascript">
        <!--
        function validar() { 
            if(document.formulario1.asistir[0].checked){
                document.formulario1.target = "ventanaAsistir";
                document.formulario1.action = "ImpInvitacion";
                window.open("", "ventanaAsistir", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
                document.formulario1.submit();
                return false;
            }else if(document.formulario1.asistir[1].checked){
                if(confirm("Confirma que no desea asistir al evento?")){
                    document.formulario1.target = "ventanaAsistir";
                    document.formulario1.action = "ImpInvitacion";
                    window.open("", "ventanaAsistir", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
                    document.formulario1.submit();
                    history.back();
                }
            }else{
                alert("Debe escoger una opción");
            }
            return false;
        }
    -->
    </script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>     
    <td width="640" valign="top"> 
      <jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center">

        <tr> 
          <td valign="top">
		  <fieldset> 
            <center>
              <font color="#336699" face="Verdana, Arial, Helvetica, sans-serif">
              </font><font face="Verdana, Arial, Helvetica, sans-serif">
              <legend></legend>
              </font>
              <legend>
              <div align="left"><font color="#336699" size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>Se&ntilde;or:
              Estudiante <%=nombre%></b></font></div>
              </legend><br>
              <div align="left" class="texto1">Las
                  Directivas de la Escuela Colombiana de Ingenier&iacute;a determinaron que en este per&iacute;odo
                se celebrar&aacute; una reuni&oacute;n para hacer la entrega
                tradicional de los escudos a los estudiantes que est&aacute;n
                pr&oacute;ximos a terminar sus estudios, la cual se celebrar&aacute; el
                d&iacute;a <strong><%=datospar.elementAt(0)%></strong> para el programa de <strong><%=datosestud.elementAt(1)%></strong> <br>
                <br>
                <% 
                if(verifIngles.size()==0){%>
                Se&ntilde;or Estudiante: Recuerde que como requisito de Grado
                es indispensable presentar el requerimiento del idioma Ingl&eacute;s
                de acuerdo al Art&iacute;culo 105 del <a href="" onclick="window.open('http://www.escuelaing.edu.co/servicios/estudiantes/art_105.htm','','height=600,width=800, toolbar=yes,scrollbars=yes,location=no,directories=yes,status=yes,menubar=yes,resizable=yes');return false">Reglamento
                Estudiantil</a>,
                el cual Ud. deber&aacute; tramitar y entregar junto a la documentaci&oacute;n
              de tr&aacute;mite de grado. <br>
              <%}%>
              <br>
              Para que pueda asistir al evento, favor acercarse a la Oficina
              de Coordinaci&oacute;n de Grados del <strong><%=datospar.elementAt(1)%></strong> y
              recoger su invitaci&oacute;n, previa confirmaci&oacute;n de la
              asistencia al evento.</div>
            </center> 
            <form name="formulario1" method="get" action="">
              <center>
              </center>
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="textocom">
                <tr>
                  <td width="25%"><strong>Usted asistir&aacute; al
                  evento?</strong></td>
                  <td width="12%"><strong>SI</strong>                    
                  <input type="radio" name="asistir" value="1" <%=sel%>></td>
                  <td width="63%"> <strong>NO
                  </strong>
                  <input type="radio" name="asistir" value="0" <%=sel1%>></td>
                </tr>
              </table>
              <br>
              <div align="center"> 
                <input type="submit" name="Submit" value="Registrar" size="2" class="boton" onclick="javascript: return validar();">
              </div>
            </form>
			</fieldset>
          </td>
        </tr>
        <tr> 
          <td valign="top" height="12"> 
            <table width="45%" border="0" align="right">
              <tr> 
                  <td width="27%" height="12"> 
                    <div align="center"> 
                      <font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">ANTERIOR</a> </font></b></font> 
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
                    <div align="center"><b>|</b></div>
                  </td>
                  <td width="43%" height="12"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
              </tr>
            </table>
          
          </td>
          
        </tr>
      </table>
  </tr>
    <tr>
      <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
</table>

</body>
</html>
<% }%>