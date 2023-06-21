<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.cancelaciones.Cancelacion" %>

<%  
    response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
	String ban = new String((String)session.getAttribute("ban"));	
	String grp = new String((String)session.getAttribute("grp"));
	String confcancel = new String((String)session.getAttribute("confCancel"));
	PrintWriter oout = response.getWriter() ;

        StringTokenizer strSol = new StringTokenizer(confcancel, "$") ;
        String rp = strSol.nextToken() ;
        String nom = strSol.nextToken() ;
        String carne = strSol.nextToken() ;
        String nemon = strSol.nextToken() ;
        String idReg = strSol.nextToken() ;
        String idGrp = strSol.nextToken() ;
        String raz = strSol.nextToken() ;
        String solEnvio= "2$" + carne + "$" + idReg + "$" + nemon + "$" + idGrp + "$" + raz + "$";
        Cancelacion can = new Cancelacion(confcancel, oout) ;                  
        can.confirmarCancelacion(oout);                        
%>

<html>
<head>
<title>Horario Estudiantes</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-style: normal;
	line-height: normal;
	font-weight: bold;
	font-variant: normal;
	text-transform: none;
	text-decoration: none;
	color: #666666;
}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr> 
        
    <td width="640" valign="top"> 
	
      <jsp:include page="encabezado" flush="true"/>
      <table border="0" align="center" width="603">
        <tr> 
          <td width="86%" height="55" valign="top" class="texto"> 
            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><font color="#336699" size="2">Servicios 
              a Estudiantes - Cancelaciones</font></font></div>
          </td>
        </tr>
        <tr> 
          <td height="2" colspan="2" align="center" valign="top" class="texto"> 
            <div align="left"> 
<%          String resp = can.getSolRespuesta().substring(0,1);%>
             
           <br>
<%          if (resp.equals("S")) {%>
              <b class="texto">Su 
              solicitud de cancelación fue enviada. Pendiente aprobación del decano. 
              <p>Asignatura solicitada para cancelar: <%=nemon%><br>
                Grupo: <%=grp%> 
              <p>Recuerde: Debe asistir a clase hasta que el decano apruebe la 
                cancelación. <br>
                Esta respuesta aparece al cierre del proceso de cancelación.</p>
              </font></b> 
<%          } else if (resp.equals("E")) {%>
              <b class="texto">Error 
              en la base de datos.</font></b> 
<%          } else if (resp.equals("O")) {%>
              <b class="texto">Servidor ocupado.</font></b> 
<%          }%>
            </div>
        </tr>
        <tr> 
          <td valign="top" colspan="2" height="49"> 
            <div align="right"> <br>&nbsp;
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">ANTERIOR</a> </font></b></font></div>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="14"> 
                    <%if (ban.equals("0")){%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">INICIO</a></font></b></font></div>
                    <%} else {%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud1">INICIO</a></font></b></font></div>
                    <%}%>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center"><b>|</b></div>
                  </td>
                  <td width="43%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
</table>

</body>
</html>
