
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*, javax.swing.*, javax.swing.Timer, java.util.Properties" %>
<%@ page import="estudiantes.Estudiante.Estudiante" %>
<%@ page import="estudiantes.baseDatos.BaseDatos" %>
<%@ page import="estudiantes.configuracion.configECI" %>
<html>
    <head>
        <title>Reloj con Javascript</title>

        <%  BaseDatos bd = new BaseDatos();
        configECI cfgEci = new configECI();
        Vector tiempo = new Vector();
        Vector hora = new Vector();
        String horas = null;
        String minuto = null;
        String segundo= null;
        String consulta = "select  DATEPART(hour,GETDATE()) as 'Hour', DATEPART(minute,GETDATE()) as 'Minute', DATEPART(second,GETDATE()) as 'Seconds'";
        // String consulta = new String("SELECT DATEPART(year, GETDATE()) as 'Year',DATEPART(month,GETDATE()) as 'Month',DATEPART(day,GETDATE()) as 'Day',DATEPART(hour,GETDATE()) as 'Hour',DATEPART(minute,GETDATE()) as 'Minute',DATEPART(second,GETDATE()) as 'Seconds'");
        if (bd.conectar(cfgEci.getUsuarioBdApolo(), cfgEci.getPasswdBdApolo())) {
            tiempo = bd.consultar(consulta, 3);
            bd.desconectarBD();
            PrintWriter oout = response.getWriter();
            hora = (Vector) (tiempo.elementAt(0));
            horas = hora.elementAt(0).toString();
            minuto = hora.elementAt(1).toString();
            segundo = hora.elementAt(2).toString();
        %>
        <!%out.println(horas);%>
        <%}%>

        <!--Silla[] sillaExtraida = (Silla[]) ciudad1.elementAt(4);-->
        <script type="text/javascript"  language="javascript">
            hora = <%=horas%>;
            minuto = <%=minuto%>;
            segundo = <%=segundo%>;
            function mueveReloj(){
                segundo=segundo+1;
                if(segundo==60){
                    segundo=0;
                    minuto=minuto+1;
                    if(minuto==60){
                        minuto=0;
                        hora=hora+1;
                        if(hora==24){hora=0;}
                    }
                }
                horaImprimible = hora + " : " + minuto + " : " + segundo;
                document.form_reloj.reloj.value = horaImprimible;
                setTimeout("mueveReloj()",1000)
            }

        </script>
    </head>

    <body onload="mueveReloj()">

        <form name="form_reloj">
            <input type="text" name="reloj" size="10" style="background-color : Black; color : White; font-family : Verdana, Arial, Helvetica; font-size : 8pt; text-align : center;" onfocus="window.document.form_reloj.reloj.blur()">
        </form>

    </body>
</html>