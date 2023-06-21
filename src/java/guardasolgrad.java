/*
 * guardasolgrad.java
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
public class guardasolgrad extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet guardasolgrad</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet guardasolgrad at " + request.getContextPath () + "</h1>");
        out.println("</body>");
        out.println("</html>");
         */
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
        int resp, resp1, resp2, resp3;
        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();
        String nombres = request.getParameter("nombres");
        String ape1 = request.getParameter("ape1");
        String ape2 = request.getParameter("ape2");
        String tip_doc = request.getParameter("tip_doc");
        String doc_est = request.getParameter("doc_est");
        String exp_diploma = request.getParameter("exp_diploma");
        String nro_libr = request.getParameter("nro_libr");
        String nro_distr = request.getParameter("nro_distr");
        String fec_exp = request.getParameter("fecha");
        String ultdir = request.getParameter("ultdir");
        String ulttel = request.getParameter("ulttel");
        String celular = request.getParameter("celular");
        String email_otro = request.getParameter("email_otro");
        String ciu_corr = request.getParameter("munres");
        String madreact = request.getParameter("madreact");
        String padreact = request.getParameter("padreact");
        String trabajoact = request.getParameter("trabajoact");
        String secuencia = request.getParameter("secuencia");
        nombres = limpiar(nombres);
        //nombres = nombres.toUpperCase();
        ape1 = limpiar(ape1);
        //ape1 = ape1.toUpperCase();
        ape2 = limpiar(ape2);
        //ape2 = ape2.toUpperCase();
        ultdir = limpiar(ultdir);
        doc_est = limpiar(doc_est);
        email_otro = email_otro.replace("'", "");
        Estudiante est = (Estudiante) sesion.getAttribute("estClase") ;

        String consulta = "";/* = new String (" update registro.estudiante " +
                "set nombres = '" + nombres + "', ape1 = '" + ape1 + "', " +
                "ape2 = '" + ape2 + "', celular = '" + celular + "', " +
                "email_otro = '" + email_otro + "', doc_est = '" + doc_est + "', " +
                "tip_doc = '" + tip_doc + "', " +
                "nro_libr = '" + nro_libr + "', nro_distr = '" + nro_distr + "', " +
                "fec_exp_libr = '" + fec_exp + "', ultdir = '" + ultdir + "', " +
                "ulttel = '" + ulttel + "', exp_diploma = '" + exp_diploma + "', " +
                "ciu_corr = '" + ciu_corr + "', fec_act = getdate() " +
                "where id_est = " + est.getIdEst());  */
        resp = est.setSolPreGrad(nombres, ape1, ape2, celular, email_otro, doc_est, tip_doc, nro_libr,
                nro_distr, fec_exp, ultdir, ulttel, exp_diploma, ciu_corr, est.getIdEst());
        
        BdEstudiante bdEst = new BdEstudiante() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg());
        if(!madreact.equals("0"))
            consulta = " update registro.responsable set nom_res = '" + request.getParameter("nommadre") + "', " +
                    " id_pro = '" + request.getParameter("profmadre") + "' where id_res = " + madreact;
        else{
            if(!request.getParameter("nommadre").equals("")){
                String idres = bdEst.sigSecuencia("REPONSABLES");
                consulta = " insert into registro.responsable (id_res, id_est, tip_res, nom_res, id_pro, lug_res, ciu_tra, id_ocu, edu_res, vive_res, edad_res) values ('" + 
                        idres + "', '" + est.getIdEst() + "', 'M', '" + request.getParameter("nommadre") + "', '" + request.getParameter("profmadre") + "', '1', '1', '0', 'X', 'S', '0')";
            }
        }
        resp1 = bdEst.actualizar(consulta);
        if(!padreact.equals("0"))
            consulta = " update registro.responsable set nom_res = '" + request.getParameter("nompadre") + "', " +
                    " id_pro = '" + request.getParameter("profpadre") + "' where id_res = " + padreact;
        else{
            if(!request.getParameter("nompadre").equals("")){
                String idres = bdEst.sigSecuencia("REPONSABLES");
                consulta = " insert into registro.responsable (id_res, id_est, tip_res, nom_res, id_pro, lug_res, ciu_tra, id_ocu, edu_res, vive_res, edad_res) values ('" + idres + "', " +
                    " '" + est.getIdEst() + "', 'P', '" + request.getParameter("nompadre") + "', '" + request.getParameter("profpadre") + "', '1', '1', '0', 'X', 'S', '0')";
            }
        }
        resp2 = bdEst.actualizar(consulta);
        if(!request.getParameter("nom_entidad").equals("")){
                   
            consulta = " insert into registro.experiencia (entidad, cargo, jefinm, teljef, id_est) values ('" + request.getParameter("nom_entidad") + "', " +
                    " '" + request.getParameter("cargo") + "', '" + request.getParameter("nomjefe") + "', '" + request.getParameter("telexper") + "', " + est.getIdEst() + ") ";
           resp3 = bdEst.actualizar(consulta);
        }
        else
            resp3 =1;
        
        bdEst.desconectar() ;
        if (resp > 0 && resp1 > 0 && resp2 > 0 && resp3 > 0)
            sesion.setAttribute("mensaje", "Su información ha sido guardada") ;
        else
            sesion.setAttribute("mensaje", "Hubo algún problema diligenciando esta solicitud") ;
        response.sendRedirect("ImprimirSolPreGrad") ;
        //out.println(consulta);
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
