<%@ include file="../secure.jsp" %>
<%@ page import="java.text.*, java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%  
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String igrad =  new String((String)session.getAttribute("igrad"));
    String iddpto =  new String((String)session.getAttribute("iddpto"));
    String impr = request.getParameter("imprimir");
    PrintWriter oout = response.getWriter() ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    int estado, i;
    estado = Integer.parseInt(est.getEstado());
    if(!igrad.equals("C")){
        if(estado>0)
            response.sendRedirect("menuServEstud");
        else
            response.sendRedirect("menuServEstud1");
    }else{
        Vector despinfopar = new Vector();
        Vector infoPar = est.getParTramGrad("5");
        Vector despinfopar2 = est.getParTramGrad("6");
        for(i=0 ; i < infoPar.size() ; i++)
            despinfopar.addElement((String)((Vector)infoPar.elementAt(i)).elementAt(0));
%>
<html>
<head>
<title>Servicios Academicos - Grado Colectivo</title>
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
<%  if(impr != null){%>
        color: #333333;
<%  }else{%>
	color: #666666;
<%  }%>
}
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
    <script language="javascript">
        <!--
        function enviar() { 
            document.form1.target = "ventanaImp";
            document.form1.action = "InstGradoIndividual?imprimir=imp";
            window.open("", "ventanaImp", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
            document.form1.submit();
            return false;
        }

        function imprim(){
<%  if(impr != null){%>
            window.focus();
            window.print();
            window.close();
<%  }%>  
        }
    -->
    </script>
</head>
<body bgcolor="#FFFFFF" text="#000000" onload="imprim()">
<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>     
    <td width="640" valign="top"> 
      <%if(impr == null){%>
      <jsp:include page="encabezado" flush="true"/>
      <%}%>
      <table width="100%" border="0" align="center" class="texto1">

        <tr> 
          <td valign="top">
                  <div align="center">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="texto1">
                      <tr>
                        <td width="15%"><img src="img/logo.gif" width="83" height="90"></td>
                        <td width="85%"><div align="left">INSTRUCTIVO PARA ACCEDER
                            A LA CEREMONIA DE GRADOS INDIVIDUAL<br>
                          GRADUANDOS EN LOS PROGRAMAS DE:
                              <p>INGENIER&Iacute;A CIVIL, EL&Eacute;CTRICA, SISTEMAS,
                                INDUSTRIAL, ELECTR&Oacute;NICA, ECONOM&Iacute;A,
                                ADMINISTRACI&Oacute;N Y MATEM&Aacute;TICAS<br>
                              </p>
                        </div>                          </td>
                      </tr>
                    </table>
            </div>              <strong>Promoci&oacute;n <%=despinfopar.elementAt(3)%></strong><br>              
            <p>Para el tr&aacute;mite de grado debe:<br>
              ENCONTRARSE A PAZ Y SALVO POR TODO CONCEPTO CON LA INSTITUCI&Oacute;N
               Reglamento Estudiantil Art&iacute;culo 106</p>              
            <p>Favor entregar en la Oficina de Coordinaci&oacute;n de Grados
                    tercer piso bloque A, la siguiente documentaci&oacute;n:<br><br>
                    1.	ENTREGA DE DOCUMENTOS DEL <strong> <%=despinfopar.elementAt(0)%></strong><br>
                     1.1 Solicitud preliminar de grado. <strong><a href="SolicitudPreGrado">CLIC
                     AQU&Iacute;</a></strong><br>
                      1.2 Solicitud aprobaci&oacute;n de grado. <strong><a href="SolicitudAprobGrado">CLIC
                      AQU&Iacute;</a></strong><br>
                      1.3 Fotocopia legible de la C&eacute;dula de Ciudadan&iacute;a
                      por ambas caras, ampliada al doble.<br>1.4 Fotocopia legible de la Libreta Militar
                      por ambas caras (Decreto Ley 2150 Art&iacute;culo 111 de
                      1995)<br>1.5 Una fotograf&iacute;a reciente, de
                      frente, tama&ntilde;o
                    3 x 4 cm., fondo blanco, en papel mate. (No pueden ser instant&aacute;neas).<br> 1.6 Examen avanzado de suficiencia en Ingl&eacute;s.<strong><%=despinfopar.elementAt(6)%></strong>
                     </strong><br> 1.7 En caso que haya solicitado intenci&oacute;n de doble
                    programa y desea continuar el Doble Programa deber&aacute; entregar
                    el formulario correspondiente. <strong>&lt;link No 3&gt;</strong><br>
                      <br>
                      2.	PAGO DE LOS DERECHOS DE GRADO DEL <strong><%=despinfopar.elementAt(7)%></strong> 		    </p>              
                    <p> S&oacute;lo pueden pagar derechos de grado aquellos estudiantes
                    que cumplan con todos los requisitos establecidos:<br><strong> VALOR: $ <%=despinfopar.elementAt(8)%></strong><br> Puede pagar en la Caja de la ESCUELA, en las siguientes
                    modalidades: <br>-	Tarjeta de cr&eacute;dito (titular de la tarjeta con c&eacute;dula)<br>
                      - Tarjeta d&eacute;bito<br>
                      -	Cheque personal, previamente avalado por Fenalco o Covinoc <br>
                      -	Cheque de gerencia<br>
                      -	Combinaci&oacute;n de cualquiera de las anteriores con
                      efectivo, </p>            
                    <p> Si usted va a cancelar en efectivo: </p>
                    <p align="justify">Deber&aacute; hacer
                      una consignaci&oacute;n en el Banco de Occidente cuenta
                      No. 25503548-7 o en el Banco BBVA cuenta No. 310-00109-4
                      a favor de la Escuela Colombiana de Ingenier&iacute;a
Julio Garavito.<br>
                    </p>
                    <p align="justify"><strong>NOTA:</strong> Si usted no cumple con estos requisitos dentro de
                      las fechas indicadas, la ESCUELA asumir&aacute; que no
                      participar&aacute; en la Ceremonia de Grados Colectiva del <strong><%=despinfopar.elementAt(5)%></strong></strong></p>
            <p align="justify">3. Debe entregar copia del recibo de caja o la
              consignaci&oacute;n en la Oficina de Coordinaci&oacute;n de Grados.
              En este recibo debe registrar el nombre del graduando, su documento
            de identidad y en el campo Referencia debe indicar el No. del carn&eacute;. </p>
                    <p>4. La solicitud de grado se presentar&aacute; al Consejo
                      Directivo el primer martes del <br>
                      mes siguiente a su solicitud, previo cumplimiento de los
                      requisitos exigidos y de<br>
                      procedimiento interno.</p>
                    <p>5. La entrega del diploma se realizar&aacute; en la fecha
                      fijada por la direcci&oacute;n de la <br>
                      Escuela despu&eacute;s de la reuni&oacute;n del Consejo
                      Directivo.</p>
                    <p>6. <font color="#990000">El tr&aacute;mite de la tarjeta de la matr&iacute;cula
                      profesional ser&aacute; de responsabilidad del egresado.
                      La Escuela no se hace responsable del tr&aacute;mite en
            la modalidad de grado individual.</font></p>
                    <br>
                    <strong>SI REQUIERE INFORMACI&Oacute;N ADICIONAL</strong>,
                    FAVOR COMUNICARSE CON LA OFICINA DE <strong>COORDINACI&Oacute;N DE
                    GRADOS</strong> Bloque A tercer piso Tel&eacute;fono 6683600 Ext.
                    339 coordgrados@escuelaing.edu.co
                    <%if(impr == null){%>
                <form name="form1" method="post" action="">
                    <div align="center">
                        <input name="imprimir" type="submit" id="imprimir" value="Imprimir" class="boton" onclick="javascript: return enviar();">
                    </div>
            </form>
            <%}%>
        </td>
        </tr>
        <tr> 
          <td valign="top" height="12"> 
      <%if(impr == null){%>
            <table width="45%" border="0" align="right">
              <tr> 
                  <td width="27%" height="12"> 
                    <div align="center"> 
                      <font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="TramiteGrado">ANTERIOR</a> </font></b></font> 
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
                    <div align="center">|</div>
                  </td>
                  <td width="43%" height="12"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
              </tr>
            </table>
          <%}%>
          </td>
          
        </tr>
      </table>
  </tr>
  <%if(impr == null){%>
    <tr>
      <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
  <%}%>
</table>

</body>
</html>
<% }%>