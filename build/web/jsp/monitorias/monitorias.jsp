<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<%  
    Vector moni = new Vector() ;
    Vector nasig = new Vector() ;
    Vector namon = new Vector();
    Vector per = new Vector() ;
    Vector asigc = new Vector();
    //Vector asigc2 = new Vector();
    //Vector asigc3 = new Vector();
    Vector nperd = new Vector() ;
    Vector nomasig = new Vector();
    Vector nomasig2 = new Vector();
    Vector nomasig3 = new Vector();
    Vector noma = new Vector();
    Vector noma2 = new Vector();
    Vector noma3 = new Vector();
    int canta = -1, canta2 = -1, canta3 = -1, cnot = -1, cnot2 = -1, cnot3 = -1, numa = 0;
    String nombre = "", nombre2= "", nombre3="";
    response.setHeader("Cache-Control","no-cache");
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    String asig_1 = request.getParameter("asig1");
    String asig_2 = request.getParameter("asig2");
    String asig_3 = request.getParameter("asig3");
    
    configECI cfgEci = new configECI();
    String persig = cfgEci.getPeriodoSig() ;
    PrintWriter oout = response.getWriter() ;
    
   
    //Se valida si las asignaturas son de planes nuevos y se transforman a las de planes antiguos para que se validen en la biblia de los monitores
    Vector asigsEq1 = est.EquivAsigMonitores(oout, asig_1, persig, "RENOVACION CURRICULAR");
    //Si la asignatura es un laboratorio se transforma en la teorica equivalente
    Vector labEq1 = est.EquivAsigMonitores(oout, asig_1, persig, "LABORATORIO");
    if(asigsEq1.size()>0){
        asig_1=((Vector) asigsEq1.get(0)).get(0).toString();
    }else if(labEq1.size()>0){
        asig_1=((Vector) labEq1.get(0)).get(0).toString();
    }
    Vector asigsEq2 = est.EquivAsigMonitores(oout, asig_2, persig, "RENOVACION CURRICULAR");
    Vector labEq2 = est.EquivAsigMonitores(oout, asig_2, persig, "LABORATORIO");
    if(asigsEq2.size()>0){
        asig_2=((Vector) asigsEq2.get(0)).get(0).toString();
    }else if(labEq2.size()>0){
        asig_2=((Vector) labEq2.get(0)).get(0).toString();
    }
    Vector asigsEq3 = est.EquivAsigMonitores(oout, asig_3, persig, "RENOVACION CURRICULAR");
    Vector labEq3 = est.EquivAsigMonitores(oout, asig_3, persig, "LABORATORIO");
    if(asigsEq3.size()>0){
        asig_3=((Vector) asigsEq3.get(0)).get(0).toString();
    }else if(labEq3.size()>0){
        asig_3=((Vector) labEq3.get(0)).get(0).toString();
    }
    

    
	//String cha = new String(), chb = new String();
	//String prog = new String();
    
    if (asig_1 == null || asig_1.equals("0")) {
      asig_1 = "0";
    }else{
      nomasig = est.NombreAsig(oout, asig_1);
      noma = (Vector) nomasig.elementAt(0);
      nombre = noma.elementAt(0).toString();
    }
    if (asig_2 == null || asig_2.equals("0")) {
      asig_2 = "0";
    }else{
      nomasig2 = est.NombreAsig(oout, asig_2);
      noma2 = (Vector) nomasig2.elementAt(0);
      nombre2 = noma2.elementAt(0).toString();
    }
    if (asig_3 == null || asig_3.equals("0")) {
      asig_3 = "0";
    }else{
      nomasig3 = est.NombreAsig(oout, asig_3);
      noma3 = (Vector) nomasig3.elementAt(0);
      nombre3 = noma3.elementAt(0).toString();
    }
    // Estudiante est = new Estudiante(carnet,oout) ;
    
    
    //Vector lispre = est.getPreinscripcion(carnet) ;
    Vector mon = est.getMonitorias(carnet) ;
    Vector asigmon = est.getAsigmonitorias(persig) ;
    Vector noasig = est.getNroasigmon(carnet, persig) ;
    Vector perbib = est.getUltPer(carnet) ;
    Vector asiginsc = est.getAsigInsc(carnet, persig);
    int i, not, not1, sem, s, ban  = 0, cantper = -1, tam ;
    String  notacum, notsem, peracad = "0";
    nasig = (Vector) noasig.elementAt(0) ;
    int nsol  = (Integer.valueOf((String) nasig.elementAt(0))).intValue() ;

    //Buscar amonestaciones
    Vector amonest = est.getAmonest(carnet) ;
    namon = (Vector) amonest.elementAt(0) ;
    numa  = (Integer.valueOf((String) namon.elementAt(0))).intValue() ;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad&eacute;micos - Solicitud Monitorias</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
       

