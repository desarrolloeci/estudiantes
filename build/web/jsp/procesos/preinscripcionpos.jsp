<%-- 
    Document   : prinscripcionpos
    Created on : 05/06/2013, 11:33:11 AM
--%>

<%@ include file="../secure.jsp" %>
<%@ page contentType="text/html"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties,java.lang.reflect.Array,java.lang.String" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%
        Vector prei = new Vector();
        Vector preadic = new Vector();
        Vector infact = new Vector();
        Vector infperr = new Vector();
        Estudiante est = (Estudiante) session.getAttribute("estClase") ;
        response.setHeader("Cache-Control", "no-cache");
        String nombre = new String((String) session.getAttribute("nombre"));
        String ind = request.getParameter("ind");
        String mensaje = "";
        String nomas, prioas, color, cha = new String(), chb = new String(), per, asig = "", firma = "";
        int nvoper = 0, maxcred = 0, val_fini = -1, hoy = -1, val_ffin = -1, val_afini = -1, val_affin = -1, valn_afini = -1, valn_fini = -1 ;
        int i, crtot, cras, cradic, totalcred = 0, indacta = 0, prim = 0, seg = 0, lon = 0;
        String perins = "", clave = "";
        String prog = new String();
        configECI confEci = new configECI();
        PrintWriter oout = response.getWriter();
       // Estudiante est = new Estudiante(carnet, oout);

        if (!ind.equals("-1"))
            mensaje = (String)session.getAttribute("mensajer");

        String idplan = est.getidplan() ;
        String idprog = est.getIdprog() ;
        String estado = est.getEstado() ;

        //==Busco periodo de registro de asig para el programa
        Vector pera = est.getInfPerA(idprog);
        if(pera.size() > 0) {
           for (int ll = 0; ll < pera.size(); ll++) {
                infperr = (Vector) pera.elementAt(ll);
                perins = infperr.elementAt(0).toString();
                if (!infperr.elementAt(2).equals("No disponible")){
                    val_fini = Integer.parseInt(infperr.elementAt(2).toString());
                    hoy = Integer.parseInt(infperr.elementAt(3).toString());
                    val_ffin = Integer.parseInt(infperr.elementAt(6).toString());
                    val_afini = Integer.parseInt(infperr.elementAt(7).toString());
                    val_affin = Integer.parseInt(infperr.elementAt(8).toString());
                    valn_afini = Integer.parseInt(infperr.elementAt(9).toString());
                    valn_fini = Integer.parseInt(infperr.elementAt(10).toString());
                }
            }
            if((hoy >= val_fini) && (val_ffin >= 0) && (valn_fini <= 0)) { //Primeras fechas de registro
                prim = 1 ;
                }
            if((hoy >= val_afini) && (val_affin >= 0) && (valn_afini <= 0)) { //Segunda fechas de registro asig adicionales
                seg = 1 ;
                }

            }

        //HttpSession   sesion;      
        session.setAttribute("perinsc", perins);
        session.setAttribute("idplan", idplan);
        //== Buscar Información del Acta de Matrícula
        Vector acta = est.getInfActa(perins, carnet);
       /* if (acta.size() > 0){
            for (int l = 0; l < acta.size(); l++) {
                infact = (Vector) acta.elementAt(l);
                firma = infact.elementAt(0).toString();
            }
            if (firma.equals("NF"))
                indacta = 0;
            else
                indacta = 1 ;
         }*/
        
        Vector lispre = est.getAsigPos(idplan, perins, carnet);
        Vector adiciona = est.getAdicionaBiblia(perins, carnet);
        
        Vector credito = (Vector) est.getCreditos(carnet).elementAt(0);
        Vector periodo = est.getPeriodoAc(carnet);
        String cant = "";
        Vector pering = new Vector();
        pering = (Vector) periodo.elementAt(0);
        per = pering.elementAt(0).toString();
    
%>


<html>
    <head>
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Preinscripciones</title>
    </head>
<script language="javascript">

     function ventanaSecundaria (URL){
            var asigna = document.form1.asigna.value;
            var hor = "";        
            for(i=0;i<document.form1.horar.length;i++){
                    if(document.form1.horar[i].checked)
                         hor = document.form1.horar[i].value;
             }
            window.open("BuscarAsigPos?asigna="+asigna+"&hor="+hor+"", "form1","width=900,height=600, scrollbars=yes,top=80,left=400");
        }

        function ventanaSecundaria1 (URL){
            var asigna = document.form2.nomasig.value;
            var hor = "";
            window.open("BuscarAsigAPos?asigna="+ asigna, "form2","width=900,height=600, scrollbars=yes,top=80,left=400");
        }
