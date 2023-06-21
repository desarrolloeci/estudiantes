<%@ include file="secure.jsp" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%@ page import="estudiantes.Modreg.Operacion" %>
<%  
    response.setHeader("Cache-Control","no-cache"); 
	String nombre = new String((String)session.getAttribute("nombre"));
	String valren;
	String prog = new String();
	PrintWriter oout = response.getWriter() ;
//        Estudiante est = new Estudiante(carnet,oout) ;
        Estudiante est = (Estudiante) session.getAttribute("estClase") ;
        Operacion op = new Operacion (carnet) ;
        Vector asignaturas = new Vector () ;
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
</head>

<body bgcolor="#FFFFFF" text="#000000">
<%
        if(op.ejecutarOperacion()){
            StringTokenizer st = new StringTokenizer(op.getSolRespuesta(), ",");
            st.nextToken();
            while (st.hasMoreTokens()) {
                Vector asignatura = new Vector () ;
                asignatura.addElement(st.nextToken()) ;
                asignatura.addElement(st.nextToken()) ;
                asignaturas.addElement(asignatura) ;
            }
%>
<div align="center"></div>
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
              <font size="2">&nbsp;VARONA MEDINA DIANA SOFIA </font></b> </font></div>
            </td>
        </tr>
        <tr> 
          <td align="center" valign="top" colspan="2"> 
            <form name="form1" method="post" action="">
              <table width="75%" border="0">
                <tr> 
                  <td valign="top"> 
                    <div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Preinscritas 
                      por el estudiante</font></b> </div>
                    <table width="75%" border="0" align="center">
                      <tr bgcolor="#336699"> 
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>P</b></font></div>
                        </td>
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>ASIG</b></font></div>
                        </td>
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>GR</b></font></div>
                        </td>
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>LAB</b></font></div>
                        </td>
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>AUX</b></font></div>
                        </td>
                      </tr>
<%
        for ( int i = 0 ;  i < asignaturas.size() ; i++ ){
            Vector asig = asignaturas.elementAt();
            if ((asig.elementAt(0)).equals("10") || (asig.elementAt(0)).equals("11")){
%>
                      <tr> 
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2">
<%
                if ((asig.elementAt(0)).equals("11")){
%>
                            <font color = '#b11d55'>!</font>
<%
                }
%>
                          </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="hidden" name="hdAsig" size="5" style="text-transform: uppercase" value="<%asig.elementAt(1)%>">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txGr" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txLab" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txAux" size="4" maxlength="4">
                            </font></div>
                        </td>
                      </tr>

<%
            }
        }
%>

                    </table>
                    <div align="center"> </div>
                  </td>
                  <td valign="top"> 
                    <div align="center"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Otras 
                      permitidas</font></b> </div>
                    <table width="75%" border="0" align="center">
                      <tr bgcolor="#336699"> 
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>P</b></font></div>
                        </td>
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>ASIG</b></font></div>
                        </td>
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>GR</b></font></div>
                        </td>
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>LAB</b></font></div>
                        </td>
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>AUX</b></font></div>
                        </td>
                      </tr>
<%
        for ( int i = 0 ;  i < asignaturas.size() ; i++ ){
            Vector asig = asignaturas.elementAt();
            if ((asig.elementAt(0)).equals("20") || (asig.elementAt(0)).equals("21")){
%>

                      <tr> 
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"></font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="hidden" name="hdAsig" size="5" style="text-transform: uppercase" value="XXXX">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txGr" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txLab" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txAux" size="4" maxlength="4">
                            </font></div>
                        </td>
                      </tr>
<%
            }
        }
%>

                    </table>
                  </td>
                </tr>
                <tr>
                  <td valign="bottom"> 
                    <div align="center">
                      <input type="submit" name="Submit" value="Enviar Solicitud">
                    </div>
                  </td>
                  <td valign="top"> 
                    <div align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><b>Otras 
                      asignaturas y electivas </b></font> </div>
                    <table width="75%" border="0" align="center">
                      <tr bgcolor="#336699"> 
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>ASIG</b></font></div>
                        </td>
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>GR</b></font></div>
                        </td>
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>LAB</b></font></div>
                        </td>
                        <td> 
                          <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>AUX</b></font></div>
                        </td>
                      </tr>
                      <tr> 
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txAsig" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txGr" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txLab" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txLab" size="4" maxlength="4">
                            </font></div>
                        </td>
                      </tr>
                      <tr> 
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txAsig" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txGr" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txLab" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txLab" size="4" maxlength="4">
                            </font></div>
                        </td>
                      </tr>
                      <tr> 
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txAsig" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txGr" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txLab" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <input type="text" name="txLab" size="4" maxlength="4">
                            </font></div>
                        </td>
                      </tr>

                    </table>
                  </td>
                </tr>
              </table>
              <p>&nbsp; </p>
			  </form>
			<hr size="3">
            <form name="form2" method="post" action="">
              <p>&nbsp;</p>
              <p><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><b>Asignaturas 
                Inscritas</b></font></p>
              <table width="75%" border="0">
                <tr bgcolor="#336699"> 
                  <td> 
                    <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>OPERACION</b></font></div>
                  </td>
                  <td> 
                    <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>ASIG</b></font></div>
                  </td>
                  <td> 
                    <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>GR</b></font></div>
                  </td>
                  <td> 
                    <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>LAB</b></font></div>
                  </td>
                  <td> 
                    <div align="center"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>AUX</b></font></div>
                  </td>
                </tr>
<%
        for ( int i = 0 ;  i < asignaturas.size() ; i++ ){
            Vector asig = asignaturas.elementAt();
            if ((asig.elementAt(0)).equals("30")){
%>


                <tr> 
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <select name="selOp">
                        <option value="N">Ninguna</option>
                        <option value="M">Cambio de Grupo</option>
                        <option value="R">Retiro de Materia</option>
                      </select>
                      </font></div>
                  </td>
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <input type="text" name="txAsig" size="4" maxlength="4">
                      </font></div>
                  </td>
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <input type="text" name="txGr" size="4" maxlength="4">
                      </font></div>
                  </td>
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <input type="text" name="txLab" size="4" maxlength="4">
                      </font></div>
                  </td>
                  <td> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <input type="text" name="txAux" size="4" maxlength="4">
                      </font></div>
                  </td>
                </tr>
<%
            }
        }
%>
              </table>
              <input type="submit" name="Submit2" value="Enviar Solicitud">
            </form>
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
                      <a href="inicio.jsp">ANTERIOR</a> </font></b></font></div> 
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="inicio.jsp">INICIO</a></font></b></font></div>
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
    <td width="20" height="42" align="right"></td>
  </tr>
  <tr> 
    <td width="24"><img src="../img/abaIzqAz.gif" width="24" height="24"></td>
    <td width="628" valign="bottom"><img src="../img/puntoAz.gif" width="664" height="2.5"></td>
    <td width="20"><img src="../img/abaDerAz.gif" width="24" height="24"></td>
  </tr>
</table>
<%
        }else{
%>
        <h4><font face="Verdana, Arial, Helvetica, sans-serif">ERROR EN LA OPERACION. 
        O EL SERVIDOR SE ENCUENTRA OCUPADO</font></h4>
<%
        }
%>

</body>
</html>
