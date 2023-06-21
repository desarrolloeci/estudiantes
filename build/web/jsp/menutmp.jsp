<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
        response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
//	String carnet = new String((String)session.getAttribute("carnet"));
	String iddpto = new String((String)session.getAttribute("iddpto"));
	String clanum = new String((String)session.getAttribute("clanum"));
        PrintWriter oout = response.getWriter() ;
//        Estudiante est = new Estudiante(carnet,oout) ;
        Estudiante est = (Estudiante) session.getAttribute("estClase") ;
        otros.rutas ruta = new otros.rutas();
%>

<html>
<head>
<title>Servicios a Estudiantes</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
<script language='javascript'>
<!--
function reservaLab(){
	document.form.submit()
}
-->
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000">
<%int estado;
estado = Integer.parseInt(est.getEstado());
%>

<%  
   	   String arreglo[]=new String[500];       
       String texto[]=new String[200];
       int i=0, n=1;
       int k=0;
       try {
            //FileReader ra = new FileReader("../confEci/serviciosestud.txt");     
            FileReader ra = new FileReader(ruta.valruta() + "serviciosestud.txt");     
            BufferedReader entrada = new BufferedReader(ra); 
            String s; 
            while((s = entrada.readLine()) != null) {
            arreglo[i]= s; 
			i=i+1;           
            }
            entrada.close();
	    ra.close();

%>
<% 
       }catch(java.io.FileNotFoundException fnfex) { 
          System.out.println("Archivo no encontrado: " + fnfex); 
%>
	  <p>Archivo no encontrado
<%     }catch(java.io.IOException ioex) { }           	
%>

<div align="center"></div>
<form name='form' method='get' action='http://www.is.escuelaing.edu.co/~reservas/reservas/estudiante/estudiante.php'>
	<input type='hidden' name='carne' value='<%=carnet%>'>
	<input type='hidden' name='nombre' value='<%=nombre%>'>
