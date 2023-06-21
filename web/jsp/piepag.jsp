<%
String bandmenu = new String((String)session.getAttribute("ban"));
String antermenu = request.getParameter("anterior");
%>
<table width="45%" border="0" height="17">
	<tr> 
	  <td width="27%" height="14"> 
		<div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
		  <a href="<%=antermenu%>">ANTERIOR</a> </font></b></font></div>
	  </td>
	  <td width="4%" height="14" align="center" valign="middle"> 
		<div align="center">|</div>
	  </td>
	  <td width="22%" height="14"> 
		<%if (bandmenu.equals("0")){%>
		<div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
		  <a href="menuServEstud">INICIO</a></font></b></font></div>
		<%} else {%>
		<div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
		  <a href="menuServEstud1">INICIO</a></font></b></font></div>
		<%}%>
	  </td>
	  <td width="4%" height="14" align="center" valign="middle"> 
		<div align="center">|</div>
	  </td>
	  <td width="43%" height="14"> 
		<div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
		  SESION </a></font></b></font></div>
	  </td>
	</tr>
</table>
<div id="modernbricksmenuline">&nbsp;</div>
