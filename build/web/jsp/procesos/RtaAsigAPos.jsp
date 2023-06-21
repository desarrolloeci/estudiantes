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
        String res = request.getParameter("ind");
        String  mensaje = (String)session.getAttribute("mensajer");
        int lon = 0;
       // String hor = request.getParameter("hor");
       // HttpSession session = request.getSession();
       
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
ventana_secundaria1.close() ;
//window.close();
window.close()
self.close()
close()
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

<div align="center"><div align="center">Respuesta a su solicitud</div><br>
   <table width="90%" border="0" class="tabla">


           <%lon = Integer.parseInt(res.toString());
           if (lon > 0){
           String[] result = mensaje.split("/");
            for (int ii = 0; ii < result.length; ii++) {
          %><tr> <td>
                   <div id="mensaje" align="center" style="color: red"><%=result[ii]%><br></div>  </td>
                   </tr>
                <%

            }%>
            <tr> <td>
            <div id="mensaje1" align="center" style="color: red"><p>"Recuerde que este proceso es válido únicamente en el momento que se realice y legalice el pago del mismo. De acuerdo con esta solicitud se generará la orden de matrícula que corresponderá al número de créditos de las asignaturas inscritas.
                            Secretaría General."</p></div>
            </td>
            </tr>
            <%}%>

            </table>
                 <div align="center">
                  <p>
                    <input name="B1" type="submit" onClick="javascript:opener.location.reload(true);self.close()" class="boton" value="Cerrar">
                  </p>
                </div>
            <input type="hidden" name="valor" size="2" value="0">
            <input type="hidden" name="ban" size="2" value="1">
                
        </div>

    </body>
</html>
