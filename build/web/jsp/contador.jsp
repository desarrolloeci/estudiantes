<%-- 
    Document   : contador
    Created on : 1/12/2010, 02:25:51 PM
    Author     : lrodriguez
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD>
<TITLE>RELOJ QUE CUENTA HACIA ATRÁS</TITLE>
<META NAME="GENERATOR" CONTENT="MAX's HTML Beauty++2">
<script type="text/javascript" language="JavaScript">
// autor : jallmalatesta

var actualiza = 1000;
function faltan(){
var ahora = new Date();
var futuro = new Date (2010,11,2,15,15);
var faltan = futuro - ahora;
if (faltan > 0){
var segundos = Math.round(faltan/1000);
var minutos = Math.floor(segundos/60);
var segundos_s = segundos%60;
var horas = Math.floor(minutos/60);
var minutos_s = minutos%60;
var dias = Math.floor(horas/24);
var horas_s = horas%24;
document.formulario.reloj.value= dias + " dias : " + horas_s + " horas : " +
+minutos_s + " minutos : " + segundos_s + " segundos" ;
setTimeout("faltan()",actualiza);
}
else {
document.formulario.reloj.value= "0 dias : 0 horas : 0 minutos : 0 segundos" ;
return true;
}
}
</script>
</head>
<BODY onload="faltan()">
<form name="formulario">
<input type="text" name="reloj" value="" size="55" style="border : 0px ; text-align : center">
</form>
</body>
</html>