/*
 * GuardarActDatos.java
 *
 * Created on 13 de noviembre de 2007, 03:29 PM
 */

import estudiantes.Estudiante.EstudMisc;
import estudiantes.Estudiante.Estudiante;
import estudiantes.baseDatos.BdEstudiante;
import estudiantes.configuracion.configECI;
import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author alexgz
 * @version
 */
public class GuardarActDatos extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.close();
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int resp, retn=0;
        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();

        String idest = request.getParameter("idest");
        String dir_cor = request.getParameter("dir_cor");
        String tel_cor = request.getParameter("tel_cor");
        //String tip_doc = request.getParameter("tip_doc");
        //String doc_est = request.getParameter("doc_est");
        String celular = request.getParameter("celular");
        String email_otro = request.getParameter("email_otro");

        String ultdir = request.getParameter("ultdir");
        String ulttel = request.getParameter("ulttel");
        
 // Limpiar los campos de ' y .
        //doc_est = limpiar(doc_est);
        email_otro = email_otro.replace("'", "");
        dir_cor=limpiar(dir_cor);
        tel_cor=limpiar(tel_cor);

        Estudiante est = (Estudiante) sesion.getAttribute("estClase") ;
        String consulta = "";

        
        BdEstudiante bdEst = new BdEstudiante() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        idest=est.getIdEst();
        //idest="2064811";

        //Actualizar los campos que se llenaron en el formulario
        /*consulta= " update registro.estudiante set dir_corr = '" + dir_cor + "', " +
                    " ultdir = '" + dir_cor + "', " +" tel_corr = '" + tel_cor + "', " +" ulttel = '" + tel_cor + "', " +
                    " doc_est = '" + doc_est + "', " +" tip_doc = '" + tip_doc + "', " +" celular = '" + celular + "', " +
                    " email_otro = '" + email_otro+ "'where id_est = " + idest;
         */
        consulta= " update registro.estudiante set dir_corr = '" + dir_cor + "', " +
                " ultdir = '" + dir_cor + "', " +" tel_corr = '" + tel_cor + "', " +" ulttel = '" + tel_cor + "', " +
                    " celular = '" + celular + "', email_otro = '" + email_otro+ "'where id_est = " + idest;
        //consulta= " update registro.estudiante set doc_est = '" + doc_est + "'where id_est = " + idest;


        resp = bdEst.actualizar(consulta);
        if (resp>0){
            String nada = consulta;
            nada = nada.replace("'", "*");
            retn = bdEst.actualizar(" insert into registro.logadmitidos (idlog, texto, fecha) " +
                    "values ('400', '" + nada + "', getdate()) ");
            
        }
        bdEst.desconectar() ;

        if (resp > 0 && retn >0)
            sesion.setAttribute("mensaje", "Su información ha sido guardada") ;

        else
            sesion.setAttribute("mensaje", "Hubo algún problema diligenciando esta solicitud") ;
        
        response.sendRedirect("menuServEstud") ;
        
    }
    
    /** Returns a short description of the servlet.
     */
    
   public String limpiar(String cadena){
        String cd;
        cd  = cadena.replace("'", "");
        cd  = cd.replace(".", "");
        return cd;  
    }
    
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
