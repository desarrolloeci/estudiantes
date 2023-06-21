<%@ include file="../secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="java.text.*" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.Estudiante.EstudFin" %>

<%  
response.setHeader("Cache-Control","no-cache"); 
int tmp, dg, div, dgfin, dgfin2, modtmp;
String ref2, tmpchar, sec, nrocarne;
String nombre = new String((String)session.getAttribute("nombre"));
String ban = new String((String)session.getAttribute("ban"));
String igrad = new String((String) session.getAttribute("igrad"));
if(!igrad.equals("O")){
    response.sendRedirect("menuServEstud");
}else{
    Vector asig = new Vector () ;
    int i = 0 ;
    long val = 0;
    NumberFormat nf = NumberFormat.getIntegerInstance() ;    
    Vector tot = new Vector () ;    
    PrintWriter oout = response.getWriter() ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    //
    EstudFin estfin = new EstudFin();
    val = Integer.parseInt(estfin.getValDerGrad());
    nrocarne = carnet;
    int estado = Integer.parseInt(est.getEstado());
    while(nrocarne.length() < 7){
        nrocarne = "0" + nrocarne;
    }
    //Vector datos = (Vector)datosEst.elementAt(0);
    // Una Asignatura: 
    ref2 = "0506" + valref2(nrocarne);
    sec = "1212121212121212";
    dg = 0;
    for(i=0; i<ref2.length(); i++){
        tmpchar = String.valueOf(ref2.charAt(i));
        tmp = Integer.parseInt(tmpchar);
        tmpchar = String.valueOf(sec.charAt(i));
        tmp = tmp * Integer.parseInt(tmpchar);
        if(tmp >= 10){
            div = tmp/10;
            dg = dg + div + tmp%10;
        }else{
            dg = dg + tmp;
        }
    }
    modtmp = dg%10;
    if(modtmp > 0){
        dgfin = 10 - modtmp;
    }else{
        dgfin = 0;
    }
    /*if(imprimir == null){
        
    }*/
%>

<html>
<head>
<title>Servicios Academicos - Forma de Pago de derechos de Matrícula</title>
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

.texto {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-style: normal;
	line-height: normal;
	font-weight: bold;
	font-variant: normal;
	text-transform: none;
	text-decoration: none;
	color: #666666;
}

.texto2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-style: normal;
	line-height: normal;
	font-variant: normal;
	text-transform: none;
	text-decoration: none;
	color: #666666;
}
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">

<table width="640" border="0" cellpadding="0" align="center" cellspacing="0" class="texto2">
    <tr>     
    <td width="640" valign="top" height="255"> 
      <jsp:include page="encabezado" flush="true"/>
      <p align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#336699">
        <b>Forma de Pago de derechos de Grado</b></font></p>
      <p align="justify">Si desea realizar el pago de los derechos de grado a
        trav&eacute;s de Internet debe contar con una cuenta corriente o de ahorros
        de cualquier entidad bancaria nacional y tener las siguientes recomendaciones
      en cuenta:<br>
      <br>
&#8226; Por seguridad evite realizar este procedimiento desde un computador diferente
          al de su casa u oficina.<br>
&#8226; 
        Este proceso hace internamente varias operaciones por esa raz&oacute;n
          es posible que se presenten demoras.<br>
&#8226; No cancele el proceso prematuramente y no cierre la ventana.<br>
&#8226; 
        Si por alg&uacute;n motivo el proceso es cancelado, espere entre media
          hora y una hora para volver a intentarlo.<br>
&#8226; Verifique que el pago fue debitado de su cuenta.<br>
&#8226; 
        Este procedimiento se realiza &uacute;nicamente a trav&eacute;s de los
          links (enlaces) oficiales de la Escuela Colombiana de Ingenier&iacute;a,
          por lo tanto no de informaci&oacute;n personal a trav&eacute;s de otros
      links enviados por correo electr&oacute;nico o mensajes sospechosos.</p>
      <p align="justify">&#8226; Una vez realizado el pago, imprima el recibo de confirmaci&oacute;n
        de la operaci&oacute;n y entregue una copia a la Oficina de Coordinaci&oacute;n
      de grados, indicando el n&uacute;mero de carn&eacute; y nombre del graduando. <br>
      <br>
      Al hacer click en <strong>PAGAR</strong> seleccione
      el tipo de cliente (persona natural o jur&iacute;dica) y la entidad bancaria
      desde donde va a realizar la transacci&oacute;n y siga las instrucciones
      que le solicitan para realizar el proceso de pago.      </p>
      <table width="100%" border="0" align="center"  class="texto">
        <tr>
            <td>
            <form method="POST" action="https://www.edinet.com/pse/pago.aspx">
            <table align="center" border="1" width="640"  class="texto">
            <tr>
                <td width="30%">
                    <b> Documento </b></td>
                <td width="70%"><%=est.getDocest()%></td>
            </tr>
            <tr>
                <td width="30%">
                    <b> Estudiante</b></td>
                <td width="70%"><%=nombre%></td>
            </tr>
            <tr>
                <td width="30%">
                    <b> Código del estudiante </b></td>
                <td width="70%"><%=valref2(nrocarne)%><%=dgfin%></td>
            </tr>
            <tr>
                <td width="30%">
                    <b> Valor </b></td>
                <td width="70%">$ <%=nf.format(val)%></td>
            </tr>
            <tr>
                <td width="30%">
                    <b> IVA </b></td>
                <td width="70%">$ 0.00</td>
            </tr>
            <input type="hidden" name="Id" value="159cd765-1498-4806-a743-51ae33fc911c">
            <input type="hidden" name="CodigoServicio" value="8600348113">
            <input type="hidden" name="NoFact" maxlength="80" value="<%=valref2(nrocarne)%><%=dgfin%>">
            <input type="hidden" name="Ref1" maxlength="80" value="<%=est.getDocest()%>">
            <input type="hidden" name="Ref2" maxlength="80" value="<%=nombre%>">
            <input type="hidden" name="Ref3" maxlength="80" value="<%=valref2(nrocarne)%><%=dgfin%>">
            <input type="hidden" name="Valor" maxlength="10" value="<%=val%>">
            <input type="hidden" name="Iva" maxlength="8" value="0">           
            </table>
              <p align="center" >
                <input type="hidden" name="casig" value="0">
                <input type="submit" value="PAGAR" name="B1"></p>
            </form>
            </td>
        </tr>
        <tr> 
          <td valign="top" height="12"> 
            <table width="45%" border="0" align="right">
              <tr> 
                  <td width="27%" height="12"> 
                    <div align="center"> 
                      <font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="PagoDerGrad">ANTERIOR</a> </font></b></font> 
                    </div>
                  </td>
                  <td width="4%" height="12" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="12"> 
                    <%if (ban.equals("0")){%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">INICIO</a></font></b></font></div>
                    <%} else {%>
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud1">INICIO</a></font></b></font></div>
                    <%}%>
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
        <tr>
          <td height="5" colspan="3" align="center">
            <img src="img/bararhoriz.gif" width="640" height="5"></td>
        </tr>
      </table>
  </tr>
</table>
</body>
</html>
<%
}%>
<%!
    public String valref3(String ref){
        while(ref.length() < 3){
            ref = "0" + ref;
        }
        return ref;
    }
%>
<%!
    public String valref2(String ref){
        while(ref.length() < 7){
            ref = ref + "0";
        }
        return ref;
    }
%>