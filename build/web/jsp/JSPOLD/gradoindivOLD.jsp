<%@ include file="../secure.jsp" %>
<%@ page import="java.text.*, java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%  
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String igrad =  new String((String)session.getAttribute("igrad"));
    String iddpto =  new String((String)session.getAttribute("iddpto"));
    session.setAttribute("ceremonia", "INDIVIDUAL");
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
        Vector despingopar = new Vector();
        Vector infoPar = est.getParTramGrad("5");
        for(i=0 ; i < infoPar.size() ; i++)
            despingopar.addElement((String)((Vector)infoPar.elementAt(i)).elementAt(0));
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
	color: #666666;
}
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
    <script language="javascript">
        <!--
        function validar() { 
            if(document.formulario1.asistir[0].checked){
                document.formulario1.target = "ventanaAsistir";
                document.formulario1.action = "ImpInvitacion";
                window.open("", "ventanaAsistir", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
                document.formulario1.submit();
                return false;
            }else if(document.formulario1.asistir[1].checked){
                if(confirm("Confirma que no desea asistir al evento?")){
                    document.formulario1.target = "ventanaAsistir";
                    document.formulario1.action = "ImpInvitacion";
                    window.open("", "ventanaAsistir", "toolbar=no,scrollbars=yes,location=no,directories=yes,status=no,menubar=yes,resizable=yes");
                    document.formulario1.submit();
                    history.back();
                }
            }else{
                alert("Debe escoger una opción");
            }
            return false;
        }
    -->
    </script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
    <tr>     
    <td width="640" valign="top"> 
      <jsp:include page="encabezado" flush="true"/>
      <table width="100%" border="0" align="center" class="texto1">

        <tr> 
          <td valign="top">
              <div align="left">Bogot&aacute; D. C., <%=despingopar.elementAt(2)%> </div>
              <p align="left"><br>
                  <strong>SE&Ntilde;OR GRADUANDO <br>
                  Promoci&oacute;n <%=despingopar.elementAt(3)%> </strong></p>
              <p align="justify"><br>
                  Reciba un cordial saludo y perm&iacute;tame felicitarlo por
                  la culminaci&oacute;n de su proceso de formaci&oacute;n en
                  la ESCUELA COLOMBIANA DE INGENIER&Iacute;A JULIO GARAVITO,
                  le auguro muchos &eacute;xitos en su vida personal y profesional.</p>
              <p align="justify">Aprovecho la oportunidad para hacer algunas precisiones con
                respecto al proceso de graduaci&oacute;n que se inicia en este
                momento, el cual se divide en dos partes:</p>
              <p align="justify">
                1.	Aprobaci&oacute;n de su Grado por parte del Consejo Directivo,
                previa certificaci&oacute;n del Rector y del Secretario General,
                sobre el cumplimiento de los requisitos reglamentarios, de Ley,
                y expedici&oacute;n del Acta de Grado correspondiente.</p>
              <p align="justify">2. Entrega del diploma que lo acredita como profesional egresado
                de la ESCUELA COLOMBIANA DE INGENIER&Iacute;A JULIO GARAVITO,
                en ceremonia especial de grados colectivos o en la modalidad
                de grado individual.</p>
              <p align="justify">Es imperativo el estricto cumplimiento de todos los requisitos
                dentro de las fechas se&ntilde;aladas en el instructivo correspondiente.
                Para ello, su solicitud de grado ser&aacute; presentada para
                aprobaci&oacute;n en la reuni&oacute;n del Consejo Directivo
                de la ESCUELA programada para el d&iacute;a <%=despingopar.elementAt(1)%></p>
              <p align="justify">
                Queda entonces, la opci&oacute;n, de recibir su diploma en la
                siguiente Ceremonia Colectiva correspondiente a la promoci&oacute;n 
                <%=despingopar.elementAt(5)%> o recibir su diploma de manera individual en fecha acordada
                con la Secretar&iacute;a General.</p>
              <p align="justify">Si durante el proceso se le presenta alg&uacute;n inconveniente
                que le impida el cumplimiento de los requisitos dentro de las
                fechas previstas, le solicito el favor de hac&eacute;rmelo saber
                para que, dentro de los plazos oportunos, la ESCUELA pueda tratar
                de colaborarle en lo posible sin contravenir el principio de
                tratamiento equitativo y condiciones de igualdad para todos los
                graduandos.</p>
              <p align="justify">Le agradezco su atenci&oacute;n y cumplimiento responsable a
                las normas y procedimientos establecidos para llevar a cabo este
                proceso de obtenci&oacute;n de su grado profesional, que una
                vez concluido, representa un aporte importante para su vida personal
                y la de su familia.</p>
              <p align="justify">En nombre de la Directiva de la ESCUELA y en el m&iacute;o propio,
                como egresado de la misma, quiero expresarle nuestro sentimiento
                de aprecio y gratitud, al contarlo como miembro de la orgullosa
                familia de egresados de la ESCUELA COLOMBIANA DE INGENIER&Iacute;A
                JULIO GARAVITO.<br>
              </p>
              <p align="left">Atentamente,</p>
              <p></p>
            <p align="left">Ing. RICARDO A. L&Oacute;PEZ CUALLA<br>
              Secretario General</p>
            </center> 
            <div align="center"><a href="InstGradoIndividual"><strong>&lt;&lt; CONTINUAR &gt;&gt;</strong></a></div></td>
        </tr>
        <tr> 
          <td valign="top" height="12"> 
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
                    <div align="center"><b>|</b></div>
                  </td>
                  <td width="43%" height="12"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
              </tr>
            </table>
          
          </td>
          
        </tr>
      </table>
  </tr>
    <tr>
      <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
</table>

</body>
</html>
<% }%>