<html>
<head>
<title>prueba</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%
String asigna="";
%>
<script language="JavaScript">


        function ventanaSecundaria (URL){
            var asigna=document.form1.asigna.value;

           window.open("BuscarAsig?asigna="+ asigna, "form1","width500,height=300,scrollbars=no,top=400,left=100");
        }

        </script>


<body bgcolor="#FFFFFF" text="#000000">
<table width="75%" border="1">
  <tr>
    <td width="51%"> 
      <form name="form1" method="get" action="javascript:ventanaSecundaria('BuscarAsig')">
        <input type="text" name="asigna">
        <input type="submit" name="button"  value="Enviar">
      </form>
    </td>
   
  </tr>
</table>
</body>
</html>
