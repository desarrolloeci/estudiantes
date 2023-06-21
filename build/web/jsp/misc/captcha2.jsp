<%-- 
    Document   : captcha2
    Created on : 20/12/2010, 10:45:38 AM
    Author     : lrodriguez
--%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.awt.image.*"%>
<%@ page import="javax.imageio.*"%>
<%@ page import="java.awt.geom.*"%>
<%String msg = "";
        String secHash = "";
        String originalHash = "";
        String seccode = request.getParameter("seccode");
        System.out.println("Valor caja texto : " + seccode);
        if (!(seccode == null || seccode.equals("null"))) {
            originalHash = (String) session.getAttribute("keycap");
            System.out.println(originalHash);
            System.out.println("Valor de captcha sesion : " + originalHash);
            secHash = seccode;
            if (originalHash.equals(secHash)) {
                msg="Correcto" ;
            } else {
                msg="Error ";
            }
        }%>

<form action="Captcha2" method="post">
    <img src="Captcha" id="captcha">

    <input name="seccode" size="20" type="text">   <%=msg%>
    <input name="Submit" value="Validar" type="submit">
</form>