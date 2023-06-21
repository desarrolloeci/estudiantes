<%@ page import = "javax.servlet.http.HttpSession" %>
<%
    String carnet = (String) session.getAttribute("carnet");
   // String carnet = (String) session.getAttribute("carnet");
    String mssge = (String) session.getAttribute("mensaje");

    if (!(carnet != null && !carnet.equals(""))) {
%>
<jsp:forward page="login?msg=6"/>

<%} else if (mssge.equals("Cambiar contraseña")) {%>
<jsp:forward page="login"/>
<%    }
%>