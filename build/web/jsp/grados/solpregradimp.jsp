<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudMisc" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
response.setHeader("Cache-Control","no-cache");
String nombre = new String((String)session.getAttribute("nombre"));
String igrad =  new String((String)session.getAttribute("igrad"));
String iddpto =  new String((String)session.getAttribute("iddpto"));
String ceremonia =  new String((String)session.getAttribute("ceremonia"));
String impr = request.getParameter("imprimir");
PrintWriter oout = response.getWriter() ;
Estudiante est = (Estudiante) session.getAttribute("estClase") ;
int estado, i;
estado = Integer.parseInt(est.getEstado());
if(!igrad.equals("C") && !igrad.equals("O")){
    if(estado>0)
        response.sendRedirect("menuServEstud");
    else
        response.sendRedirect("menuServEstud1");
}else{
    Vector solicitud = est.getSolPreGrad(carnet);
    Vector tmp;
    BdEstudiante bdEst = new BdEstudiante() ;
    configECI cfgEci = new configECI();
    bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
    Vector exper = bdEst.getSolPreGradExper(carnet);
    Vector respm = bdEst.getSolPreGradMadre(carnet);
    Vector respp = bdEst.getSolPreGradPadre(carnet);
    bdEst.desconectar() ;
    if(exper.size()==0){
        for(i=0;i<15;i++)
            exper.addElement("");
    }else{
        exper = (Vector)exper.elementAt(0);
    }
    if(respm.size()==0){
        for(i=0;i<15;i++)
            respm.addElement("");
    }else{
        respm = (Vector)respm.elementAt(0);
    }
    if(respp.size()==0){
        for(i=0;i<15;i++)
            respp.addElement("");
    }else{
        respp = (Vector)respp.elementAt(0);
    }
    Vector despinfopar = new Vector();
    Vector infoEst = est.getDatosEst(carnet);
    Vector datosestud = (Vector)infoEst.elementAt(0) ;
    Vector datospar = est.getParProg(iddpto);
    Vector profesiones = est.getProfesiones();
    String sel = "";
    String sel1 = "";
    Vector infoPar = est.getParTramGrad("4");
    for(i=0 ; i < infoPar.size() ; i++)
        despinfopar.addElement((String)((Vector)infoPar.elementAt(i)).elementAt(0));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad&eacute;micos - Solicitud</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
		
<%  if(impr != null){%>
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
        color: #333333;
}
-->
        </style>
<%  }else{%>
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
<%  }%>
        <script language="JavaScript" type="text/JavaScript">
            <!--
            //-->
        </script>
		<script language="javascript">
        <!--
        function enviar() { 
            document.form1.target = "ventanaImp";
            document.form1.action = "ImprimirSolPreGrad?imprimir=imp";
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
    <body id="public" onload="imprim()" style="background-color: white;">
        <div id="container">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><%if(impr == null){%><img src="img/top.gif" alt="" width="770" height="10" id="top" /><%}%></td>
                </tr>
                <tr>
                    <td>
                    
                <%if(impr == null){%>
                    <jsp:include page="encabezado" flush="true">
                        <jsp:param name="anterior" value="menuServEstud" />
                    </jsp:include>
					<%}%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Solicitud</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
					<fieldset><legend>Solicitud preliminar de grado</legend>
                        
        <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
          <tr>
                                            <td width="15%" height="134"><img src="img/logo.gif" width="83" height="90"></td>
                                            <td width="65%"><div align="left"><strong>ESCUELA COLOMBIANA
                                                        DE INGENIER&Iacute;A &quot;JULIO GARAVITO&quot;<br>
                                                    SOLICITUD PRELIMINAR DE GRADO</strong><br>
                                                CEREMONIADE ENTREGA DE DIPLOMAS</div>
                                            </td>
                                            <td width="20%"><table width="100%" height="135" border="1" cellpadding="1" cellspacing="0">
                                                    <tr>
                                                        <td><div align="center">FOTO</div></td>
                                                    </tr>
                                            </table></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><p>PREGRADO O POSGRADO
                                                EN: <strong><%=datosestud.elementAt(1)%></strong></p>
                                                <p>PROMOCI&Oacute;N O PER&Iacute;ODO ACAD&Eacute;MICO:<strong> 2020</strong></p>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
                                                    <tr>
                                                        <td width="50%">NOMBRE COMPLETO GRADUANDO: </td>
                                                        <td width="30%">&nbsp;</td>
                                                        <td width="20%">C&Oacute;DIGO No.</td>
                                                    </tr>
                                                    <tr>
                                                      <td colspan="2"><strong><%=solicitud.elementAt(2)%> <%=solicitud.elementAt(3)%> <%=solicitud.elementAt(1)%>
                                                      </strong> </td>
                                                        <td><strong><%=carnet%></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3"><font color="#333333"><em>Nombres
                                                                    y Apellidos
                                                            (COMPLETOS igual
                                                            al de la c&eacute;dula,
                                                                    May&uacute;sculas y min&uacute;sculas y tildes). As&iacute; aparecer&aacute; en
                                                        su diploma<strong> </strong></em></font></td>
                                                    </tr>
                                                </table>                    
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
                                                    <tr>
                                                        <td colspan="3"><hr></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">Documento de Identidad:</td>
                                                        <td width="65%">&nbsp;</td>
                                                    </tr><tr>
                                                        <td colspan="2"><strong><%=solicitud.elementAt(7)%> <%=solicitud.elementAt(6)%></strong></td>
                                                        <td>Expedida en: <strong><%=solicitud.elementAt(17)%></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4"><font color="#333333"><em>Como
                                                            aparece en su Documento
                                                            de identidad y lugar
                                                        de expedici&oacute;n</em></font><em> </em></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">&nbsp;</td>
                                                    </tr>
                                                    <% if (solicitud.elementAt(18).equals("M"))
                                                        {%>
                                                    <tr>
                                                        <td width="22%">Libreta
                                                          militar No:</td>
                                                        <td width="13%">DM:</td>
                                                        <td>Fecha de expedici&oacute;n: </td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong><%=solicitud.elementAt(8)%></strong></td>
                                                        <td><strong><%=solicitud.elementAt(9)%></strong></td>
                                                        <td>                                                               
                                                          <strong><%=solicitud.elementAt(10)%></strong></td>
                                                    </tr>
                                                    <% }%>
                                                    <tr>
                                                        <td colspan="4"><hr></td>
                                                    </tr>
                                                </table> 
												<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
                                                    <tr>
                                                        <td colspan="2">Residencia:</td>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="9%">Direcci&oacute;n:&nbsp;&nbsp;</td>
                                                        <td width="30%"><strong><%=solicitud.elementAt(12)%></strong></td>
                                                        <td width="7%">Ciudad:&nbsp;&nbsp; 
                                                        </td>
                                                      <td width="54%"><strong><%=solicitud.elementAt(16)%></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        Tel&eacute;fono:&nbsp;&nbsp;                        </td>
                                                      <td><strong><%=solicitud.elementAt(13)%></strong></td>
                                                        <td>Celular:&nbsp;&nbsp;</td>
                                                        <td><strong><%=solicitud.elementAt(4)%></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>email:</td>
                                                        <td><strong><%=solicitud.elementAt(5)%></strong></td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4"><hr></td>
                                                    </tr>
                                                </table>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
                                                    <tr>
                                                        <td colspan="2">Entidad
                                                        donde trabaja:</td>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td width="14%">Nombre:&nbsp;&nbsp;</td>
                                                        <td width="26%"><strong><%=exper.elementAt(0)%></strong></td>
                                                        <td width="7%">Cargo:&nbsp;&nbsp; 
                                                        </td>
                                                        <td width="53%"><strong><%=exper.elementAt(1)%></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        Jefe inmediato:&nbsp;&nbsp;                        </td>
                                                        <td><strong><%=exper.elementAt(2)%></strong></td>
                                                        <td>Tel&eacute;fono:&nbsp;&nbsp;</td>
                                                        <td><strong><%=exper.elementAt(3)%></strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4"><hr></td>
                                                    </tr>
                                                </table>                   
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tabla">
                                                    <tr>
                                                        <td colspan="2">Informaci&oacute;n
                                                          de los padres:</td>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        
                  <td width="7%">Padre:&nbsp;&nbsp;</td>
                                                        
                  <td width="37%"><strong><%=respp.elementAt(3)%></strong></td>
                                                        
                  <td width="9%">Profesi&oacute;n:&nbsp;&nbsp; </td>
                                                        
                  <td width="47%"><strong> 
                    <% 
                                                                Vector tmpprof;
                                                                for(int j=0; j< profesiones.size(); j++){
                                                                    tmpprof = (Vector)profesiones.elementAt(j);
                                                                    if(tmpprof.elementAt(0).equals(respp.elementAt(4)))
                                                                        out.println(tmpprof.elementAt(1));
                                                                }
                                                                %>
                    </strong></td>
                                                    </tr>
                                                    <tr>
                                                        
                  <td width="7%"> Madre:&nbsp;&nbsp; </td>
                                                        
                  <td width="37%"><strong><%=respm.elementAt(3)%></strong></td>
                                                        
                  <td width="9%">Profesi&oacute;n:&nbsp;&nbsp;</td>
                                                        
                  <td width="47%"><strong> 
                    <% 
                                                                for(int j=0; j< profesiones.size(); j++){
                                                                    tmpprof = (Vector)profesiones.elementAt(j);
                                                                    if(tmpprof.elementAt(0).equals(respm.elementAt(4)))
                                                                        out.println(tmpprof.elementAt(1));
                                                                }
                                                                %>
                    </strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4"><hr></td>
                                                    </tr>
                                                </table>                    
                                                
              <p align="justify">NOTA: Si no puede asistir a la ceremonia de entrega 
                de diplomas, debe dar poder mediante documento escrito, a un familiar 
                o a su acudiente para recibir el diploma, en la ceremonia de grado. 
                Esta comunicaci&oacute;n debe dirigirla al Secretario General 
                y entregarla en la Oficina de Coordinaci&oacute;n de Grados bloque 
                A primer piso. De igual manera debe hacer llegar debidamente firmado 
                el Juramento con una carta dirigida al Consejo Directivo donde 
                informa que tiene conocimiento y lo va a cumplir.<br>
                NOTA: PARA PRESENTAR SU SOLICITUD DE GRADO DEBE CUMPLIR CON LOS 
                REQUISITOS EXIGIDOS POR EL REGLAMENTO ESTUDIANTIL Y LA LEY.<br>
                Declaro que conozco el procedimiento de grado y las fechas establecidas 
                y acepto que el incumplimiento de ellos conlleva mi exclusi&oacute;n 
                de la Ceremonia de Grados Colectiva prevista para esta promoci&oacute;n. 
                As&iacute; mismo, acepto en su<br>
                totalidad las calificaciones, que hasta la fecha est&aacute;n 
                consignadas en mi registro acad&eacute;mico. 
              <p>&nbsp;</p>
                                                <p>____________________________________________ &nbsp; &nbsp;Fecha actualizaci&oacute;n
                                                  datos: <%=solicitud.elementAt(15)%><br>
                                                Firma</p>
                                                
                                                <p align="center">
                                                  <%if(impr == null){%>
                <form name="form1" method="post" action="">
                    <div align="center">
                        <input name="imprimir" type="submit" id="imprimir" value="Imprimir" class="boton" onclick="javascript: return enviar();">
                    </div>
            </form>
            <%}%>
                                                  <br>
                                            </p>
                                          </td>
                                        </tr>
                    </table>  </fieldset>                  </td>
                </tr>
                <%if(impr == null){%> 
            </table>
        </div><!--container-->
           <footer style="position: static">
    <div class="container">
        <div class="row">
            <div class="col-8 oferta-academica">
                <ul>
                <h6>Oferta Educativa</h6>  
                   <li>Carreras profesionales</li>
                   <li>Especializaciones</li>
                   <li>Maestrías</li>
                   <li>Doctorado</li>
                   <li>Educación Continuada</li>
                   <li>Escuela Internacional de Verano</li> 
               </ul>
                
            </div>
            <div class="col localizacion-redes">
                <ul> 
                    <li><img width="60%" height="60%" src="img/Navegacion/acreditacion.png" class="img-fluid" alt="acreditación institucional"></li><br>
                   <li>
                     <div class="row">
                         <div class="col-1 mr-2">
                            <img src="img/Navegacion/icono-localizacion.png" alt="localizacion">
                        </div>
                         <div class="col ml-1">
                             <p>AK. 45 n.º 205 - 59 (Autopista Norte)
                             <br>PBX: +57 (1) 668 3600 - Bogotá
                             <br>Línea nacional gratuita: 018000112668</p>
                         </div>
                     </div>
                   </li>
                   <li>
                       <ul class="list-inline">
                           <li class="list-inline-item"><a href="https://www.facebook.com/EscuelaIng/" target="_blank"><img src="img/Navegacion/icono-facebook.png" class="img-fluid" alt="facebook"></a></li>
                           <li class="list-inline-item"><a href="https://twitter.com/Escuelaing" target="_blank"><img src="img/Navegacion/icono-twitter.png" class="img-fluid" alt="twitter"></a></li>
                           <li class="list-inline-item"><a href="https://www.linkedin.com/school/escuela-colombiana-de-ingenieria/" target="_blank"><img src="img/Navegacion/icono-linkedin.png" class="img-fluid" alt="linkedin"></a></li>
                           <li class="list-inline-item"><a href="https://www.instagram.com/somoscivilescuelaing/" target="_blank"><img src="img/Navegacion/icono-instagram.png" class="img-fluid" alt="instagram"></a></li>
                           <li class="list-inline-item"><a href="https://www.youtube.com/user/escuelacolingenieria" target="_blank"><img src="img/Navegacion/icono-youtube.png" class="img-fluid" alt="youtube"></a></li>
                       </ul>
                   </li>
               </ul>
            </div>
            <div class="col-12 derechos-reservados">
                <p>
                    Todos los derechos reservados ©2011 - Escuela Colombiana de Ingeniería Julio Garavito. Personería Jurídica 086 de enero 19 de 1973. Renovación de Acreditación Institucional de Alta Calidad. Resolución 002710 del 18 de marzo de 2019 (vigencia de 6 años). Vigilada por Mineducación.
                </p>
            </div>
        </div>
    </div>
</footer>
    </body>
    
</html>
</html>
<%}%>