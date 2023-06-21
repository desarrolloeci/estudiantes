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
        String idplan = (String) session.getAttribute("idplan");
       // String hor = request.getParameter("hor");
       // HttpSession session = request.getSession();
        String perh = (String) session.getAttribute("perinsc");
        Estudiante est = new Estudiante(carnet, oout);
        int nvoper = 0, maxcred = 0;
        int i, ind = 0;
        entrada = entrada.toUpperCase();
        String codasig = "", nomasig = "", var = "marcar", dia = "";

        lispre = est.BuscarAsigAPos(perh, entrada, carnet, idplan);
   

if (lispre.size()>0){
    ind = 1 ;  
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
	else {
		alert ("Debe seleccionar alguna asignatura")
                return false;
        }
//cerrar ventana
//javascript:opener.location.reload(true);self.close()

//ventana_secundaria1.close() ;
//window.close();
//window.close()
//self.close()
//close()
return true;
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
if (ind == 1){%>
<div align="center"><div align="center">Seleccione la o las asignaturas a registrar</div><br>
    <form name="fmArchivos" method="POST" action="InscripAsigPos" >
        <!--<form name="fmArchivos" method="POST" action="InscripAsigPos" onSubmit="return ValidarChk();">-->
               <table width="95%" border="1" class="tabla">          
                    <tr>
                        <td width="10%"><center>Código Asig</center></td>
                        <td width="35%"><center>Nombre Asignatura</center></td>
                        <td width="5%"><center>Grupo</center></td>
                        <td width="5%"><center>Créditos</center></td>
                        <td width="35%"><center>Nombre Profesor</center></td>
                        <td width="5%"><center>Seleccione</center></td>
                    </tr>
                    <% for (i = 0; i < lispre.size(); i++) {
            prei = (Vector) lispre.elementAt(i);%>

                    <tr>
                        <td width="10%">
                            <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                                    <%=(String) prei.elementAt(2)%>                                    
                            </font> </div>
                        </td>
                        <td width="35%">
                            <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                                    <%=(String) prei.elementAt(3)%>                                    
                            </font> </div>
                        </td>
                        <td width="5%">
                            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                            <%=(String) prei.elementAt(4)%></font>
                        </td>
                        <td width="5%">
                            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                            <%=(String) prei.elementAt(1)%></font>
                        </td>
                        <td width="35%">
                            <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#000000">
                            <%=(String) prei.elementAt(8)%></font>
                        </td>
                        <td width="5%">
                            <input type="checkbox" name="checEli" onClick="chkUn()" value="<%=prei.elementAt(0)%>,<%=prei.elementAt(6)%>,<%=prei.elementAt(1)%>,<%=prei.elementAt(4)%>,<%=prei.elementAt(7)%>,<%=prei.elementAt(2)%>,">
                        </td>
                    </tr>
                    
                    <%}%>       
            </table>
                 <div align="center">
                  <p>
                    <!--<input name="B1" type="submit" onClick="ValidarChk()" class="boton" value="<-Inscribir">-->
                    <input name="B1" type="submit" onClick="return ValidarChk()" class="boton" value="<-Inscribir">

                   <!-- <input name="B1" type="submit" class="boton" value="<-Inscribir">-->
                  </p>
                </div>
            <input type="hidden" name="valor" size="2" value="0">
            <input type="hidden" name="ban" size="2" value="1">
                 </form>
        </div>

     <%}else{%>
     <div align="center">No Existe información para la asignatura: <%=entrada%>, para el periodo: <%=perh%> </div><br>
      <p>
                    <input name="B1" type="submit" onClick="self.close()" class="boton" value="Cerrar">
                  </p>
     <%}%>
    </body>
</html>
