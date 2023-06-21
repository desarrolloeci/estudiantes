<%@ include file="../secure.jsp" %>
<%@ page import="java.text.*, java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BdEstudiante" %>
<%  
    response.setHeader("Cache-Control","no-cache"); 
    String nombre = new String((String)session.getAttribute("nombre"));
    String igrad =  new String((String)session.getAttribute("igrad"));
    String iddpto =  new String((String)session.getAttribute("iddpto"));
    String tmp, fecha="";
    PrintWriter oout = response.getWriter() ;
    Estudiante est = (Estudiante) session.getAttribute("estClase") ;
    int estado;
    estado = Integer.parseInt(est.getEstado());
    if(!igrad.equals("C")){
        if(estado>0)
            response.sendRedirect("menuServEstud");
        else
            response.sendRedirect("menuServEstud1");
    }else{
        Vector infoEst = est.getDatosEst(carnet);
        Vector datosestud = (Vector)infoEst.elementAt(0) ;
        Vector datospar = est.getParProg(iddpto);
        Vector paregre = est.getParGraduado(carnet);
        int ParConsec;
        String numInv = "";
        String asis = request.getParameter("asistir");
        if(paregre.size()>0){
            est.setUpParGrad(carnet, asis);
            paregre = est.getParGraduado(carnet);
            fecha = ((Vector)paregre.elementAt(0)).elementAt(3).toString();
            numInv = ((Vector)paregre.elementAt(0)).elementAt(0).toString();
        }else{
            ParConsec = est.getConsGrad();
            if(ParConsec == 0)
                ParConsec = 231;
            tmp = carnet.substring(carnet.length()-3,carnet.length());
            numInv = numInv.concat(String.valueOf(tmp.charAt(2)));
            numInv = numInv.concat(String.valueOf(tmp.charAt(1)));
            numInv = numInv.concat(String.valueOf(tmp.charAt(0)));
            numInv = numInv + "0" + String.valueOf(ParConsec);
            est.setParGrad(carnet, numInv, asis);
            paregre = est.getParGraduado(carnet);
            fecha = ((Vector)paregre.elementAt(0)).elementAt(3).toString();
        }
%>
<html>
<head>
<title>Servicios Academicos - Invitación</title>
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
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-style: normal;
	line-height: normal;
	font-weight: bold;
	font-variant: normal;
	text-transform: none;
	text-decoration: none;
	color: #990000;
}
a{color: blue;}
a:hover{color:#3366CC; }
-->
</style>
<style type="text/css">
<!--
.texto2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-style: normal;
	line-height: normal;
	font-weight: bold;
	font-variant: normal;
	text-transform: none;
	text-decoration: none;
	color: #333333;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function impresion(){
    document.getElementById("botonImp").style.visibility='hidden';
    //window.print();
    window.close();
}
-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000">
     <table width="640" border="0" align="center">
        <tr> 
          <td valign="top">
<% 
        if(asis.equals("FALSE")){%> <!--El campo asis se compara con FALSE para que no permita imprimir la invitación, el valor correcto es asis = 1-->
                <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="texto2">
                  <!-- fwtable fwsrc="invitacion.png" fwbase="invitacion.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
                  <tr>
                    <td><img src="img/grados/spacer.gif" width="90" height="1" border="0" alt=""></td>
                    <td><img src="img/grados/spacer.gif" width="85" height="1" border="0" alt=""></td>
                    <td><img src="img/grados/spacer.gif" width="115" height="1" border="0" alt=""></td>
                    <td><img src="img/grados/spacer.gif" width="100" height="1" border="0" alt=""></td>
                    <td><img src="img/grados/spacer.gif" width="10" height="1" border="0" alt=""></td>
                    <td><img src="img/grados/spacer.gif" width="1" height="1" border="0" alt=""></td>
                  </tr>
				  
				  <tr>
                    <td colspan="5"><hr color="#000000"></td>
                    <td><img src="img/grados/spacer.gif" width="1" height="20" border="0" alt=""></td>
                  </tr>
                  <tr>
                    <td colspan="5"><img name="invitacion" src="img/grados/invitacion.gif" width="400" height="60" border="0" alt=""></td>
                    <td><img src="img/grados/spacer.gif" width="1" height="60" border="0" alt=""></td>
                  </tr>
                  <tr>
                    <td colspan="5"><div align="center">
                      <p><em>EL RECTOR<BR>
                          <font size="2">RICARDO QUINTANA SIGHINOLFI</font></em></p>
                      <p>Tiene el gusto de invitar a</p>
                    </div></td>
                    <td><img src="img/grados/spacer.gif" width="1" height="20" border="0" alt=""></td>
                  </tr>
				  <tr>
                    <td colspan="5"><div align="center" class="texto1">
                      &nbsp;<br>
                        <%=nombre%><br>&nbsp;
                    </div></td>
                    <td><img src="img/grados/spacer.gif" width="1" height="20" border="0" alt=""></td>
                  </tr>
                  <tr>
                    <td colspan="5"><div align="justify">A la ceremonia de imposici&oacute;n
                        de <em>ESCUDOS</em> que realizar&aacute; la Directiva de la <em>ESCUELA
                        COLOMBIANA DE INGENIER&Iacute;A JULIO GARAVITO</em>, en honor
                        de los estudiantes de &uacute;ltimo semestre con motivo
                        de la finalizaci&oacute;n de sus estudios profesionales
                    en la instituci&oacute;n, el d&iacute;a <span class="texto1"><%=datospar.elementAt(0)%></span></div></td>
                    <td><img src="img/grados/spacer.gif" width="1" height="20" border="0" alt=""></td>
                  </tr>
                  <tr>
                    <td colspan="5"><div align="left"><br>Como requisito de entrada
                        a la ceremonia debe presentar su carn&eacute; estudiantil y
                        una impresi&oacute;n de esta invitaci&oacute;n.</div></td>
                    <td><img src="img/grados/spacer.gif" width="1" height="20" border="0" alt=""></td>
                  </tr>
                  <tr>
                    <td colspan="5"><div align="left">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="50%"><br><span class="texto2">No. Invitaci&oacute;n:</span><span class="texto1"><%=numInv%></span></td>
                          </tr>
                          <tr>
                            <td><span class="texto2">Fecha de Impresi&oacute;n:</span><span class="texto1"><%=fecha%></span></td>
                          </tr>
						  
                        </table>
                    </div></td>
                    <td><img src="img/grados/spacer.gif" width="1" height="20" border="0" alt=""></td>
                  </tr>
				  <tr>
                    <td colspan="5"><div align="right"><br>
					Esta invitaci&oacute;n
                        es personal e intransferible</div></td>
                    <td><img src="img/grados/spacer.gif" width="1" height="20" border="0" alt=""></td>
                  </tr>
				  <tr>
                    <td colspan="5"><hr color="#000000"></td>
                    <td><img src="img/grados/spacer.gif" width="1" height="20" border="0" alt=""></td>
                  </tr>
				  <tr>
                    <td colspan="5"><div align="center">
                      <input type="submit" name="botonImp" id="botonImp" value="Imprimir Invitaci&oacute;n" onclick="impresion()">
                    </div></td>
                    <td><img src="img/grados/spacer.gif" width="1" height="20" border="0" alt=""></td>
                  </tr>
            </table>
<%}else{%>

   <script language="javascript">
        <!--
        alert("Proceso realizado con éxito");
        window.close();
    -->
    </script>
        
<%}%>
        </td>
        </tr>
</table>
</body>
</html>
<% }%>