<script language="javascript">
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
		alert ("Para eliminar tiene que seleccionar algun recurso")

	//else {
		//document.fmArchivos.submit()
		//document.fmArchivos.submit()
		//}
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

function CambiarFormulario(){
            document.formulario.action='Monitorias';
            document.formulario.submit();

        }
//-->   

</script>
  <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">

    </head>
    <body id="public" style="background-color: white">
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
                            <h2><font color="#666666">
                                    <label id="msj">Solicitud de Monitorias:  <%=persig%></label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
                <%
  not = 0;
    not1 = 0;
    s = 0 ;
//SE VALIDA QUE EXISTA INFORMACION DEL ESTUDIANTE EN BIBLIA

 if(mon.size() > 0){
  //BUSCAR INFORMACION DE CUANTAS MATERIAS PERDIO EL SEMESTRE ANTERIOR - se quita de la validación. nov 26 de 2010, se coloca nuevamente en 2017.
  if(perbib.size() > 0){
         per = (Vector) perbib.elementAt(0) ;
         peracad =  (String) per.elementAt(0);
    }
    Vector perdidas = est.getPerdidas(carnet, peracad) ;  
    nperd = (Vector) perdidas.elementAt(0) ;
    cantper  = (Integer.valueOf((String) nperd.elementAt(0))).intValue() ;

  if (cantper == 0 && numa == 0){//verifica si no perdio asignaturas en el semestre anterior*/

   //====================Busco si la asignatura la perdio o la curso una vez y la aprobo
    if(!asig_1.equals("0")){
        canta = -1;
        Vector asiga = est.getAsigA(carnet, asig_1, "1") ;
        if(asiga.size() > 0){
         asigc = (Vector) asiga.elementAt(0) ;
         canta = (Integer.valueOf((String) asigc.elementAt(0))).intValue() ;
         //Se verifica si el estudiante fue eximido de una fundamentacion con fundExim
         Vector fundExim1 = est.EquivAsigMonitores(oout, asig_1, persig, "FUNDAMENTACION EXIMIDA");
         if (canta == 1){ //== Se valida si la aprobo
             asiga = est.getAsigA(carnet, asig_1, "2") ;
             if(asiga.size() > 0){
                 asigc = (Vector) asiga.elementAt(0) ;
                 cnot = (Integer.valueOf((String) asigc.elementAt(0))).intValue() ;
             }
         }else if(fundExim1.size()>0){
             //Se busca si fue eximido de alguna fundamentacion
             String noFund=((Vector) fundExim1.get(0)).get(0).toString();
             asiga = est.getAsigA(carnet, noFund, "1");
            if(asiga.size() > 0){
             asigc = (Vector) asiga.elementAt(0) ;
             canta = (Integer.valueOf((String) asigc.elementAt(0))).intValue() ;
             if (canta == 1){ //== Se valida si la aprobo
                 asiga = est.getAsigA(carnet, noFund, "2") ;
                 if(asiga.size() > 0){
                     asigc = (Vector) asiga.elementAt(0) ;
                     cnot = (Integer.valueOf((String) asigc.elementAt(0))).intValue() ;
                 }
             }
            }
         }
        }
     }

    if(!asig_2.equals("0")){
        canta2 = -1;
        Vector asiga2 = est.getAsigA(carnet, asig_2, "1") ;
        if(asiga2.size() > 0){
         asigc = (Vector) asiga2.elementAt(0) ;
         canta2 = (Integer.valueOf((String) asigc.elementAt(0))).intValue() ;
         //Se verifica si el estudiante fue eximido de una fundamentacion con fundExim
         Vector fundExim2 = est.EquivAsigMonitores(oout, asig_2, persig, "FUNDAMENTACION EXIMIDA");
         if (canta2 == 1){ //== Se valida si la aprobo
             asiga2 = est.getAsigA(carnet, asig_2, "2") ;
             if(asiga2.size() > 0){
                 asigc = (Vector) asiga2.elementAt(0) ;
                 cnot2 = (Integer.valueOf((String) asigc.elementAt(0))).intValue() ;
                 }
         }else if(fundExim2.size()>0){
             //Se busca si fue eximido de alguna fundamentacion
             String noFund2=((Vector) fundExim2.get(0)).get(0).toString();
             asiga2 = est.getAsigA(carnet, noFund2, "1");
            if(asiga2.size() > 0){
             asigc = (Vector) asiga2.elementAt(0) ;
             canta2 = (Integer.valueOf((String) asigc.elementAt(0))).intValue() ;
             if (canta2 == 1){ //== Se valida si la aprobo
                 asiga2 = est.getAsigA(carnet, noFund2, "2") ;
                 if(asiga2.size() > 0){
                     asigc = (Vector) asiga2.elementAt(0) ;
                     cnot2 = (Integer.valueOf((String) asigc.elementAt(0))).intValue() ;
                 }
             }
            }
         }
        }
     }

    if(!asig_3.equals("0")){
        canta3 = -1;
        Vector asiga3 = est.getAsigA(carnet, asig_3, "1") ;
        if(asiga3.size() > 0){
         asigc = (Vector) asiga3.elementAt(0) ;
         canta3 = (Integer.valueOf((String) asigc.elementAt(0))).intValue() ;
         //Se verifica si el estudiante fue eximido de una fundamentacion con fundExim
         Vector fundExim3 = est.EquivAsigMonitores(oout, asig_3, persig, "FUNDAMENTACION EXIMIDA");
         if (canta3 == 1){ //== Se valida si la aprobo
             asiga3 = est.getAsigA(carnet, asig_3, "2") ;
             if(asiga3.size() > 0){
                 asigc = (Vector) asiga3.elementAt(0) ;
                 cnot3 = (Integer.valueOf((String) asigc.elementAt(0))).intValue() ;
                 }
         }else if(fundExim3.size()>0){
             //Se busca si fue eximido de alguna fundamentacion
             String noFund3=((Vector) fundExim3.get(0)).get(0).toString();
             asiga3 = est.getAsigA(carnet, noFund3, "1");
            if(asiga3.size() > 0){
             asigc = (Vector) asiga3.elementAt(0) ;
             canta3 = (Integer.valueOf((String) asigc.elementAt(0))).intValue() ;
             if (canta3 == 1){ //== Se valida si la aprobo
                 asiga3 = est.getAsigA(carnet, noFund3, "2") ;
                 if(asiga3.size() > 0){
                     asigc = (Vector) asiga3.elementAt(0) ;
                     cnot3 = (Integer.valueOf((String) asigc.elementAt(0))).intValue() ;
                 }
             }
            }
         }
        }
     }
    //================================================================================
    for (i = 0; i < mon.size(); i++) {
        moni = (Vector) mon.elementAt(i) ;
%>
        <p><font face="Verdana, Arial, Helvetica,sans-serif" size="1"><b>Promedio Acumulado:</b> <%=(String) moni.elementAt(1)%> &nbsp;&nbsp;&nbsp;&nbsp;
        <b>Promedio Semestre:</b> <%=(String) moni.elementAt(2)%></font></p>
        <%  sem = (Integer.valueOf((String) moni.elementAt(3))).intValue() ;%>
        <!%=sem%>
        <%if (sem < 4)  { ban = 1 ;  //if (sem < 4)  { ban = 1 ;%>
        <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="2"><b>No puede realizar la solicitud ya que el semestre en que actualmente se encuentra es menor a cuarto.</b>
         </font></p>
       <%}else{
           notacum = moni.elementAt(1).toString();
           notsem = moni.elementAt(2).toString();
           if (notacum.compareTo("3.5") >= 0 )
                        not = 1;
            else
                        not = 0;

           if (notsem.compareTo("3.5") >= 0 )
                        not1 = 1;
            else
                        not1 = 0;

            //if(not == 1 || not1 == 1 || not == 0 || not == 0)

            if(not == 0 || not1 == 0) { ban = 1 ;
              out.println("<p><b>No puede realizar la solicitud ya que no cumple con ninguno de los requisitos de promedio</b></p>");
              }
            else {
               nasig = (Vector) noasig.elementAt(0) ;
               %>
           <form method="POST" action="GuardarMonitoria" name ="formulario">
                 
          <table width="80%" border="1" bordercolor="#336699" align="center">
            <tr bgcolor="#336699">
                  
              <td width="12%"> 
                <div align="center"><b><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Opciones</font></b></div>
                  </td>
                  
              <td width="56%"> 
                <p align="center"><b><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Lista de Asignaturas</font></b>
                  </td>
                  
              <td width="32%"> 
                <p align="center"><b><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Número Máximo de Monitorias</font></b>
                  </td>
                   </tr>
                   <tr>
                  
              <td width="12%"> 
                <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">1</font></b></div>
                  </td>
                  
              <td width="56%"> 
                <select name="asig1" onchange="CambiarFormulario();">
                    <%if ((canta == 1 && cnot == 1)&& !asig_1.equals("0")){%>
                       <option value="<%=asig_1%>" Selected><%=nombre%></option>
                        <%}else{%>
                       <option value="0" Selected>Seleccione</option>
                       <%}%>
                       <% for ( int k = 0 ; k < asigmon.size() ; k++ ){
                        Vector asigm = (Vector)asigmon.elementAt(k) ;
                       %>
                          <option value="<%=asigm.elementAt(0)%>"><%=asigm.elementAt(1)%></option>
                           <%}%>
                 </select>
                        <%if (canta > 1){%>
                        <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#B72400">La asignatura <%=nombre%> no se permite, porque se curso más de una vez. </font>
                        <%}else if(canta == 0){%>
                        <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#B72400">La asignatura <%=nombre%> no se ha cursado. </font>
                        <%}else if ((canta == 1) && (cnot == 0)){%>
                        <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#B72400">La asignatura <%=nombre%> no ha sido aprobada o no cumple con la nota minima de 3.8. </font>
                        <%}%>
                  </td>
                  
              <td width="32%" rowspan="3"> <font size="1" face="Verdana, Arial, Helvetica, sans-serif">Cuál 
                es el número máximo de monitorias que quiere dictar ? 
                <p>(Mínimo 1, Máximo 2)</p> 
                    <p align="center"><select name="nro">
                      <option   value="1">1</option>
                      <option   value="2">2</option>
                    </select></p>
                    </font>
                  </td>
                   </tr>
                  <tr>
                  
              <td width="12%"> 
                <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">2</font></b></div>
                  </td>
                  
              <td width="56%"> 
                <select name="asig2" onchange="CambiarFormulario();">
                      <%if ((canta2 == 1 && cnot2 == 1)&& !asig_2.equals("0")){%>
                       <option value="<%=asig_2%>" Selected><%=nombre2%></option>
                        <%}else{%>
                       <option value="0" Selected>Seleccione</option>
                       <%}%>
                       <% for ( int k = 0 ; k < asigmon.size() ; k++ ){
                        Vector asigm = (Vector)asigmon.elementAt(k) ;
                        %>
                          <option value="<%=asigm.elementAt(0)%>"><%=asigm.elementAt(1)%></option>
                           <%}%>
                    </select>
                    <%if (canta2 > 1){%>
                        <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#B72400">La asignatura <%=nombre2%> no se permite, porque se curso más de una vez. </font>
                        <%}else if(canta2 == 0){%>
                        <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#B72400">La asignatura <%=nombre2%> no se ha cursado. </font>
                        <%}else if ((canta2 == 1) && (cnot2 == 0)){%>
                        <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#B72400">La asignatura <%=nombre%> no ha sido aprobada o no cumple con la nota minima de 3.8. </font>
                        <%}%>
                  </td>
                   </tr>
                  <tr>
                  
              <td width="12%" height="32"> 
                <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">3</font></b></div>
                  </td>
                  
              <td width="56%" height="32"> 
                <select name="asig3" onchange="CambiarFormulario();">
                        <%if ((canta3 == 1 && cnot3 == 1)&& !asig_3.equals("0")){%>
                       <option value="<%=asig_3%>" Selected><%=nombre3%></option>
                        <%}else{%>
                       <option value="0" Selected>Seleccione</option>
                       <%}%>
                       <% for ( int k = 0 ; k < asigmon.size() ; k++ ){
                        Vector asigm = (Vector)asigmon.elementAt(k) ;
                        %>
                          <option value="<%=asigm.elementAt(0)%>"><%=asigm.elementAt(1)%></option>
                           <%}%>
                        </select>
                        <%if (canta3 > 1){%>
                        <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#B72400">La asignatura <%=nombre3%> no se permite, porque se curso más de una vez. </font>
                        <%}else if(canta3 == 0){%>
                        <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#B72400">La asignatura <%=nombre3%> no se ha cursado. </font>
                        <%}else if ((canta3 == 1) && (cnot3 == 0)){%>
                        <font size="1" face="Verdana, Arial, Helvetica, sans-serif" color="#B72400">La asignatura <%=nombre%> no ha sido aprobada o no cumple con la nota minima de 3.8. </font>
                        <%}%>
                  </td>
                   </tr>
                   </table>


   <% } %>
            <br>
              <input type="hidden" name="nsol" size="2" value="<%=nsol%>">
              <input type="hidden" name="per" size="2" value="<%=persig%>">
              <center><input name="B1" type="submit" class="boton" value="Enviar solicitud"></center>
            </form>
           <%}%>
     <%}%>
  <%}%> <!--if de materis perdidas-->
 <%if (cantper > 0){ %>
    <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="2"><b>No puede realizar la solicitud ya que perdio una asignatura en el semetre anterior. Periodo <%=peracad%></b>
      </font></p>
      <%}else if (numa > 0){ %>
    <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="2"><b>No puede realizar la solicitud ya que registra amonestaciones.</b>
      </font></p>
      <%}%>
              <!--<input type="hidden" name="ncampos" size="2" value="<!%=i%>">-->
			
                 </td>
                </tr>
		  <!--SEGUNDO FORM-->
                <tr>
                    <td>
  <%if (asiginsc.size() > 0 ) {%>
        <div align="center" class="piepag">
          <hr align="center" >
          <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="2"><b>MONITORIAS 
            SOLICITADAS</b> </font></p>
		   <form name="fmArchivos" method="POST" action="EliminarMonitoria">
            <table width="80%" border="1" bordercolor="#336699" align="center">
              <tr bgcolor="#336699"> 
                <td rowspan="2" width="22%"> 
                  <div align="center"><b><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><input type="checkbox" name="chAll" onClick="chkAll()"></font></b></div>
                </td>
                <td colspan="2"> 
                  <div align="center"><b><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Asignatura Solicitadas</font></b></div>
                </td>
              </tr>
              <tr  bgcolor="#336699"> 
                <td width="17%"> 
                  <div align="center"><b><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Cod_Asig</font></b></div>
                </td>
                <td width="61%"> 
                  <div align="center"><b><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif">Nombre</font></b></div>
                </td>
              </tr>
              <% for ( int m = 0 ; m < asiginsc.size() ; m++ ){
               Vector asiginscri = (Vector)asiginsc.elementAt(m) ;
               %>
              <tr> 
                <td width="22%"> 
                  <div align="center">
                    <input type="checkbox" name="checEli" onClick="chkUn()" value="<%=asiginscri.elementAt(0)%>">
                  </div>
                </td>
                <td width="17%"> 
                  <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=asiginscri.elementAt(1)%></font></b></div></td>
                <td width="61%">
                <div align="center"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=asiginscri.elementAt(2)%></font></b></div></td>
              </tr>
              <%}%>
            </table>
            <p>
              <input name="B1" type="submit" onClick="ValidarChk()" class="boton" value="Eliminar Asig de Solicitud">
            </p>
              </form>
              <%}%>

<% //ELSE DE DATOS EN BIBLIA
} else {%>
    <p align="center"><font face="Verdana, Arial, Helvetica,sans-serif" size="2"><b>No puede realizar la solicitud ya que no cumple con requisitos, favor verificarlos.</b></font>
    <%}%>
   
        </div></td>
                </tr>
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
