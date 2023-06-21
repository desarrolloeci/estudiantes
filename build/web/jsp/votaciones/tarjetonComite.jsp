<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*, javax.swing.*, javax.swing.Timer, java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import = "eci.baseDatos.BaseDatos" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
    HttpSession sesion = request.getSession();
   // String carnet = (String)session.getAttribute("carnet");
  //  String carnet = request.getParameter("carnet");
    String nomCrp = new String();
    String tipo = new String();
    String nomprog = new String();
    String consulta = new String();
    Vector lista, infocan;
    int cont=0, i, j;
    if (carnet != null && !carnet.equals("")) {
        tipo = request.getParameter("idCrp");
        nomprog = request.getParameter("nomprog");
        nomCrp = request.getParameter("nomCrp");
	Estudiante Est = new Estudiante();
         lista = Est.Candidatos(tipo);%>

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
<script language="javascript"> 
<!--
    function validar(){
        with (document.formulario1){
            for ( var i = 0; i < R1.length; i++ ) {
                if ( R1[i].checked ) {
                    return true;
                }
            }
        }
        alert("Debe seleccionar un candidato");
        return false;
    }
//-->
</script>
</head>
<body bgcolor="#FFFFFF">

<form method="post" action="guardavotos" name="formulario1">
<!-- Tabla externa -->
<table border="0" cellspacing="0" cellpadding="0" width="725" align="center">
      <tr>
                    <td colspan="2">
                         <jsp:include page="encabezado" flush="true">
                        <jsp:param name="anterior" value="IngresoVotacion" />
                    </jsp:include>
                       
                    </td>
                </tr>
    <tr>
      <td height="30" valign="top">
	  <table width="600" border="0" align="center">
        <tr>
          <td align="center" valign="middle"><div align="left"><br>
                  <span class="textocom">Seleccione un sólo candidato haciendo
                  click en el círculo del <font color="#990000">cuadro rojo</font> correspondiente
                  al candidato deseado y presionando al final el botón de <font color="#990000">Enviar
                  voto</font>.</span> </div>
          </td>
        </tr>
      </table>
	  </td>
    </tr>
    <tr>
      <td height="23" width="725">
    <table width="720" border="0" align="center">
        <%
        cont = lista.size();
        i = 1;
        while(cont>0){
%>
        <tr>
          <%
          for(j=0; j<3; j++){
            %>
          <td>
              <%
              if(i<=lista.size()){
                infocan = (Vector)lista.elementAt(i-1);
%>
              <table width="300" border="1"  align="center" cellspacing="1" bordercolor="#336699" bgcolor="#F8F8F8">
                <tr>
                  <td width="90" rowspan="2"><img src="img/<%=infocan.elementAt(2)%>.jpg" width="110" height="125" alt="wpe133.jpg (3748 bytes)" align="right"></td>
                  <td width="141" rowspan="2" class="textocom"><font size="2"><strong><%=infocan.elementAt(1)%>
                    <p>
                    <% 
                        if(!infocan.elementAt(2).toString().equals("imblanco")){
%>
                        <a href="html/<%=infocan.elementAt(2)%>.htm" onClick="window.open(this.href, this.target); return false;"> VER PROPUESTA</a>
                    <% 
                        }
%>
                    </strong></font></td>
                  <td width="51"><img src="img/nro<%=infocan.elementAt(0)%>.jpg" width="51" height="57"></td>
                </tr>
                <tr>
                  <td width="50"> 
                    <table border="1" width="28%" bgcolor="#FF0000">
                      <tr>
                        <td width="100%">
                        <p><input type="radio" name="R1" value="<%=infocan.elementAt(0)%>"></td>
                      </tr>
                    </table>
                 </td>
                </tr>
            </table>
            <%
              }else{
            %>
                &nbsp;
              <%}
               i = i +1;
%>
          </td>
          <%
          }
            %>
        </tr>
        <%
            cont = cont - 3;
        }
        %>
      </table>     
        </td>
    </tr>
          <input type="hidden" name="nomcrp" value="<%=nomCrp%>">
          <input type="hidden" name="codcrp" value="<%=tipo%>">
  
<tr align="center">
      <td height="65" valign="top" width="756">
	  <fieldset><legend class="textocom">Enviar Voto</legend>
	  <div align="center"><center><p><blink><span class="textocom"><font color="#990000"><b>Una
                    vez seleccionado el candidato presione el botón&nbsp; ==========&gt;&nbsp;</b></font></span><b> </b></blink>
              <input type="submit" value="Enviar voto" name="B1" onClick="javascript: return validar()">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
      </center></div><p>&nbsp;
	  </fieldset></td>
    </tr>
    <tr align="center">
      <td height="66" valign="top" width="756"><p><font
      color="#CCCCCC" size="2"><a href="" onClick="window.open('http://www.escuelaing.edu.co'); return false;"><font color="#999999" size="1" face="Verdana, Arial, Helvetica, sans-serif">Escuela
      Colombiana de Ingeniería</font></a><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><br>
      Avenida 13 No 205-59 Autopista Norte. Km 13 <br>
      Bogotá, D.C. - Colombia. Sur América<br></font></font></td>
    </tr>
    <tr align="center">
      <td height="22" valign="top" width="91"><div align="center"></div></td>
    </tr>
<!--  cierra Tabla  externa -->
  </table>
</form>
</body>
</html>
<%
                       
        } else {
        response.sendRedirect("../estudiantes/login?msg=4") ;
    } 
%>