<!--
/*------------------------------------------------------------------
	function Validar Eliminacion del CheckBox
------------------------------------------------------------------*/
function comprueba( ){
    var max = document.fmEliminar.checEli.length ;
    //var asigna = document.form1.asigna.value;
    //alert ("valor max: " +max);
    	var vall = false
	var k = 0
	for ( i=0 ; i<max ; i++ ){
		if  (document.fmEliminar.checEli[i].checked == true) {
			vall =true
			k++ ;
			}
	}

    if ((vall == true))
		document.fmEliminar.submit()
	else
	if ((vall == false) && (document.fmEliminar.checEli.checked == true) )
		document.fmEliminar.submit()
	else{
		alert ("Debe seleccionar alguna asignatura a eliminar.")
                return false;
        }
   
  return false;
}




function ValidarChk(){
	var max = document.fmArchivos.checEli.length
       // alert ("valor max: " +max);
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
	else{
		alert ("Debe seleccionar alguna asignatura a registrar.")
                return false;
        }
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
  <body style="background-color: white">
        <div id="container">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0" class="tabla">
                <tr>
                    <td colspan="2" bgcolor="#EEEEEE"><img src="img/top.gif" alt="" width="770" height="10" id="top" /></td>
                </tr>
                <tr>
                    <td>
                        <jsp:include page="encabezado" flush="true">
                            <jsp:param name="anterior" value="menuServEstud" />
                        </jsp:include>
                    </td>
                </tr>
  

                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666"> <label id="msj">Registro de Asignaturas</label>
                            </font></h2>
                    </div></td>
                </tr>
<%//if ((estado.equals("-179")) || (estado.equals("-94")) || (estado.equals("-91")) || (estado.equals("-96")) || (estado.equals("-183")) || (estado.equals("-102"))){ //== Estados válidos
  if ((estado.equals("-94")) || (estado.equals("-91")) ){ //== Estados válidos, sa dejan solo estos dos estados por solicitud de Johanna Hurtado en la fecha 24 de noviembre de 2017.
//if (indacta == 1) { //==Si ya firmo el acta
   // if((hoy >= val_fini) && (val_ffin >= 0)) { //Si esta dentro de la fecha programada de registo
    if((prim == 1) || (seg == 1)) { //Si esta dentro de la fecha programada de registo%>
       <tr>
                    <td>
 <table width="100%" border="0" align="center" class="tabla">

           <%lon = Integer.parseInt(ind.toString());
           if (lon > 0){
           String[] result = mensaje.split("/");
            for (int ii = 0; ii < result.length; ii++) {
          %><tr> <td>
                   <div id="mensaje" align="center" style="color: red"><%=result[ii]%><br></div>  </td>
                   </tr>
                <%

            }%>
            <tr> <td>
            <div id="mensaje1" align="center" style="color: red">
                <p>"Recuerde que este proceso es válido únicamente en el momento 
                  que se realice y legalice el pago del mismo. De acuerdo con 
                  esta solicitud se generará la orden de matrícula que corresponderá 
                  al número de créditos de las asignaturas inscritas. Secretaría 
                  General."</p>
               
              </div>
            </td>
            </tr>

            <%}%>
            <tr><td>
              <p align="center"><b><font size="3"><a href="http://tycho.escuelaing.edu.co/contenido/estudiantes/MANUALREGISTROASIGNATURASPOSGRADOS.pdf" TARGET="blank">Consulte 
                aqu&iacute; el Manual de Registro de Asignaturas </a> </font></b></p>

                </td></tr>
 </table>   
        <table width="100%" border="0" align="center" class="tabla">          
          <tr> 
            <td colspan="3" valign="top"> <div align="center"> <font  color="#666666">Seleccione de la lista de asignaturas disponibles aquellas de desee Inscribir.</font><br></div></td>
          </tr>
          <tr> 
            <td width="47%" valign="top"> 
              <center>
                <b><font color="#000000">Asignaturas Inscritas</font> </b> 
              </center>
              <form name="fmEliminar" method="POST" action="InscripAsigPos" onSubmit="return comprueba();">
               <div style="height:180px;width:360px;overflow:auto;">
                <table width="100%" border="1" class="tabla">
                  <tbody id="preinscritas"> 
                  <tr bgcolor="#336699"> 
                    <td width="5%"><font color="#FFFFFF"><b>Código - Grp</b></font></td>
                    <td width="70%"><font color="#FFFFFF"><b>Nombre</b></font></td>
                    <td width="1%"><font color="#FFFFFF"><b>Créditos</b></font></td>
                    <td width="2%"> 
                      <div align="center"><b><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Seleccione</font></b></div>
                    </td>
                  </tr>
                  <%  crtot = 0;
        cradic = 0;
        for (i = 0; i < adiciona.size(); i++) {
            preadic = (Vector) adiciona.elementAt(i);
            clave = (String) preadic.elementAt(5) ;%>
                  <tr> 
                    <td width="5%"> 
                      <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#666666"> 
                        <%=(String) preadic.elementAt(1)%> Grp(<%=(String) preadic.elementAt(4)%>) 
                        </font> </div>
                    </td>
                    <td width="70%"> 
                      <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#666666"> 
                        <%=(String) preadic.elementAt(2)%> </font> </div>
                    </td>
                    <td width="1%"> 
                      <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#666666"> 
                        <%=(String) preadic.elementAt(3)%> </font> 
                    </td>
                    <td width="28%" id="columna"> 
                      <div align="center">
                       <%if (prim == 1) {%>
                        <input type="checkbox" name="checEli" onClick="chkUn()" value="<%=preadic.elementAt(0)%>,1,<%=preadic.elementAt(1)%>,"> <!--disabled-->
                       <%}else{
                        if(clave.equals("A")){%>
                            <input type="checkbox" name="checEli" onClick="chkUn()" value="<%=preadic.elementAt(0)%>,1,<%=preadic.elementAt(1)%>,">
                            <%}else{%>
                            <input type="checkbox" name="checEli" onClick="chkUn()" value="<%=preadic.elementAt(0)%>,1,<%=preadic.elementAt(1)%>," disabled>
                            <%}%>
                       <%}%>
                      </div>
                    </td>
                  </tr>
                  <%}%>
                  </tbody> 
                </table>
                  </div>
                <div align="center"> 
                  <p>                  
                   <!-- <input name="B1" type="submit" onClick="return ValidarChk()" class="boton" value=" Quitar -> ">-->

                     <input type="submit" class="boton" value=" Quitar -> ">
                    <input type="hidden" name="ban" size="2" value="0">
                  </p>
                </div>
                <input type="hidden" name="valor" size="2" value="1">
              </form>
              <%
        if (request.getParameterValues("marcar") != null) {
            String[] recoger = new String[10];
            recoger = request.getParameterValues("marcar");
            for (int x = 0; x < recoger.length; x++) {
                out.print(recoger[x]);
            }
        }%>
            </td>
            <td width="3%">&nbsp; 
            <td width="50%" valign="top"> 
              <center>
                <b><font color="#000000">Asignaturas disponibles que puede Inscribir 
                </font> </b> 
              </center>
              <form name="fmArchivos" method="POST" action="InscripAsigPos">
                  <!--<div id="Layer1" style="position:absolute; left:95px; top:27px; width:105px; height:51px; z-index:1; overflow: auto;"> Aqui pones todo el texto y cuando te cubra te saldra el scroll. </div>-->
              <div style="height:180px;width:360px;overflow:auto;"> <!--overflow:scroll-->
                <table width="100%" border="1" class="tabla">
                  <tbody id="asignaturas"> 
                  <tr bgcolor="#336699"> 
                    <td width="5%"><font color="#FFFFFF"><b>Código</b></font></td>
                    <td width="1%"><font color="#FFFFFF"><b>Créditos</b></font></td>
                    <td width="65%"><font color="#FFFFFF"><b>Nombre</b></font></td>
                    <td width="5%"><font color="#FFFFFF"><b>Grupo</b></font></td>
                    <td width="2%"> 
                      <div align="center"><b><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Seleccione</font></b></div>
                    </td>
                  </tr>
                  <%  crtot = 0;
        cradic = 0;
        for (i = 0; i < lispre.size(); i++) {
            prei = (Vector) lispre.elementAt(i);
            nomas = "as" + i;
            prioas = "pr" + i;
            cras = (Integer.valueOf((String) prei.elementAt(2))).intValue();     %>
                  <tr> 
                    <td width="5%"> 
                      <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#666666"> 
                        <%=(String) prei.elementAt(3)%> </font> </div>
                    </td>
                    <td width="1%"> 
                      <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#666666"> 
                        <%=(String) prei.elementAt(2)%></font> 
                    </td>
                    <td width="65%"> 
                      <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#666666"> 
                        <%=(String) prei.elementAt(4)%> </font> </div>
                    </td>
                    <td width="5%"> 
                      <div align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="1" color="#666666"> 
                        <%=(String) prei.elementAt(5)%> </font> </div>
                    </td>
                    <td width="28%"> 
                      <div align="center">
                       <%if (prim == 1) {%>
                        <input type="checkbox" name="checEli" onClick="chkUn()" value="<%=prei.elementAt(0)%>,<%=prei.elementAt(7)%>,<%=prei.elementAt(2)%>,<%=prei.elementAt(5)%>,<%=prei.elementAt(8)%>,<%=prei.elementAt(3)%>,">
                        <%}else{%>
                        <input type="checkbox" name="checEli" onClick="chkUn()" value="<%=prei.elementAt(0)%>,<%=prei.elementAt(7)%>,<%=prei.elementAt(2)%>,<%=prei.elementAt(5)%>,<%=prei.elementAt(8)%>,<%=prei.elementAt(3)%>," disabled>
                        <%}%>
                      </div>
                    </td>
                  </tr>
                  <%}%>
                  </tbody> 
                </table>
                  </div>
                <div align="center"> 
                  <p>
                  <%if (prim == 1) {%>
                    <input name="B1" type="submit" onClick="return ValidarChk()" class="boton" value="<-Inscribir">
                  <%}else{%>
                    <input name="B1" type="submit" onClick="return ValidarChk()" class="boton" value="<-Inscribir" disabled>
                  <%}%>
                  </p>
                </div>
                <input type="hidden" name="valor" size="2" value="0">
                 <input type="hidden" name="ban" size="2" value="0">
              </form>
            </td>
          </tr>
        </table>  <table width="70%" border="0" align="center" class="tabla">
                  <tr> 
                    <td width="45%" valign="top" align ="center"><b>Buscar Horario Asignatura</b>
                      <form name="form1" method="get" action="javascript:ventanaSecundaria('BuscarAsigPos')">
                       Cód Asignatura: <input type="text" name="asigna" size="30" maxlength="30"><font size="1" color="#666666"> Ejemplo: SMDI(M)</font>
                        <br>
                        &nbsp;&nbsp;Horario Semanal&nbsp; 
                        <input name="horar" type="radio" value="1" checked>
                        &nbsp;&nbsp;Calendario Académico&nbsp; 
                        <input name="horar" type="radio" value="2"><br>
                        <input type="submit" name="" value="Buscar" >
                      </form>
                    </td>
                  </tr>
                </table>
        <!-- Si está activa la segunda fecha se muestra la opción para registrar asignaturas ssadicionales-->
      <%if ((prim == 0) && (seg == 1)){%>
        <hr>        
         <table width="90%" border="0" align="center" class="tabla">
              <tr>
                    <td width="45%" valign="top" align ="center"><b> Buscar Asignaturas Adicionales que desea registrar</b>
                      <form name="form2" method="get" action="javascript:ventanaSecundaria1('BuscarAsigAPos')">
                       Código o  nombre asginatura: <input type="text" name="nomasig" size="30" maxlength="30"><font size="1" color="#666666"> Ejemplo: SMDI(M)</font>
                        <br><br>
                        &nbsp;&nbsp;
                        <input type="submit" name="" value="Buscar" >
                      </form>
                    </td>
                  </tr>
                </table>
<%}%>
                    </td>
                </tr>

       <!-- else-->
   <%}else{%>
       <tr>
           <td><p>&nbsp;</p>
               <div align="center"><b><font color="#666666" size="1" face="Verdana, Arial, Helvetica, sans-serif">EL PROCESO DE REGISTRO DE ASIGNATURAS PARA ESTE PROGRAMA NO ESTA HABILITADO.</font></b></div>
               <p>&nbsp;</p>
           </td>
       </tr>
       <%}%>
<%//else de estado
}else{%>
    <tr>
       <td><p>&nbsp;</p>
               <div align="center"><b><font color="#666666" size="1" face="Verdana, Arial, Helvetica, sans-serif">ESTUDIANTE NO AUTORIZADO PARA REALIZAR ESTE PROCESO.</font></b></div>
               <p>&nbsp;</p>
       </td>
    </tr>
       <%}%>

            </table>
        </div>
        <h1>&nbsp;</h1>
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
