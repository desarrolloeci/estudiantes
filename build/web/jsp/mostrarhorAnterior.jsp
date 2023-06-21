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
%>

<html>
<head>
<title>Elaboraci&oacute;n de Horarios</title>
<%
    out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
    out.println("<!-- ");
    out.println("function openPop(pagename){");
    out.println("window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=400,width=620')} ");
    out.println("//-->"); 
    out.println("</SCRIPT>");
%>
<%
    out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
    out.println("<!-- ");
    out.println("function openPopHor(pagename){");
    out.println("window.open(pagename,'','toolbar=yes,scrollbars=yes,location=no,directories=no,status=no,menubar=yes,resizable=yes,height=620,width=650')} ");
    out.println("//-->"); 
    out.println("</SCRIPT>");
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a  { text-decoration: none }
.texto {  font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="640" border="0" cellpadding="0" align="center" cellspacing="0">
  <tr>
    <td width="640" height="42" valign="top"> 
      <!--Tabla externa donde va logo y titulo-->
	  <jsp:include page="encabezado" flush="true"/>
      <table width="88%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="6" colspan="2"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="67%"><font face="Verdana, Arial, Helvetica, sans-serif"><b></b></font></td>
                <td width="2%">&nbsp;</td>
                <td width="31%"> 
                  <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><a href="JavaScript:openPopHor('horarioEstud')">Ver 
                    horario estudiante</a></b></font></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td align="center" valign="top" colspan="2"> 
            <form name="form1" method="post" action="EnviarSolicitud">
              <br>
              <div align="center"><b> 
                <%  if(op.ejecutarOperacion()){%>
                <%
      String texto[]=new String[200];
       int k=0, i=0, ban=0, s=0, l=0, n=0;
       //Aca se tokeniza la informacion que envia el servidor, la cual se almacena en el arreglo texto
       //En la variable k se calcula el tamano del arreglo texto
       StringTokenizer st = new StringTokenizer(op.getSolRespuesta(), ",");
                k=0;
                while (st.hasMoreTokens()) {         
                    texto[k]=st.nextToken();%>
                <!--VALOR DE CADA TOKEN:<%=texto[k]%><br>-->
                <%k=k+1;  
                   
                }   %>
                <%if(texto[0].equals("S")){%>
                <%   for(int j=0; j<k; j++){
 //       if (((texto[j].equals("10")) || (texto[j].equals("11")) || (texto[j].equals("20")) || (texto[j].equals("21"))) && (!(texto[j].equals("fin")))){
   //         i=i+1;
     //   }
        if (((texto[j].equals("30")) || (texto[j].equals("31"))) && (!(texto[j].equals("fin")))){
            ban=ban+1;
            s=s+1;
        }
}%>
                </b> </div>
              <!--Tabla en la que se pinta en cada celda las tablas de preinscritas y otras permitidas y electivas-->
              <table width="640" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr> 
                  <td width="343"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><font size="2">Preinscritas 
                      por el estudiante</font></b></font></div>
                  </td>
                  <td width="10"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;</font></td>
                  <td width="343"> 
                    <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><font size="2">Otras 
                      permitidas</font></b></font></div>
                  </td>
                </tr>
                <td width="696" valign="top"> 
                  <!--Tabla interna de asignaturas Preinscritas-->
                  <table width="300" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr bgcolor="#336699"> 
                      <td width="20"> 
                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>P</b></font></div>
                      </td>
                      <td width="100"> 
                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>ASIG</b></font></div>
                      </td>
                      <td width="60"> 
                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>GR</b></font></div>
                      </td>
                      <td width="60"> 
                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>LAB</b></font></div>
                      </td>
                      <td width="60"> 
                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>AUX</b></font></div>
                      </td>
                    </tr>
                    <!--INICIA VALIDACION PARA PINTAR ASIGNATURAS PREINSCRITAS POR EL ESTUDIANTE-->
                    <% int j=0;
String cadena="var";
    while(!(texto[j].equals("fin"))){
        if (((texto[j].equals("10")) || (texto[j].equals("11")))){
            //ACA SE ARMA EL NOMBRE DE LAS VARIABLES (Ejm: var0, var1), LA VARIABLE l ES LA QUE INDICA EL INDICE DE ESTA VARIABLE var. 
            //ESTE NOMBRE SE ASIGNA A LOS INPUT HIDDEN Y A LOS INPUT TEXT. ESTO SE HACE EN CADA CELDA A PINTAR
            String var=(String)cadena.concat(String.valueOf(l));
            l=l+1;
           %>
                    <tr> 
                      <td width="20"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                        <%if(texto[j].equals("10")) {%>
                        </font> 
                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#CC0033">!</font></b></font></div>
                        <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                        <input type="hidden" name="<%=var%>" size="4" value="<%=texto[j]%>">
                        <%}%>
                        <%if(texto[j].equals("11")) {%>
                        </font> 
                        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#CC0033">&nbsp;</font></b></font></div>
                        <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                        <input type="hidden" name="<%=var%>" size="4" value="<%=texto[j]%>">
                        <%}%>
                        </font></td>
                      <td width="100"> 
                        <!-- Aca se pinta el nombre de la Asignatura seguido del credito-->
                        <%var=(String)cadena.concat(String.valueOf(l));
                            l=l+1;
                            String nemonico1 = (String)texto[j+1].substring(0,4);%>
                        <!-- Aca se envia de tipo hidden el nemonico de la asignatura-->
                        <input type="hidden" name="<%=var%>" size="5" style="text-transform: uppercase" value="<%=nemonico1%>">
                        <div align="center"><a href="JavaScript:openPop('HorarioAsigEstudiante?iden=<%=nemonico1%>')"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=texto[j+1]%></font></a></div>
                      </td>
                      <td width="60"> 
                        <!--Aca se pinta la casilla para digitar el Grupo-->
                        <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                          <%var=(String)cadena.concat(String.valueOf(l));
                            l=l+1;%>
                          <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                          </font></div>
                      </td>
                      <td width="60"> 
                        <!--Aca se pinta la casilla para digitar el Laboratorio-->
                        <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                          <%var=(String)cadena.concat(String.valueOf(l));
                            l=l+1;%>
                          <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                          </font></div>
                      </td>
                      <td width="60"> 
                        <!--Aca se pinta la casilla para digitar la Auxiliar-->
                        <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                          <%var=(String)cadena.concat(String.valueOf(l));
                             l=l+1;%>
                          <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                          </font></div>
                      </td>
                    </tr>
                    <%}
                    j=j+1;}%>
                    <!--SE CIERRA IF Y WHILE-->
                  </table>
                  <font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                  <!---ACA FINALIZA IMPRESION ASIG INSCRITAS POR ESTUDIANTES-->
                  </font></td>
                <td width="10"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;</font></td>
                <td width="343" valign="top"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                  <!--ACA INICIA TABLA DE OTRAS ASIGNATURAS Y DE ELECTIVAS-->
                  </font> 
                  <div align="center"> 
                    <!--Tabla interna de otras permitidas - Otras asignaturas y electivas-->
                    <table width="300" border="0" cellspacing="0" cellpadding="0" align="center">
                      <tr> 
                        <td width="20" bgcolor="#336699"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>P</b></font></div>
                        </td>
                        <td width="100" bgcolor="#336699"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>ASIG</b></font></div>
                        </td>
                        <td width="60" bgcolor="#336699"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>GR</b></font></div>
                        </td>
                        <td width="60" bgcolor="#336699"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>LAB</b></font></div>
                        </td>
                        <td width="60" bgcolor="#336699"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>AUX</b></font></div>
                        </td>
                      </tr>
                      <% j=0;
    while(!(texto[j].equals("fin"))){
        if (((texto[j].equals("20")) || (texto[j].equals("21")))){
            //ACA SE SIGUE GENERANDO EL NOMBRE DE LAS VARIABLES AL CONCATENAR EL STRING CADENA QUE ES IGUAL A "var" Y EL VALOR DE LA VARIABLE l, ESTO SE HACE EN CADA CELDA A PINTAR.
            String var=(String)cadena.concat(String.valueOf(l)); 
           %>
                      <tr> 
                        <td width="20"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                          <!--Aca se pinta la celda P, en este caso se pinta el signo !-->
                          <%if(texto[j].equals("20")) {%>
                          </font> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#CC0033">!</font></b></font></div>
                          <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                          <%var=(String)cadena.concat(String.valueOf(l));
                            l=l+1;%>
                          <input type="hidden" name="<%=var%>" size="4" value="<%=texto[j]%>">
                          <%}%>
                          <%if(texto[j].equals("21")) {%>
                          <!--Aca se pinta la celda P, en este caso no se pinta el signo, ya que texto sub j es igual a 21-->
                          </font> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><font color="#CC0033">&nbsp;</font></b></font></div>
                          <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                          <%var=(String)cadena.concat(String.valueOf(l));
                            l=l+1;%>
                          <input type="hidden" name="<%=var%>" size="4" value="<%=texto[j]%>">
                          <%}%>
                          </font></td>
                        <%//if (!((texto[j+1]).equals("ZZZZ"))){%>
                        <td width="100"> 
                          <%var=(String)cadena.concat(String.valueOf(l));
                            l=l+1;
                            //ACA SE HACE EL SUBSTRING PARA SACAR EL NEMONICO Y ENVIARLO DE TIPO HIDDEN
                            String nemonico2 = (String)texto[j+1].substring(0,4);%>
                          <input type="hidden" name="<%=var%>" size="5" style="text-transform: uppercase" value="<%=nemonico2%>">
                          <!-- Aca se pinta el nombre de la Asignatura seguido del credito, con un link que muestra el horario de la asignatura-->
                          <div align="center"><a href="JavaScript:openPop('HorarioAsigEstudiante?iden=<%=nemonico2%>')"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><%=texto[j+1]%></font></a></div>
                        </td>
                        <td width="60"> 
                          <!--Aca se pinta la casilla para digitar el Grupo-->
                          <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <%var=(String)cadena.concat(String.valueOf(l));
                                l=l+1;%>
                            <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                            </font></div>
                        </td>
                        <td width="60"> 
                          <!--Aca se pinta la casilla para digitar el Laboratorio-->
                          <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <%var=(String)cadena.concat(String.valueOf(l));
                                l=l+1;%>
                            <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                            </font></div>
                        </td>
                        <td width="60"> 
                          <!--Aca se pinta la casilla para digitar la Auxiliar-->
                          <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <%var=(String)cadena.concat(String.valueOf(l));
                l=l+1;%>
                            <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                            </font></div>
                        </td>
                        <%//}%>
                      </tr>
                      <%}
j=j+1;}%>
                      <!--SE CIERRA IF Y WHILE-->
                      <tr> 
                        <td colspan="5"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">&nbsp;</font></div>
                        </td>
                      <tr> 
                        <td colspan="5">&nbsp;</td>
                      </tr>
                      <!--ACA SE PINTAN LAS CASILLAS DE OTRAS ASIGNATURAS Y ELECTIVAS-->
                      <tr> 
                        <td colspan="5"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><b><font size="2">Otras 
                            asignaturas y electivas</font></b></font></div>
                        </td>
                      </tr>
                      <tr bgcolor="#336699"> 
                        <td width="20"> 
                          <div align="center"><font color="#FFFFFF"><font size="2"></font></font></div>
                        </td>
                        <td width="60"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>ASIG</b></font></div>
                        </td>
                        <td width="60"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>GR</b></font></div>
                        </td>
                        <td width="60"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>LAB</b></font></div>
                        </td>
                        <td width="60"> 
                          <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>AUX</b></font></div>
                        </td>
                      </tr>
                      <%for(int p=0; p<3; p++){
                        //ACA SE SIGUE ARMANDO EL NOMBRE DE LAS VARIABLES, CON LA SECUENCIA l, ESTO SE HACE EN CADA CELDA A PINTAR.
                        String var=(String)cadena.concat(String.valueOf(l));
                        l=l+1;%>
                      <tr> 
                        <td width="20" height="18"> 
                          <div align="center"><font size="2"> 
                            <!--En esta celda no se pinta nada esta es equivalente a las anteriores a la de P y se envia la variable hidden con valor cero-->
                            <input type="hidden" name="<%=var%>" value="0" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td width="60" height="18"> 
                          <!--Aca se pinta la celda para digitar la Asignatura-->
                          <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <% var=(String)cadena.concat(String.valueOf(l));
                                 l=l+1;%>
                            <input type="text" name="<%=var%>" style="text-transform: uppercase" size="4" maxlength="4">
                            </font></div>
                        </td>
                        <td width="60" height="18"> 
                          <!--Aca se pinta la celda para digitar el Grupo-->
                          <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <% var=(String)cadena.concat(String.valueOf(l));
                                l=l+1;%>
                            <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                            </font></div>
                        </td>
                        <td width="60" height="18"> 
                          <!--Aca se pinta la celda para digitar el Laboratorio-->
                          <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <%var=(String)cadena.concat(String.valueOf(l));
                                l=l+1;%>
                            <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                            </font></div>
                        </td>
                        <td width="60" height="18"> 
                          <!--Aca se pinta la celda para digitar la Auxiliar-->
                          <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                            <% var=(String)cadena.concat(String.valueOf(l));
                                l=l+1;%>
                            <input type="text" name="<%=var%>" size="4" maxlength="4" value="0">
                            </font></div>
                        </td>
                      </tr>
                      <%}%>
                    </table>
                  </div>
                </td>
                <tr align="center"> 
                  <td colspan="3"> 
                    <div align="center"><br>
                      <font face="Verdana, Arial, Helvetica, sans-serif" size="1"> 
                      <input type="submit" name="Submit" value="Enviar Solicitud">
                      </font> </div>
                  </td>
                </tr>
                <tr> 
                  <td colspan="3"> 
                    <hr size="3">
                  </td>
                </tr>
              </table>
            </form>
            <!--Si la variable ban es igual a cero quiere decir que el estudiante no tiene en registro ninguna asignatura
    por lo tanto no se pinta nada en la parte inferior, pero si es diferente si se pintan las asignaturas que 
    que ya tiene en registro.-->
            <%if (ban != 0){%>
            <form name="form2" method="post" action="EnviarSolicitudIns">
              <div align="center"> 
                <p><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Asignaturas 
                  Inscritas</font></b> </p>
                <table width="450" border="0" cellspacing="0" cellpadding="0" align="center">
                  <tr bgcolor="#336699"> 
                    <td width="90"> 
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>Operaci&oacute;n</b></font></div>
                    </td>
                    <td width="240"> 
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>ASIG</b></font></div>
                    </td>
                    <td width="90"> 
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>GR</b></font></div>
                    </td>
                    <td> 
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>LAB</b></font></div>
                    </td>
                    <td> 
                      <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>AUX</b></font></div>
                    </td>
                  </tr>
                  <!--INICIA VALIDACION PARA ASIGNATURAS YA INSCRITAS-->
                  <%String nomvar="campo";  
 j=0;
    while(!(texto[j].equals("fin"))){
        if (((texto[j].equals("30")) || (texto[j].equals("31")))){
            //ACA SE ARMA EL NOMBRE DE LA VARIABLE EN ESTE CASO ES campo0, campo1, ... EL INDICE SE CONTROLA CON n
            //ESTO SE HACE EN CADA CELDA A PINTAR
            String variable=(String)nomvar.concat(String.valueOf(n));
            n=n+1; %>
                  <tr> 
                    <td width="90"> 
                      <!--Aca se pinta el select de las opciones de cambio y retiro de grupo-->
                      <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                        <select name="<%=variable%>">
                          <option value="N">Ninguna</option>
                          <option value="M">Cambio Grupo</option>
                          <option value="R">Retiro Materia</option>
                        </select>
                        </font></div>
                    </td>
                    <td width="240"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <!--Aca se pinta el nombre de la asignatura seguido del grupo y el credito
                        Aca se hace un substring para enviar hidden el nemonico de la asignatura y se hace un link al horario de la signatura-->
                      <%              variable=(String)nomvar.concat(String.valueOf(n));
                n=n+1;
                String nemonico = (String)texto[j+1].substring(0,4);
%>
                      </font> 
                      <div align="center"><a href="JavaScript:openPop('HorarioAsigEstudiante?iden=<%=nemonico%>')"><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><%=texto[j+1]%> 
                        </font></a></div>
                      <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                      <input type="hidden" name="<%=variable%>" style="text-transform: uppercase" size="5" value="<%=nemonico%>">
                      </font></td>
                    <td width="90"> 
                      <!--Aca se pinta la casilla para escribir el grupo-->
                      <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                        <%variable=(String)nomvar.concat(String.valueOf(n));
                        n=n+1;%>
                        <input type="text" name="<%=variable%>" size="4" maxlength="4" value="0">
                        </font></div>
                    </td>
                    <td> 
                      <!--Aca se pinta la casilla para escribir el laboratorio-->
                      <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                        <%variable=(String)nomvar.concat(String.valueOf(n));
                n=n+1;%>
                        <input type="text" name="<%=variable%>" size="4" maxlength="4" value="0">
                        </font></div>
                    </td>
                    <td> 
                      <!--Aca se pinta la casilla para escribir la auxiliar-->
                      <div align="center"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                        <%variable=(String)nomvar.concat(String.valueOf(n));
                n=n+1;%>
                        <input type="text" name="<%=variable%>" size="4" maxlength="4" value="0">
                        </font></div>
                    </td>
                  </tr>
                  <%}
j=j+1;}%>
                  <!--SE CIERRA IF Y WHILE-->
                  <tr> 
                    <td width="90"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></td>
                    <td width="240"> 
                      <div align="center"><font size="2"><font size="2"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></div>
                    </td>
                    <td width="90"> 
                      <div align="center"><font size="2"><font size="2"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></div>
                    </td>
                    <td> 
                      <div align="center"><font size="2"><font size="2"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></div>
                    </td>
                    <td> 
                      <div align="center"><font size="2"><font size="2"><font face="Verdana, Arial, Helvetica, sans-serif"></font></font></font></div>
                    </td>
                  </tr>
                </table>
                <font face="Verdana, Arial, Helvetica, sans-serif" size="1"><br>
                </font> </div>
              <div align="center"> 
                <input type="submit" name="Submit2" value="Enviar Solicitud">
              </div>
            </form>
            <%}%>
            <!--SE CIERRA IF DE BAND-->
            <%}else 
			if(texto[0].equals("H")){%>
            <br>
            <p> 
            <center>
              <h4><font face="Verdana, Arial, Helvetica, sans-serif" size="2">USTED 
                DEBE PRIMERO FIRMAR SU ACTA DE MATRICULA O SU DIA DE REGISTRO 
                NO ES HOY.</font></H4>
              <P> 
              <h3><font size="2"><a href="matriculaEstudJava"><font face="Verdana, Arial, Helvetica, sans-serif">Solicitud 
                de Renovación y Acta de Matricula</font></a></font></h3>
            </center>
            <%}else
if(texto[0].equals("B")){%>
            <p> 
            <h4><font face="Verdana, Arial, Helvetica, sans-serif" size="2">EL 
              ESTUDIANTE NO ESTA AUTORIZADO PARA MODIFICAR EL HORARIO.</font></H4>
            <%}else{%>
            <p> 
            <h4><font face="Verdana, Arial, Helvetica, sans-serif" size="2">EL 
              SERVIDOR SE ENCUENTRA OCUPADO. POR FAVOR INTENTE MAS TARDE. GRACIAS 
              <%=texto[0]%></font></H4>
            <%}%>
            <% 
	HttpSession         sesion;
        sesion = request.getSession(true);	
	sesion.setAttribute("nombre", nombre);
	sesion.setAttribute("cont", String.valueOf(l));
	sesion.setAttribute("cont1", String.valueOf(n));
%>
            <!--este es el cierre del if (op.ejecutarOperacion())-->
            <%}else {%>
            
            <h4><font face="Verdana, Arial, Helvetica, sans-serif" size="2">ERROR 
              EN LA OPERACION. O EL SERVIDOR SE ENCUENTRA OCUPADO</font></h4>
            <br>
            <%}%>
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
                      <a href="menuServEstud">ANTERIOR</a> </font></b></font></div>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center">|</div>
                  </td>
                  <td width="22%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"> 
                      <a href="menuServEstud">INICIO</a></font></b></font></div>
                  </td>
                  <td width="4%" height="14" align="center" valign="middle"> 
                    <div align="center"><b>|</b></div>
                  </td>
                  <td width="43%" height="14"> 
                    <div align="center"><font size="1"><b><font face="Verdana, Arial, Helvetica, sans-serif"><a href="LogOutEst">CERRAR 
                      SESION </a></font></b></font></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
    <tr>
      <td height="5" colspan="3"><img src="img/bararhoriz.gif" width="640" height="5"></td>
    </tr>
</table>


</body>
</html>

