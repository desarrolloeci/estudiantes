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
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Forma de Pago de derechos de Grado</title>
        
        <!-- JavaScript -->
        <script type="text/javascript" src="scripts/wufoo.js"></script>
        
        <!-- CSS -->
          <link rel="stylesheet" type="text/css" href="Navegacion/css/estilo-escuela.css">
<link rel="stylesheet" href="Navegacion/css/bootstrap.min.css">
        <script language="JavaScript" type="text/JavaScript">
            <!--
            //-->
        </script>
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
                        <jsp:param name="anterior" value="PagoDerGrad" />
                    </jsp:include>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Forma de Pago de derechos
                                    de Grado</label></font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td>
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
            <form method="POST" action="https://www.edinet.com/pse/pago.aspx">
      <table width="100%" border="0" align="center"  class="texto">
        <tr>
            <td>
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
                <div align="center">
                  <input type="hidden" name="casig" value="0">
                  <input type="submit" value="PAGAR" name="B1">
                </div>
            </form>
                    </td>
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