<%-- 
    Document   : BuscadorAsig
    Created on : 18/11/2010, 04:32:49 PM
    Author     : 
--%>
<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties " %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
        Vector prei = new Vector();
        Vector preadic = new Vector();
        Vector lispre = new Vector();
        response.setHeader("Cache-Control", "no-cache");
        configECI confEci = new configECI();
        PrintWriter oout = response.getWriter();
        String entrada = request.getParameter("asigna");
        String hor = request.getParameter("hor");        
       // HttpSession session = request.getSession();
        String perh = (String) session.getAttribute("perinsc");
        Estudiante est = new Estudiante(carnet, oout);
        int nvoper = 0, maxcred = 0;
        int i, ind = 0;
        entrada = entrada.toUpperCase();
        String codasig = "", nomasig = "", var = "marcar", dia = "";

        if (hor.equals("1"))
             lispre = est.BuscarAsigPos(perh, entrada);
        else
              lispre = est.BuscarAsigPosC(perh, entrada);
       

if (lispre.size()>0){
    ind = 1 ;
    for (i = 0; i < lispre.size(); i++) {
        prei = (Vector) lispre.elementAt(i);
        codasig = (String) prei.elementAt(5);
        nomasig = (String) prei.elementAt(6);
    }
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Buscar Asignaturas</title>
    </head>
    <script language="JavaScript" type="text/JavaScript">
<!--
/*------------------------------------------------------------------
	function Validar Eliminacion del CheckBox
------------------------------------------------------------------*/
function ValidarChk(){
	var max = document.fmArchivos.checEli.length
	var vall = false
	var k = 0
	for ( i=0 ; i<max ; i++ ){
		if  (document.fmArchivos.checEli[i].checked == true) {
			vall =true
			k++ ;
			}
	}
	//if ( k > 1 )
		//alert("Solo puede seleccionar un campo")
	//else
    if ((vall == true))
		document.fmArchivos.submit()
	else
	if ((vall == false) && (document.fmArchivos.checEli.checked == true) )
		document.fmArchivos.submit()
	else
		alert ("Debe seleccionar alguna asignatura")

	//else {
		//document.fmArchivos.submit()
		//document.fmArchivos.submit()
		//}

//cerrar ventana
//ventana_secundaria.close() ;
//window.close();
}
/*-----------------------------------------------------------------
	function Validar el CheckBox que selecciona a todos
------------------------------------------------------------------*/
function chkAll(){
	var max = document.fmArchivos.checEli.length
	var vall
	if (document.fmArchivos.chAll.checked == true)
		vall = true
	else
		vall = false
	for ( i=0 ; i<max ; i++ ){
		document.fmArchivos.checEli[i].checked = vall
	}
}
/*------------------------------------------------------------------
	function Validar Cada check box
------------------------------------------------------------------*/
function chkUn(){
	var max = document.fmArchivos.checEli.length
	var vall = true
	if (document.fmArchivos.chAll.checked == true)
		document.fmArchivos.chAll.checked = false
	for ( i=0 ; i<max ; i++ ){
		vall = vall && document.fmArchivos.checEli[i].checked
	}
	if (vall == true)
		document.fmArchivos.chAll.checked = true
}
//-->
    </script>

    <link href="css/comun.css" rel="stylesheet" type="text/css">
    <body>    
<%
if (hor.equals("1") && ind == 1){%>
<div align="center"><div align="center">HORARIO SEMANAL <BR> PERIODO: <%=perh%> </div><br>
    <table width="90%" border="1" class="tabla">
        <tbody id="asignaturas">
        <tr>
            <td width="5%"><b><center>Día</center></b></td>
          <td width="5%"><b><center>Grupo</center></b></td>
          <td width="5%"><b><center>Hora Ini</center></b></td>
          <td width="5%"><b><center>Hora Fin</center></b></td>
          <td width="10%"><b><center>Salón</center></b></td>
          <td width="10%"><b><center>Cod Asig</center></b></td>
          <td width="30%"><b><center>Nombre Asignatura</center></b></td>
          <td width="20%"><b><center>Nombre Profesor</center></b></td>
        </tr>
        <% for (i = 0; i < lispre.size(); i++) {
                prei = (Vector) lispre.elementAt(i);
                if (prei.elementAt(2).equals("1"))
                    dia = "Lunes";
                else if(prei.elementAt(2).equals("2"))
                    dia = "Martes";
                else if(prei.elementAt(2).equals("3"))
                    dia = "Miércoles";
                else if(prei.elementAt(2).equals("4"))
                    dia = "Jueves";
                else if(prei.elementAt(2).equals("5"))
                    dia = "Viernes";
                else if(prei.elementAt(2).equals("6"))
                    dia = "Sábado";

        %>
        <tr>
          <td width="10%">
            <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=dia%>
              </font> </div>
          </td>
          <td width="5%">
            <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=(String) prei.elementAt(1)%>
              </font> </div>
          </td>
          <td width="5%">
            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=(String) prei.elementAt(3)%></font>
          </td>
           <td width="5%">
            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=(String) prei.elementAt(4)%></font>
          </td>
         <td width="5%">
            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=(String) prei.elementAt(0)%></font>
          </td>
         <td width="10%">
            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=(String) prei.elementAt(5)%></font>
          </td>
         <td width="30%">
            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=(String) prei.elementAt(6)%></font>
          </td>
         <td width="20%">
            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=(String) prei.elementAt(7)%></font>
          </td>
        </tr>
        <div align="right">
          <h1><b>   
            </b> </h1>
        </div>
        <%}%>
        </tbody>
      </table>
        </div>
     <%}else if(hor.equals("2") && ind == 1){%>
	<div align="center"><div align="center">CALENDARIO ACADEMICO <BR> ASIGNATURA: <%=nomasig%>-<%=codasig%>  PERIODO: <%=perh%> </div><br>
    <table width="80%" border="1" class="tabla">
        <tbody id="asignaturas">
        <tr>
            <td width="10%"><b><center>Día</center></b></td>
          <td width="5%"><b><center>Grupo</center></b></td>
          <td width="15%"><b><center>Fecha</center></b></td>
          <td width="5%"><b><center>Hora</center></b></td>
          <td width="10%"><b><center>Salón</center></b></td>
          <td width="35%"><b><center>Profesor</center></b></td>
        </tr>
        <% for (i = 0; i < lispre.size(); i++) {
                prei = (Vector) lispre.elementAt(i);
                if (prei.elementAt(1).equals("1"))
                    dia = "Lunes";
                else if(prei.elementAt(1).equals("2"))
                    dia = "Martes";
                else if(prei.elementAt(1).equals("3"))
                    dia = "Miércoles";
                else if(prei.elementAt(1).equals("4"))
                    dia = "Jueves";
                else if(prei.elementAt(1).equals("5"))
                    dia = "Viernes";
                else if(prei.elementAt(1).equals("6"))
                    dia = "Sábado";

        %>
        <tr>
          <td width="10%">
            <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=dia%>
              </font> </div>
          </td>
          <td width="5%">
            <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=(String) prei.elementAt(8)%>
              </font> </div>
          </td>
          <td width="15%">
            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=(String) prei.elementAt(2)%></font>
          </td>
           <td width="5%">
            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=(String) prei.elementAt(7)%></font>
          </td>
         <td width="10%">
            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=(String) prei.elementAt(0)%></font>
          </td>
         <td width="35%">
            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
              <%=(String) prei.elementAt(9)%></font>
          </td>
        </tr>
        <div align="right">
          <h1><b>
            </b> </h1>
        </div>
        <%}%>
        </tbody>
      </table>
        </div>
     <%}else{%>
     <div align="center">No Existe información para la asignatura: <%=entrada%>, para el periodo: <%=perh%> </div><br>
     <%}%>
     <p>&nbsp;</p>
     <input name="B1" type="submit" onClick="self.close()" class="boton" value="Cerrar">
    </body>
</html>
