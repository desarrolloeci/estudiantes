<%
String  cuerpo = request.getParameter("parametro"), nomprog;
%>
<table width="650" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
<!-- fwtable fwsrc="elecciones.png" fwbase="elecciones.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
  <tr>
   <td><img src="img/spacer.gif" width="85" height="1" border="0" alt=""></td>
   <td><img src="img/spacer.gif" width="133" height="1" border="0" alt=""></td>
   <td><img src="img/spacer.gif" width="253" height="1" border="0" alt=""></td>
   <td><img src="img/spacer.gif" width="27" height="1" border="0" alt=""></td>
   <td><img src="img/spacer.gif" width="152" height="1" border="0" alt=""></td>
   <td><img src="img/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="3"><img name="elecciones_r1_c1" src="img/elecciones_r1_c1.gif" width="85" height="90" border="0" alt=""></td>
   <td colspan="2"><img name="elecciones_r1_c2" src="img/elecciones_r1_c2.gif" width="386" height="20" border="0" alt=""></td>
   <td rowspan="2" colspan="2"><img name="elecciones_r1_c4" src="img/elecciones_r1_c4.gif" width="179" height="50" border="0" alt=""></td>
   <td><img src="img/spacer.gif" width="1" height="20" border="0" alt=""></td>
  </tr>
  <tr>
   <td><img name="elecciones_r2_c2" src="img/elecciones_r2_c2.gif" width="133" height="30" border="0" alt=""></td>
<% 
    if(cuerpo.equals("vcd")){
%>
   <td><img name="elecciones_r2_c3" src="img/elecciones_r2_c3.gif" width="253" height="30" border="0" alt=""></td>
<% 
    }else if(cuerpo.equals("vca")){
%>
   <td><img name="elecciones2_r2_c3" src="img/elecciones2_r2_c3.gif" width="253" height="30" border="0" alt=""></td>
<%
    }else{
%>
   <td><img name="elecciones3_r2_c3" src="img/elecciones3_r2_c3.gif" width="253" height="30" border="0" alt=""></td>
<%
    }
%>
   <td><img src="img/spacer.gif" width="1" height="30" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="3"><img name="elecciones_r3_c2" src="img/elecciones_r3_c2.gif" width="413" height="40" border="0" alt=""></td>
   <td><img name="elecciones_r3_c5" src="img/elecciones_r3_c5.gif" width="152" height="40" border="0" alt=""></td>
   <td><img src="img/spacer.gif" width="1" height="40" border="0" alt=""></td>
  </tr>
</table>
<%
nomprog = request.getParameter("nomprog");
if(nomprog != null && !nomprog.equals("")){
%>
<div align="center">
<font color="#990000" size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><%=nomprog%></strong></font>
        <div>
<% 
}
%>