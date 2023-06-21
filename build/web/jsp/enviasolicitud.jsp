<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.Modreg.Operacion" %>
<%@ page import="estudiantes.Modreg.Solicitud" %>

<%  
        response.setHeader("Cache-Control","no-cache"); 
	String cont = new String((String)session.getAttribute("cont"));
	String nombre = new String((String)session.getAttribute("nombre"));
	PrintWriter oout = response.getWriter() ;
//        Estudiante est = new Estudiante(carnet,oout) ;
        Estudiante est = (Estudiante) session.getAttribute("estClase") ;
        Operacion op = new Operacion (carnet) ;
%>

<html>
<head>
<title>Elaboraci&oacute;n de Horarios</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
  <tr> 
    <td width="628" height="42" valign="top"> 
	<jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center">
        <tr> 
          <td align="center" valign="top" colspan="2"> 
            <%
int contador=Integer.parseInt(cont);%>
            <%String arreglo[] = new String[500];
 String cadena="var", cadena1="";
for(int i=0; i<contador; i++){
      cadena1=String.valueOf(i);
      String variable=(String)cadena.concat(cadena1);         
      arreglo[i] = request.getParameter(variable); %>
            <%}%>
            <%int p1=0, m1=0; 
  int k=contador/5;
  for (int j=0; j<k; j++){   
        if(!(arreglo[p1+2].equals("0"))){
            m1=m1+1;  
       }
        p1=p1+5;
    } %>
    <%if (m1 == 0){%>
            <CENTER>
              <font face="Verdana, Arial, Helvetica, sans-serif">&nbsp; </font> 
              <p> 
              <h4><font face="Verdana, Arial, Helvetica, sans-serif"><br>
                USTED NO REALIZO NINGUNA OPERACION.<br>
                </font></H4>
            </CENTER>
            <font face="Verdana, Arial, Helvetica, sans-serif"> 
    <%} else {
    int p=0, m=0;  
    String codasig;
    int c=contador/5;
    Solicitud sol[] = new Solicitud [m1];
    for (int n=0; n<c; n++){   
       if(!(arreglo[p+2].equals("0"))){ 
        codasig = arreglo[p+1].toUpperCase();
        sol[m] = new Solicitud ("A",codasig,arreglo[p+2],arreglo[p+3],arreglo[p+4]); 
        m=m+1;
       }
       p=p+5;
    }
%>
            </font> 
            <div align="center"> 
              <p><font face="Verdana, Arial, Helvetica, sans-serif"><b><br>
                Despu&eacute;s de enviar su solicitud, consulte y verifique el 
                horario.</b><BR>
                <br>
                </font> 
              <table width="95%" border="1" bordercolor="#336699">
                <tr bgcolor="#336699"> 
                  <td width="20%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>OPERACION</b></font></div>
                  </td>
                  <td width="12%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>ASIG</b></font></div>
                  </td>
                  <td width="8%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>GR</b></font></div>
                  </td>
                  <td width="8%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>LAB</b></font></div>
                  </td>
                  <td width="8%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>AUX</b></font></div>
                  </td>
                  <td width="44%"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>RESPUESTA</b></font></div>
                  </td>
                </tr>
                <% String respuesta = ""; 
    Operacion op2 = new Operacion (carnet,sol) ;
        if(op2.ejecutarOperacion()){
            for ( int i = 0 ; i < m ; i++ ){
                Solicitud soll = op2.getSolicitud(i) ;

                if(soll.getRespuesta() == 'S')
                     respuesta="Su solicitud fue aceptada";
                else if(soll.getRespuesta() == 'A')
                     respuesta="Asignatura no programada";
                else if((soll.getRespuesta() == 'B') && (soll.getTipOp().equals("R")))
                     respuesta="La asignatura a retirar no esta inscrita";
                else if((soll.getRespuesta() == 'B') && (soll.getTipOp().equals("M")))
                     respuesta="La asignatura a a modificar no esta inscrita";
                else if(soll.getRespuesta() == 'C')
                     respuesta="El grupo a retirar no esta inscrito";
                else if(soll.getRespuesta() == 'D')
                     respuesta="No se encontro el laboratorio";
                else if(soll.getRespuesta() == 'E')
                     respuesta="Sistema ocupado por favor intente mas tarde";
                else if((soll.getRespuesta() == 'F') && (soll.getTipOp().equals("A")))
                     respuesta="Esta intentando adicionar una materia que ya tiene inscrita";
                else if((soll.getRespuesta() == 'F') && (soll.getTipOp().equals("M")))
                     respuesta="Esta intentando modificar a un grupo en el que ya esta inscrito";
                else if((soll.getRespuesta() == 'G') && (soll.getTipOp().equals("A")))
                     respuesta="El grupo a adicionar no existe";
                else if((soll.getRespuesta() == 'G') && (soll.getTipOp().equals("M")))
                     respuesta="El grupo a modificar no existe";
                else if(soll.getRespuesta() == 'H')
                     respuesta="No se permite la asignatura";
                else if(soll.getRespuesta() == 'I')
                     respuesta="Sobrepasa la carga de créditos";
                else if(soll.getRespuesta() == 'J')
                     respuesta="El grupo se cruza con alguno ya inscrito";
                else if(soll.getRespuesta() == 'K')
                     respuesta="No hay cupo";
                else if(soll.getRespuesta() == 'L')
                     respuesta="No coincide grupo teórico con laboratorio o auxiliar";
                else if(soll.getRespuesta() == 'M')
                     respuesta="El grupo de laboratorio o auxiliar no existe";
                else if(soll.getRespuesta() == 'N')
                     respuesta="Esta intentando cambiarse al grupo que ya tiene inscrito";
                else if(soll.getRespuesta() == 'O')
                     respuesta="Aun no ha firmado el acta de matricula";
                else if(soll.getRespuesta() == 'Y')
                     respuesta="Cruce o falta de cupo en el laboratorio o la auxiliar";
                else if(soll.getRespuesta() == 'Z')
                     respuesta="Asignatura adicionada. Pendiente aprobación del decano";
                else if(soll.getRespuesta() == 'X')
                     respuesta="No puede retirar esta asignatura";
                else if(soll.getRespuesta() == 'W')
                     respuesta="Este grupo no corresponde a su período de ingreso";
                else if(soll.getRespuesta() == 'V')
                     respuesta="Este grupo no corresponde a su período de ingreso";
%>
                <tr> 
                  <%if(soll.getTipOp().equals("M")){%>
                  <td width="20%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Cambio 
                    grupo</font></td>
                  <%}if(soll.getTipOp().equals("A")){%>
                  <td width="20%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Adición 
                    materia</font></td>
                  <%}if(soll.getTipOp().equals("R")){%>
                  <td width="20%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Retiro 
                    materia</font></td>
                  <%}%>
                  <td width="12%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=soll.getCodAsig()%></font></td>
                  <td width="8%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=soll.getNumGrp()%></font></td>
                  <td width="8%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=soll.getNumLab()%></font></td>
                  <td width="8%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=soll.getNumAux()%></font></td>
                  <td width="44%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=respuesta%></font></td>
                </tr>
                <%}
        }else {%>
                <p>Error en la operacion</p>
                <%}%>
                <%}%>
              </table>
            </div>
          </td>
        </tr>
        <tr> 
          <td valign="top" colspan="2"> 
            <div align="right"></div>
            <div align="right"> 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="27%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="mostrarhor">ANTERIOR</a> </font></b></font></div>
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
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="../servlet/LogOutEst/">CERRAR 
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
