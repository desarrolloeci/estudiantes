<%@ page import = "javax.servlet.http.HttpSession" %>
<%  
    String ref = (String)session.getAttribute("usuario");

    if (!(ref != null && !ref.equals(""))) {
%>
		<jsp:forward page="formautent.jsp"/>
<%
    }
%>