</form>
<table width="672" border="0" cellpadding="0" align="center" cellspacing="0">
  <tr> 
    <td width="24"><img src="../img/arbIzqAz.gif" width="24" height="24"></td>
    <td width="628" valign="top"><img src="../img/puntoAz.gif" width="664" height="2.5" align="absmiddle"></td>
    <td width="20"><img src="../img/arbDerAz.gif" width="24" height="24"></td>
  </tr>
  <tr> 
    <td width="24" height="42"></td>
    <td width="628" height="42"> 
      <table width="100%" border="0" align="center">
        <tr> 
          <td height="37" rowspan="2" align="left" valign="top" width="14%"> 
            <div align="left"><font face="Verdana, Arial, Helvetica, sans-serif"><b><img src="../img/LogEci.gif" width="72" height="74"></b></font></div>
            </td>
          <td height="33" width="86%"> 
            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#336699" size="4">ESCUELA 
              COLOMBIANA DE INGENIERIA</font></b></font></div>
          </td>
        </tr>
        <tr> 
          <td width="86%" height="36" valign="top"> 
            <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><font size="4">Servicios 
              a Estudiantes</font></font></div>
          </td>
        </tr>
        <tr> 
          <td height="6" colspan="2"> 
            <div><font face="Verdana, Arial, Helvetica, sans-serif"><b>Nombre: 
              <font size="2">&nbsp;<%=nombre%> </font></b> </font></div>
            </td>
        </tr>
        <tr> 
          <td align="center" valign="top" colspan="2">
            <table width="100%" border="1" height="216" bordercolor="#336699">
              <tr bgcolor="#336699"> 
                <td height="19" width="53%"> 
                  <p align="center"><font color="#FFFFFF" size="2"><b><font face="Verdana, Arial, Helvetica, sans-serif">OPCIONES</font></b></font></p>
                </td>
                <td height="19" width="47%"> 
                  <div align="center"><font color="#FFFFFF" size="2"><b><font face="Verdana, Arial, Helvetica, sans-serif">NOTICIAS</font></b></font></div>
                </td>
              </tr>
			  <tr> 
                <td width="53%" valign="top"> 
                 <br><% String variable="VERMAT";
                for (int j=0; j<i; j++){
                StringTokenizer st = new StringTokenizer(arreglo[j], ",");
                k=0;
              
                while (st.hasMoreTokens()) {              
                    texto[k]=st.nextToken();
                    k=k+1;  
                }               
                if (texto[0].equals("0")){ %>
                  <font color="#CCCCCC"><%= n %>. <%= texto[1]%></font><br>                
				<%}
                else{%>
                    <%if (n==15){%> 
                                <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><form name="form1" method="post" action="http://www.escuelaing.edu.co/cgi-bin/preins">
                                <input type="submit" value="15"> &nbsp; Preinscripciones 
                                <input type="hidden" name="carnet" value="<%=carnet%>">
	  	                <input type="hidden" name="password" value="<%=clanum%>">
		  	        <input type="hidden" name="mat" value="<%=variable%>">
                                </form>
                    <%}else{%>                    
			        <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><a href="<%= texto[2]%>"><%= n %>. 
                        <%= texto[1]%></a></b><br></font>
                    <%}%>
			
                <%} n++; 
            }   %>
          
                  </td>
                <td width="47%" valign="top"> 
                    <div align="left"> 
                  <%if (est.getDpto().equals("19")){%>
                        <p><font size="2">Los estudiantes de segundo semestre de Administracion tienen Administración tienen que inscribir 
                            la asignatura <b>"TALLER DE INVESTIGACION (ADMON)"</b> Código TAAD</font></p>
                  <%} else if (est.getDpto().equals("16")){%>
                       <font size="2"> <p>Se informa que la asignatura <b>"PROCESO DE MANUFACTURA - LAB"</b>, no sera dictada en las instalaciones
                            del <b>SENA</b>, será dictada en las instalaciones de la <b>ECI</b></p>
                            <p>Los estudiantes que van a cursar la siguiente asignatura, deberán reservar el horario indicado:</p></font>
                            <p><center><table width="80%" border="1" cellspacing="0" cellpadding="0">
                                  <tr> 
                                    <td width="30%"><b><font size="2">Asignatura</font></b></td>
                                    <td colspan="2"> 
                                      <div align="center"><font size="2"><b>Asignatura propuesta</b></font></div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td width="30%"><b><font size="2">ASDI</font></b></td>
                                    <td width="25%"><b><font size="2">ASDI*</font></b></td>
                                    <td width="45%"><font size="2"> Viernes 14:30</font></td>
                                  </tr>
                                </table></center></p>
                                <p><font size="2">Esto con el fin de adelantar monitorias y exámenes</font></p>
                   <%} else if (est.getDpto().equals("15")){%>
                               <p><font size="2">Estudiantes del Plan 11 que tengan algún inconveniente en el proceso de registro de sus
                                asignaturas, favor dirigirse a la decanatura de Sistemas con la Ing. Maria Irma Díaz (Decano)</font></p>
                   <%} else if (est.getDpto().equals("18")){%>
                               <p><font size="2">Plan de Homologación</font></p>
                               <center><p><table width="95%" border="1" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="43%"> 
                          <div align="center"><b><font size="2">Planes 3 y 4</font></b></div>
                        </td>
                        <td width="8%"> 
                          <div align="center"><b><font size="2">&nbsp;</font></b></div>
                        </td>
                        <td width="49%"> 
                          <div align="center"><b><font size="2">Plan 5</font></b></div>
                        </td>
                      </tr>
                      <tr> 
                        <td width="43%"> 
                          <div align="center"><font size="2">TIV1</font></div>
                        </td>
                        <td width="8%"> 
                          <div align="center"><font size="2">&nbsp;</font></div>
                        </td>
                        <td width="49%"> 
                          <div align="center"><font size="2">MECI</font></div>
                        </td>
                      </tr>
                      <tr> 
                        <td width="43%"> 
                          <div align="center"><font size="2">TAE2</font></div>
                        </td>
                        <td width="8%"> 
                          <div align="center"><font size="2">&nbsp;</font></div>
                        </td>
                        <td width="49%"> 
                          <div align="center"><font size="2">SETI</font></div>
                        </td>
                      </tr>
                      <tr> 
                        <td width="43%"> 
                          <div align="center"><font size="2">TIV2</font></div>
                        </td>
                        <td width="8%"> 
                          <div align="center"><font size="2">&nbsp;</font></div>
                        </td>
                        <td width="49%"> 
                          <div align="center"><font size="2">TAE2</font></div>
                        </td>
                      </tr>
                    </table></p></center>

                  <%} else if ((est.getDpto().equals("14")) || (est.getDpto().equals("17"))){%>
                               <p><font size="2">Los estudiantes que van a cursar alguna de las siguientes asignaturas,
                                deberán reservar el día indicado para adelantar monitorias y/o exámenes en la asignatura propuesta:</font></p>
                                <p><table width="95%" border="1" cellspacing="0" cellpadding="0" align="center">
                                      <tr valign="top"> 
                                        <td width="22%" height="14"> 
                                          <div align="center"><b>Asignatura</b></div>
                                        </td>
                                        <td width="4%" height="14"> 
                                          <div align="center"><b></b></div>
                                        </td>
                                        <td colspan="2" height="14"> 
                                          <div align="center"><b>Asignatura propuesta</b></div>      
                                        </td>
                                      </tr>
                                      <tr> 
                                        <td width="22%"> 
                                          <div align="center">ASDI</div>
                                        </td>
                                        <td width="4%"> 
                                          <div align="center"></div>
                                        </td>
                                        <td width="35%"> 
                                          <div align="center">ASDI*</div>
                                        </td>
                                        <td width="39%"> 
                                          <div align="center">Viernes 14:30</div>
                                        </td>
                                      </tr>
                                      <tr> 
                                        <td width="22%"> 
                                          <div align="center">CEL1</div>
                                        </td>
                                        <td width="4%"> 
                                          <div align="center"></div>
                                        </td>
                                        <td width="35%"> 
                                          <div align="center">CEL1+</div>
                                        </td>
                                        <td width="39%"> 
                                          <div align="center">Viernes 13:00</div>
                                        </td>
                                      </tr>
                                      <tr> 
                                        <td width="22%"> 
                                          <div align="center">CEL2</div>
                                        </td>
                                        <td width="4%"> 
                                          <div align="center"></div>
                                        </td>
                                        <td width="35%"> 
                                          <div align="center">CEL2+</div>
                                        </td>
                                        <td width="39%"> 
                                          <div align="center">S&aacute;bado 11:30</div>
                                        </td>
                                      </tr>
                                      <tr> 
                                        <td width="22%"> 
                                          <div align="center">TCPE</div>
                                        </td>
                                        <td width="4%"> 
                                          <div align="center"></div>
                                        </td>
                                        <td width="35%"> 
                                          <div align="center">TCPE*</div>
                                        </td>
                                        <td width="39%"> 
                                          <div align="center">Lunes 17:30</div>
                                        </td>
                                      </tr>
                                    </table>
                   <%}else{%>
                        <p>&nbsp;</p>
                        <%}%>
                  </div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td valign="top" colspan="2"> 
            <div align="right"></div>
            <div align="right"> 
              <table width="45%" border="0" height="17">
                <tr> 
                  <td width="43%" height="14"> 
                    <div align="right"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="../servlet/LogOutEst/">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>
    </td>
    <td width="20" height="42" align="right"></td>
  </tr>
  <tr> 
    <td width="24"><img src="../img/abaIzqAz.gif" width="24" height="24"></td>
    <td width="628" valign="bottom"><img src="../img/puntoAz.gif" width="664" height="2.5"></td>
    <td width="20"><img src="../img/abaDerAz.gif" width="24" height="24"></td>
  </tr>
</table>

<% 
        session.setAttribute("ban", "0"); 
%>

</body>
</html>
