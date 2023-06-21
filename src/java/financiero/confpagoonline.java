/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package financiero;

import estudiantes.baseDatos.BdEstfin;
import estudiantes.configuracion.configECI;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alexgz
 */
public class confpagoonline extends HttpServlet {
   
    /** 
    * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
    * @param request servlet request
    * @param response servlet response
    */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet confpagoonline</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet confpagoonline at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
            */
        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
    * Handles the HTTP <code>GET</code> method.
    * @param request servlet request
    * @param response servlet response
    */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //doPost(request, response);
    } 

    /** 
    * Handles the HTTP <code>POST</code> method.
    * @param request servlet request
    * @param response servlet response
    */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession sesion;
        String      usid = new String(""), riesgo = new String("") ;
        String      estado_pol = new String(""), codigo_respuesta_pol = new String("") ;          
        String      ref_venta = new String(""), ref_pol = new String("") ;          
        String      firma = new String(""), idord = new String("") ;           
        String      medio_pago = new String(""), extra2 = new String("") ;               
        String      tipo_medio_pago = new String(""), cuotas = new String("") ;               
        String      valor = new String(""), valorAdicional = new String("") ;   
        String      moneda = new String(""), fecha_transaccion = new String("") ;               
        String      codigo_autorizacion = new String(""), cus = new String("") ;               
        String      banco_pse = new String(""), iva = new String("") ;                     
        int         ret, valpag ;

        usid = request.getParameter("usuario_Id") ;
        estado_pol = request.getParameter("estado_pol") ;
        riesgo = request.getParameter("riesgo") ;
        codigo_respuesta_pol = request.getParameter("codigo_respuesta_pol") ;
        ref_venta = request.getParameter("ref_venta") ;
        ref_pol = request.getParameter("ref_pol") ;
        firma = request.getParameter("firma") ;
        idord = request.getParameter("extra1") ;
        extra2 = request.getParameter("extra2") ;
        medio_pago = request.getParameter("medio_pago") ;
        tipo_medio_pago = request.getParameter("tipo_medio_pago") ;
        cuotas = request.getParameter("cuotas") ;
        valor = request.getParameter("valor") ;
        valorAdicional = request.getParameter("valorAdicional") ;
        moneda = request.getParameter("moneda") ;
        fecha_transaccion = request.getParameter("fecha_transaccion") ;
        codigo_autorizacion = request.getParameter("codigo_autorizacion") ;
        cus = request.getParameter("cus") ;
        banco_pse = request.getParameter("banco_pse") ;
        iva = request.getParameter("iva") ;
        

        /*Long valpgd = Long.valueOf(valor);
        valpag = valpgd.intValue();*/
        
        
        BdEstfin bdEst = new BdEstfin() ;
        configECI cfgEci = new configECI();
        bdEst.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg()); 
        ret = bdEst.confpagoonline(idord, estado_pol, codigo_respuesta_pol, fecha_transaccion, banco_pse, tipo_medio_pago, codigo_autorizacion, valor, medio_pago, cus);        
        /*ret = bdEst.confpagoonline(usid, estado_pol, riesgo, codigo_respuesta_pol, ref_venta, ref_pol, 
                firma, extra1, extra2, medio_pago, tipo_medio_pago, cuotas, valpag, valorAdicional, moneda,
                fecha_transaccion, codigo_autorizacion, cus, banco_pse, iva) ; */
        bdEst.desconectar() ; 
    }

    /** 
    * Returns a short description of the servlet.
    */
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
