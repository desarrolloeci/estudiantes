<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="java.text.*" %>

<%  
    response.setHeader("Cache-Control","no-cache"); 
    int i = 0 ;
    long val = 0;
    NumberFormat nf = NumberFormat.getIntegerInstance() ;    
    String      usid = new String(""), riesgo = new String("") ;
    String      estado_pol = new String(""), codigo_respuesta_pol = new String("") ;          
    String      ref_venta = new String(""), ref_pol = new String("") ;          
    String      firma = new String(""), idord = new String("") ;           
    String      medio_pago = new String(""), extra2 = new String("") ;               
    String      tipo_medio_pago = new String(""), cuotas = new String("") ;               
    String      valor = new String(""), valorAdicional = new String("") ;   
    String      moneda = new String(""), fecha_transaccion = new String("") ;               
    String      codigo_autorizacion = new String(""), cus = new String("") ;               
    String      banco_pse = new String(""), mensaje = new String("") ;                     
    int         ret, valpag ;

    usid = request.getParameter("usuario_Id") ;
    estado_pol = request.getParameter("estado_pol") ;
    riesgo = request.getParameter("riesgo") ;
    codigo_respuesta_pol = request.getParameter("codigo_respuesta_pol") ;
    ref_venta = request.getParameter("ref_venta") ;
    ref_pol = request.getParameter("ref_pol") ;
    firma = request.getParameter("firma") ;
    idord = request.getParameter("extra1") ;
    extra2 = request.getParameter("extra2") ;
    medio_pago = request.getParameter("medio_pago") ;
    tipo_medio_pago = request.getParameter("tipo_medio_pago") ;
    cuotas = request.getParameter("cuotas") ;
    valor = request.getParameter("valorPesos") ;
    valorAdicional = request.getParameter("valorAdicional") ;
    moneda = request.getParameter("moneda") ;
    fecha_transaccion = request.getParameter("fecha_transaccion") ;
    codigo_autorizacion = request.getParameter("codigo_autorizacion") ;
    cus = request.getParameter("cus") ;
    banco_pse = request.getParameter("banco_pse") ;
    mensaje = request.getParameter("mensaje") ;
    
    int tpmedpag = Integer.parseInt(tipo_medio_pago);
    int medpag = Integer.parseInt(medio_pago);
    int codresp = Integer.parseInt(codigo_respuesta_pol);
    
    
    /*Vector tipomp = new Vector(10);
    tipomp.addElement("");
    tipomp.addElement("");
    tipomp.addElement("Tarjetas de Cr�dito");
    tipomp.addElement("Verified by VISA");
    tipomp.addElement("PSE (Cta. corriente/ahorros)");
    tipomp.addElement("D�bito ACH");
    tipomp.addElement("");
    tipomp.addElement("Pago en efectivo (Efecty)");
    tipomp.addElement("Pago referenciado");
    
    Vector medpago = new Vector(10);
    for(i=0;i<)
    medpago.addElement("");
    medpago.addElement("");
    medpago.addElement("Tarjetas de Cr�dito");
    medpago.addElement("Verified by VISA");
    medpago.addElement("PSE (Cta. corriente/ahorros)");
    medpago.addElement("D�bito ACH");
    medpago.addElement("");
    medpago.addElement("Pago en efectivo (Efecty)");
    medpago.addElement("Pago referenciado");
    
    String[] tip_mp;*/
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Servicios Acad�micos - Forma de Pago de derechos de Matr�cula</title>
        
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
                    
                      <div align="right"><img src="img/encabezado.jpg" width="770" height="100">
					  <li><a href="LogOutEst"><img src="img/door_out.png" width="16" height="16" border="0"> Cerrar</a></li>
                      </div></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="info" align="center">
                            <h2><font color="#666666">
                                    <label id="msj">Pago en l&iacute;nea</label>
                            </font></h2>
                    </div></td>
                </tr>
                <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabla">
                      <tr>
                        <td width="20%">Referencia:</td>
                        <td width="80%"><%=ref_venta%></td>
                      </tr>
                      <tr>
                        <td>Respuesta:</td>
                        <td><%
                            switch(codresp){
                                case 1: out.println("Transacci�n aprobada");
                                     break;
                                case 2: out.println(" Pago cancelado por el usuario");
                                     break;
                                case 3: out.println(" Pago cancelado por el usuario durante validaci�n");
                                     break;
                                case 4: out.println(" Transacci�n rechazada por la entidad");
                                     break;
                                case 5: out.println(" Transacci�n declinada por la entidad");
                                     break;
                                case 6: out.println(" Fondos insuficientes");
                                     break;
                                case 7: out.println(" Tarjeta invalida");
                                     break;
                                case 8: out.println(" Acuda a su entidad");
                                     break;
                                case 9: out.println(" Tarjeta vencida");
                                     break;
                                case 10: out.println(" Tarjeta restringida");
                                     break;
                                case 11: out.println(" Discrecional POL");
                                     break;
                                case 12: out.println(" Fecha de expiraci�n o campo seg. inv�lidos");
                                     break;
                                case 13: out.println(" Repita transacci�n");
                                     break;
                                case 14: out.println(" Transacci�n inv�lida");
                                     break;
                                case 15: out.println(" Transacci�n en proceso de validaci�n");
                                     break;
                                case 16: out.println(" Combinaci�n usuario-contrase�a inv�lidos");
                                     break;
                                case 17: out.println(" Monto excede m�ximo permitido por entidad");
                                     break;
                                case 18: out.println(" Documento de identificaci�n inv�lido");
                                     break;
                                case 19: out.println(" Transacci�n abandonada capturando datos TC");
                                     break;
                                case 20: out.println(" Transacci�n abandonada");
                                     break;
                                case 21: out.println(" Imposible reversar transacci�n");
                                     break;
                                case 22: out.println(" Tarjeta no autorizada para realizar compras por internet.");
                                     break;
                                case 23: out.println(" Transacci�n rechazada");
                                     break;
                                case 24: out.println(" Transacci�n parcial aprobada");
                                     break;
                                case 9994: out.println(" Transacci�n pendiente por confirmar");
                                     break;
                                case 9995: out.println(" Certificado digital no encontrado");
                                     break;
                                case 9996: out.println(" Entidad no responde");
                                     break;
                                case 9997: out.println(" Error de mensajer�a con la entidad financiera");
                                     break;
                                case 9998: out.println(" Error en la entidad financiera");
                                     break;
                                case 9999: out.println(" Error no especificado");
                                     break;
                            }
                                %></td>
                      </tr>
                      <tr>
                        <td>Ref1:</td>
                        <td><%=idord%></td>
                      </tr>
                      <tr>
                        <td>Ref2:</td>
                        <td><%=extra2%></td>
                      </tr>
                      <tr>
                        <td>Mensaje:</td>
                        <td><%=mensaje%></td>
                      </tr>
                      <tr>
                        <td>Medio de pago:</td>
                        <td><%
                        switch(medpag){
                            case 10: out.println("VISA");
                                    break;
                            case 11: out.println("MASTERCARD");
                                    break;
                            case 12: out.println("AMEX");
                                    break;
                            case 22: out.println("DINERS");
                                    break;
                            case 24: out.println("Verified by VISA");
                                    break;
                            case 25: out.println("PSE");
                                    break;
                            case 27: out.println("VISA Debito");
                                    break;
                            case 30: out.println("Efecty");
                                    break;
                            default: out.println("-");
                                     break;
                        }
                        %></td>
                      </tr>
                      <tr>
                        <td>Tipo medio pago:</td>
                        <td><%
                        switch(tpmedpag){
                            case 2: out.println("Tarjetas de Cr�dito");
                                    break;
                            case 3: out.println("Verified by VISA");
                                    break;
                            case 4: out.println("PSE (Cta. corriente/ahorros)");
                                    break;
                            case 5: out.println("D�bito ACH");
                                    break;
                            case 7: out.println("Pago en efectivo (Efecty)");
                                    break;
                            case 8: out.println("Pago referenciado");
                                    break;
                        }
                        %></td>
                      </tr>
                      <tr>
                        <td>Cuotas *:</td>
                        <td><%=cuotas%></td>
                      </tr>
                      <tr>
                        <td>Valor en pesos:</td>
                        <td><%=valor%></td>
                      </tr>
                      <tr>
                        <td>Banco*:</td>
                        <td><%=banco_pse%></td>
                      </tr>
                      <tr>
                        <td>Estado:</td>
                        <td><%
                        switch(tpmedpag){
                            case 1 : out.println("Sin abrir");
                                     break;
                            case 2 : out.println("Abierta");
                                     break;
                            case 4 : out.println("Pagada y abonada");
                                     break;
                            case 5 : out.println("Cancelada");
                                     break;
                            case 6 : out.println("Rechazada");
                                     break;
                            case 7 : out.println("En validaci�n");
                                     break;
                            case 8 : out.println("Reversada");
                                     break;
                            case 9 : out.println("Reversada fraudulenta");
                                     break;
                            case 10 : out.println("Enviada ent. Financiera");
                                     break;
                            case 11 : out.println("Capturando datos tarjeta de cr�dito");
                                     break;
                            case 12 : out.println("Esperando confirmaci�n sistema PSE");
                                     break;
                            case 13 : out.println("Activa D�bitos ACH");
                                     break;
                            case 14 : out.println("Confirmando pago Efecty");
                                     break;
                            case 15 : out.println("Debito ACH Registrado");
                                     break;
                            case 16 : out.println("Debito ACH Registrado");
                                     break;
                        }
                        %></td>
                      </tr>
                    </table>
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
                   <li>Maestr�as</li>
                   <li>Doctorado</li>
                   <li>Educaci�n Continuada</li>
                   <li>Escuela Internacional de Verano</li> 
               </ul>
                
            </div>
            <div class="col localizacion-redes">
                <ul> 
                    <li><img width="60%" height="60%" src="img/Navegacion/acreditacion.png" class="img-fluid" alt="acreditaci�n institucional"></li><br>
                   <li>
                     <div class="row">
                         <div class="col-1 mr-2">
                            <img src="img/Navegacion/icono-localizacion.png" alt="localizacion">
                        </div>
                         <div class="col ml-1">
                             <p>AK. 45 n.� 205 - 59 (Autopista Norte)
                             <br>PBX: +57 (1) 668 3600 - Bogot�
                             <br>L�nea nacional gratuita: 018000112668</p>
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
                    Todos los derechos reservados �2011 - Escuela Colombiana de Ingenier�a Julio Garavito. Personer�a Jur�dica 086 de enero 19 de 1973. Renovaci�n de Acreditaci�n Institucional de Alta Calidad. Resoluci�n 002710 del 18 de marzo de 2019 (vigencia de 6 a�os). Vigilada por Mineducaci�n.
                </p>
            </div>
        </div>
    </div>
</footer>
    </body>
    
</html>
</html>
