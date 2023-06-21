
/**
 *
 * @author
 * @version
 */

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.* ;
import estudiantes.baseDatos.BaseDatos ;
import estudiantes.configuracion.configECI;

public class horAsigEsta extends HttpServlet
{
    configECI cfgEci;
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
        BaseDatos bd = new BaseDatos();
        String nomParam, opcion = new String(), usuario, iden, ruta, tmp;
        Integer idCE;
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">") ;
        out.println("</head>") ;
        out.println("<p>");
        out.println("<body>");
        HttpSession sesion;
        sesion = request.getSession(false);
        iden = new String(request.getParameter("iden"));
        if (bd.conectar()) {
            //out.println("<center><b>Horario de Asignatura</b></center><br>");
            despCupoSem(out, bd, iden) ;
            bd.desconectarBD();
        }

            else
            out.println("No se pudo conectar " + bd.getMensajeBD());
            out.println("</p>");
            out.println("</body>");
            out.println("</html>") ;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
        BaseDatos bd = new BaseDatos();
        String nomParam, opcion = new String(), usuario, iden, ruta, tmp;
        Integer idCE;
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">") ;
        out.println("<style type=\"text/css\"> <!-- " +
                " .texto { font-family: Arial, Helvetica, sans-serif;	" +
                " font-size: 10px; " +
                " } --> " +
                " </style>");
        out.println("</head>") ;
        out.println("<p>");
        out.println("<body>");
        HttpSession sesion;
        sesion = request.getSession(false);
        cfgEci = new configECI();
        iden = new String(request.getParameter("iden"));
        if (bd.conectar(cfgEci.getUsuarioBdReg(), cfgEci.getPasswdBdReg())) {
            //out.println("<center><b>Horario de Asignatura</b></center><br>");
            despCupoSem(out, bd, iden) ;
            bd.desconectarBD();
        }

            else
            out.println("No se pudo conectar " + bd.getMensajeBD());
            out.println("</p>");
            out.println("</body>");
            out.println("</html>") ;
    }

    public void despCupoSem(PrintWriter out, BaseDatos bd, String codAsig) {
        String consulta = new String();
        String consulta2 = new String();
    	Vector  lisnom = new Vector() ;
        //7 Campos
        ArrayList param = new ArrayList<String>();
        param.add(codAsig);
        param.add(cfgEci.getPeriodoActual());
        param.add(cfgEci.getPeriodoActual());
        

    /**********************************
       * SIN PROFESOR SIN VALIDAR DPTO********************
    consulta = new String("	select num_grupo, nomd, hora_ini, hora_fin, cod_sal, " +
	"  (cupo_maximo - count(id_reg)) " +
	"  from  registro.grupo, registro.asignatura, registro.diassem, " +
	"  registro.sal_grupo, registro.salones, registro.registro " +
	"  where registro.grupo.id_asig = registro.asignatura.id_asig and " +
	"  registro.grupo.id_grupo *= registro.registro.id_grupo and " +
	"  ndi = dia and " +
    "  registro.grupo.id_grupo = registro.sal_grupo.id_grupo and " +
	"  registro.sal_grupo.id_sal = registro.salones.id_sal and " +
//Operaciones normales
	"  registro.grupo.per_acad = '" + cfgEci.getPeriodoActual() + "'  and " +
//Para periodo intermedio
	//"  registro.grupo.per_acad = '2007-I'  and " +
	"  registro.asignatura.cod_asig = '" + codAsig + "' " +
	"  group by cod_asig, num_grupo, dia,nomd, hora_ini, hora_fin, cod_sal, cupo_maximo " +
	"  order by cod_asig, num_grupo, dia,nomd, hora_ini " ) ;*/

      /*********************************
       * CON PROFESOR SIN VALIDAR DPTO ******************/
      consulta=new String("select num_grupo, nomd, hora_ini, hora_fin, cod_sal, (cupo_maximo - count(id_reg)), nom_prof " +
              " from  registro.grupo LEFT OUTER JOIN registro.registro ON registro.grupo.id_grupo = registro.registro.id_grupo, registro.asignatura, registro.diassem, " +
              " registro.sal_grupo, registro.salones,  registro.profesor " +
              " where registro.asignatura.cod_asig = ? and registro.grupo.id_asig = registro.asignatura.id_asig and  " +
              " ndi = dia and registro.grupo.id_grupo = registro.sal_grupo.id_grupo and " +
              " registro.sal_grupo.id_sal = registro.salones.id_sal and " +
//Operaciones normales COMEntarizar esta linea despues de semana de registro para inhabilitar busqueda
                " registro.grupo.per_acad = ? and  registro.sal_grupo.per_acad = ? and " +
//Para periodo intermedio '2011-I'
                // registro.grupo.per_acad = '2017-I' and  registro.sal_grupo.per_acad = '2016-I'
               // " registro.grupo.per_acad = '' and  registro.sal_grupo.per_acad = '' and " +
                "  id_profesor = id_prof " +
                " group by cod_asig, num_grupo, dia,nomd, hora_ini, hora_fin, cod_sal, cupo_maximo, nom_prof " +
                " order by cod_asig, num_grupo, dia,nomd, hora_ini ");


      /*********************************
       * CON PROFESOR ***************************
      consulta=new String("select num_grupo, nomd, hora_ini, hora_fin, cod_sal, (cupo_maximo - count(id_reg)), nom_prof, registro.area.id_area, registro.area.id_dpto " +
                " from  registro.grupo, registro.asignatura, registro.diassem, " +
                " registro.sal_grupo, registro.salones, registro.registro, registro.profesor, registro.area " +
                " where registro.grupo.id_asig = registro.asignatura.id_asig and  " +
                " registro.grupo.id_grupo *= registro.registro.id_grupo and  ndi = dia and " +
                " registro.grupo.id_grupo = registro.sal_grupo.id_grupo and " +
                " registro.sal_grupo.id_sal = registro.salones.id_sal and " +
//Operaciones normales
                " registro.grupo.per_acad = '" + cfgEci.getPeriodoActual() + "' and " +
//Para periodo intermedio
                //" registro.grupo.per_acad = '2009-I'  and " +
                " registro.asignatura.cod_asig = '" + codAsig + "' and id_profesor = id_prof and registro.asignatura.id_area=registro.area.id_area" +
                " group by cod_asig, num_grupo, dia,nomd, hora_ini, hora_fin, cod_sal, cupo_maximo, nom_prof, registro.area.id_area, registro.area.id_dpto " +
                " order by cod_asig, num_grupo, dia,nomd, hora_ini ");*/

    /**********************************
       * SIN PROFESOR ********************
    consulta2 = new String("	select num_grupo, nomd, hora_ini, hora_fin, cod_sal, " +
	"  (cupo_maximo - count(id_reg)) " +
	"  from  registro.grupo, registro.asignatura, registro.diassem, " +
	"  registro.sal_grupo, registro.salones, registro.registro, registro.area  " +
	"  where registro.grupo.id_asig = registro.asignatura.id_asig and " +
	"  registro.grupo.id_grupo *= registro.registro.id_grupo and " +
	"  ndi = dia and " +
    "  registro.grupo.id_grupo = registro.sal_grupo.id_grupo and " +
	"  registro.sal_grupo.id_sal = registro.salones.id_sal and " +
//Operaciones normales
	"  registro.grupo.per_acad = '" + cfgEci.getPeriodoActual() + "'  and " +
//Para periodo intermedio
	//"  registro.grupo.per_acad = '2007-I'  and " +
	"  registro.asignatura.cod_asig = '" + codAsig + "' and registro.asignatura.id_area=registro.area.id_area and registro.area.id_dpto= 16 " +
	"  group by cod_asig, num_grupo, dia,nomd, hora_ini, hora_fin, cod_sal, cupo_maximo, registro.area.id_area, registro.area.id_dpto " +
	"  order by cod_asig, num_grupo, dia,nomd, hora_ini " ) ;*/

        //out.println(consulta);
        lisnom.addElement("Grupo") ;
        lisnom.addElement("Día") ;
        lisnom.addElement("Inicio") ;
        lisnom.addElement("Finalización") ;
        lisnom.addElement("Salón") ;
        lisnom.addElement("Disponible") ;
       // lisnom.addElement("Profesor") ;
        /*lisnom.addElement("") ;
        lisnom.addElement("") ;*/
        Abstracta.despliegueTablaHor(out, bd, consulta, lisnom, "HORARIO PARA - " + codAsig.toUpperCase(), param);
        //Abstracta.despliegueTablaHor(out, bd, consulta, consulta2, lisnom, "HORARIO PARA - " + codAsig.toUpperCase());
    }

}
