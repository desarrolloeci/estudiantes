<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>

<%  
        Vector prei = new Vector() ;
        response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
	String nomas, prioas, cha = new String(), chb = new String();
	String prog = new String();
	PrintWriter oout = response.getWriter() ;
        Estudiante est = new Estudiante(carnet,oout) ;
        Vector lispre = est.getPreinscripcion(carnet) ;
        int i, crtot, cras, cradic ;
%>
<html>
<head>
<title>Preinscripciones</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}
.textocom {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #666666;
}
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
-->
</style>
</head>
<body bgcolor="#FFFFFF" text="#000000">
    <table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr> 
      <td width="640"> 
	<jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center">
        <tr>
          <td align="center" valign="top" colspan="2"><div><br> 
              <p align="center" class="textocom"><font size="3"><b>Preinscripciones</b></font></p>             
            </div></td>
        </tr>
        <tr> 
          <td align="center" valign="top" colspan="2"> <span class="textocom">
            <MARQUEE>
            <font color="#990000">ATENCIÓN!!: Si es la primera vez que consulta la preinscripción
            debe confirmarla con el boton correspondiente</font>
            </MARQUEE>
            <br>Solo
                preinscriba las asignaturas teóricas y en el orden dado.<br>
            La prioridad indica el nivel de certeza con el que tomará la asignatura. 
            </span>
            <form method="POST" action="ProcesoPreinscripcion">
              <table width="100%" border="1" bordercolor="#336699">
                <tr bgcolor="#336699"> 
                  <td width="20%"> 
                    <div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Asignaturas</font></b></div>
                  </td>
                  <td width="20%"> 
                    <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Prioridad</font></b> 
                  </td>
                  <td width="10%"> 
                    <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Créditos</font></b> 
                  </td>
                  <td width="20%"> 
                    <div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Asignaturas</font></b></div>
                  </td>
                  <td width="20%"> 
                    <p align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Prioridad</font></b> 
                  </td>
                  <td width="10%"> 
                    <div align="center"><b><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Créditos</font></b></div>
                  </td>
                </tr>
                <%  crtot = 0 ;
    cradic = 0 ;
    for (i = 0; i < lispre.size(); i++) {
        prei = (Vector) lispre.elementAt(i) ;
        nomas = "as" + i ;
        prioas = "pr" + i ;
        cras = (Integer.valueOf((String) prei.elementAt(2))).intValue() ;
        if (((String) prei.elementAt(3)).equals("A"))
            cradic = cradic + cras ;
        else
            crtot = crtot + cras ;
        if (((String) prei.elementAt(1)).equals("0")) {
            cha = "checked" ;
            chb = "" ;
        }
        else {
            chb = "checked" ;
            cha = "" ;
        }
        if (i%2 == 0) {
%>
                <tr> 
                  <%      } %>
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                      <input type="text" name="<%=nomas%>" size="5" value="<%=(String) prei.elementAt(0)%>">
                      </font> </div>
                  </td>
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                      <input type="radio" value="0" <%=cha%> name="<%=prioas%>">
                      Alta 
                      <input type="radio" name="<%=prioas%>" value="1" <%=chb%>>
                      Baja</font> </div>
                  </td>
                  <td> 
                    <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                      <%=(String) prei.elementAt(2)%></font> 
                  </td>
                  <%      if (i%2 != 0) {
%>
                </tr>
                <%      }
    }
%>
                <tr> 
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                      <input type="text" name="asf1" size="5" value="">
                      </font> </div>
                  </td>
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                      <input type="radio" value="0" checked name="priof1">
                      Alta 
                      <input type="radio" name="priof1" value="1">
                      Baja</font> </div>
                  </td>
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                      &nbsp;</font> </div>
                  </td>
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                      <input type="text" name="asf2" size="5" value="">
                      </font> </div>
                  </td>
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                      <input type="radio" value="0" checked name="priof2">
                      Alta 
                      <input type="radio" name="priof2" value="1">
                      Baja</font> </div>
                  </td>
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1"> 
                      &nbsp;</font> </div>
                  </td>
                </tr>
              </table>
              <input type="hidden" name="ncampos" size="2" value="<%=i%>">
              <br>
              <span class="textocom">Total
              créditos preinscritos con asignaturas del plan y opcionales <%=crtot%> <br>
              Total créditos preinscritos con asignaturas
              adicionales <%=cradic%></span><br>
              <br>
              <input name="B1" type="submit" class="boton" value="Confirmar esta preinscripción">
            </form>
            <p class="textocom">Las
                  asignaturas preinscritas están sujetas al cumplimineto de sus
              requisitos.</p>
          </td>
        </tr>
        <tr> 
          <td valign="top" colspan="2"> 
            <div align="right"> 
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
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">INICIO</a></font></b></font></div>
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
		<tr>
    		<td height="5" colspan="2"><img src="img/bararhoriz.gif" width="640" height="5"></td>
  		</tr>
      </table>
    </td>
    </tr>
  
</table>
</body>
</html>