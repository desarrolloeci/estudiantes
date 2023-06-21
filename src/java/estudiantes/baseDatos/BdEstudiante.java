package estudiantes.baseDatos;

import java.sql.*;
import java.net.*;
import java.util.*;
import java.io.*;

import estudiantes.configuracion.configECI;

/**
 * Esta clase ha sido creada para realizar consultas y actualizaciones a la
 * tabla de Estudiantes.
 */
public class BdEstudiante extends BaseDatos {

    configECI cfgEci = new configECI();

    /**
     * Crea una instancia del objeto base de datos para ser usada por otros
     * objetos. Coloca el numero de registros en -1 y no hay conexion aun :
     * conectado = false
     */
    /*public BdEstudiante () {
     super () ;
     this.dbUrl = "jdbc:freetds:sqlserver://10.1.1.55/REGISTRO" ;
     }*/
    public Vector ConsultaEstReint(String idEst) {
        String consulta = new String();
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);
        consulta = "select top 5 act.id_est, act.nom_est, act.tip_doc, act.doc_est,"
                + "dir_corr, ciu_corr, tel_corr, act.id_dpto, "
                + "lug_exp, nom_acud, dir_acud, tel_acud, nom_otr, dir_otr, "
                + "tel_otr, act.estado, dtur, clanum, tip_est, valren, sem_est, "
                + " par_acud, bas_pru, act.emails,  ISNULL(sem_est,1) AS sem_est ,e.id_plan,"
                + "id_dpplan, nom_prog, cod_plan, dest, passwd,  igrad, fac_cor,"
                + "per_ing, nom_acudiente, pr.id_prog, pilopaga,max_mat  "
                + "from  registro.registro.estudiante_enlace_act  act"
                + " LEFT JOIN  registro.lis_estados lis ON lis.nest = act.estado"
                + "  LEFT JOIN registro.estudiante e ON e.doc_est = act.doc_est "
                + "   LEFT JOIN  registro.plan_estud  p ON e.id_plan = p.id_plan "
                + " LEFT JOIN registro.programas pr  ON pr.id_prog = p.id_prog  "
                + " where act.id_est = ?";
        return this.consultar(consulta, 38, params);
    }

    public Vector ConsultaPrograma(String idEst) {
        String consulta = new String();
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);
        consulta = " select id_est, nom_est, tip_doc, doc_est, dir_corr, ciu_corr, tel_corr, "
                + " registro.estudiante.id_dpto, lug_exp, nom_acud, dir_acud, tel_acud, nom_otr, dir_otr, "
                + " tel_otr, estado, dtur, clanum, tip_est, valren, sem_est, par_acud, bas_pru, emails, "
                + " sem_est, registro.estudiante.id_plan, id_dpplan, nom_prog, cod_plan, dest, passwd, "
                + " igrad, fac_cor, per_ing, nom_acudiente, registro.programas.id_prog, pilopaga "
                + " from registro.lis_estados, registro.estudiante, registro.plan_estud, registro.programas "
                + " where nest = estado and registro.estudiante.id_plan = registro.plan_estud.id_plan and "
                + " registro.plan_estud.id_prog = registro.programas.id_prog and id_est = ?";
        return this.consultar(consulta, 37, params);
    }

    public Vector ConsultaAdmitido(String docEst) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(docEst);

        String consulta = new String();
        consulta = new String(" select  nom_est, id_dpto, estado "
                + " from registro.registro.estudiante "
                + " where doc_est = ? and per_ing= '2015-2' ");
        return this.consultar(consulta, 3, params);
    }

    //CONSULTAR CARNE DEL ESTUDIANTE
    public Vector ConsultaCarne(String mail) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(mail);

        //params.add(mail);
//and estado between -112 and -91) or (emails = ? and estado >= -26 )and (emails = ? and estado <> -10)
        // where (emails = ?   and estado <> -185) and (emails = ?   and estado <> -500) and (emails = ?   and estado <> -10) and (emails = ?   and estado <> -181) and (emails = ?   and estado <> -111)  order by estado asc ";
        String consulta = new String();
        consulta = " select  id_est, nom_est "
                + " from registro.registro.estudiante_enlace_act "
                + " where (REPLACE (REPLACE(emails,'@escuelaing.edu.co',''),'@mail.escuelaing.edu.co','') = ?   and estado not in (-185,-500,-10,-181, -111, 108,105,101,102,-190,-182,-180,-183,-11))  order by estado asc ";
        return this.consultar(consulta, 2, params);
   

    }

    public Vector Fechas() {

        String consulta = new String();
        consulta = new String(" select  DATEPART(hour,GETDATE()) as 'Hour', DATEPART(minute,GETDATE()) as 'Minute', DATEPART(second,GETDATE()) as 'Seconds'  ");
        return this.consultar(consulta, 3);
    }

    //select  DATEPART(hour,GETDATE()) as 'Hour', DATEPART(minute,GETDATE()) as 'Minute', DATEPART(second,GETDATE()) as 'Seconds'
    public Vector ConsultaCiudad(String ciudad, String lugexp) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(ciudad);
        params.add(lugexp);

        String consulta = new String();
        consulta = new String(" select nom_ciu "
                + " from registro.registro.ciudades "
                + " where id_ciu = ? or  id_ciu = ?  ");

        return this.consultar(consulta, 1, params);
    }

    public Vector ConsultaPadres(String carnet) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String(" select tip_res, nom_res, dir_res, tel_res, dir_acti, lug_res, tel_acti, ciu_tra, carg_res, edu_res, id_ocu "
                + " from registro.registro.responsable "
                + " where id_est = ? order by id_res ");
        return this.consultar(consulta, 11, params);
    }

    public Vector ConsultaTutor(String carnet, String periodoact) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(periodoact);
        String consulta = new String();
        consulta = " select  nom_prof  from registro.tutoreado, registro.profesor "
                + " where idprof = id_prof and idest = ? and peracad=? ";
        return this.consultar(consulta, 1, params);
    }

    public Vector SecuenciaReint() {
        String consulta = new String();
        consulta = new String(" select sig_sec  "
                + " from registro.secuencias"
                + " where registro.secuencias.nombre='NUM_SOLREINT' ");
        return this.consultar(consulta, 1);
    }

    public Vector SecuenciaPreinscrip() {

        String consulta = new String();
        Vector cant = new Vector();
        consulta = new String(" select sig_sec  "
                + " from registro.secuencias"
                + " where registro.secuencias.nombre='PREINS_INTERNET' ");
        return this.consultar(consulta, 1);
        /*    consulta = new String("update registro.secuencias set sig_sec = sig_sec + incr where nombre = 'PREINSCRIPCION' ");
         int ret;
         ret = return this.actualizar(consulta);
         return ret.elementAt(0).toString();*/
    }

    public Vector SecuenciaPI() {
        String consulta = new String();
        consulta = new String(" select sig_sec  "
                + " from registro.secuencias"
                + " where registro.secuencias.nombre='ID_INTERSEMESTRAL' ");
        return this.consultar(consulta, 1);
    }

    public int ActSecuenciaPI() {
        String consulta = new String();
        Vector cant = new Vector();
        consulta = new String("update registro.secuencias set sig_sec = sig_sec + incr where nombre = 'ID_INTERSEMESTRAL' ");
        return this.actualizar(consulta);
    }

    public int ActSecuencia() {
        String consulta = new String();
        Vector cant = new Vector();
        consulta = new String("update registro.secuencias set sig_sec = sig_sec + incr where nombre = 'PREINS_INTERNET' ");
        return this.actualizar(consulta);
    }

    public int ActSecuenciaReservas() {
        String consulta = new String();
        Vector cant = new Vector();
        consulta = new String("update registro.secuencias set sig_sec = sig_sec + incr where nombre = 'RESERVAS' ");
        return this.actualizar(consulta);
    }

    public Vector ConsultaHorario(String periodoact, String carnet) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(periodoact);
        params.add(carnet);
        String consulta = new String();

        consulta = new String(" select registro.estudiante.nom_est, cod_asig,   "
                + " cod_sal, dia, hora_ini, hora_fin, num_grupo, estado,nr_sec  "
                + "  from  registro.estudiante, registro.registro, registro.grupo, registro.asignatura, "
                + "  registro.salones, registro.sal_grupo  "
                + "  where registro.grupo.id_grupo = registro.sal_grupo.id_grupo and "
                + " registro.sal_grupo.id_sal = registro.salones.id_sal and "
                + " registro.grupo.per_acad = ?  and "
                + " registro.estudiante.id_est = registro.registro.id_est and   "
                + " registro.grupo.id_grupo = registro.registro.id_grupo and   "
                + " registro.grupo.id_asig = registro.asignatura.id_asig and  "
                + " registro.registro.id_est = ?   order by  hora_ini, hora_fin, dia ");

        return this.consultar(consulta, 9, params);
    }

    public Vector ConsultaHorarioPos(String periodoact, String carnet) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(periodoact);
        params.add(carnet);
        String consulta = new String();

        consulta = new String(" select registro.estudiante.nom_est, cod_asig,  "
                + "  cod_sal, dia, hora_ini, hora_fin, nro, estado   "
                + "  from  registro.estudiante, registro.biblia_post, registro.grupo_post, registro.asignatura, "
                + "  registro.salones, registro.sal_grupo    "
                + " where registro.grupo_post.id_grp = registro.sal_grupo.id_grupo and registro.sal_grupo.per_acad= registro.grupo_post.per_acad and "
                + " registro.sal_grupo.id_sal = registro.salones.id_sal and  "
                + " registro.grupo_post.per_acad= ?  and "
                + " registro.estudiante.id_est = registro.biblia_post.id_est and     "
                + " registro.grupo_post.id_grp = registro.biblia_post.id_grupo and     "
                + " registro.grupo_post.id_asig = registro.asignatura.id_asig and   "
                + " registro.biblia_post.id_est = ?   order by  dia, hora_ini, hora_fin ");

        return this.consultar(consulta, 8, params);
    }

    //PROMEDIO ESTUDIANTE POSGRADO
    public Vector PromedioPos(String carnet) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();

        consulta = new String("SELECT  round((sum(nota*cred )*0.10/ SUM(cred)), 2) "
                + " FROM registro.biblia_post, registro.estudiante "
                + " WHERE ( registro.biblia_post.id_est = registro.estudiante.id_est) and "
                + " ( ( registro.biblia_post.id_est = ?  ) )   and "
                + " ( registro.biblia_post.clave not in('G', 'I', 'F') )  and "
                + " ( registro.biblia_post.nota is not null  ) and prom=1 ");
        return this.consultar(consulta, 1, params);
    }
    //Nuevo horario para estudiantes de posgrado 2013

    public Vector HorarioPosgrado(String periodoact, String carnet) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(periodoact);
        params.add(carnet);

        String consulta = new String();

        consulta = new String(" select registro.estudiante.nom_est, cod_asig,   "
                + "  cod_sal, registro.usosalon.dia,  estado , fecuso, fsol, per_acad,hora, nom_asig   "
                + "  from  registro.estudiante, registro.biblia_post,  registro.asignatura, "
                + "  registro.salones,registro.usosalon     "
                + " where registro.usosalon.id_sal = registro.salones.id_sal  and  "
                + " registro.biblia_post.per_acad= ?   and  "
                + "registro.estudiante.id_est = registro.biblia_post.id_est   and "
                + "  registro.biblia_post.id_asig = registro.asignatura.id_asig and    "
                + "  registro.usosalon.idgrp=registro.biblia_post.id_grupo and    "
                + " registro.biblia_post.id_est = ?  order by  registro.usosalon.fecuso ,registro.usosalon.dia ");

        return this.consultar(consulta, 10, params);
    }

    //Consulta para ver calendario de asignatura de posgrado desde afuera
    public Vector CalendarioPosgrado(String periodoact, String codasig) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(periodoact);
        params.add(codasig);

        String consulta = new String();

        consulta = new String(" select  cod_asig, cod_sal, registro.usosalon.dia,  fecuso, fsol, hora, nom_asig    "
                + "  from  registro.asignatura, registro.salones,registro.usosalon, REGISTRO.grupo_post  "
                + " where registro.usosalon.id_sal = registro.salones.id_sal  and  "
                + "  registro.grupo_post.per_acad= ?   AND  "
                + "registro.grupo_post.id_asig = registro.asignatura.id_asig and "
                + "  registro.usosalon.idgrp=registro.grupo_post.id_grp and registro.asignatura.cod_asig = ?    "
                + " order by  registro.usosalon.fecuso ,registro.usosalon.dia, hora ");

        return this.consultar(consulta, 7, params);
    }

    public Vector getExaIngles(String idEst) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);
        String consulta = new String();

        /* consulta = new String(" select sem_est, estado, count(registro.anot_acad.id_est), min(id_plan), min(tpgrp)"
         + "	from registro.estudiante, registro.anot_acad "
         + "	where registro.estudiante.id_est *= registro.anot_acad.id_est and"
         + "	registro.estudiante.id_est = " + idEst + " and tip_anot in (5880, 6880)"
         + "     group by sem_est, estado ");*/
        consulta = new String(" select sem_est, estado, count(registro.anot_acad.id_est), min(id_plan), min(tpgrp)"
                + "   from registro.estudiante LEFT OUTER JOIN registro.anot_acad ON  registro.estudiante.id_est = registro.anot_acad.id_est and tip_anot in (5880, 6880) "
                + "   where registro.estudiante.id_est = ? "
                + "   group by sem_est, estado ");
        return this.consultar(consulta, 5, params);
    }

    public Vector ConsultaPeriodos(String carnet) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(carnet);
        String consulta = new String();

        /*    consulta = new String("select per_acad " +
         " from registro.biblia_def " +
         " where id_est = " + carnet +
         " group by per_acad union " +
         " select per_acad from registro.biblia_post " +
         " where id_est =  " + carnet + "  and nota >0 and  clave in ('Z', 'H') " +
         " group by per_acad " +
         " order by per_acad ");
         */
        //clave in ('Z', 'H')asi estaba

        consulta = new String("select per_acad "
                + " from registro.biblia_def "
                + " where id_est = ? group by per_acad union "
                + " select per_acad from registro.biblia_post "
                + " where id_est =  ?   and  clave not in ('G', 'C','I')"
                + " group by per_acad "
                + " order by per_acad ");
        return this.consultar(consulta, 1, params);
    }

    public Vector MaxPeriodoPos(String carnet) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        /* consulta = new String("select max(per_acad) from registro.biblia_post "
         + " where id_est=" + carnet + " and idord is not null and id_grupo <> '-1'");*/


        //CAMBIADA EL 12 DE JULIO 2014
        consulta = "select peracad from registro.defcoho, registro.estudiante "
                + " where(registro.defcoho.nco = registro.estudiante.semnv) "
                + " and  (registro.defcoho.idplan = registro.estudiante.id_plan) and id_est = ? ";

        return this.consultar(consulta, 1, params);
    }

    public Vector despNotas(String carnet, String per) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(4);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(per);
        params.add(carnet);
        params.add(carnet);
        params.add(per);

        String consulta = new String();
//sum_ult * 0.1 / can_ult,

        /*  consulta = new String("	select registro.estudiante.nom_est,  cod_dpto, "
         + " cod_plan, sumest * 0.1 / can, 0, "
         + " sem_est,  per_acad, cod_asig, nom_asig, convert(char(3),nota * 0.1), nom, nomt, tpeva "
         + "  from  registro.estudiante, registro.biblia_def, registro.asignatura, "
         + " registro.plan_estud, registro.departamento, registro.claves, registro.codigos,registro.sumnotas "
         + "  where registro.estudiante.id_dpto = registro.departamento.id_dpto and registro.estudiante.id_est = ide and "
         + "        registro.estudiante.id_plan = registro.plan_estud.id_plan and "
         + "        registro.estudiante.id_est = registro.biblia_def.id_est and "
         + "        registro.biblia_def.as_vis = registro.asignatura.id_asig and "
         + "        clave = cd  and prom = cdt and tipo = 'promt' and  "
         + "        registro.biblia_def.per_acad = '" + per + "' and "
         + "        registro.biblia_def.id_est = " + carnet
         + " union all "
         + "select registro.estudiante.nom_est,  cod_dpto, "
         + "cod_plan, sum_est * 0.1 / can_mat, 0,  sem_est,  per_acad, cod_asig, nom_asig, "
         + "convert(char(3),nota * 0.1), nom, nomt, tpeva "
         + "from  registro.estudiante, registro.biblia_post, registro.asignatura, "
         + "registro.plan_estud, registro.departamento, registro.claves, registro.codigos "
         + "where registro.estudiante.id_dpto = registro.departamento.id_dpto and "
         + "registro.estudiante.id_plan = registro.plan_estud.id_plan and "
         + "registro.estudiante.id_est = registro.biblia_post.id_est and "
         + "registro.biblia_post.as_vis = registro.asignatura.id_asig and "
         + "clave = cd and 1 = cdt and tipo = 'promt' and "
         + "registro.biblia_post.per_acad = '" + per + "' and  "
         + "registro.biblia_post.id_est = " + carnet + " ");*/

        consulta = new String("SELECT registro.estudiante.nom_est,  cod_dpto, cod_plan, (select SUM((registro.biblia_def.nota*registro.biblia_def.prom)*.10)/NULLIF(sum(registro.biblia_def.prom), 0) from registro.biblia_def  where id_est = ? and clave <> 'I'), 0, "
                + " sem_est,  per_acad, cod_asig, nom_asig, convert(char(3),nota * 0.1), nom, nomt, tpeva, cred, tip_est  "
                + " FROM  registro.estudiante, registro.biblia_def, registro.asignatura, "
                + " registro.plan_estud, registro.departamento, registro.claves, registro.codigos,registro.sumnotas "
                + " WHERE registro.estudiante.id_dpto = registro.departamento.id_dpto and registro.estudiante.id_est = ide and "
                + " registro.estudiante.id_plan = registro.plan_estud.id_plan and "
                + " registro.estudiante.id_est = registro.biblia_def.id_est and "
                + " registro.biblia_def.as_vis = registro.asignatura.id_asig and "
                + " clave = cd  and prom = cdt and tipo = 'promt' and registro.biblia_def.per_acad = ? and "
                + " registro.biblia_def.id_est = ? "
                + " UNION ALL "
                + " SELECT registro.estudiante.nom_est, cod_dpto, cod_plan,round(SUM((bp.nota*bp.cred)*.10)/sum(bp.cred),2), 0, "
                + " sem_est, registro.biblia_post.per_acad, cod_asig, nom_asig, "
                + "    convert(char(3),registro.biblia_post.nota * 0.1), nom,nomt, tpeva,registro.biblia_post.cred, tip_est  "
                + " FROM registro.asignatura, registro.biblia_post, registro.biblia_post bp,"
                + " registro.estudiante,registro.departamento,registro.plan_estud, registro.claves, registro.codigos "
                + " WHERE registro.estudiante.id_dpto = registro.departamento.id_dpto and "
                + " registro.estudiante.id_plan = registro.plan_estud.id_plan and "
                + " ( registro.asignatura.id_asig = registro.biblia_post.as_vis) and  "
                + " ( registro.biblia_post.id_est = registro.estudiante.id_est) and"
                + " ( registro.biblia_post.as_vis = registro.asignatura.id_asig) and"
                + " ( ( registro.biblia_post.id_est = ? ) )   and registro.biblia_post.per_acad = ? and"
                + "    ( bp.clave not in('G', 'I', 'F') )   and bp.prom > 0 and "
                + " registro.biblia_post.clave = cd and 1 = cdt and tipo = 'promt' and (registro.estudiante.id_est = bp.id_est)"
                + " group by  registro.estudiante.nom_est, cod_dpto, cod_plan, sem_est, registro.biblia_post.per_acad, cod_asig, nom_asig,"
                + " registro.biblia_post.nota, nom, nomt, tpeva,registro.biblia_post.cred, tip_est");

//DESPUES DE BP.CLAVE NOT IN() and ( bp.nota is not null )
//despues de cod_plan, sum_est * 0.1 / can_mat
        return this.consultar(consulta, 15, params);
    }

    /*PERIODO INTEMEDIO - SE CAMBIO LA PARTE FINAL, CUANDO NO SE HABIA CERRADO PERIOD 2004-1 Y EL ARCHIVO SI POR 2004-I*/
    /*public Vector despNotasAct(String carnet, String per){
     String consulta = new String();
     consulta = new String("select registro.estudiante.nom_est,  cod_dpto, " +
     " cod_plan, sum_est * 0.1 / can_mat, sum_ult * 0.1 / can_ult, " +
     " sem_est, cod_asig, nota1, nota2, nota3, nota_lab, nota,nom  " +
     " from  registro.estudiante, registro.registro, registro.grupo, registro.asignatura, " +
     " registro.plan_estud, registro.departamento, registro.claves " +
     " where registro.estudiante.id_dpto = registro.departamento.id_dpto and " +
     " registro.estudiante.id_plan = registro.plan_estud.id_plan and " +
     " registro.estudiante.id_est = registro.registro.id_est and " +
     " registro.grupo.id_grupo = registro.registro.id_grupo and " +
     " registro.grupo.id_asig = registro.asignatura.id_asig and " +
     " clave = cd  and tipo_asig='N' and " +
     " registro.registro.id_est = " + carnet  + " order by registro.grupo.per_acad " ) ;
     return this.consultar(consulta, 13);
     }    */
    /**
     * PERIODO NORMAL *
     */
    public Vector despNotasAct(String carnet, String per) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(carnet);
        params.add(per);

        String consulta = new String();
//sum_ult * 0.1 / can_ult,

        consulta = "select registro.estudiante.nom_est,  cod_dpto, "
                + " cod_plan,(select SUM((registro.biblia_def.nota*registro.biblia_def.prom)*.10)/NULLIF(sum(registro.biblia_def.prom), 0) from registro.biblia_def  where id_est = ? and clave <> 'I'), 0, "
                + " sem_est, cod_asig, convert(char(3),nota1 * 0.1), convert(char(3),nota2* 0.1), "
                + " convert(char(3),nota3* 0.1), convert(char(3),nota_lab* 0.1), convert(char(3),nota* 0.1),nom, nom_dpto,convert(char(3),nota4* 0.1)  "
                + " from  registro.estudiante, registro.registro, registro.grupo, registro.asignatura, "
                + " registro.plan_estud, registro.departamento, registro.claves, registro.sumnotas "
                + " where registro.estudiante.id_dpto = registro.departamento.id_dpto and registro.estudiante.id_est = ide and "
                + " registro.estudiante.id_plan = registro.plan_estud.id_plan and "
                + " registro.estudiante.id_est = registro.registro.id_est and "
                + " registro.grupo.id_grupo = registro.registro.id_grupo and "
                + " registro.grupo.id_asig = registro.asignatura.id_asig and "
                + " clave = cd and "
                + " registro.registro.id_est = ? and registro.grupo.per_acad= ? ";
        return this.consultar(consulta, 15, params);
    }

    public Vector Promedio(String carnet) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = "select convert(numeric(9,2), round (sumest * 0.1 / can,3 )) from registro.estudiante, registro.sumnotas "
                + " where registro.estudiante.id_est = ide and id_est= ? ";
        return this.consultar(consulta, 1, params);
    }


    /*public String despNotasActborrar(String carnet, String per){
     String consulta = new String();
     consulta = new String("select registro.estudiante.nom_est,  cod_dpto, " +
     " cod_plan, sum_est * 0.1 / can_mat, sum_ult * 0.1 / can_ult, " +
     " sem_est, cod_asig, convert(char(3),nota1 * 0.1), convert(char(3),nota2* 0.1), " +
     " convert(char(3),nota3* 0.1), convert(char(3),nota_lab* 0.1), convert(char(3),nota* 0.1),nom, nom_dpto " +
     " from  registro.estudiante, registro.registro, registro.grupo, registro.asignatura, " +
     " registro.plan_estud, registro.departamento, registro.claves " +
     " where registro.estudiante.id_dpto = registro.departamento.id_dpto and " +
     " registro.estudiante.id_plan = registro.plan_estud.id_plan and " +
     " registro.estudiante.id_est = registro.registro.id_est and " +
     " registro.grupo.id_grupo = registro.registro.id_grupo and " +
     " registro.grupo.id_asig = registro.asignatura.id_asig and " +
     " clave = cd  and tipo_asig='N' and " +
     " registro.registro.id_est = " + carnet  + " and registro.grupo.per_acad='" + per + "' ") ;
     return this.consultarborrar(consulta, 14);
     } */
    public Vector HorarioExamen(String carnet, String per) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(per);
        params.add(carnet);

        String consulta = new String();
        consulta = new String("select registro.estudiante.nom_est, cod_asig,   "
                + " desf,  hora_ex,cod_sal, sal_ex,dia_ex   "
                + "  from  registro.estudiante, registro.registro, registro.grupo, "
                + "  registro.asignatura, registro.salones, registro.fechas "
                + "  where  registro.grupo.per_acad = ?  and "
                + " registro.estudiante.id_est = registro.registro.id_est and   "
                + " registro.grupo.id_grupo = registro.registro.id_grupo and   "
                + " registro.grupo.id_asig = registro.asignatura.id_asig and  "
                + " registro.salones.id_sal= registro.grupo.sal_ex and "
                + " registro.grupo.dia_ex= registro.fechas.idf and (tipo_asig='N' or tipo_asig='L') and "
                + " registro.registro.id_est = ?  order by dia_ex, hora_ex, sal_ex ");

        return this.consultar(consulta, 7, params);
    }
//Asignaturas q se pueden preinscribir 

    public Vector getPreinscripcion(String carnet) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        /*    consulta = new String("update registro.pre_internet set fec = getdate() where id_est = " + carnet);
         this.actualizar(consulta);*/
        consulta = new String("select cod_asig, prio, num_ulas_a, val_ele, nom_asig, registro.asignatura.id_asig, opcion  "
                + " from registro.asignatura, registro.pre_internet "
                + " where  registro.pre_internet.id_asig = registro.asignatura.id_asig and  "
                + " tipo_asig = 'N' and registro.pre_internet.id_est = ?  and opcion < 0 "
                + " and ( registro.pre_internet.id_asig in (select id_asig from registro.grupo) or registro.pre_internet.id_asig in (select id_asig from registro.grupo_post) ) order by prio,opcion desc, cod_asig ");
        return this.consultar(consulta, 7, params);
    }

    //Modificaciones a la preinscripción
    public Vector getModificaPreins(String carnet) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        //tipo_asig = 'N' se cambia por  tipo_asig in ('P', 'N')
        String consulta = new String();
        consulta = new String("select cod_asig,  nom_asig, registro.asignatura.id_asig,cd_lab, lab,num_ulas_a  "
                + " from registro.asignatura, registro.inscripcionprim "
                + " where  registro.inscripcionprim.id_asig = registro.asignatura.id_asig and    "
                + " tipo_asig in ('P', 'N', 'L') and registro.inscripcionprim.id_est = ?  and registro.inscripcionprim.id_asig <> '1000000' "
                + " and  registro.inscripcionprim.id_asig in (select id_asig from registro.grupo) order by  cod_asig");
        return this.consultar(consulta, 6, params);
    }

//Buscar asignaturas con preinternet (NO MATERIAS FUNDAMENTACION)
    public Vector BuscarAsig(String per, String carnet, String entrada) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add("%" + entrada + "%");
        params.add("%" + entrada + "%");
        String consulta = new String();
        consulta = new String("select cod_asig, nom_asig, num_ulas_a,  val_ele, id_asig from registro.asignatura " +
        "where  (registro.asignatura.nom_asig like  ? OR registro.asignatura.cod_asig like ? and " +
        "(registro.asignatura.cod_asig not like '%FQUI%' and registro.asignatura.cod_asig not like '%FMAT%' " +
        "and registro.asignatura.cod_asig not like '%EXOE%' and registro.asignatura.cod_asig not like '%FFIS%'" +
        "and registro.asignatura.cod_asig not like '%TQUI%' and registro.asignatura.cod_asig <> 'TFIS'))");
        //consulta original se quita por ahora la ultima parte porq no hay programacion aun en registro.grupo para 2011-2
        /*consulta = new String("select cod_asig, nom_asig, num_ulas_a,  val_ele, id_asig from registro.asignatura " +
         "where  (registro.asignatura.nom_asig like  '%" + entrada + "%' OR registro.asignatura.cod_asig like '%" + entrada + "%') and id_asig not in (select id_asig from registro.pre_internet where id_est= " + carnet + ") " +
         "and  registro.asignatura.id_asig in (select id_asig from registro.grupo where per_acad='" + per + "') ");*/

        return this.consultar(consulta, 5, params);
    }

    //Buscar Asignaturas con inscripcionprim
    public Vector Buscarprim(String per, String carnet, String entrada) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(4);

        //Agregamos cada uno de los datos al ArrayList
        params.add("%" + entrada + "%");
        params.add("%" + entrada + "%");
        params.add(carnet);
        params.add(per);
        String consulta = new String();
        consulta = new String("select cod_asig, nom_asig, num_ulas_a,  val_ele, id_asig, cd_lab, lab from registro.asignatura "
                + "where  (registro.asignatura.nom_asig like  ? OR registro.asignatura.cod_asig like ?) and id_asig not in (select id_asig from registro.inscripcionprim where id_est= ?) "
                + "and  registro.asignatura.id_asig in (select id_asig from registro.grupo where per_acad=?) ");
        return this.consultar(consulta, 7, params);
    }

    //Verificar si la asignatura a buscar es del plan de estudios
    public Vector BuscarPlan(String carnet, String idAsig) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList

        params.add(idAsig);
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select idas,  idest from registro.asplanestud "
                + "where  registro.asplanestud.idas= ? and registro.asplanestud.idest= ? ");
        return this.consultar(consulta, 2, params);
    }

    //CONSULTAR PLAN VIGENTE PARA CADA PROGRAMA 
    public Vector PlanVigente(String prog) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList

        params.add(prog);

        String consulta = new String();
        consulta = "select id_plan, id_prog,cod_plan, act from registro.plan_estud "
                + "where  id_prog= ? and act='S' ";
        return this.consultar(consulta, 3, params);
    }

    //CONSULTAR Nro PLAN  PARA CADA PROGRAMA 
    public Vector NroPlan(String idplan) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList

        params.add(idplan);

        String consulta = new String();
        consulta = "select cod_plan from registro.plan_estud "
                + "where  id_plan= ?  ";
        return this.consultar(consulta, 1, params);
    }

    //
    //where id_plan='334' and id_asig=9703
    public Vector Nivel(String prog, String idasig) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList

        params.add(prog);
        params.add(idasig);

        String consulta = new String();
        consulta = "select nivel from registro.asig_plan "
                + "where  id_plan= ? and id_asig=? ";
        return this.consultar(consulta, 1, params);
    }

    //Verificar si la asignatura tiene laboratorio se le debe preinscribir de una vez
    public Vector BuscarLab(String idAsig) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idAsig);

        String consulta = new String();
        consulta = new String("select  cod_asig, cd_lab, nom_asig, id_asig from registro.asignatura "
                + "where  registro.asignatura.id_asig= ?  ");
        return this.consultar(consulta, 4, params);
    }

    //MIRAR LOS REQUISITOS PARA PREINSCRIBIR
    //and (registro.estudiante.id_plan = idplan or registro.estudiante.id_dpplan =
//idplan)
    public Vector Requisitos(String carnet, String idAsig) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(4);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(idAsig);
        params.add(carnet);
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select count(distinct id_bib), count(distinct registro.asig_plan.id_asig)"
                + " from registro.estudiante, registro.biblia_def, registro.asplanestud,  registro.req_plan, registro.asig_plan "
                + "  where  id_aspl = id_asig_plan1 and  id_asig_plan2 = id_asig_plan and (registro.estudiante.id_plan = idplan  or registro.estudiante.id_dpplan =idplan)and "
                + "  registro.asig_plan.id_asig *= registro.biblia_def.id_asig and nota >= 30 and clave not in ('C', 'R') and "
                + "  idest = ? and idas = ? and registro.biblia_def.id_est = ? and registro.estudiante.id_est = ? ");

        // String consulta = new String();
       /* consulta = new String("select count(distinct id_bib), count(distinct registro.asig_plan.id_asig) "
         + "   from registro.estudiante, registro.asplanestud,  registro.req_plan, "
         + "   registro.asig_plan LEFT OUTER JOIN registro.biblia_def ON registro.asig_plan.id_asig = registro.biblia_def.id_asig"
         + "   where  id_aspl = id_asig_plan1 and  id_asig_plan2 = id_asig_plan and   registro.estudiante.id_plan = idplan and"
         + "   nota >= 30 and clave not in ('C', 'R') and "
         + "   idest = " + carnet + " and idas = " + idAsig + " and registro.biblia_def.id_est =  " + carnet + " and registro.estudiante.id_est = " + carnet + " ");*/
        return this.consultar(consulta, 2, params);
    }

    public Vector ReqEspeciales(String carnet, String idReq, String idReq2) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(5);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idReq);
        params.add(idReq);
        params.add(idReq2);
        params.add(idReq2);
        params.add(carnet);
        String consulta = new String();
        /*   consulta = new String("select nivelicfes, count(distinct id_bib) "
         + " from registro.biblia_def, registro.estudiante "
         + " where  registro.biblia_def.id_est =* registro.estudiante.id_est and nota >= 30 and clave not in ('C', 'R') and "
         + " (id_asig = " + idReq + " or as_vis = " + idReq + " or id_asig = " + idReq2 + " or as_vis = " + idReq2 + ")  and registro.estudiante.id_est =  " + carnet + " group by nivelicfes ");*/

        consulta = "select nivelicfes, count(distinct id_bib) "
                + " from registro.biblia_def  RIGHT OUTER JOIN registro.estudiante on "
                + "registro.biblia_def.id_est = registro.estudiante.id_est and (id_asig = ? or as_vis = ? or id_asig = ? or as_vis = ?) and nota >=30 and clave not in ('C', 'R') "
                + "where registro.estudiante.id_est =  ? group by nivelicfes ";

        return this.consultar(consulta, 2, params);
    }

    public Vector BibliaDef(String carnet) {

        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = "select count (*) " + " from registro.biblia_def " + " where as_vis in (10134, 9687,9684,9686) and clave not in ('C', 'R') and nota >= 30 and id_est =   ? ";
        return this.consultar(consulta, 1, params);
    }

    public Vector ReqIngles(String carnet, String iding) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList

        params.add(iding);
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select  count(*) "
                + " from registro.clasif_inglesestud "
                + " where id_asig = ?  and id_est = ? ");
        return this.consultar(consulta, 1, params);
    }

    // Buscar el id_prog para la siguiente consulta
    public Vector Idprog(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();

        consulta = new String(" select registro.estudiante.id_plan, id_prog "
                + "from registro.estudiante, registro.plan_estud "
                + "where id_est= ? and registro.estudiante.id_plan=registro.plan_estud.id_plan");
        return this.consultar(consulta, 2, params);
    }

    //Mirar requisitos fuera del plan
    public Vector Noplanestud(String idAsig, String idprog) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idAsig);
        params.add(idprog);
        String consulta = new String();

        consulta = new String("select id1, id2, id3, id4, id5 "
                + "FROM registro.progelectiva "
                + "where id_as = ? and (id_prg = 0 or id_prg = ? ) and "
                + " (id1 is not null or id2 is not null or id3 is not null or id4 is not null or id5 is not null)");
        return this.consultar(consulta, 5, params);
    }

    //Para cada una de los registros que se traiga debe chequear que esté en la
//biblia del estudiante, mirar cuantas son las asignaturas requisitos y
    public Vector VerBiblia(String carnet, String id1, String id2, String id3, String id4, String id5) {
        ArrayList<String> params = new ArrayList<String>(11);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(id1);
        params.add(id1);
        params.add(id2);
        params.add(id2);
        params.add(id3);
        params.add(id3);
        params.add(id4);
        params.add(id4);
        params.add(id5);
        params.add(id5);
        String consulta = new String();
        consulta = new String("select count(distinct id_asig) "
                + "from registro.biblia_def "
                + "where  id_est =  ? and nota >= 30 and clave not in ('C', 'R') and "
                + "(id_asig = ? or as_vis = ? or id_asig =  ? or as_vis = ? or "
                + "id_asig = ? or as_vis = ? or id_asig = ? or "
                + "as_vis = ? or id_asig = ? or as_vis = ? ) ");
        return this.consultar(consulta, 1, params);
    }

//Actualizar preinscripción
    public int Actualpreins(String idAsig, String carnet) {
        //Creamos un ArrayList de Strings, del tamaño de la cantidad de parámetros.
        ArrayList<String> params = new ArrayList<String>(2);

        String[] ident = idAsig.split(",");
        String consultaIN = "(";
        //Agregamos cada uno de los datos al ArrayList
        for (int i = 0; i < ident.length; i++) {
            params.add(ident[i]);
            if (i != 0) {
                consultaIN += " or ";
            }
            consultaIN += "id_asig = ?";
        }

        consultaIN += ")";

        params.add(carnet);

        String consulta = new String();
        consulta = new String("update registro.pre_internet set opcion = opcion*(-1), fec= getdate()  "
                + " where " + consultaIN + " and id_est= ? ");
        return this.actualizar(consulta, params);
    }

    //ACTUALIZAR FECHASIEMPRE AL INGRESAR AL SERVICIO
    public int ActualFecha(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("update registro.pre_internet set fec= getdate()  "
                + " where  id_est= ?");
        return this.actualizar(consulta, params);
    }

    //Valor que retorna el procedimiento
    public Vector VeriPreins(String carnet, String idAsig) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(idAsig);

        String consulta = new String();
        consulta = new String("select res from registro.resp_requis where est = ?  and asig = ? ");
        return this.consultar(consulta, 1, params);
    }

    //Borrar dato
    public int BorrarVeriPreins(String idAsig, String carnet) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(idAsig);
        String consulta = new String();
        consulta = new String("delete  from registro.resp_requis where est =  ? and asig = ? ");
        return this.actualizar(consulta, params);
    }

//Borrar de  preinscripciónPRIM
    public int Borrarpreins(String idAsig, String carnet) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idAsig);
        params.add(carnet);

        String consulta = new String();
        consulta = new String("delete from registro.inscripcionprim"
                + " where  id_asig in (?) and id_est= ?");
        return this.actualizar(consulta, params);
    }

    /*  actualizar = new String("insert into registro.usosalon " +
     " (fecuso, iduso, id_sal, hora, dia, fsol, tipo, estad, per, prof, idgrp, " +
     " asig, ngrp, descr, cap, req, hfin, tblq, docsol, valor) values (convert(varchar(10), '" + fecuso + "', 103), " + resec + ", " + idsal + ", " + horaini + ", " + ndia + ", getdate(), '" +
     tipo + "', '" + estado + "', '" + empleado.getPerHorario() + "', " + idProf + ", " + texto[1] + ", " + texto[2] + ", " +
     2 + ", '" + descr.toUpperCase() + "', '', '', " + horafin + ", '" + tblq + "', " + cedula + ", '"+total +"' ) ");*/
    //insertar reserva de gimnasio en usosalon
    public int ReservaGimnasio(int resec, String idsal, String tipo, String estado, String per, String carnet, String descr) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList

        String consulta = new String();
        consulta = new String("insert into registro.usosalon  (fecuso, iduso, id_sal,  fsol, tipo, estad, per, prof, idgrp, "
                + " asig, ngrp, descr, cap, req, hfin, tblq, docsol, valor) values  (getdate(), " + resec + ", " + idsal + ", getdate(), '"
                + tipo + "', '" + estado + "', '" + per + "', NULL, NULL, NULL, "
                + 1 + ", '" + descr.toUpperCase() + "', '1', 'C', NULL, 1, " + carnet + ", '" + 15000 + "' ) ");
        return this.actualizar(consulta, params);
    }
    
    //Consultar si un usuario tiene desbloqueado el acceso al servicio de gimnasio
    public Boolean bloqueadoGimnasio(String idEst, String per_acad){
        String consulta="select DISTINCT(GIM.doc) from registro.bloqueados_gimnasio GIM JOIN registro.estudiante EST " +
                        " ON EST.doc_est=GIM.doc WHERE EST.id_est='"+idEst+"' and GIM.per_acad='"+per_acad+"'";
        Vector bloqueado=this.consultar(consulta, 1);
        return bloqueado.size()>0;
    }
    
    
    
            
    //Consultar si está desbloqueado el acceso al servicio de gimnasio
    public Boolean desbloqueadoServicioGimnasio(String per_acad){
        String consulta="select * from registro.bloqueados_gimnasio where per_acad='"+per_acad+"' and doc='0000000000' and bloqueado='0'";
        Vector desbloqueado=this.consultar(consulta, 1);
        return desbloqueado.size()>0;
    }

    //contar cuantos han solicitado gimasio para control máximo dado semestralmente por empleados del gimnasio
    public Vector ControlaGimnasio(String per) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(per);

        String consulta = new String();
        consulta = new String("select count (iduso) from registro.usosalon where id_sal='134' and per=? and descr <> 'No disponible'");
        return this.consultar(consulta, 1, params);
    }

    //Consultar si el estudiante ya solicito reserva gimnasio
    public Vector ControlaInscritoGimnasio(String per, String carnet) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(per);
        params.add(carnet);

        String consulta = new String();
        consulta = new String("select docsol , id_sal, iduso from registro.usosalon where id_sal='134' and per=? and docsol=? ");
        return this.consultar(consulta, 3, params);
    }

//Insertar en pre_internet
    public int Insertapreins(String idAsig, String carnet) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(idAsig);

        String consulta = new String();
        consulta = new String("insert into registro.pre_internet values (?, ?, 0,0, getdate(), '1' )");
        return this.actualizar(consulta, params);
    }

//Insertar en r.estadisticos registro cdo se autenntica el estudiante
    public int Insertaestadis(String año, String mes, String carnet) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(año);
        params.add(mes);

        String consulta = new String();
        consulta = new String("insert into registro.estadis.estadisticos values (getdate(),?, ?, ?, 'SAE', 'login')");
        return this.actualizar(consulta, params);
    }

//Seleccionar las asignaturas q el estudiante ya preinscribio
    public Vector getAdicionaPreinsc(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();

        consulta = new String("select cod_asig, prio, num_ulas_a, val_ele, nom_asig, registro.asignatura.id_asig, opcion  "
                + " from registro.asignatura, registro.pre_internet "
                + " where  registro.pre_internet.id_asig = registro.asignatura.id_asig  and registro.pre_internet.id_est = ? and opcion > 0 "
                + " order by prio,opcion asc, cod_asig ");
        return this.consultar(consulta, 7, params);
    }
//and  tipo_asig = 'N'
    //Sumar créditos de la preinscripción

    public Vector getCreditos(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        Vector cant = new Vector(), cred = new Vector();
        consulta = new String("select sum(num_ulas_a) "
                + " from registro.asignatura, registro.pre_internet "
                + " where  registro.pre_internet.id_asig = registro.asignatura.id_asig and   "
                + "  tipo_asig = 'N' and registro.pre_internet.id_est = ? and "
                + " opcion > 0 ");
        return this.consultar(consulta, 1, params);
    }

    //Sumar créditos de la preinscripción definitiva
    public Vector getCreditosDef(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        Vector cant = new Vector(), cred = new Vector();
        consulta = new String("select sum(num_ulas_a) "
                + " from registro.asignatura, registro.inscripcionprim "
                + " where  registro.inscripcionprim.id_asig = registro.asignatura.id_asig and   "
                + "  tipo_asig = 'N' and registro.inscripcionprim.id_est = ?  ");
        return this.consultar(consulta, 1, params);
    }

    public Vector getPeriodoAc(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        Vector cant = new Vector(), cred = new Vector();
        consulta = new String("select per_ing "
                + " from registro.estudiante"
                + " where  registro.estudiante.id_est = ?  ");
        return this.consultar(consulta, 1, params);
    }

    public Vector getPreintermedio(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        consulta = new String("select registro.asignatura.id_asig, nom_asig + ' ' +cod_asig, num_ulas_a  "
                + " from registro.asignatura, registro.preins_int "
                + " where  registro.preins_int.id_asig = registro.asignatura.id_asig and tanda >= 0 and "
                + " tipo_asig = 'N' and registro.preins_int.id_est = ? order by nom_asig, cod_asig ");
        return this.consultar(consulta, 3, params);
    }

    public int borrarPreinscripcion(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        consulta = new String("delete from registro.pre_internet "
                + " where  registro.pre_internet.id_est = ? ");
        return this.actualizar(consulta, params);
    }

    public int borrarAsigPreintermedio(String carnet, String idAsig) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idAsig);
        params.add(carnet);
        String consulta = new String();
        consulta = new String("delete from registro.preins_int "
                + " where (valor <= 0 or valor is null) and id_asig = ? and id_est = ? ");
        return this.actualizar(consulta, params);
    }

    public int insMatricula(String carnet, String peracad, String idord) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList
        params.add(peracad);
        params.add(carnet);
        // params.add(idord);
        int ret;
        String consulta = new String();
        consulta = new String(" update registro.ordenes set val_pag = 1 "
                + " where per_acad = ? and val_pag = 0 and id_est = ? ");
        ret = actualizar(consulta, params);
        if (ret > 0) {
            params = new ArrayList<String>(1);

            //Agregamos cada uno de los datos al ArrayList
            params.add(idord);
            consulta = " update registro.plan_pagos set val_pago = 1, fec_pago = getdate() "
                    + " where id_ord = ? and val_pago = 0 ";
            ret = actualizar(consulta, params);
        }
        return ret;

    }
//" values ( " + sec + ", " + carnet  + ", " + idAsig  + ", 'N', 0, 1, 1, getdate() )")  *** Para inscripciones primera vez
//" values ( " + sec + ", " + carnet  + ", " + idAsig  + ", 'N', 0, 1, 2, getdate() )")  *** Para inscripciones segunda vez

    public int inscAsigPreintermedio(String carnet, String idAsig, String sec) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(idAsig);
        params.add(idAsig);

        String consulta = new String();
        Vector cant = new Vector(), cup = new Vector(), vis = new Vector();

        //= Con esto se verifica que vea por por primera o segunda vez en reingresos
        consulta = "select count(*) from registro.biblia_def, registro.estudiante "
                + "   where registro.biblia_def.id_est = registro.estudiante.id_est and "
                + " registro.estudiante.id_est = ? and ( as_vis = ? or id_asig = ?) "
                + " and clave not in ('C', 'R') and tip_est = 'R'  ";
        cant = this.consultar(consulta, 1, params);
        vis = (Vector) cant.elementAt(0);
        if (Integer.parseInt((String) vis.elementAt(0)) > 1) {
            return 0;
        }
        //== Verifica que haya cupo
        ArrayList<String> params1 = new ArrayList<String>(1);
        params1.add(idAsig);
        consulta = "select num_ulas_b - count(id_est) "
                + " from registro.asignatura LEFT OUTER JOIN registro.preins_int ON registro.asignatura.id_asig = registro.preins_int.id_asig"
                + " where registro.asignatura.id_asig = ? group by num_ulas_b";
        cant = this.consultar(consulta, 1, params1);
        cup = (Vector) cant.elementAt(0);

        if (Integer.parseInt((String) cup.elementAt(0)) > 0) {
            params1 = new ArrayList<String>(3);
            params1.add(sec);
            params1.add(carnet);
            params1.add(idAsig);
            consulta = new String("insert into registro.preins_int "
                    + " (id_pre, id_est, id_asig, reg_pag, valor, nro_ran, tanda, fec) "
                    + " values ( ?, ?, ?, 'N', 0, 1, 2, getdate() )");
            return this.actualizar(consulta, params1);
        }
        return 0;
    }

    public int insPreinscripcion(String carnet, Vector asig) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList

        params.add(carnet);
        String consulta = new String("insert into registro.pre_internet "
                + " (id_est, id_asig, estado, prio, fec) "
                + " values (?, " + (String) asig.elementAt(0)
                + ", 0, '" + (String) asig.elementAt(4) + "', getdate() ) ");
        return this.actualizar(consulta, params);
    }

    // Insertar preinscripción en registro.inscripcionprim
    public int InsertaPreinsprim(String carnet, String sec, String idasig, String per) {
        ArrayList<String> params = new ArrayList<String>(5);

        //Agregamos cada uno de los datos al ArrayList
        params.add(sec);
        params.add(carnet);
        params.add(idasig);
        params.add(idasig);
        params.add(per);

        String consulta = new String("insert into registro.inscripcionprim "
                + " (id_pre,id_est, id_asig, sem_rel, cor2, as_vis, tip_ele, per_acad, grp, visdp) "
                + " values (?, ?, ?,1,0, ?, 'Z', ?, 21,'-1' ) ");
        return this.actualizar(consulta, params);
    }

    public int inscripicfes(String carnet, String documento, String celular) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList 
        params.add(carnet);
        params.add(documento);
        params.add(celular);

        String consulta = new String("insert into registro.inscripicfes "
                + " (idest, documento, celular, fechainsc) "
                + " values (?, ?, ?, getdate()) ");
        return this.actualizar(consulta, params);
    }

    public int CreditosExtras(String carnet, String per, String cred, String justif) {
        ArrayList<String> params = new ArrayList<String>(4);
        
        //Se consulta que no haya creditos solicitados
        
        params.add(carnet);
        params.add(per);
        String consulta = new String();
        consulta = new String("select id_est, estado, razon "
                + "from registro.creditos_extra "
                + "where id_est=? and per_acad=?   ");
        Vector sols= this.consultar(consulta, 3, params);
        int ans = 0;
        if(sols.isEmpty()){
            //Agregamos cada uno de los datos al ArrayList 
            params.clear();
            
            params.add(carnet);
            params.add(per);
            params.add(cred);
            params.add(justif);

            consulta = "insert into registro.creditos_extra "
                    + " (id_est, per_acad,estado,cred_sol,raz_est,fec_sol) "
                    + " values (?, ?, 0, ?, ?, getdate()) ";
            ans= this.actualizar(consulta, params);
        }
        return ans;
    }

    //CONSULTA RESPUESTA A SOLICITUD DE CREDITOS EXTRAS
    public Vector ConsultacreditosE(String per, String carnet) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList

        params.add(carnet);
        params.add(per);
        String consulta = new String();
        consulta = new String("select id_est, estado, razon "
                + "from registro.creditos_extra "
                + "where id_est=? and per_acad=?   ");
        return this.consultar(consulta, 3, params);
    }

    public Vector Datos(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList

        params.add(carnet);
        String consulta = new String();
        consulta = new String("select nom_est, id_est, tip_doc,doc_est "
                + "FROM  registro.estudiante "
                + "WHERE  id_est = ?");
        return this.consultar(consulta, 4, params);
    }

//===========================Monitorias===================================================================================
    public Vector getMonitorias(String carnet) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(carnet);
        String consulta = new String();
        consulta = new String(" select e.id_est, round(sum( ( b.prom * b.nota )*0.1 ) /  ( sum( b.prom)), 3) as prom_acum, round(sum( ( bf.prsem * bf.nota )*0.1 ) /  ( sum( bf.prsem)), 2) as prom_sem, e.sem_est"
                + " from registro.estudiante e inner join registro.biblia_def bf on e.id_est = bf.id_est inner join registro.biblia_def b on e.id_est = b.id_est"
                + " where bf.per_acad in (select max(per_acad) from registro.biblia_def where id_est = ? and clave not in ('C', 'R') and per_acad not like '%-I%') and e.id_est = ? "
                + " group by e.id_est, e.sem_est"
                + " HAVING ( sum(b.prom) > 0 ) and  ( sum(bf.prsem) > 0) ");
        return this.consultar(consulta, 4, params);
    }

    public Vector getAsigmonitorias(String per) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(per);

        String consulta = new String();
        consulta = new String("select id_asig, nom_asig "
                + "from registro.asignatura, registro.asigconvoca "
                + "where (registro.asignatura.id_asig = registro.asigconvoca.idAsignatura) and "
                + " peracad = ? and aceptada = 1 order by nom_asig asc ");
        return this.consultar(consulta, 2, params);
    }
    
    public Vector getAsigA(String carnet, String idasig, String val) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(idasig);
        params.add(idasig);
        //params.add(val);

        String consulta = new String();
        if(val.equals("1")){
            consulta = new String("select count(*) from registro.biblia_def where id_est = ? and (id_asig = ? or as_vis = ?) and clave not in ('C') ");
        }else{
            consulta = new String("select count(*) from registro.biblia_def where id_est = ? and (id_asig = ? or as_vis = ?) and clave not in ('C') and nota >= 38 ");
        }
        return this.consultar(consulta, 1, params);
    }

    public Vector getAmonest(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        consulta = new String("select count(*) from registro.anotacion_aux where tip_anot = 1487 and id_tabla = ?");
        return this.consultar(consulta, 1, params);
    }

 public Vector getUltPer(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select max(per_acad) "
                + "from registro.biblia_def "
                + "where id_est = ? and per_acad not like '%-I' ");
        return this.consultar(consulta, 1, params);
    }
 
//============================================================================================================================

    public Vector getNroasigmon(String carnet, String per) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(per);
        String consulta = new String();
        consulta = new String("select count(id_as) "
                + "from registro.sol_monitoria "
                + "where idest = ? and periodo = ?");
        return this.consultar(consulta, 1, params);
    }

    public Vector getPbiblia(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select max(per_acad) "
                + "from registro.biblia_def "
                + "where id_est = ? ");
        return this.consultar(consulta, 1, params);
    }

    public Vector getNperdidas(String carnet, String per) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(per);
        String consulta = new String();
        consulta = new String("select count(id_asig) "
                + "from registro.biblia_def "
                + "where id_est = ? and per_acad = ? and nota < 30 and clave='Z' ");
        return this.consultar(consulta, 1, params);
    }

    public Vector getAsigmonsol(String carnet, String per) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(per);
        String consulta = new String();
        consulta = new String("select id_as, cod_asig, nom_asig  "
                + "from registro.sol_monitoria, registro.asignatura "
                + "where (registro.sol_monitoria.id_as = registro.asignatura.id_asig) and idest = ? and periodo = ? ");
        return this.consultar(consulta, 3, params);
    }
//FIN MONITORIAS

    public int insMonitorias(String carnet, String asig, String nro, String per) {
        ArrayList<String> params = new ArrayList<String>(4);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(asig);
        params.add(nro);
        params.add(per);

        String consulta = new String("insert into registro.sol_monitoria "
                + " (idest, id_as, id_conv, fecha , aprobo, cant_asig, automatica, periodo) "
                + " values (?, ?, 1, getdate(), 0, ?, 0, ? ) ");
        return this.actualizar(consulta, params);
    }

    public int elimMonitorias(String carnet, String val) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(val);
        String consulta = new String("delete from registro.sol_monitoria "
                + " where idest = ? and id_as = ? ");
        return this.actualizar(consulta, params);
    }

    public Vector icfes(String carnet) {

        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        consulta = new String("select  idest, documento "
                + "FROM  registro.inscripicfes "
                + "WHERE  idest = ? ");
        return this.consultar(consulta, 2, params);
    }

    public Vector despInfAsi(PrintWriter out, String carnet, String ident) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(ident);
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select nom_asig, nom_est "
                + "FROM registro.asignatura, registro.estudiante "
                + "WHERE id_asig = ? and id_est = ? ");
        return this.consultar(consulta, 2, params);
    }


    /* public Vector despDetallePlanPos(String carnet, PrintWriter out) {
     String consulta = new String(), prog = new String();
     Vector lisnom = new Vector();

     consulta = new String("select  registro.asignatura.id_asig, " +
     " cod_asig + '(' + convert(varchar(2), peso) + ')', " +
     "linea, semestre,  nom_prog, cod_plan, registro.estudiante.nom_est, id_dpplan, nom_asig  " +
     "FROM registro.asignatura, registro.asig_plan, registro.estudiante, registro.programas, registro.plan_estud " +
     "WHERE registro.asignatura.id_asig = registro.asig_plan.id_asig and " +
     " registro.asig_plan.id_plan = registro.estudiante.id_plan and " +
     " registro.plan_estud.id_plan = registro.estudiante.id_plan and " +
     " registro.programas.id_prog = registro.plan_estud.id_prog and " +
     " linea > 0 and semestre > 0 and semestre < 12 and " +
     " id_est = " + carnet +"  order by linea, semestre ") ;
     return this.consultar(consulta, 9);
     }*/
    public Vector despDetallePlan(String carnet, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String(), prog = new String();
        Vector lisnom = new Vector();

        /*  consulta = new String("select  registro.asignatura.id_asig, " +
         " cod_asig + '(' + convert(varchar(2), peso) + ')', " +
         "linea, semestre,  nom_prog, cod_plan, registro.estudiante.nom_est, id_dpplan, nom_asig  " +
         "FROM registro.asignatura, registro.asig_plan, registro.estudiante, registro.programas, registro.plan_estud " +
         "WHERE registro.asignatura.id_asig = registro.asig_plan.id_asig and " +
         " registro.asig_plan.id_plan = registro.estudiante.id_plan and " +
         " registro.plan_estud.id_plan = registro.estudiante.id_plan and " +
         " registro.programas.id_prog = registro.plan_estud.id_prog and " +
         " linea > 0 and semestre > 0 and semestre < 12 and " +
         " id_est = " + carnet +"  order by linea, semestre ") ;
         return this.consultar(consulta, 9);*/

        consulta = new String(" select  registro.asignatura.id_asig, "
                + " cod_asig + '(' + convert(varchar(2), peso) + ')', "
                + " linea, semestre,  nom_prog, cod_plan, registro.estudiante.nom_est, id_dpplan, nom_asig, registro.estudiante.id_plan  "
                + "  FROM registro.asignatura, registro.asplanestud, registro.estudiante, registro.programas, registro.plan_estud "
                + " WHERE registro.asignatura.id_asig = registro.asplanestud.idas and idest = registro.estudiante.id_est and "
                + " registro.asplanestud.idplan = registro.estudiante.id_plan and "
                + " registro.plan_estud.id_plan = registro.estudiante.id_plan and  "
                + " registro.programas.id_prog = registro.plan_estud.id_prog and  "
                + " linea > 0 and semestre >= 0 and semestre < 20 and "
                + " id_est = ?  order by linea, semestre ");
        return this.consultar(consulta, 10, params);
    }

    // total  de los creditos aprobados en el plan  de estudio
    public Vector despCreditos(String carnet, String idplan, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idplan);
        params.add(carnet);
        params.add(carnet);
        String consulta = new String();

        /* consulta = new String("select sum(num_ulas_a) " +
         "from registro.biblia_def, registro.asig_plan, registro.asignatura " +
         "where ( registro.biblia_def.id_asig = registro.asig_plan.id_asig or " +
         "registro.biblia_def.as_vis = registro.asig_plan.id_asig) " +
         "and registro.asig_plan.id_asig = registro.asignatura.id_asig " +
         "and nota >= 30 and clave not in ('R', 'C') and id_plan = " + idplan + " and " +
         "registro.biblia_def.id_est = " + carnet + " ");*/
        //out.println("consulta");

        consulta = "select sum(peso) "
     + "from registro.biblia_def, registro.asplanestud, registro.asignatura "
     + "where ( registro.biblia_def.id_asig = registro.asplanestud.idas or  "
     + "registro.biblia_def.as_vis = registro.asplanestud.idas )    and "
     + " registro.asplanestud.idas = registro.asignatura.id_asig   "
     + "and  nota >= 30 and (clave not in ('R', 'C') or (clave = 'I' and registro.biblia_def.per_acad >= '2018-2' and registro.biblia_def.per_acad <> '2018-i')) and idplan = ? and "
     + "registro.biblia_def.id_est = ? and idest = ? ";
        //IMPORTANTE el >= 2018-2 y <> 2018-i se agrego porque hasta despues de la renovacion currricular se tuvo en cuenta la clave I para creditos del plan
        return this.consultar(consulta, 1, params);
    }
    
    
    
     // total  de creditos que debe cursar
    public Vector Creditosacursar(String carnet, String idplan) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(idplan);
        params.add(carnet);
        String consulta = new String();

        consulta = new String("select sum(peso) "
                + "from  registro.asplanestud "
                + "where idest = ? and idplan = ? and idas not in (select id_asig from registro.biblia_def where id_est = ? and clave = 'I') ");

        return this.consultar(consulta, 1, params);
    }
    
        
    //Total de creditos aprobados para doble plan
    //Esta consulta no esta activa
    /* public Vector despCreditosdp (String carnet, String iddpplan, PrintWriter out) {
     String consulta = new String();

     consulta=new String("select sum(num_ulas_a) " +
     "from registro.biblia_def, registro.asig_plan, registro.asignatura " +
     "where ( registro.biblia_def.id_asig = registro.asig_plan.id_asig or " +
     "registro.biblia_def.as_vis = registro.asig_plan.id_asig) " +
     "and registro.asig_plan.id_asig = registro.asignatura.id_asig " +
     "and nota >= 30 and clave not in ('R', 'C') and id_plan = "+ iddpplan +" and " +
     "registro.biblia_def.id_est = " + carnet + " ") ;
     //out.println("consulta");
     return this.consultar(consulta, 1);
     }
     */
    public Vector despDoblePlan(PrintWriter out, String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        consulta = new String("select  registro.asignatura.id_asig,cod_asig + '(' + convert(varchar(2), peso) + ')',  "
                + "linea, semestre,  nom_prog, cod_plan, registro.estudiante.nom_est, null "
                + "FROM registro.asignatura, registro.asig_plan, registro.estudiante, registro.programas, registro.plan_estud "
                + "WHERE registro.asignatura.id_asig = registro.asig_plan.id_asig and "
                + " registro.asig_plan.id_plan = registro.estudiante.id_dpplan and "
                + " registro.plan_estud.id_plan = registro.estudiante.id_dpplan and "
                + " registro.programas.id_prog = registro.plan_estud.id_prog and "
                + " linea > 0 and semestre > 0 and semestre < 12 and "
                + " id_est = ?  order by linea, semestre ");
        return this.consultar(consulta, 8, params);

    }

    public Vector despidasig(String carnet, String ident, int par) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(ident);

        String consulta = new String();

        if (par == 1) {
            consulta = new String("select id_asig from registro.biblia_def "
                    + "where id_est = ? and nota >= 30 and clave not in ('C', 'R')  and "
                    + " (id_asig = ? )");
        } else {
            consulta = new String("select id_asig from registro.biblia_def "
                    + "where id_est = ? and nota >= 30 and clave not in ('C', 'R')  and "
                    + " ( visdp = ? )");
        }
        return this.consultar(consulta, 1, params);
    }

    public Vector despasig(PrintWriter out, String carnet, String ident) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(ident);

        String consulta = new String();
        consulta = new String("select id_asig from registro.registro, registro.asignatura "
                + "where (as_vis = id_asig  or visdp =id_asig) and id_est = ? and  "
                + "id_asig =  ? ");
        return this.consultar(consulta, 1, params);
    }

    public Vector despPrerreq(PrintWriter out, String carnet, String ident) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(ident);

        String consulta = new String();
        consulta = new String("select distinct nom_asig "
                + " from registro.estudiante, registro.asig_plan aspA,  "
                + " registro.req_plan, registro.asignatura, registro.asig_plan aspB "
                + " where (registro.estudiante.id_plan = aspA.id_plan) and  "
                + " aspA.id_asig_plan = id_asig_plan1 and "
                + " aspB.id_asig_plan = id_asig_plan2 and "
                + " registro.asignatura.id_asig = aspB.id_asig and "
                + " id_est = ?   and aspA.id_asig = ? ");
        return this.consultar(consulta, 1, params);
    }

    public Vector despPrerreqDP(PrintWriter out, String carnet, String ident) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(ident);

        String consulta = new String();
        consulta = new String("select distinct nom_asig "
                + " from registro.estudiante, registro.asig_plan aspA, "
                + "registro.req_plan, registro.asignatura, registro.asig_plan aspB "
                + " where (registro.estudiante.id_dpplan = aspA.id_plan ) and  "
                + " aspA.id_asig_plan = id_asig_plan1 and "
                + "  aspB.id_asig_plan = id_asig_plan2 and "
                + "  registro.asignatura.id_asig = aspB.id_asig and "
                + " id_est =  ?   and aspA.id_asig = ? ");

        return this.consultar(consulta, 1, params);
    }

    public Vector despOtrosPrerreq(PrintWriter out, String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        consulta = "select idas from registro.otrasigestud where idest= ? ";
        return this.consultar(consulta, 1, params);
    }

    public Vector NombreAsig(PrintWriter out, String ident) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(ident);

        String consulta = new String();
        consulta = "select nom_asig from registro.asignatura where id_asig= ? ";
        return this.consultar(consulta, 1, params);
    }
    
    public Vector EquivAsigMonitores(PrintWriter out, String idasig, String peracad, String tip_equiv) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idasig);
        params.add(peracad);
        params.add(tip_equiv);

        String consulta = new String();
        consulta = "select equivalente from registro.equival_conv_monitores where id_asig=? and per_acad=? and tip_equiv=?";
        return this.consultar(consulta, 1, params);
    }
    
    public Vector OtrosPrerreq(PrintWriter out, String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select idas from registro.otrasigestud where idest= ? and idas in(9703,9704) ");
        return this.consultar(consulta, 1, params);
    }

    public Vector OtrosPrerreqF(PrintWriter out, String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select idas from registro.otrasigestud where idest=? and idas =9660 ");
        return this.consultar(consulta, 1, params);
    }

    public Vector OtrosPrerreqE(PrintWriter out, String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select idas from registro.otrasigestud where idest= ? and idas =9704 ");
        return this.consultar(consulta, 1, params);
    }

    public Vector OtrosPrerreqQ(PrintWriter out, String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select idas from registro.otrasigestud where idest= ? and idas =9715 ");
        return this.consultar(consulta, 1, params);
    }

    public Vector OtrosPrerreqB(PrintWriter out, String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select idas from registro.otrasigestud where idest=? and idas =10211 ");
        return this.consultar(consulta, 1, params);
    }

    public Vector OtrosPrerreqC(PrintWriter out, String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select idas from registro.otrasigestud where idest=? and idas =10212 ");
        return this.consultar(consulta, 1, params);
    }

    public Vector OtrosPrerreqQui(PrintWriter out, String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select idas from registro.otrasigestud where idest=? and idas =10268 ");
        return this.consultar(consulta, 1, params);
    }

    public Vector despCorreq(PrintWriter out, String carnet, String ident, String idplan) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(ident);
        params.add(idplan);
        String consulta = new String();
        consulta = new String("select distinct nom_asig,  registro.asignatura.id_asig, id_cor "
                + "from registro. asignatura, registro.coreq  , registro.estudiante "
                + "  where  registro.asignatura.id_asig= registro.coreq.id_cor "
                + " and  id_est= ? and registro.coreq.id_asig= ? and registro.coreq.id_plan=  ? ");
        return this.consultar(consulta, 3, params);
    }

    public Vector despBiblia(PrintWriter out, String carnet, String ident) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(ident);
        params.add(ident);
        String consulta = new String();
        consulta = new String("select nom_asig, per_acad, nota, nom "
                + "FROM registro.asignatura, registro.biblia_def, registro.claves "
                + "WHERE registro.asignatura.id_asig = registro.biblia_def.as_vis and "
                + "  id_est = ? and clave = cd and "
                + " ( registro.biblia_def.id_asig = ? or visdp = ? ) "
                + " order by per_acad");

        return this.consultar(consulta, 4, params);
    }

    public Vector despRegistro(PrintWriter out, String carnet, String ident) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(ident);

        String consulta = new String(), prog = new String();
        Vector lisnom = new Vector();
        consulta = new String("select nom_asig,  nota1, nota2, nota3, nota_lab, nom "
                + "FROM registro.asignatura, registro.grupo, registro.registro, registro.claves "
                + "WHERE registro.asignatura.id_asig = registro.grupo.id_asig and "
                + " registro.grupo.id_grupo = registro.registro.id_grupo and clave = cd and "
                + "  id_est = ? and as_vis = ? ");
        return this.consultar(consulta, 6, params);
    }

    public Vector despAsignaturas(PrintWriter out, String carnet, String peracad) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(peracad);
        params.add(carnet);

        String consulta = new String();
        consulta = new String("select registro.estudiante.nom_est, cod_asig, num_grupo "
                + "FROM registro.estudiante, registro.registro, registro.grupo, registro.asignatura "
                + "WHERE registro.grupo.per_acad = ?  and registro.estudiante.id_est = registro.registro.id_est and "
                + "registro.grupo.id_grupo = registro.registro.id_grupo and registro.estudiante.estado > 0 and "
                + "registro.grupo.id_asig not between 810 and 880 and "
                + "registro.grupo.id_asig = registro.asignatura.id_asig and registro.registro.id_est = ? and registro.asignatura.tipo_asig = 'N' order by cod_asig ");
        //out.println(consulta);
        return this.consultar(consulta, 3, params);
    }

    public Vector despAsignaturasCan(PrintWriter out, String carnet, String peracad) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(peracad);
        params.add(carnet);
        params.add(peracad);

        String consulta = new String();
        consulta = new String("select registro.estudiante.nom_est, cod_asig, num_grupo, registro.asignatura.id_asig "
                + "FROM registro.estudiante, registro.registro, registro.grupo, registro.asignatura "
                + "WHERE registro.grupo.per_acad = ?  and registro.estudiante.id_est = registro.registro.id_est and "
                + "registro.grupo.id_grupo = registro.registro.id_grupo and registro.estudiante.estado > 0 and "
                + "registro.grupo.id_asig not between 810 and 880 and "
                + "registro.grupo.id_asig = registro.asignatura.id_asig and registro.registro.id_est = ? and "
                + "registro.asignatura.tipo_asig = 'N' and id_reg not in (select id_reg from registro.aprob_reg where per_acad= ?) and getdate() <= '03/05/2020' "
                + "order by cod_asig ");
        //dd/mm/yyyy PARA CONTROLAR EL CIERRE DE LA CANCELACION and getdate() < '02/11/2013'
        //out.println(consulta);
        return this.consultar(consulta, 4, params);
    }

    //
    public Vector CuentaAsignaturasCan(String carnet, String peracad) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList

        params.add(carnet);
        params.add(carnet);
        params.add(peracad);

        String consulta = new String();
        consulta = new String("select COUNT(*) from registro.registro where id_est = ? and cred > 1 and id_grupo not in (select id_grupo from registro.aprob_reg where id_est = ? and per_acad = ?)");

        return this.consultar(consulta, 1, params);
    }

    public Vector Correqcancela(String idcor, String id_plan) {

        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idcor);
        params.add(id_plan);
        String consulta = new String();
        consulta = new String("select registro.coreq.id_asig, cod_asig from registro.coreq,  registro.asignatura where id_cor = ? and id_plan= ? and registro.asignatura.id_asig=registro.coreq.id_asig ");
        return this.consultar(consulta, 2, params);
    }

    public Vector CancelaVeces(String carnet, String id_asig) {

        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(id_asig);
        params.add(carnet);
        String consulta = new String();
        consulta = "select * from registro.biblia_def where id_est=? and id_asig=? and clave='C' and (per_acad='2017-2' or per_acad>'2017-i') and per_acad not in (select AA.per_acad from registro.anot_acad AA where tip_anot = '1375' and id_est=?) ";
        return this.consultar(consulta, 1, params);
    }

    public Vector MatriculasVeces(String carnet) {

        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        consulta = "select per_acad from registro.actasmat where id_est = ?  and firma <> 'NF' ";
        return this.consultar(consulta, 1, params);
    }

    //Consultar cuantas asignaturas a cancelado en un periodo
    public Vector CuantasCancela(String carnet, String peracad) {

        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(peracad);

        String consulta = new String();
        consulta = "select id_reg from registro.aprob_reg  where  id_est=? and per_acad=? ";
        return this.consultar(consulta, 1, params);
    }

    public Vector MatriculasSinPI(String carnet) {

        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        consulta = "select per_acad from registro.actasmat where id_est = ?  and firma <> 'NF' and substring (per_acad, 6,1 )<> 'I' ";
        return this.consultar(consulta, 1, params);
    }

    public Vector consultCancel(PrintWriter out, String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();

        consulta = new String(" select registro.estudiante.nom_est, cod_dpto, "
                + " cod_plan, nom_asig, nom, registro.aprob_reg.razon, registro.aprob_reg.estado "
                + "  from  registro.estudiante, registro.aprob_reg, registro.grupo, registro.asignatura, "
                + "  registro.plan_estud, registro.departamento, registro.registro, registro.claves "
                + "  where registro.estudiante.id_dpto = registro.departamento.id_dpto and "
                + " registro.estudiante.id_plan = registro.plan_estud.id_plan and "
                + "        registro.estudiante.id_est = registro.aprob_reg.id_est and "
                + "        registro.grupo.id_grupo = registro.aprob_reg.id_grupo and "
                + "        registro.grupo.id_grupo = registro.registro.id_grupo and "
                + "        registro.grupo.id_asig = registro.asignatura.id_asig and "
                + "        registro.estudiante.id_est = registro.registro.id_est and "
                + "        registro.registro.clave = registro.claves.cd and "
                + "        tipo_asig='N' and tipapr=4 and "
                + "        clave = cd and "
                + "        registro.estudiante.id_est = ? "
                + " group by registro.estudiante.nom_est,  cod_dpto, cod_plan, nom_asig, nom, "
                + " registro.aprob_reg.razon, registro.aprob_reg.estado ");
        return this.consultar(consulta, 7, params);
    }

    public Vector datosEst(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();

        consulta = new String("select registro.estudiante.nom_est, nom_dpto,cod_plan, sem_est, dest "
                + " from  registro.lis_estados, registro.estudiante, registro.plan_estud, registro.departamento "
                + " where registro.estudiante.id_dpto = registro.departamento.id_dpto and "
                + " registro.estudiante.id_plan = registro.plan_estud.id_plan and estado = nest and"
                + " registro.estudiante.id_est = ? ");
        //" registro.estudiante.id_est = " + carnet  + " and registro.estudiante.estado > 0");
        return this.consultar(consulta, 5, params);
    }

    public Vector getOrdenes(String carnet, String periodo) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(periodo);
        params.add(carnet);
        String consulta = new String();

        consulta = new String(" select id_ord, val_der from registro.ordenes "
                + " where per_acad = ? and id_est = ?  and (val_der + vcon1 + vcon2 + vcon3 + vcon4 <= 0) and val_pag = 0 ");
        return this.consultar(consulta, 2, params);
    }

    public Vector getReintegro(String carnet, String periodo) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(periodo);
        params.add(carnet);

        String consulta = new String();

        consulta = new String(" select id_est from registro.estudiante, registro.anotacion_aux "
                + " where tip_est='E' and tip_anot='1480' and registro.estudiante.id_est=registro.anotacion_aux.id_tabla "
                + " and registro.anotacion_aux.per=? and id_est=? ");
        return this.consultar(consulta, 1, params);
    }

    public Vector getSeguimiento(String carnet, String periodo) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(periodo);
        params.add(carnet);

        String consulta = new String();

        consulta = new String(" select id_est from registro.estudiante where estado='-12' "
                + " and tip_est='M' and ult_ing=? and id_est=? ");
        return this.consultar(consulta, 1, params);
    }

    public Vector getEdad(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select datediff(dd,fec_nac, getdate()), dtur from registro.estudiante "
                + "where id_est=? ");

        return this.consultar(consulta, 2, params);
    }

    public Vector restafechas(String fec) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(fec);
        String consulta = new String();
        consulta = new String(" select datediff(ss, getdate(), ?), getdate() ");
        return this.consultar(consulta, 2, params);
    }

    public Vector LisPlan(PrintWriter out, String idprog) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idprog);
        String consulta = new String(), prog = new String();
        
        //Quitar validacion de la fecha cuandop los nuevos planes esten valodados para todos los programas
        consulta = new String("select id_plan, nom_prog, cod_plan " +
                                "FROM registro.registro.programas, registro.registro.plan_estud " +
                                "WHERE registro.registro.programas.id_prog = registro.registro.plan_estud.id_prog and " +
                                "registro.registro.programas.id_prog = ? and fec_inicio < '2018-01-01' " +
                                "order by cod_plan desc");
        return this.consultar(consulta, 3, params);
    }

    //HORA DE LA BASE DE DATOS
    public Vector horaBD() {
        String consulta = new String();
        consulta = new String(" select convert(varchar, getdate(), 108)");
        return this.consultar(consulta, 1);
    }

    //FECHA Y HORA HORA DE LA BASE DE DATOS PARA EL ENCABEZADO DE LOS ESTUDIANTES
    public Vector FechaBD() {
        String consulta = new String();
        consulta = new String(" select convert(varchar(20), getdate(),113)");
        return this.consultar(consulta, 1);
    }

    public Vector despDetallePlan(PrintWriter out, String idPlan) {
        ArrayList<String> params = new ArrayList<String>(14);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idPlan);
        params.add(idPlan);
        params.add(idPlan);
        params.add(idPlan);
        params.add(idPlan);
        params.add(idPlan);
        params.add(idPlan);
        params.add(idPlan);
        params.add(idPlan);
        params.add(idPlan);
        params.add(idPlan);
        params.add(idPlan);
        params.add(idPlan);
        params.add(idPlan);
        String consulta = new String(), prog = new String();
//consulta modificada el 16 de marzo de 2016 LA ANTERIOR ESTABA MAL   " + idPlan + "

        consulta = ("select registro.registro.asignatura.id_asig, cod_asig, linea, semestre, nivel "
                + "FROM registro.registro.asignatura, registro.registro.asig_plan "
                + "WHERE registro.registro.asignatura.id_asig = registro.registro.asig_plan.id_asig and "
                + "linea > 0 and semestre >= 0 and semestre < 20 and  id_plan = ? "
                + "union "
                + "select asig1, cod_asig, 1, 0,0  from registro.asig_exa, registro.asignatura,   registro.programas, registro.plan_estud"
                + "  where (registro.asig_exa.asig1 = registro.asignatura.id_asig) and"
                + "  (registro.programas.id_prog = registro.plan_estud.id_prog) and "
                + "  (registro.asig_exa.id_dpto = registro.programas.id_dpto) and registro.plan_estud.id_plan = ? and area = 'MATEMATICAS' AND nivel IN( 'B', 'M') AND asig1 <> 0 and registro.programas.id_prog not in (261, 275) and act = 'S'"
                + "  union"
                + "  select asig2, cod_asig, 1, 0,0  from registro.asig_exa, registro.asignatura,   registro.programas, registro.plan_estud "
                + "  where (registro.asig_exa.asig2 = registro.asignatura.id_asig) and "
                + "  (registro.programas.id_prog = registro.plan_estud.id_prog) and "
                + "  (registro.asig_exa.id_dpto = registro.programas.id_dpto) and registro.plan_estud.id_plan = ? and area = 'MATEMATICAS' AND nivel IN( 'B', 'M') AND asig2 <> 0 and registro.programas.id_prog not in (261, 275) and act = 'S' "
                + "  union "
                + "  select asig1, cod_asig, 3, 0,0  from registro.asig_exa, registro.asignatura,   registro.programas, registro.plan_estud "
                + "  where (registro.asig_exa.asig1 = registro.asignatura.id_asig) and "
                + "  (registro.programas.id_prog = registro.plan_estud.id_prog) and "
                + "  (registro.asig_exa.id_dpto = registro.programas.id_dpto) and registro.plan_estud.id_plan = ? and area = 'FISICA' AND nivel IN( 'B') AND asig1 <> 0 and registro.programas.id_prog not in (275) and act = 'S'"
                + "  union"
                + "  select asig2, cod_asig, 3, 0,0  from registro.asig_exa, registro.asignatura,   registro.programas, registro.plan_estud"
                + "  where (registro.asig_exa.asig2 = registro.asignatura.id_asig) and "
                + "  (registro.programas.id_prog = registro.plan_estud.id_prog) and "
                + "  (registro.asig_exa.id_dpto = registro.programas.id_dpto) and registro.plan_estud.id_plan = ? and area = 'FISICA' AND nivel IN( 'B') AND asig2 <> 0 and registro.programas.id_prog not in (275) and act = 'S'"
                + "   union"
                + "  select asig1, cod_asig, 5, 0,0  from registro.asig_exa, registro.asignatura,   registro.programas, registro.plan_estud"
                + "  where (registro.asig_exa.asig1 = registro.asignatura.id_asig) and "
                + "  (registro.programas.id_prog = registro.plan_estud.id_prog) and "
                + "  (registro.asig_exa.id_dpto = registro.programas.id_dpto) and registro.plan_estud.id_plan = ? and area = 'QUIMICA' AND nivel IN( 'B') AND asig1 <> 0  and registro.programas.id_prog not in (275) and act = 'S'"
                + "  union"
                + "  select asig2, cod_asig, 5, 0,0  from registro.asig_exa, registro.asignatura,   registro.programas, registro.plan_estud"
                + "  where (registro.asig_exa.asig2 = registro.asignatura.id_asig) and "
                + "  (registro.programas.id_prog = registro.plan_estud.id_prog) and "
                + "  (registro.asig_exa.id_dpto = registro.programas.id_dpto) and registro.plan_estud.id_plan = ? and area = 'QUIMICA' AND nivel IN( 'B') AND asig2 <> 0 and registro.programas.id_prog not in (275) and act = 'S'"
                + "  union"
                + "  select 8453, 'EXOE', 6, 0,0 from registro.plan_estud where id_plan = ? and id_plan not in(314, 334) and act = 'S'  "
                + "  union "
                + "  select 10212,     'COMBR', 2, 0,0 from registro.plan_estud where id_plan = ? and 314 = ? and act = 'S' "
                + "  union"
                + "  select 10211,     'FBICR', 5, 0,0 from registro.plan_estud where id_plan = ? and 314 = ? and act = 'S' "
                + "  union"
                + "  select 10268,     'FQUIR', 4, 0,0 from registro.plan_estud where id_plan = ? and 314 = ? and act = 'S' "
                + "  order by linea,semestre ");
        return this.consultar(consulta, 5, params);
    }

    public Vector despContenido(PrintWriter out, String idasig) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idasig);
        String consulta;
        Vector lisnom = new Vector();
        consulta = "select nom_asig, vigd, vigh, ultmod, penmod, obj, just, intens, biblio, contres, cntdet, metod, hor_sem from registro.descasig, registro.asignatura  WHERE  registro.descasig.idasig = registro.asignatura.id_asig and  registro.asignatura.id_asig = ? and activ= 1  order by vigh desc ";

        return this.consultar(consulta, 13, params);
    }

    public static String quitarSaltosL(String Linea) {
        String cadTmp = new String();
        int pos;

        pos = Linea.indexOf("\n");
        while (pos >= 0) {
            cadTmp = cadTmp + Linea.substring(0, pos);
            Linea = Linea.substring(pos + 1);
            cadTmp = cadTmp + "<br>";
            pos = Linea.indexOf("\n");
        }
        cadTmp = cadTmp + Linea;
        return cadTmp;
    }

    public Vector infoInscrip(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select id_asig "
                + "FROM registro.pre_internet "
                + "WHERE id_est = ? ");
        return this.consultar(consulta, 1, params);
    }

    public Vector infoAudit(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("select errses, keyses "
                + "FROM registro.auditest "
                + "WHERE idest = ? ");
        return this.consultar(consulta, 2, params);
    }

    public int insAudit(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String("insert into registro.auditest "
                + " (idest, errses, keyses, iperr) "
                + " values ( ?, '0', '0', '0') ");
        return this.actualizar(consulta, params);
    }

    public int setAudit(String carnet, int errses) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(Integer.toString(errses));
        params.add(carnet);
        String consulta = new String();
        consulta = new String("update registro.auditest set errses = ? where idest = ? ");
        return this.actualizar(consulta, params);
    }

    public int setAuditIP(String carnet, String ip) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(ip);
        params.add(carnet);
        String consulta = new String();
        consulta = new String("update registro.auditest set iperr = ? where idest = ?");
        return this.actualizar(consulta, params);
    }

    public int ChPwd(String carnet, String nvPwd) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(nvPwd);
        params.add(carnet);
        String consulta = new String("update registro.estudiante set "
                + " passwd = ? "
                + " where id_est = ? ");
        return this.actualizar(consulta, params);
    }

    public Vector despDetallePlanPos(String carnet, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String(), prog = new String();
        Vector lisnom = new Vector();

        /* NOV29-11 SE CAMBIA EL PLAN ESTA SALIENDO MALconsulta = new String("select  registro.asignatura.id_asig, " +
         " cod_asig + '(' + convert(varchar(2), cred) + ')', " +
         "linea, semestre,  nom_prog, cod_plan, registro.estudiante.nom_est, id_dpplan, nom_asig, estado  " +
         "FROM registro.asignatura, registro.asig_plan, registro.estudiante, registro.programas, registro.plan_estud, registro.biblia_post " +
         "WHERE registro.asignatura.id_asig = registro.asig_plan.id_asig and " +
         " registro.asig_plan.id_plan = registro.estudiante.id_plan and " +
         "registro.asignatura.id_asig = registro.biblia_post.id_asig and " +
         " registro.plan_estud.id_plan = registro.estudiante.id_plan and " +
         " registro.programas.id_prog = registro.plan_estud.id_prog and " +
         " linea > 0 and semestre > 0 and semestre < 12 and " +
         " registro.biblia_post.id_est =   " + carnet + " and registro.estudiante.id_est= registro.biblia_post.id_est order by linea,semestre  ");
         //    out.println(consulta);
         return this.consultar(consulta, 10);*/
        consulta = "select  registro.asignatura.id_asig, " + " cod_asig + '(' + convert(varchar(2), peso) + ')', " + "linea, semestre,  nom_prog, cod_plan, registro.estudiante.nom_est, id_dpplan, nom_asig,estado  " + "FROM registro.asignatura, registro.asig_plan, registro.estudiante, registro.programas, registro.plan_estud " + "WHERE registro.asignatura.id_asig = registro.asig_plan.id_asig and " + " registro.asig_plan.id_plan = registro.estudiante.id_plan and " + " registro.plan_estud.id_plan = registro.estudiante.id_plan and " + " registro.programas.id_prog = registro.plan_estud.id_prog and " + " linea > 0 and semestre > 0 and semestre < 12 and " + " id_est = ?  order by linea, semestre ";
        return this.consultar(consulta, 10, params);

    }

    //Consulta para determinar el maximo semestre de posgrado y pintar plan de estudios
    public Vector despMaximoSemPos(String carnet, PrintWriter out) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String(), prog = new String();
        Vector lisnom = new Vector();

        consulta = new String("select  max(semestre)  "
                + "FROM registro.asignatura, registro.asig_plan, registro.estudiante, registro.programas, registro.plan_estud "
                + "WHERE registro.asignatura.id_asig = registro.asig_plan.id_asig and "
                + " registro.asig_plan.id_plan = registro.estudiante.id_plan and "
                + " registro.plan_estud.id_plan = registro.estudiante.id_plan and "
                + " registro.programas.id_prog = registro.plan_estud.id_prog and "
                + " linea > 0  and  id_est = ?   ");
        return this.consultar(consulta, 1, params);
    }

    //Consulta para creditos plan de estudios posgrados
    public Vector despCreditosPos(String carnet, String idplan, PrintWriter out, int nota) {
        ArrayList<String> params = new ArrayList<String>(3);


        //Agregamos cada uno de los datos al ArrayList
        params.add(Integer.toString(nota));
        params.add(idplan);
        params.add(carnet);

        String consulta = new String();
//NOV 29 SE CAMBIA PAO select sum(num_ulas_a)
        consulta = "select sum(cred) " + "from registro.biblia_post, registro.asig_plan, registro.asignatura " + "where ( registro.biblia_post.id_asig = registro.asig_plan.id_asig or " + "registro.biblia_post.as_vis = registro.asig_plan.id_asig) " + "and registro.asig_plan.id_asig = registro.asignatura.id_asig " + " and nota >= ? and clave not in ('R', 'C') and id_plan = ? and " + "registro.biblia_post.id_est = ? ";
        //out.println("consulta");
        return this.consultar(consulta, 1, params);
    }

    // nueva para posgrados total de asignaturas vistas y aprobadas
    public Vector despidasigpos(PrintWriter out, String carnet, String ident, int par, int nota) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(Integer.toString(nota));
        params.add(ident);


        String consulta = new String();
        //  if (par == 1)
        consulta = new String("select id_asig from registro.biblia_post "
                + "where id_est = ? and nota >= ? and clave not in ('C', 'R')  and "
                + " (id_asig = ? )");

        return this.consultar(consulta, 1, params);
    }

    //Para algunas cohortes la nota mínima es 35 por eso se requiere esta consulta
    public Vector despidasigposCoh(PrintWriter out, String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();

        consulta = new String("SELECT registro.defcoho.nmin "
                + "FROM registro.estudiante, registro.defcoho WHERE (registro.estudiante.id_plan = registro.defcoho.idplan) and "
                + "(registro.estudiante.semnv = registro.defcoho.nco) and registro.estudiante.id_est =?  ");

        return this.consultar(consulta, 1, params);
    }

    //Consulta para total de asignaturas posgrados
    public Vector despasigpos(PrintWriter out, String carnet, String ident) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(ident);
        String consulta = new String();
        consulta = new String("select registro.asignatura.id_asig from registro.biblia_post, registro.asignatura "
                + "where as_vis = registro.asignatura.id_asig and id_est = ? and  "
                + "registro.asignatura.id_asig =  ? ");
        // out.println(consulta);
        return this.consultar(consulta, 1, params);

    }

    public Vector despasigposVE(PrintWriter out, String carnet, String ident) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(ident);

        String consulta = new String();
        consulta = new String("select registro.asignatura.id_asig from registro.biblia_post, registro.asignatura "
                + "where as_vis = registro.asignatura.id_asig and id_est = ? and  "
                + " NOTA is null and clave ='Z' and registro.asignatura.id_asig =  ? ");
        // out.println(consulta);
        return this.consultar(consulta, 1, params);

    }

    public Vector despBibliapost(PrintWriter out, String carnet, String ident) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(ident);
        String consulta = new String();
        consulta = new String("select nom_asig, per_acad, nota, nom "
                + "FROM registro.asignatura, registro.biblia_post, registro.claves "
                + "WHERE registro.asignatura.id_asig = registro.biblia_post.as_vis and "
                + "  id_est = ? and clave = cd and "
                + " ( registro.biblia_post.id_asig = ? ) "
                + " order by per_acad");

        return this.consultar(consulta, 4, params);
    }

    public Vector despParProg(String iddpto) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(iddpto);

        String consulta = new String();
        consulta = new String(" select fecesc, fecent "
                + " from registro.parprogramas, registro.programas "
                + " where idprg = id_prog and id_dpto = ?");
        return this.consultar(consulta, 2, params);
    }

    public Vector despExIngEgre(String idest) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idest);

        String consulta = new String();
        consulta = new String(" select e.id_est from registro.anot_acad a, registro.estudiante e "
                + " where a.id_est = e.id_est and tip_anot = '890' and id_plan > 254 "
                + " and e.id_est = ?");
        return this.consultar(consulta, 1, params);
    }

    public Vector despParGraduado(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        consulta = new String(" select ninvesc,asis, convert(varchar, fec, 113), convert(varchar, fult, 113) "
                + " from registro.paregresado "
                + " where idest = ?");
        return this.consultar(consulta, 4, params);
    }

    public Vector despConsGrad() {
        String consulta = new String();
        consulta = new String(" select max(ninvesc%1000) + 1 "
                + " from registro.paregresado, registro.estudiante "
                + " where id_est = idest and estado > 0 and igrad = 'C' ");
        return this.consultar(consulta, 1);
    }

    public int setParGrad(String idEst, String numInv, String asis) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);
        params.add(numInv);
        params.add(asis);

        String consulta = new String();
        consulta = new String("insert into registro.paregresado(idest, ninvesc, asis, fec, fult)"
                + " values(?, ?, ?, getdate(), getdate()) ");
        return this.actualizar(consulta, params);
    }

    public int setUpParGrad(String idEst, String asis) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(asis);
        params.add(idEst);
        String consulta = new String();
        consulta = new String("update registro.paregresado set asis = ?, fult = getdate()  where idest = ?");
        return this.actualizar(consulta, params);
    }

    //**** 29 oct 2007 Trámite de grado
    public Vector despParTramGrad(String limpar) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(limpar + "00000");
        params.add(limpar + "00500");

        String consulta = new String();
        consulta = new String(" select fecesc from registro.parprogramas "
                + " where idprg between ? and ? "
                + " order by idprg ");
        return this.consultar(consulta, 1, params);
    }

    public int setSolPreGrad(String nombres, String ape1, String ape2, String celular,
            String email_otro, String doc_est, String tip_doc, String nro_libr,
            String nro_distr, String fec_exp, String ultdir, String ulttel, String exp_diploma,
            String ciu_corr, String IdEst) {

        ArrayList<String> params = new ArrayList<String>(17);
        params.add(nombres);
        params.add(ape1);
        params.add(ape2);
        params.add(celular);
        params.add(email_otro);
        params.add(doc_est);
        params.add(tip_doc);
        params.add(nro_libr);
        params.add(nro_distr);
        params.add(fec_exp);
        params.add(ultdir);
        params.add(ultdir);
        params.add(ulttel);
        params.add(ulttel);
        params.add(exp_diploma);
        params.add(ciu_corr);
        params.add(IdEst);


        String consulta = new String(" update registro.estudiante "
                + "set nombres = ?, ape1 = ?, "
                + "ape2 = ?, celular = ?, "
                + "email_otro = ?, doc_est = ?, "
                + "tip_doc = ?, "
                + "nro_libr = ?, nro_distr = ?, "
                + "fec_exp_libr = ?, ultdir = ?, dir_corr = ?, "
                + "tel_corr = ?, ulttel = ?, exp_diploma = ?, "
                + "ciu_corr = ?, fec_act = getdate() "
                + "where id_est = ?");
        return this.actualizar(consulta, params);
    }

    public Vector getSolPreGrad(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);

        String consulta = new String();
        consulta = new String(" select id_est, nombres, ape1, ape2, celular, email_otro, "
                + "doc_est, tip_doc, nro_libr, nro_distr, convert(varchar, fec_exp_libr, 103), ciu_corr, ultdir, ulttel, "
                + "lug_exp, convert(varchar, fec_act, 103), "
                + "(select nom_ciu from registro.registro.ciudades "
                + "where id_ciu = ciu_corr), exp_diploma, sexo, dir_corr, tel_corr "
                + "from registro.estudiante "
                + "where id_est = ? ");
        return this.consultar(consulta, 21, params);
    }

    public Vector getSolPreGradExper(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);
        String consulta = new String();
        /*consulta = new String(" select idexper, nom_entidad, cargo, nomjefe, telexper, id_est " +
         " from registro.experiencia_graduado " +
         " where id_est = '" + idEst + "' ");*/
        consulta = new String(" select entidad, cargo, jefinm, teljef, id_est "
                + " from registro.experiencia "
                + " where id_est = ? order by id_exper desc");
        return this.consultar(consulta, 5, params);
    }

    public Vector getSolPreGradMadre(String idEst) {
        String consulta = new String();
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);
        consulta = new String(" select id_res, id_est, tip_res, nom_res, id_pro "
                + " from registro.responsable "
                + " where tip_res = 'M' and "
                + " id_est = ? ");
        return this.consultar(consulta, 5, params);
    }

    public Vector getSolPreGradPadre(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);
        String consulta = new String();
        consulta = new String(" select id_res, id_est, tip_res, nom_res, id_pro "
                + " from registro.responsable "
                + " where tip_res = 'P' and "
                + " id_est = ? ");
        return this.consultar(consulta, 5, params);
    }

    //****************************************************
    //************* Solicitud de Readmisión *************
    public Vector getSolRead(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);
        String consulta = new String();
        consulta = new String(" select fsolread, tip_est from registro.estudiante "
                + " where id_est = ? ");
        return this.consultar(consulta, 2, params);
    }

    public Vector getValidaSolRead(String idEst, String perant) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(perant);
        params.add(idEst);
        String consulta = new String();
        consulta = new String(" select id_est from registro.estudiante "
                + " where id_est in "
                + " (select id_est from registro.biblia_def "
                + " where per_acad > '2007' and per_acad not like '%-0' "
                + " group by id_est "
                + " having min(per_acad) = max(per_acad) and "
                + " min(per_acad) = ?) "
                + " and estado = -22 and id_est = ? ");
        return this.consultar(consulta, 1, params);
    }

    public int setSolRead(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);
        String consulta = new String();
        consulta = new String("update registro.estudiante "
                + " set fsolread = getdate (), tip_est = 'Z' "
                + " where id_est = ? ");
        return this.actualizar(consulta, params);
    }

    public Vector EntrevistasRead(String doc, String iddpto) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(doc);
        params.add(iddpto);
        String consulta = new String();
        consulta = new String("select nom_est, registro.estudiante.id_dpto, convert(varchar, fec, 106), convert(varchar, fec, 108), "
                + " idest, idprof, sitio, nom_prof, estado, fac_cor, convert(varchar, fec1, 106), convert(varchar, fec1, 108), "
                + "(select nom_prof from registro.profesor where id_prof = idprof1) as nmprof1, sitio1 "
                + " from registro.estudiante, registro.dispentrev, registro.profesor "
                + " where doc_est = ? and registro.estudiante.id_dpto = ? "
                + " and registro.estudiante.id_est = registro.dispentrev.idest "
                + " and registro.profesor.id_prof = registro.dispentrev.idprof ");
        //out.println(consulta);
        return this.consultar(consulta, 14, params);
    }

    //Consulta para verificar fac_cor del estudiante q solicito la readmision, ya q en la tabla
    //dispentrev solo estaran los registros de quienes tengan entrevistas
    //fac_cor 1=Admitido no requiere entrevista, 0 Citado a entrevista.
    public Vector EstadoReadmision(String doc, String iddpto) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(doc);
        params.add(iddpto);
        String consulta = new String();
        consulta = new String("select nom_est, registro.estudiante.id_dpto,  estado, fac_cor "
                + " from registro.estudiante "
                + " where doc_est = ? and registro.estudiante.id_dpto = ? and estado in (-13, -22)  ");
        return this.consultar(consulta, 4, params);
    }

    //***********  Horarios AJAX ******************
    public Vector getHorarioAsigEst(String codAsig, String numgr) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(codAsig);
        //  params.add(numgr);
        String consulta = new String();
        if (!numgr.equals("")) {
            numgr = " and num_grupo = " + numgr;
        }
        consulta = new String("select num_grupo, nomd, hora_ini, hora_fin, cod_sal, (cupo_maximo - count(id_reg)), nom_prof  "
                + " from  registro.grupo LEFT OUTER JOIN registro.registro ON registro.grupo.id_grupo = registro.registro.id_grupo,"
                + " registro.asignatura, registro.diassem, "
                + " registro.sal_grupo, registro.salones, registro.profesor "
                + " where registro.grupo.id_asig = registro.asignatura.id_asig and  "
                + " ndi = dia and registro.grupo.id_grupo = registro.sal_grupo.id_grupo and "
                + " registro.sal_grupo.id_sal = registro.salones.id_sal and "
                + //Operaciones normales
                " registro.grupo.per_acad = '" + cfgEci.getPeriodoActual() + "' and "
                + //Para periodo intermedio
                //" registro.grupo.per_acad = '2007-I'  and " +
                " registro.asignatura.cod_asig = ? and id_profesor = id_prof "
                + numgr
                + " group by cod_asig, num_grupo, dia,nomd, hora_ini, hora_fin, cod_sal, cupo_maximo, nom_prof "
                + " order by cod_asig, num_grupo, dia,nomd, hora_ini ");
        return this.consultar(consulta, 7, params);
    }

    public Vector getdespAsigEst(String numgr, String codAsig) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(codAsig);

        String consulta = new String();
        consulta = new String("select num_grupo, nomd, hora_ini, hora_fin, cod_sal, (cupo_maximo - count(id_reg)), nom_prof "
                + " from  registro.grupo LEFT OUTER JOIN registro.registro ON registro.grupo.id_grupo = registro.registro.id_grupo, "
                + " registro.asignatura, registro.diassem, registro.sal_grupo, registro.salones, registro.profesor"
                + " where registro.grupo.id_asig = registro.asignatura.id_asig and "
                + " ndi = dia and registro.grupo.id_grupo = registro.sal_grupo.id_grupo and"
                + " registro.sal_grupo.id_sal = registro.salones.id_sal and "
                + //Operaciones normales
                " registro.grupo.per_acad = '" + cfgEci.getPeriodoActual() + "' and "
                + //Para periodo intermedio
                //" registro.grupo.per_acad = '2007-I'  and " +
                " registro.asignatura.cod_asig = ?  and id_profesor = id_prof "
                + " group by cod_asig, num_grupo, dia,nomd, hora_ini, hora_fin, cod_sal, cupo_maximo, nom_prof "
                + " order by cod_asig, num_grupo, dia,nomd, hora_ini ");
        return this.consultar(consulta, 7, params);
    }

    //************ Formato Periodo intermedio ********************
    public Vector getInfoPerInter(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);

        String consulta = new String();
        consulta = new String(" select es.id_est, nom_est, nom_prog, doc_est, "
                + " convert(numeric(9,2), 2*(base_liq/6)), pr.id_prog, "
                + " convert(numeric(9,2), base_liq/6) "
                + " from registro.estudiante es, registro.plan_estud pl, "
                + " registro.programas pr "
                + " where es.id_plan = pl.id_plan and pl.id_prog = pr.id_prog "
                + " and es.id_est = ? ");
        return this.consultar(consulta, 7, params);
    }

    public Vector getVerifPerInter(String idEst) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);
        params.add(idEst);
        String consulta = new String();
        consulta = new String(" select e.id_est from registro.estudiante e, registro.anot_acad a "
                + " where a.id_est = e.id_est and (tip_anot in (' 890', '5880', '6880') "
                + " or id_plan < 255) and e.id_est = ? group by e.id_est "
                + " union select e.id_est from registro.estudiante e "
                + " where (id_plan < 255 or sem_est < 5) and id_est = ? ");
        return this.consultar(consulta, 1, params);
    }

    public Vector getProfesiones() {
        String consulta = new String();
        consulta = new String(" select id_pro, nom_pro from registro.profesiones where cd_pro <> 'X' ");
        return this.consultar(consulta, 2);
    }

    public Vector AdmitidosReadmision(String doc, String iddpto) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(doc);
        params.add(iddpto);
        String consulta = new String();
        consulta = new String("select nom_est, registro.estudiante.id_dpto,  estado, fac_cor, tip_est "
                + " from registro.estudiante "
                + " where doc_est = ? and registro.estudiante.id_dpto = ? ");
        return this.consultar(consulta, 5, params);
    }

    //************** Ingles ***********************************
    public Vector getReqIngles(String idEst, String tip_anot) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(tip_anot);
        params.add(idEst);
        String consulta = new String();
        consulta = new String(" select a.tip_anot from registro.estudiante e, registro.anot_acad a  "
                + " where a.id_est = e.id_est and tip_anot = ? "
                + " and e.id_est = ? group by a.tip_anot order by a.tip_anot");
        return this.consultar(consulta, 1, params);
    }

    /**
     * Información de correo electrónico
     *
     * @param idest
     * @return
     */
    public Vector infoCorreo(String idest) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idest);
        params.add(idest);

        String consulta = new String();
        consulta = new String(" select id_est, doc_est, nom_est, emails "
                + " from registro.estudiante "
                + " where id_est = ? or doc_est = ? ");
        return this.consultar(consulta, 4, params);
    }

    public Vector GraduadosPos(String cedula) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(cedula);
        String consulta = new String();
        consulta = new String(" select id_est, doc_est, nom_est "
                + " from registro.estudiante "
                + " where doc_est = ?  and (estado = '-100'or estado= '0')and igrad='G' ");
        return this.consultar(consulta, 3, params);
    }

    public String getSecuencia() {
        Vector retorno = new Vector(), tmp = new Vector();
        String consulta = new String();
        String dato = new String();
        consulta = new String("select sig_sec  "
                + " from registro.secuencias"
                + " where registro.secuencias.nombre='RESERVAS' ");

        retorno = this.consultar(consulta, 1);
        if (retorno.size() > 0) {
            return (String) retorno.elementAt(0);
        } else {
            return "0";
        }

    }

    public Vector getSecuenciaColiseo() {
        Vector retorno = new Vector(), tmp = new Vector();
        String consulta = new String();
        String dato = new String();
        consulta = new String("select sig_sec  "
                + " from registro.secuencias"
                + " where registro.secuencias.nombre='RESERVAS' ");

        return this.consultar(consulta, 1);


    }

    //Eventos a los cuales se encuentra inscrito
    public Vector EventosInscritos(String peracad, String doc) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(doc);
        params.add(peracad);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select registro.inscrito_eventos.id_evento,descripcion, lugar, horario from registro.inscrito_eventos,  registro.eventos "
                + " where registro.eventos.id_evento = registro.inscrito_eventos.id_evento and documento=?  and per_acad= ? ");
        return this.consultar(consulta, 4, params);
    }

    public Vector departamentos(String peracad) {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = "select distinct id_dpto, nom_dpto from registro.departamento, registro.eventos "
                + " where registro.eventos.dpto=registro.departamento.id_dpto ";
        return this.consultar(consulta, 2);
    }

    public Vector Lineas(String id_dpto) {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = new String("select id_lin,descripcion from registro.lineas_prof "
                + " where id_dpto = '" + id_dpto + "' ");
        return this.consultar(consulta, 2);
    }

    //Consultar listado de eventos por depto
    //'" + peracad + "' para PI  2013-I
    public Vector Eventosdpto(String peracad, String dpto) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList

        params.add(peracad);
        params.add(dpto);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select id_evento, descripcion, convert(varchar,fecha_ini, 103), "
                + " convert(varchar,fecha_fin, 103), lugar, cupo_max, per_acad, estado,horario,profes,detalle, dpto, id_curso  "
                + " from registro.eventos where estado = 2  and publico in (0,1) and per_acad= ? and dpto= ? "
                + " order by id_evento");

        return this.consultar(consulta, 13, params);
    }

    public Vector EventosdptoLinea(String peracad, String dpto, String linea) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList

        params.add(peracad);
        params.add(dpto);
        params.add(linea);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select id_evento, descripcion, convert(varchar,fecha_ini, 103), "
                + " convert(varchar,fecha_fin, 103), lugar, cupo_max, per_acad, estado,horario,profes,detalle, dpto, id_curso  "
                + " from registro.eventos where estado = 2  and publico in (0,1) and per_acad= ? and dpto= ? and linea_cur= ? "
                + " order by id_evento");

        return this.consultar(consulta, 13, params);
    }

    //Verificar si ya esta inscrito a un evento
    public Vector VerificaEventos(String id, String doc) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList

        params.add(id);
        params.add(doc);
        Vector retorno = new Vector();
        String consulta = new String();

        /* consulta = new String("select registro.eventos.id_evento, descripcion from registro.inscrito_eventos, registro.eventos " +
         " where registro.eventos.id_evento= registro.inscrito_eventos.id_evento and  documento='"+doc+"' and per_acad='" + peracad +  "' "+
         " order by registro.eventos.id_evento");*/

        consulta = new String("select id_evento, id_curso from registro.inscrito_eventos "
                + " where registro.inscrito_eventos.id_evento =  ? and  documento=? ");
        return this.consultar(consulta, 2, params);
    }

    //Verificar si ya esta inscrito a un evento UGE CURSOS
    public Vector VerificaEventosUGE(String doc,  String id_curso) {

        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList 
        params.add(doc);
        //params.add(peracad);
        params.add(id_curso);
        Vector retorno = new Vector();
        String consulta = new String();

         consulta = new String("select registro.eventos.id_evento, descripcion from registro.inscrito_eventos, registro.eventos " +
         " where registro.eventos.id_evento= registro.inscrito_eventos.id_evento and  documento=?  and registro.inscrito_eventos.id_curso =? and estadoc = 'APROBADO'"+
         " order by registro.eventos.id_evento");

        /*consulta = "select id_evento, id_curso from registro.inscrito_eventos "
                + " where   documento=?  and id_evento=?  ";*/
        return this.consultar(consulta, 2, params);
    }
    

    public int EliminaCurso(java.lang.String idevento, java.lang.String doc) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList 

        params.add(idevento);
        params.add(doc);
        int respuesta = 0;
        String consulta = new String();
        consulta = new String("delete from registro.inscrito_eventos "
                + " where id_evento=? and  documento=?  ");
        return this.actualizar(consulta, params);
    }

    public int InscribeEvento(java.lang.String idevento, java.lang.String doc, java.lang.String nombres, java.lang.String vinculo, java.lang.String id_curso) {
        ArrayList<String> params = new ArrayList<String>(5);

        //Agregamos cada uno de los datos al ArrayList 

        params.add(idevento);
        params.add(doc);
        params.add(nombres);
        params.add(vinculo);
        params.add(id_curso);

        int retorno = 0;
        String consulta = new String();

        consulta = new String("insert into registro.inscrito_eventos (id_evento,  documento, nombres, "
                + "vinculo, fechains,id_curso) values ( ?, ?, ?,?,  getdate(),?  ) ");
        return this.actualizar(consulta, params);

    }

    public int PraticaUge(java.lang.String idevento, java.lang.String documento, java.lang.String nombres, java.lang.String vinculo, java.lang.String programa, java.lang.String semestre, java.lang.String carnet) {
        int retorno = 0;
        String consulta = new String();
        ArrayList<String> params = new ArrayList<String>(7);

        //Agregamos cada uno de los datos al ArrayList 

        params.add(idevento);
        params.add(documento);
        params.add(nombres);
        params.add(vinculo);
        params.add(programa);
        params.add(semestre);
        params.add(carnet);

        consulta = new String("insert into registro.inscrito_eventos (id_evento,  documento, nombres, "
                + "vinculo, fechains, programa, semestre, carnet) values ( ?, ?, ?,?,  getdate(), ?,  ?,?) ");
        return this.actualizar(consulta, params);

    }

    public Vector CuposEventos(String ident) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList

        params.add(ident);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select  count(*) "
                + " from registro.inscrito_eventos"
                + " where id_evento = ? ");
        return this.consultar(consulta, 1, params);
    }

    //***********************APOLO **********************
    private Vector getInfoApolo(String consulta, int tip, ArrayList<String> params) {
        Vector retorno = new Vector();
        BaseDatos bdnot = new BaseDatos();
        if (bdnot.conectarApolo()) {
            mensaje = "conectado";
            retorno = bdnot.consultar(consulta, tip, params);
            bdnot.desconectar();
        } else {
            mensaje = "Ha ocurrido un error " + bdnot.getMensaje();
        }
        return retorno;
    }

    public int setInfoApolo(String consulta, ArrayList<String> params) {
        int retorno = 0;
        BaseDatos bdnot = new BaseDatos();
        if (bdnot.conectarApolo()) {
            retorno = bdnot.actualizar(consulta, params);
            bdnot.desconectar();
        } else {
            mensaje = "Ha ocurrido un error " + bdnot.getMensaje();
        }
        if (retorno == 0) {
            mensaje = "Ha ocurrido un error " + bdnot.getMensaje();
        }
        return retorno;
    }

    //Insertar respuestas de registro calificado
    public int autoevaluacion(String id, String restas, String programa, String ident, String justif1, String justif2, String justif3, String justif4, String justif5, String justif6, String justif7, String justif8, String justif9, String justif10) {
        String consulta = new String();
        ArrayList<String> params = new ArrayList<String>(14);

        //Agregamos cada uno de los datos al ArrayList 

        params.add(id);
        params.add(restas);
        params.add(programa);
        params.add(ident);
        params.add(justif1);
        params.add(justif2);
        params.add(justif3);
        params.add(justif4);
        params.add(justif5);
        params.add(justif6);
        params.add(justif7);
        params.add(justif8);
        params.add(justif9);
        params.add(justif10);

        consulta = new String("insert into registro.apolo.restasep (id_enc,  restas, programa, identif, justif1, justif2, justif3, justif4, justif5, justif6,justif7,justif8,justif9,justif10, "
                + " fecha) values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?, getdate()) ");
        return this.setInfoApolo(consulta, params);
    }
//DISEÑO ANTERIOR
   /* public int Encuestado(String cedula, String id) {
     ArrayList<String> params = new ArrayList<String>(2);

     //Agregamos cada uno de los datos al ArrayList 

     params.add(cedula);
     params.add(id);
     int retorno = 0;
     String consulta = new String();
     consulta = new String("update registro.apolo.encuestadosep set flag1 = 1 "
     + "where id_persona = ?  and idenc1= ? ");

     return this.setInfoApolo(consulta, params);
     }*/

    public int Encuestado2(String cedula, String id) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList 

        params.add(cedula);
        params.add(id);
        int retorno = 0;
        String consulta = new String();
        consulta = new String("update registro.registro.apolo.encuestadosep set flag2 = 1 "
                + "where id_persona = ?  and idenc2= ? ");
        return this.setInfoApolo(consulta, params);
    }

    //Revisar si el estudiante ya contesto la encuesta reg calificado
    public Vector Contesto(String docest, String idenc) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList 
        params.add(docest);
        params.add(idenc);
        String consulta = new String();
        consulta = new String(" select id_enc, identif "
                + " from registro.apolo.restasep "
                + " where identif = ? and  id_enc = ? ");
        return this.getInfoApolo(consulta, 2, params);
    }
//DatosEncuestas version anterior
   /* public Vector DatosEncuestas(String cedula) {
     ArrayList<String> params = new ArrayList<String>(1);

     //Agregamos cada uno de los datos al ArrayList 
     params.add(cedula);

     String consulta = new String();
     consulta = " select id_persona, idenc1, flag1, idenc2, flag2, programa, descripcion " + "from registro.apolo.encuestadosep, registro.apolo.encuestas "
     + "where id_persona= ? and flag1=0 and id_encuesta=idenc1  ";
     return this.getInfoApolo(consulta, 7, params);
     // consulta = " select id_persona, idenc1, flag1, idenc2, flag2, programa " + "from apolo.encuestadosep " + "where id_persona= '" + cedula + "'   ";
     //return this.getInfoApolo(consulta, 6);

     }*/

    /*   public Vector PreguntasEnc(String idenc) {
     ArrayList<String> params = new ArrayList<String>(1);

     //Agregamos cada uno de los datos al ArrayList 
     params.add(idenc);
     String consulta = new String();
     consulta = " select  npre,npreg, lit,preg,tip, valores,t1, t2,t3,t4,t5, t6,t7 from registro.apolo.lispreguntasenc, registro.apolo.defpreguntas "
     + "where idenc= ? and idpreg=idpr order by npre  ";
     return this.getInfoApolo(consulta, 13, params);
     }
     */
    //diseño anterior
    /*Vector FactoresEnc(String idenc) {
     ArrayList<String> params = new ArrayList<String>(1);

     //Agregamos cada uno de los datos al ArrayList 
     params.add(idenc);
     String consulta = new String();
     consulta = " select distinct (id_factor) from registro.apolo.lispreguntasenc where idenc = ?   ";
     return this.getInfoApolo(consulta, 1, params);
     //return getConsultaApolo(consulta, 1, 1);

     }
     */
    //DISEÑO ANTERIOR
  /*  public Vector Factores(int idfactor) {
     ArrayList<String> params = new ArrayList<String>(1);

     //Agregamos cada uno de los datos al ArrayList 
     params.add(Integer.toString(idfactor));
     String consulta = new String();
     consulta = " select descripcion, nom_factor from registro.apolo.factores where id_factor= ?   ";
     return this.getInfoApolo(consulta, 2, params);
     }*/
    public Vector ContestoEncuestaFac(String idest, String factor) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList 
        params.add(idest);

        String consulta = new String();
        consulta = "select " + factor + "  from registro.apolo.encuestadosep, registro.apolo.encuestas "
                + " where id_persona= ? and  id_encuesta=idenc1 ";
        return this.getInfoApolo(consulta, 1, params);
    }
//DISEÑOANTERIOR
   /* public Vector PreguntasEncFactor(String idenc, int idfactor) {
     ArrayList<String> params = new ArrayList<String>(2);

     //Agregamos cada uno de los datos al ArrayList 
     params.add(idenc);
     params.add(Integer.toString(idfactor));
     String consulta = new String();
     consulta = " select  npre,npreg, lit,preg,tip, valores,t1, t2,t3,t4,t5, t6, t7,id_factor, ind, id_lispreg from registro.apolo.lispreguntasenc, registro.apolo.defpreguntas " + " where idenc= ? and idpreg=idpr and id_factor= ? order by npre  ";
     return this.getInfoApolo(consulta, 16, params);

     }*/

    //ENCUESTAS DE AUTOEVALIACION NUEVO DISEÑO
    //actualizar el estado del encuestado cuando haya respondido todos los factores de la encuesta.
    public int Encuestado(String carnet, String id) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(id);
        int retorno = 0;
        String consulta = new String();
        consulta = "update encuestas.encuestas.encuestado set estado = 1 "
                + "where id_encuestado = ?  and id_enc= ? ";
        return this.actualizar(consulta, params);
    }

    //DATOS DE LA ENCUESTA Y VALIDAR SI YA LA RESPONDIO
    public Vector DatosEncuestas(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select documento, encuestas.encuestas.encuestado.id_enc,encuestas.encuestas.encuestado.estado, nombre_enc, codigo, tipo_enc, encuestas.encuestas.encuestado.id_encuestado, encuestas.encuestas.encuestado.grupo , tipo_enc from encuestas.encuestas.encuestado, encuestas.encuestas.encuestas "
                + " where documento = ? and encuestas.encuestas.encuestado.estado=0 and  encuestas.encuestas.encuestas.id_enc=encuestas.encuestas.encuestado.id_enc ";
        return this.consultar(consulta, 9, params);

    }

    //CONSULTAR EN RESPUESTAS CUANTOS FACTORES HA CONTESTADO
    public Vector ContestoFactor(String carnet, String idenc) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(carnet);
        params.add(idenc);
        String consulta = new String();
        consulta = "SELECT distinct (id_factor) from encuestas.encuestas.respuestas "
                + " where id_encuestado= ? and  id_enc= ? ";
        return this.consultar(consulta, 1, params);
    }

    //CONSULTAR NOMBRE DEL PROFESOR DE UNA ASIGNATURA PARA ENCUESTAS POGRADOS
    public Vector ProfesorEncuesta(String idg, String per, String ngrp) {
        String consulta = new String();

        consulta = new String(" select otro_prof from encuestas.encuestas.grpprof "
                + " where id_grupo=" + idg + " and per= '" + per + "' and n_grp= '" + ngrp + "'");
        return this.consultar(consulta, 1);
    }

    //CONSULTAR EN QUE FACTOR VA RESPONDIENDO LA ENCUESTA
    public Vector MáximoFactor(String carnet, String idenc) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(carnet);
        params.add(idenc);

        String consulta = new String();
        consulta = "SELECT max (id_factor) from encuestas.encuestas.respuestas "
                + " where id_encuestado= ? and  id_enc= ? ";
        return this.consultar(consulta, 1, params);
    }

    //LISTA TODAS LAS PREGUNTAS POR ENCUESTA
    public Vector PreguntasEnc(String idenc) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idenc);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select  encuestas.encuestas.listpreguntas_enc.id_pregunta, id_factor, enunciado,encuestas.encuestas.enunciados.id_escala, tipo, valores, t1,t2,t3,t4,t5,t6,t7 "
                + " from encuestas.encuestas.listpreguntas_enc, encuestas.encuestas.enunciados, encuestas.encuestas.escala "
                + " where id_enc= ? and  encuestas.encuestas.listpreguntas_enc.id_pregunta= encuestas.encuestas.enunciados.id_pregunta and encuestas.encuestas.enunciados.id_escala = encuestas.encuestas.escala.id_escala order by id_pregunta  ";
        return this.consultar(consulta, 13, params);

    }

    //LISTAR PREGUNTAS POR CADA FACTOR DE LA ENCUESTA
    public Vector PreguntasEncFactor(String idenc, int idfactor) {
        ArrayList<String> params = new ArrayList<String>(2);
        params.add(idenc);
        params.add(Integer.toString(idfactor));
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = " select  encuestas.encuestas.listpreguntas_enc.id_pregunta, id_factor, enunciado,encuestas.encuestas.enunciados.id_escala, tipo, valores, t1,t2,t3,t4,t5,t6,t7 , id_pregenc"
                + " from encuestas.encuestas.listpreguntas_enc, encuestas.encuestas.enunciados, encuestas.encuestas.escala "
                + " where id_enc= ? and  encuestas.encuestas.listpreguntas_enc.id_pregunta= encuestas.encuestas.enunciados.id_pregunta and encuestas.encuestas.enunciados.id_escala = encuestas.encuestas.escala.id_escala and id_factor= ? order by id_pregunta  ";
        return this.consultar(consulta, 14, params);

    }

    // cuantos factores tiene una encuesta
    public Vector FactoresEnc(String idenc) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(idenc);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select distinct (id_factor) from encuestas.encuestas.listpreguntas_enc where id_enc=?   ";
        return this.consultar(consulta, 1, params);

    }

    //DATOS DE CADA FACTOR DE LA ENCUESTA
    public Vector Factores(int idfactor) {
        ArrayList<String> params = new ArrayList<String>(1);
        params.add(Integer.toString(idfactor));
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select descripcion, nombre from encuestas.encuestas.factores where id_factor=?   ";
        return this.consultar(consulta, 2, params);
    }
    //VALIDAR CADA RESPUESTA

    public Vector Validar(java.lang.String id, java.lang.String idpreg, java.lang.String ident) {
        ArrayList<String> params = new ArrayList<String>(3);
        params.add(id);
        params.add(idpreg);
        params.add(ident);
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select id_enc, id_pregunta, id_enc from encuestas.encuestas.respuestas where id_enc=? and id_pregunta=? and id_encuestado=?  ";
        return this.consultar(consulta, 3, params);
    }

    //INSERTA RESPUESTAS UNA A UNA CON SU RESPECTIVO COMENTARIO 
    public int AutoevaluacionNvo(java.lang.String ident, java.lang.String id, java.lang.String idfactor, java.lang.String idpreg, java.lang.String restas, java.lang.String comentario) {
        ArrayList<String> params = new ArrayList<String>(6);
        params.add(ident);
        params.add(id);
        params.add(idfactor);
        params.add(idpreg);
        params.add(restas);
        params.add(comentario);
        int respuesta = 0;
        String consulta = new String();

        consulta = "insert into encuestas.encuestas.respuestas (id_encuestado,  id_enc, id_factor, id_pregunta, respuesta, "
                + " fecha, comentario) values ( ?, ?, ?, ? , ?, getdate(), ? ) ";

        return this.actualizar(consulta, params);
    }

    //Inserta respuestas encuesta académica posgrados
    public int PosgradosComentarios(java.lang.String ident, java.lang.String id, java.lang.String idfactor, java.lang.String idpreg, java.lang.String restas, java.lang.String comentario, String aspecto, String grupo, String per) {
        ArrayList<String> params = new ArrayList<String>(9);
        params.add(ident);
        params.add(id);
        params.add(idfactor);
        params.add(idpreg);
        params.add(restas);
        params.add(comentario);
        params.add(aspecto);
        params.add(grupo);
        params.add(per);


        int respuesta = 0;
        String consulta = new String();

        consulta = "insert into encuestas.encuestas.respuestas (id_encuestado,  id_enc, id_factor, id_pregunta, respuesta, "
                + " fecha, comentario, aspecto, id_grupo, per_acad) values ( ?, ?, ?, ? , ?, getdate(), ?, ?, ?, ? ) ";

        return this.actualizar(consulta, params);
    }

    public int AutoevaluacionNvoPosgrados(java.lang.String ident, java.lang.String id, java.lang.String idfactor, java.lang.String idpreg, java.lang.String restas, String grupo, String per) {
        ArrayList<String> params = new ArrayList<String>(7);
        params.add(ident);
        params.add(id);
        params.add(idfactor);
        params.add(idpreg);
        params.add(restas);
        params.add(grupo);
        params.add(per);


        int respuesta = 0;
        String consulta = new String();

        consulta = "insert into encuestas.encuestas.respuestas (id_encuestado,  id_enc, id_factor, id_pregunta, respuesta, "
                + " fecha,  id_grupo, per_acad) values ( ?, ?, ?, ? , ?, getdate(), ?, ? ) ";

        return this.actualizar(consulta, params);
    }
    
    public Vector VeriPreinsExcepciones(String id_plan, String id_asig) {

        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(id_plan);
        params.add(id_asig);
        String consulta = new String();
        consulta = "select id_prerrequ from registro.excepcionPreinscripcion where id_plan= ? and id_asig= ?";
        return this.consultar(consulta, 1, params);
    }
    
    
    public Vector getPlanEstud(String id_est) {

        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(id_est);
        String consulta = new String();
        consulta = "select id_plan, id_dpplan from registro.estudiante where id_est=?";
        return this.consultar(consulta, 2, params);
    }
    
    public Vector getNotaAsig(String id_est, String id_asig) {

        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(id_est);
        params.add(id_asig);
        String consulta = new String();
        consulta = "select nota from registro.biblia_def where id_est=? and as_vis=?";
        return this.consultar(consulta, 1, params);
    }
    
    public Vector VeriPreinsProgramada(String id_plan, String id_asig) {

        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(id_plan);
        params.add(id_asig);
        String consulta = new String();
        consulta = "select id_programada from registro.asigProgramadaRenovacion where id_plan= ? and id_asig= ?";
        return this.consultar(consulta, 0, params);
    }
    
    public Vector VeriPreinsNoProgramada(String id_plan, String id_asig) {

        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(id_plan);
        params.add(id_asig);
        String consulta = new String();
        consulta = "select id_asig from registro.asigProgramadaRenovacion where id_plan= ? and id_programada= ?";
        return this.consultar(consulta, 1, params);
    }
    
    public Vector VeriTransicion(String id_est) {

        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(id_est);
        String consulta = new String();
        consulta = "select step from dbo.sim_proceso_est where id_est=?";
        return this.consultar(consulta, 1, params);
    }
    
    public Vector EstIngresoDespuesTransicion(String id_est) {

        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(id_est);
        String consulta = new String();
        consulta = "select * from registro.registro.estudiante where id_est=? and per_ing > '2018-1'";
        return this.consultar(consulta, 1, params);
    }
    

    public int ProcedimientoAlumno(String idest, String identificador, String val) {
        int retorno = 0;

        try {
            retorno = VerReq(idest, identificador, val);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due toSQLException: " + ex.getMessage());
        }
        // desconectarBD();
        return retorno;
    }
    
    public int ProcedimientoAlumnoNuevosPlanes(String idest, String identificador, String val) {
        int retorno = 0;

        try {
            retorno = VerReqNuevosPlanes(idest, identificador, val);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due toSQLException: " + ex.getMessage());
        }
        // desconectarBD();
        return retorno;
    }

//======POSGRADO===================================
    //==ASIGNATURAS QUE SE PUEDEN INSCRIBIR, INCLUIDAS LAS QUE NO ESTAN EN EL PLAN Y ESTAN OFRECIDAS PARA EL PROGRMA EN PROGELECTIVAS
/*public Vector getAsigPos(String idplan, String per, String carnet) {
     String consulta = new String();
     consulta = new String("SELECT registro.asig_plan.id_asig, id_prog, peso, cod_asig, nom_asig, nro as grupo, per_acad, id_grp, cupo "
     + " FROM registro.asig_plan, registro.plan_estud, registro.asignatura, registro.grupo_post "
     + " WHERE ( registro.plan_estud.id_plan = registro.asig_plan.id_plan ) and "
     + " ( registro.asig_plan.id_asig = registro.asignatura.id_asig) and "
     + " ( registro.asig_plan.id_asig = registro.grupo_post.id_asig) and "
     + " ( registro.plan_estud.id_plan = '" + idplan + "' ) and per_acad = '" + per + "' and "
     + " registro.asig_plan.id_asig not in (select id_asig from registro.biblia_post where clave in('Z', 'A') and "
     + " per_acad = '" + per + "' and id_est = " + carnet + ") and registro.asig_plan.id_asig not in (select id_asig from registro.biblia_post where aprob = 1 and id_est =  " + carnet + ")  "
     + " union"
     + " SELECT id_as, id_prog, num_ulas_a, cod_asig, nom_asig, num_grupo as grupo, per_acad, id_grupo, cupo_maximo "
     + " FROM registro.estudiante, registro.plan_estud, registro.asignatura, registro.grupo, registro.progelectiva "
     + " WHERE ( registro.plan_estud.id_plan = registro.estudiante.id_plan ) and "
     + " ( registro.progelectiva.id_as = registro.asignatura.id_asig) and "
     + " ( registro.progelectiva.id_prg = registro.plan_estud.id_prog) and "
     + " ( registro.progelectiva.id_as = registro.grupo.id_asig) and"
     + " ( registro.plan_estud.id_plan = '" + idplan + "' ) and per_acad = '" + per + "' and "
     + " registro.progelectiva.id_as not in (select id_asig from registro.biblia_post where clave in('Z', 'A') and "
     + " per_acad = '" + per + "' and id_est = " + carnet + ") and id_est = " + carnet + " and registro.progelectiva.id_as not in (select id_asig from registro.biblia_post where aprob = 1 and id_est =  " + carnet + ")"
     + " union"
     + " SELECT id_as, id_prog, num_ulas_a, cod_asig, nom_asig, nro as grupo, per_acad, id_grp, cupo "
     + " FROM registro.estudiante, registro.plan_estud, registro.asignatura, registro.grupo_post, registro.progelectiva"
     + " WHERE ( registro.plan_estud.id_plan = registro.estudiante.id_plan ) and "
     + " ( registro.progelectiva.id_as = registro.asignatura.id_asig) and "
     + " ( registro.progelectiva.id_prg = registro.plan_estud.id_prog) and ( registro.progelectiva.id_as = registro.grupo_post.id_asig) and"
     + " ( registro.plan_estud.id_plan = '" + idplan + "' ) and per_acad = '" + per + "' and "
     + " registro.progelectiva.id_as not in (select id_asig from registro.biblia_post where clave in('Z', 'A') and "
     + " per_acad = '" + per + "' and id_est = " + carnet + ") and id_est = " + carnet + " and registro.progelectiva.id_as not in (select id_asig from registro.biblia_post where aprob = 1 and id_est =  " + carnet + ")"
     + " order by cod_asig");
     return this.consultar(consulta, 9);
     }*/
    public Vector getAsigPos(String idplan, String per, String carnet) {
        ArrayList<String> params = new ArrayList<String>(11);

        //Agregamos cada uno de los datos al ArrayList

        params.add(idplan);
        params.add(per);
        params.add(per);
        params.add(carnet);
        params.add(carnet);
        params.add(idplan);
        params.add(per);
        params.add(per);
        params.add(carnet);
        params.add(carnet);
        params.add(carnet);

        String consulta = new String();
        consulta = new String("SELECT registro.asig_plan.id_asig, id_prog, peso, cod_asig, nom_asig, nro as grupo, per_acad, id_grp, cupo "
                + " FROM registro.asig_plan, registro.plan_estud, registro.asignatura, registro.grupo_post "
                + " WHERE ( registro.plan_estud.id_plan = registro.asig_plan.id_plan ) and "
                + " ( registro.asig_plan.id_asig = registro.asignatura.id_asig) and "
                + " ( registro.asig_plan.id_asig = registro.grupo_post.id_asig) and "
                + " ( registro.plan_estud.id_plan = ? ) and per_acad = ? and "
                + " registro.asig_plan.id_asig not in (select id_asig from registro.biblia_post where clave in('Z', 'A') and "
                + " per_acad = ? and id_est = ?) and registro.asig_plan.id_asig not in (select id_asig from registro.biblia_post where aprob = 1 and id_est =  ?)  "
                + " union"
                + " SELECT id_as, id_prog, num_ulas_a, cod_asig, nom_asig, nro as grupo, per_acad, id_grp, cupo "
                + " FROM registro.estudiante, registro.plan_estud, registro.asignatura, registro.grupo_post, registro.progelectiva"
                + " WHERE ( registro.plan_estud.id_plan = registro.estudiante.id_plan ) and "
                + " ( registro.progelectiva.id_as = registro.asignatura.id_asig) and "
                + " ( registro.progelectiva.id_prg = registro.plan_estud.id_prog) and ( registro.progelectiva.id_as = registro.grupo_post.id_asig) and"
                + " ( registro.plan_estud.id_plan = ? ) and per_acad = ?  and "
                + " registro.progelectiva.id_as not in (select id_asig from registro.biblia_post where clave in('Z', 'A') and "
                + " per_acad = ? and id_est = ?) and id_est = ? and registro.progelectiva.id_as not in (select id_asig from registro.biblia_post where aprob = 1 and id_est =  ?)"
                + " order by cod_asig");
        return this.consultar(consulta, 9, params);
    }

    public Vector getAsigBib(String per, String carnet) {
        ArrayList<String> params = new ArrayList<String>(4);

        //Agregamos cada uno de los datos al ArrayList

        params.add(per);
        params.add(carnet);
        params.add(per);
        params.add(per);
        params.add(carnet);
        String consulta = new String();
        consulta = new String(" select registro.biblia_post.id_asig, cod_asig, nom_asig, cred, nro, clave"
                + " from registro.biblia_post, registro.asignatura, registro.grupo_post "
                + " where (registro.biblia_post.id_asig = registro.asignatura.id_asig) and "
                + " (registro.biblia_post.id_grupo = registro.grupo_post.id_grp) and "
                + " registro.biblia_post.per_acad = ? and clave in ('Z', 'A') and id_est = ? "
                + " union"
                + " select registro.biblia_post.id_asig, cod_asig, nom_asig, cred, num_grupo, clave"
                + " from registro.biblia_post, registro.asignatura, registro.grupo"
                + " where (registro.biblia_post.id_asig = registro.asignatura.id_asig) and "
                + " (registro.biblia_post.id_grupo = registro.grupo.id_grupo) and "
                + " registro.biblia_post.per_acad = ? and registro.grupo.per_acad=? and clave in ('Z', 'A') and id_est = ? ");

        /* consulta = new String("SELECT registro.asig_plan.id_asig, id_prog, peso, cod_asig, nom_asig, nro as grupo, per_acad, id_grp "
         + " FROM registro.asig_plan, registro.plan_estud, registro.asignatura, registro.grupo_post "
         + " WHERE ( registro.plan_estud.id_plan = registro.asig_plan.id_plan ) and "
         + " ( registro.asig_plan.id_asig = registro.asignatura.id_asig) and  "
         + " ( registro.asig_plan.id_asig = registro.grupo_post.id_asig) and"
         + " ( registro.plan_estud.id_plan = '" + idplan + "' ) and per_acad = '" + per + "' and "
         + " registro.asig_plan.id_asig in (select id_asig from registro.biblia_post where clave = 'P' and "
         + " per_acad = '" + per + "' and id_est = '" + carnet + "') ORDER BY registro.asig_plan.id_asig ASC  ");*/
        return this.consultar(consulta, 6, params);
    }

//Verifica asignatura en biblia_post
    public Vector VerifAsig(String idasig, String carnet, String per) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList

        params.add(idasig);
        params.add(carnet);
        params.add(per);
        String consulta = new String();
        consulta = new String("select id_bib from registro.biblia_post "
                + " where id_asig = ? and id_est = ? and per_acad = ? ");
        return this.consultar(consulta, 1, params);
    }

    public int Actualinscpos(String idAsig, String carnet, String per, String grp, String ngrp, String ban) {


        String consulta = new String();
        String clave = "Z";
        int prom = 1;
        if (ban.equals("1")) {
            clave = "A";
            prom = 0;
        }
        ArrayList<String> params = new ArrayList<String>(7);

        //Agregamos cada uno de los datos al ArrayList

        params.add(clave);
        params.add(ngrp);
        params.add(grp);
        params.add(Integer.toString(prom));
        params.add(carnet);
        params.add(idAsig);
        params.add(per);
        consulta = new String("update registro.biblia_post set clave = ?, nr_grp = ?, des_tpo = 'Internet - ' + (convert(char, GETDATE(), 120)), id_grupo = ?, prom = ?"
                + " where id_est= ? and  id_asig  = ? and per_acad = ? ");
        return this.actualizar(consulta, params);
    }

    public int Borrainscpos(String idAsig, String carnet, String per) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList

        params.add(carnet);
        params.add(per);
        params.add(idAsig);

        String consulta = new String();
        consulta = new String("delete from registro.biblia_post where id_est = ? and per_acad = ? and clave in ('Z', 'A') and id_asig = ? and (pag is null or pag = 0) and nota is null");
        return this.actualizar(consulta, params);
    }

    public Vector InfAsig(String idasig, String idplan, String per, String prog, String idgrp) {
        ArrayList<String> params = new ArrayList<String>(12);

        //Agregamos cada uno de los datos al ArrayList

        params.add(idplan);
        params.add(per);
        params.add(idasig);
        params.add(idgrp);
        params.add(prog);
        params.add(per);
        params.add(idasig);
        params.add(idgrp);
        params.add(prog);
        params.add(per);
        params.add(idasig);
        params.add(idgrp);

        String consulta = new String();
        consulta = new String(" SELECT  peso, nro, id_grp "
                + " FROM registro.asig_plan, registro.plan_estud, registro.asignatura, registro.grupo_post  "
                + " WHERE ( registro.plan_estud.id_plan = registro.asig_plan.id_plan ) and "
                + " ( registro.asig_plan.id_asig = registro.asignatura.id_asig) and  "
                + " ( registro.asig_plan.id_asig = registro.grupo_post.id_asig) and"
                + " ( registro.plan_estud.id_plan = ? ) and per_acad = ? and  "
                + " ( registro.asignatura.id_asig = ?) and (registro.grupo_post.id_grp = ?)"
                + " union "
                + " SELECT num_ulas_a, num_grupo, id_grupo"
                + " FROM registro.asignatura, registro.grupo, registro.progelectiva "
                + " WHERE ( registro.progelectiva.id_as = registro.asignatura.id_asig) and "
                + " ( registro.progelectiva.id_prg = ? ) and "
                + " ( registro.progelectiva.id_as = registro.grupo.id_asig) and "
                + " per_acad = ? and registro.asignatura.id_asig = ? and registro.grupo.id_grupo = ? "
                + " union "
                + " SELECT num_ulas_a, nro, id_grp"
                + " FROM registro.asignatura, registro.grupo_post, registro.progelectiva "
                + " WHERE ( registro.progelectiva.id_as = registro.asignatura.id_asig) and "
                + " ( registro.progelectiva.id_prg = ? ) and "
                + " ( registro.progelectiva.id_as = registro.grupo_post.id_asig) and "
                + " per_acad = ? and registro.asignatura.id_asig = ? and (registro.grupo_post.id_grp = ?) ");
        return this.consultar(consulta, 3, params);
    }

//Insertar en Biblia_Post
    public int InsertInscPos(String sec, String idasig, String carnet, String ngrp, String per, String peso, String grp, String ban) {
        String clave = "Z";
        java.util.Date date = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
        String fecha = sdf.format(date);
        String desp = "Internet - " + fecha;
        int prom = 1;
        if (ban.equals("1")) {
            clave = "A";
            prom = 0;
        }

        ArrayList<String> params = new ArrayList<String>(10);

        //Agregamos cada uno de los datos al ArrayList

        params.add(sec);
        params.add(idasig);
        params.add(carnet);
        params.add(idasig);
        params.add(ngrp);
        params.add(per);
        params.add(peso);
        params.add(clave);
        params.add(grp);
        params.add(Integer.toString(prom));


        String consulta = new String();
        consulta = new String("insert into registro.biblia_post (id_bib, id_asig, id_est, as_vis, nr_grp, per_acad, nota, cred, clave, des_tpo, id_grupo, idord, pag, prom)"
                + "  values (?, ?, ?, ?, ?, ?, null, ?, ?, 'Internet - ' + (convert(char, GETDATE(), 120)) , ?, null, 0, ?)");
        return this.actualizar(consulta, params);
    }

//==Buscar horario semanal asignatura
    public Vector BuscarAsigPos(String per, String entrada) {
        ArrayList<String> params = new ArrayList<String>(4);

        //Agregamos cada uno de los datos al ArrayList
        params.add("%" + entrada + "%");
        params.add("%" + entrada + "%");
        params.add(per);
        params.add(per);

        String consulta = new String();
        consulta = new String("SELECT registro.salones.cod_sal, registro.grupo_post.nro, registro.sal_grupo.dia, registro.sal_grupo.hora_ini,   "
                + " registro.sal_grupo.hora_fin, registro.asignatura.cod_asig, registro.asignatura.nom_asig, nom_prof "
                + " FROM registro.sal_grupo, registro.grupo_post, registro.asignatura, registro.salones, registro.profesor "
                + " WHERE (registro.asignatura.cod_asig like ? OR registro.asignatura.nom_asig like ?) and "
                + " ( registro.grupo_post.id_grp = registro.sal_grupo.id_grupo ) and ( registro.grupo_post.per_acad = ? ) AND  "
                + " ( registro.grupo_post.id_asig = registro.asignatura.id_asig ) and ( registro.sal_grupo.id_sal =registro.salones.id_sal) and "
                + " (registro.grupo_post.id_prof =registro.profesor.id_prof) and "
                + " ( registro.sal_grupo.per_acad = ? ) order by registro.sal_grupo.id_grupo, dia ");
        return this.consultar(consulta, 8, params);
    }

    public Vector BuscarAsigPosC(String per, String entrada) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList
        params.add(per);
        params.add("%" + entrada + "%");
        params.add("%" + entrada + "%");

        String consulta = new String();
        consulta = new String(" select cod_sal, registro.usosalon.dia, (convert(char, fecuso, 103)), fsol, per_acad, cod_asig, nom_asig, hora, nro, nom_prof "
                + " from  registro.grupo_post, registro.asignatura, registro.salones,registro.usosalon, registro.profesor "
                + " where registro.usosalon.id_sal = registro.salones.id_sal and registro.grupo_post.per_acad= ? and "
                + " (registro.asignatura.nom_asig like ? OR registro.asignatura.cod_asig like ?) and "
                + " registro.asignatura.id_asig = registro.grupo_post.id_asig and registro.usosalon.idgrp = registro.grupo_post.id_grp and "
                + " (registro.grupo_post.id_prof =registro.profesor.id_prof)  "
                + " order by  registro.usosalon.dia, registro.usosalon.fecuso");
        return this.consultar(consulta, 10, params);
    }

    public Vector InfAsigNoPlan(String idas, String per) {
        ArrayList<String> params = new ArrayList<String>(4);

        //Agregamos cada uno de los datos al ArrayList
        params.add(per);
        params.add(idas);
        params.add(per);
        params.add(idas);

        String consulta = new String();
        consulta = new String("SELECT  num_ulas_a, num_grupo, id_grupo FROM registro.asignatura, registro.grupo"
                + " WHERE (registro.asignatura.id_asig = registro.grupo.id_asig) and "
                + " per_acad = ? and registro.asignatura.id_asig = ? "
                + " union"
                + " SELECT  num_ulas_a, nro, id_grp FROM registro.asignatura, registro.grupo_post"
                + " WHERE (registro.asignatura.id_asig = registro.grupo_post.id_asig) and "
                + " per_acad = ? and registro.asignatura.id_asig = ? order by id_grupo");
        return this.consultar(consulta, 3, params);
    }

    public Vector AsigAdPos(String per) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(per);
        params.add(per);

        String consulta = new String();
        consulta = new String("select cod_asig, nom_asig, num_ulas_a, val_ele, id_asig from registro.asignatura"
                + " where registro.asignatura.id_asig in (select id_asig from registro.grupo where per_acad = ?) and cod_asig not like '%+%' and cod_asig not like '%Z-%'"
                + " union"
                + " select cod_asig, nom_asig, num_ulas_a, val_ele, id_asig from registro.asignatura"
                + " where registro.asignatura.id_asig in (select id_asig from registro.grupo_post where per_acad = ?) and cod_asig not like '%+%' and cod_asig not like '%Z-%'");
        return this.consultar(consulta, 5, params);
    }

    public Vector getInfActa(String per, String idest) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList

        params.add(idest);
        params.add(per);

        String consulta = new String();
        consulta = new String("select firma from registro.actasmat where id_est = ? and per_acad = ? ");
        return this.consultar(consulta, 1, params);
    }

    public int Actualactpos(String per, String firma, String carnet) {
        ArrayList<String> params = new ArrayList<String>(3);

        //Agregamos cada uno de los datos al ArrayList

        params.add(firma);
        params.add(carnet);
        params.add(per);
        String consulta = new String();
        consulta = new String("update registro.registro.actasmat set firma = '" + firma + "-' + convert(varchar(20), getdate()) "
                + " where id_est= " + carnet + " and per_acad = '" + per + "' ");
        return this.actualizar(consulta, params);
    }

    public int InserActaPos(String idest, String per) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList

        params.add(idest);
        params.add(per);

        String consulta = new String();
        consulta = new String(" insert into registro.actasmat (id_est, per_acad, firma, obse) "
                + " values (" + idest + ", '" + per + "', '100000--' + convert(varchar(20), getdate()), null) ");
        return this.actualizar(consulta, params);
    }

    public Vector getInfPer(String idprg) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idprg);

        String consulta = new String();
        consulta = new String("SELECT registro.parampos.per_reg, convert(varchar, fechr_ini, 103) as fini, "
                + " convert(int,fechr_ini) as infini, convert(int,GETDATE()) as hoy, convert(varchar, fechr_fin, 103) as ffin, "
                + " convert(int,fechr_fin) as inffin, datediff(day, getdate(),fechr_fin) as difffin, convert(int,fecha_aini) as afini, datediff(day, getdate(),fecha_afin) as affin,"
                + " datediff(day, getdate(),fecha_aini) as dafini, datediff(day, getdate(),fechr_ini) as dfini"
                + " FROM registro.parampos WHERE  registro.parampos.idprg = ?  ");
        return this.consultar(consulta, 11, params);
    }

    /* public Vector BuscarAsigAPos(String per, String entrada, String idest, String idplan) {
     String consulta = new String();
     consulta = new String("  SELECT registro.asignatura.id_asig, num_ulas_a, cod_asig, nom_asig, nro as grupo, per_acad, id_grp, cupo"
     + " FROM registro.asignatura, registro.grupo_post "
     + " WHERE ( registro.asignatura.id_asig = registro.grupo_post.id_asig ) and registro.grupo_post.per_acad= '" + per + "' and "
     + " (registro.asignatura.nom_asig like '%" + entrada + "%' OR registro.asignatura.cod_asig like '%" + entrada + "%') and "
     + " registro.asignatura.id_asig not in (select id_asig from registro.biblia_post where aprob = 1 and id_est =   '" + idest + "' ) and"
     + " registro.asignatura.id_asig not in (select id_asig from registro.biblia_post where clave in ('Z', 'A') and per_acad = '" + per + "' and id_est =  '" + idest + "' )  and"
     + " registro.asignatura.id_asig not in (SELECT registro.asig_plan.id_asig"
     + " FROM registro.asig_plan, registro.plan_estud, registro.grupo_post, registro.estudiante"
     + " WHERE (registro.estudiante.id_plan = registro.plan_estud.id_plan) and ( registro.plan_estud.id_plan = registro.asig_plan.id_plan ) and "
     + " ( registro.asig_plan.id_asig =  registro.grupo_post.id_asig) and ( registro.plan_estud.id_plan = '" + idplan + "') and per_acad = '" + per + "' and id_est = '" + idest + "' and "
     + " registro.asig_plan.id_asig not in (select id_asig from registro.biblia_post where clave in ('Z', 'A') and per_acad = '" + per + "' and id_est = '" + idest + "' ) and "
     + " registro.asig_plan.id_asig not in (select id_asig from registro.biblia_post where aprob = 1 and id_est =  '" + idest + "' ) ) "
     + " union                        "
     + " SELECT registro.asignatura.id_asig, num_ulas_a, cod_asig, nom_asig, num_grupo as grupo, per_acad, id_grupo, cupo_maximo "
     + " FROM registro.asignatura, registro.grupo "
     + " WHERE ( registro.asignatura.id_asig = registro.grupo.id_asig ) and registro.grupo.per_acad= '" + per + "' and "
     + " (registro.asignatura.nom_asig like '%" + entrada + "%' OR registro.asignatura.cod_asig like '%" + entrada + "%') and "
     + " registro.asignatura.id_asig not in (select id_asig from registro.biblia_post where aprob = 1 and id_est =   '" + idest + "' )  and"
     + " registro.asignatura.id_asig not in (select id_asig from registro.biblia_post where clave in ('Z', 'A') and per_acad = '" + per + "' and id_est =  '" + idest + "' ) and cooterm = 'S'");
     return this.consultar(consulta, 8);
     }*/
    public Vector BuscarAsigAPos(String per, String entrada, String idest, String idplan) {
        ArrayList<String> params = new ArrayList<String>(12);

        //Agregamos cada uno de los datos al ArrayList
        params.add(per);
        params.add("%" + entrada + "%");
        params.add("%" + entrada + "%");
        params.add(idest);
        params.add(per);
        params.add(idest);
        params.add(idplan);
        params.add(per);
        params.add(idest);
        params.add(per);
        params.add(idest);
        params.add(idest);


        String consulta = new String();
        consulta = new String("SELECT registro.asignatura.id_asig, num_ulas_a, cod_asig, nom_asig, nro as grupo, per_acad, id_grp, cupo, nom_prof"
                + " FROM registro.asignatura, registro.grupo_post, registro.profesor "
                + " WHERE ( registro.asignatura.id_asig = registro.grupo_post.id_asig ) and registro.grupo_post.per_acad= ? and "
                + " (registro.asignatura.nom_asig like ? OR registro.asignatura.cod_asig like ?) and "
                + " registro.asignatura.id_asig not in (select id_asig from registro.biblia_post where aprob = 1 and id_est =   ? ) and"
                + " registro.asignatura.id_asig not in (select id_asig from registro.biblia_post where clave in ('Z', 'A') and per_acad = ? and id_est =  ? )  and"
                + " registro.asignatura.id_asig not in (SELECT registro.asig_plan.id_asig"
                + " FROM registro.asig_plan, registro.plan_estud, registro.grupo_post, registro.estudiante"
                + " WHERE (registro.estudiante.id_plan =registro.plan_estud.id_plan) and ( registro.plan_estud.id_plan = registro.asig_plan.id_plan ) and "
                + " ( registro.asig_plan.id_asig =registro.grupo_post.id_asig) and ( registro.plan_estud.id_plan = ?) and per_acad = ? and id_est = ? and "
                + " registro.asig_plan.id_asig not in (select id_asig from registro.biblia_post where clave in ('Z', 'A') and per_acad = ? and id_est = ? ) and "
                + " registro.asig_plan.id_asig not in (select id_asig from registro.biblia_post where aprob = 1 and id_est =  ? ) ) and (registro.grupo_post.id_prof = registro.profesor.id_prof) ");
        return this.consultar(consulta, 9, params);
    }

    public Vector VerifCup(String idgrp, String per) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idgrp);
        params.add(per);

        String consulta = new String();
        consulta = new String("select count (id_bib) from registro.biblia_post where id_grupo = ? and per_acad = ? and clave in ('Z', 'A')");
        return this.consultar(consulta, 1, params);
    }

    public Vector FirmaActa(String idest, String per) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idest);

        String consulta = new String();
        consulta = new String("select COUNT (*) from registro.actasmat where id_est=? and per_acad='2015-I' and firma <> 'NF'  ");
        return this.consultar(consulta, 1, params);
    }

    public Vector VerifCupPreg(String idgrp, String per) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idgrp);
        params.add(per);

        String consulta = new String();
        consulta = new String("select count (id_bib) from registro.registro where id_grupo = ? and per_acad = ?");
        return this.consultar(consulta, 1, params);
    }

    public int InsertLog(String idasig, String carnet, String per, String grp, String ngrp, String tipo) {
        ArrayList<String> params = new ArrayList<String>(4);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        params.add(tipo);
        String consulta = new String();
        String texto = "";
        if (tipo.equals("U")) {
            params.add(ngrp);
            params.add(grp);
            params.add(idasig);
            texto = "update registro.biblia_post set nr_grp = " + ngrp
                    + " , id_grupo = " + grp + " , id_asig = " + idasig + "";
        } else if (tipo.equals("D")) {

            params.add(idasig);
            params.add(grp);
            texto = "delete from registro.biblia_post where id_asig = "
                    + idasig + " and grupo = " + grp + "";
        } else if (tipo.equals("I")) {

            params.add(idasig);
            params.add(ngrp);
            params.add(grp);
            texto = "insert into registro.biblia_post values (id_asig, nr_grp, id_grupo) values ( " + idasig + " , " + ngrp + " , " + grp + " )";
        }

        consulta = new String("insert into registro.logaudit (usu, modu, prc, oper, fec, sent )"
                + "  values (" + carnet + ", 'RegPosgrado', 'Registro-AsigPosgrado', '" + tipo + "', getdate(), '" + texto + "') ");
        return this.actualizar(consulta, params);
    }

    public int Autentica(String carnet) {

        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        consulta = new String("insert into registro.sesiones values (?, 1, getdate()");
        return this.actualizar(consulta);
    }

// == procedimiento actas
    public int ProcedimientoActas(String idest) {
        int retorno = 0;
        try {
            // conectar();
            //retorno = Actasmat(idest);

            retorno = Actasmat(idest);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due toSQLException: " + ex.getMessage());
        }
        desconectar();
        return retorno;

    }

    public Vector PreinscripcionDefinitiva(String idAsig, String idest) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idest);
        params.add(idAsig);


        String consulta = new String();
        Vector retorno = new Vector();

        consulta = new String("select registro.grupo.id_grupo, id_asig from registro.registro, registro.grupo "
                + " where id_est=? and registro.grupo.id_grupo=registro.registro.id_grupo and registro.grupo.id_asig=?  and registro.grupo.per_acad= '" + cfgEci.getPeriodoActual() + "'");

        try {
            conectar();
            return this.consultar(consulta, 2, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());

        }
        desconectar();

        return retorno;

    }

    public Vector Ingles(String idest) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idest);


        String consulta = new String();
        Vector retorno = new Vector();

        // consulta = new String("select MAX(niv_ingles), id_asig  from registro.clasif_inglesestud where id_est =? group by registro.clasif_inglesestud.id_asig");
        consulta = new String("select niv_ingles, id_asig, max(per_examen)   from registro.clasif_inglesestud where id_est  = ? group by per_examen, id_asig, niv_ingles order by  per_examen desc");
        try {
            conectar();
            return this.consultar(consulta, 3, params);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());

        }
        desconectar();

        return retorno;

    }

    public Vector InglesVer(String idest) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idest);
        String consulta = new String();
        Vector retorno = new Vector();
        /* ABRIL 19 2017 SE CAMBIA ESTA CONSULTA POR SOLICUTD DE JAVIER RIOS YA QUE NO PODEMOS INDENTIFICAR Q ES MAYOR ENTRE A2 Y 60 POR EJEMPLO
         consulta = "select  niv_ingles, registro.asignatura.id_asig, cod_asig from registro.clasif_inglesestud, registro.asignatura  where id_est =? "
         + "and niv_ingles in  ( select MAX(niv_ingles) "
         + " from registro.clasif_inglesestud  where id_est =?) and registro.asignatura.id_asig=registro.clasif_inglesestud.id_asig ";
         * */

        consulta = "select A.NIV_INGLES, A.id_asig, B.cod_asig from registro.clasif_inglesestud A "
                + "left outer join registro.asignatura B on  A.id_asig=B.id_asig where  id_est =? and (A.id_asig=0  or A.id_asig=-1)";

        try {
            conectar();
            return this.consultar(consulta, 3, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectar();
        return retorno;
    }

    public Vector InglesVerNivel(String idest) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idest);
        String consulta = new String();
        Vector retorno = new Vector();
        /* ABRIL 19 2017 SE CAMBIA ESTA CONSULTA POR SOLICUTD DE JAVIER RIOS YA QUE NO PODEMOS INDENTIFICAR Q ES MAYOR ENTRE A2 Y 60 POR EJEMPLO
         consulta = "select  niv_ingles, registro.asignatura.id_asig, cod_asig from registro.clasif_inglesestud, registro.asignatura  where id_est =? "
         + "and niv_ingles in  ( select MAX(niv_ingles) "
         + " from registro.clasif_inglesestud  where id_est =?) and registro.asignatura.id_asig=registro.clasif_inglesestud.id_asig ";
         * */

        consulta = "select A.NIV_INGLES, A.id_asig, B.cod_asig from registro.clasif_inglesestud A "
                + "left outer join registro.asignatura B on  A.id_asig=B.id_asig where  id_est =? order by id_asig desc ";

        try {
            conectar();
            return this.consultar(consulta, 3, params);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectar();
        return retorno;
    }

    public int InsertaAuditPI(String idest, String idgrupo) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idest);
        params.add(idgrupo);
        String consulta = new String();
        consulta = new String("insert into registro.audit_intermedio values ( ?, ?,getdate() )");
        return this.actualizar(consulta, params);
    }

    public int ActualizaRetiro(String sec, String idEst, String grupo, String per) {
        ArrayList<String> params = new ArrayList<String>(4);

        //Agregamos cada uno de los datos al ArrayList
        params.add(sec);
        params.add(idEst);
        params.add(grupo);
        params.add(per);
        String consulta = new String();
        int retorno = 0;

        consulta = new String("update registro.registro set retiro = 1, id_est =?, fecha_retiro= getdate() where id_est=  ?  and id_grupo= ? and per_acad=?");
        return this.actualizar(consulta, params);
    }

    public Vector AsignaturasPI(String idest, String per) {
        String consulta = new String();
        Vector retorno = new Vector();
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idest);
        params.add(per);

        consulta = new String("select id_grupo, as_vis, cod_asig, retiro, rpag from registro.registro, registro.asignatura where id_est= ? and per_acad= ? and registro.registro.as_vis= registro.asignatura.id_asig ");
        return this.consultar(consulta, 5, params);
    }

    // ASIGNATURA Y LABORATORIO SI TIENE 
    public Vector Asignatura(String codasig) {
        String consulta = new String();
        Vector retorno = new Vector();
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(codasig);

        consulta = new String("select ID_ASIG,CD_LAB from registro.asignatura where cod_asig= ?  ");
        return this.consultar(consulta, 2, params);
    }
    
    

    //
    public Vector AsignaturaLaborat(String idasig, String num_grupo, String idasig1, String num_grupo1, String per) {
        String consulta = new String();
        Vector retorno = new Vector();
        ArrayList<String> params = new ArrayList<String>(5);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idasig);
        params.add(num_grupo);
        params.add(idasig1);
        params.add(num_grupo1);
        params.add(per);

        consulta = new String("select id_grupo, id_asig from registro.grupo where ((id_asig=? and num_grupo= ?)  OR (id_asig=? and num_grupo=? ))AND per_acad= ? ");
        return this.consultar(consulta, 2, params);
    }
    //CONSULTAR ID_GRUPO LABORATORIO CDO EL ESTUDIANTE NO INGRESA EL NRO DE GRUPO EN EL MOMENTO DE BORRAR UNA ASIG EN LA ELABORACION DEL HORARIO

    public Vector ConsultagrupoLaborat(String idasig, String per) {
        String consulta = new String();
        Vector retorno = new Vector();
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idasig);

        params.add(per);

        consulta = new String("select num_grupo from registro.registro, registro.grupo  where registro.registro.id_grupo = registro.grupo.id_grupo and id_asig=? and registro.registro.per_acad= ? ");
        return this.consultar(consulta, 1, params);
    }

    public Vector AsignaturaPago(String idgrupo, String per, String idest) {
        

        
        String consulta = new String();
        Vector retorno = new Vector();
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idgrupo);
        params.add(per);
        params.add(idest);

        consulta = new String("select id_grupo, as_vis, rpag from registro.registro where id_grupo= ? AND per_acad=?  and id_est= ?");
        


        return this.consultar(consulta, 3, params);

    }

    public Vector AsignaturasPI(String codasig) {
        String consulta = new String();
        Vector retorno = new Vector();
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(codasig);

        consulta = new String("select ID_ASIG,CD_LAB from registro.asignatura where cod_asig= ?  ");
        return this.consultar(consulta, 2, params);
    }

    public Vector Candidatos(String tipo) {
        String consulta = new String();
        Vector retorno = new Vector();
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(tipo);

        consulta = new String("select nroton, nombre, narc from registro.candidat where idcrp = ? order by nroton ");
        return this.consultar(consulta, 3, params);
    }
           
    

    public Vector desptarjeton(String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);

        String consulta = new String();

        consulta = new String( "select  registro.votantesest.vcd,registro.votantesest.vca, "
+ "registro.votantesest.vprg1,registro.votantesest.vprg2,  "
+ "registro.registro.programas.nom_prog, registro.registro.estudiante_enlace_act.nom_est, "
+ "'' as id_dpplan, registro.votantesest.prg1 , registro.votantesest.posg  "
+ "FROM registro.votantesest, registro.registro.estudiante_enlace_act,"
+ "registro.registro.programas, registro.registro.plan_estud  "
+ "WHERE  registro.registro.plan_estud.id_plan = "
+ "registro.registro.estudiante_enlace_act.id_plan and registro.registro.programas.id_prog "
+ "= registro.registro.plan_estud.id_prog   and "
+ "registro.registro.estudiante_enlace_act.id_est= registro.votantesest.idest and id_est = ? ");

        return this.consultar(consulta, 9, params);

    }

    public int ActualizaVotos(String campo, String idEst) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idEst);
        String consulta = new String();
        int retorno = 0;

        consulta = new String("update registro.votantesest set " + campo + " = 1 where idest=  ? ");
        return this.actualizar(consulta, params);
    }
    
    
    

    public int InserVoto(String idcrp, String nro) {
        int retorno = 0;
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idcrp);
        params.add(nro);
        conectar();
        String consulta = new String();
        consulta = " insert into registro.votacionest values (?, ? ,getdate() ) ";

        return this.actualizar(consulta, params);
    }

    public Vector ConsultaVoto(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select  vcd, vca, vprg1,vprg2, posg " + "from  registro.votantesest where idest= ?  ";

        return this.consultar(consulta, 5, params);
    }

    public Vector Icetex(String carnet, String periodo) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select  id_est, estado, estado_cargue, convert(varchar,fecha_cargue, 103) "
                + "from  registro.renovacion_icetex where id_est= ? and periodo= '" + periodo + "' ";

        return this.consultar(consulta, 4, params);
    }

    public Vector Valor_Matricula(String carnet, String periodo) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select convert (int,val_matricula) from Novasoft.dbo.usr_cxc_orden_matri where cod_alum= ? and periodo= '" + periodo + "' ";

        return this.consultar(consulta, 1, params);
    }

    public Vector Renovar_Icetex(String carnet, String periodo) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select  id_est, estado, estado_cargue, convert(varchar,fecha_cargue, 103), linea_cred, tipo_matricula  from  registro.renovacion_icetex where id_est= ? and periodo= '" + periodo + "' ";

        return this.consultar(consulta, 6, params);
    }

    public int Actualizar_Icetex(String carnet, String periodo, String tipo) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("update registro.renovacion_icetex set estado=2, estado_cargue=1, fecha_cargue=getdate(), tipo_matricula= '" + tipo + "' where id_est= ? and periodo= '" + periodo + "'  ");
        return this.actualizar(consulta, params);
    }

//=================================================
    public Vector AsignaEncuestaA(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select count(idg) from registro.contenc where ide = ?  ";

        return this.consultar(consulta, 1, params);
    }

    public Vector ContestaEncuestaA(String carnet) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(carnet);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select count(idg) from registro.contenc where ide = ? and res = 1 ";

        return this.consultar(consulta, 1, params);
    }
    
    public Vector Representantes(String idprog) {
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(idprog);
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select nombres, correo from registro.representantes where id_prog = ?  ";

        return this.consultar(consulta, 2, params);
    }
    
     public int CanalComunica(String idest, String comunica, String propuesta, String contacta, String per) {
        ArrayList<String> params = new ArrayList<String>(2);

        //Agregamos cada uno de los datos al ArrayList

        String consulta = new String();
        consulta = new String("insert into registro.comunicacion  values  ( " + idest + ", '" + comunica + "',  '"
                + propuesta + "', '" + contacta + "', '" + per + "' ) ");
        return this.actualizar(consulta, params);
    }
     
     
     public Vector ConsulCambioCorreo(String doc_est){
         ArrayList<String> params = new ArrayList<String>(1);
         params.add(doc_est);
         String consulta = "select ESTUDIANTE.nom_est, CORREO.correo_viejo, CORREO.correo_nuevo, ESTUDIANTE.emails from registro.cambio_usr_correo CORREO "
                 + "RIGHT JOIN registro.estudiante ESTUDIANTE on CORREO.doc_est=ESTUDIANTE.doc_est where ESTUDIANTE.doc_est=?";
         return this.consultar(consulta, 4, params);
     }
     
     
     public Boolean PersisteToken(String token, String carnet){
         ArrayList<String> params = new ArrayList<String>();
         Vector datos= new Vector();
         Boolean ans=false;
         //Se consulta si existe un token para el usuario
         params.add(carnet);
         datos=this.consultar("select token from registro.dbo.sim_control_ingreso where carne= ?", 1, params);
         if(datos.size()<=0){
             params.clear();
             params.add(carnet);
             params.add(token);
             this.actualizar("insert into registro.dbo.sim_control_ingreso (carne, token) values ( ? , ? )", params);
             ans=true;
         }else{
             params.clear();
             params.add(token);
             params.add(carnet);
             this.actualizar("update registro.dbo.sim_control_ingreso set token = ? where carne= ? ", params);
             ans=true;
         }
         return ans;
     }
     
     public Boolean ConvocadoSaberPro(String carne, String cedula, String email){
         ArrayList<String> params = new ArrayList<String>();
         Vector datos= new Vector();
         Boolean ans=false;
         params.add(carne);
         params.add(cedula);
         params.add(email);
         ans=this.consultar("select id_est from registro.convocados_saberpro where id_est=? or doc_est=? or emails=?", 1, params).size()>0;
         return ans;
     }
    
    // Consulta de Profesor por ID Evento
    public Vector ProfesorPorIDEvento(String id_evento) {
        String consulta = new String();
        Vector retorno = new Vector();
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(id_evento);

        consulta = new String(" select nom_prof from registro.eventos EVENTO, registro.profesor PROF where TRY_CAST(PROF.cc_prof AS INT) is not null and EVENTO.prof1=PROF.cc_prof and EVENTO.id_evento= ?  ");
        return this.consultar(consulta, 1, params);
    }
    
    
    public String ConsultarIdAsig(String cod_asig) {
        String consulta = new String();
        Vector retorno = new Vector();
        ArrayList<String> params = new ArrayList<String>(1);

        //Agregamos cada uno de los datos al ArrayList
        params.add(cod_asig);

        consulta = new String("select id_asig from registro.asignatura where cod_asig= ?");
        Vector res=this.consultar(consulta, 1, params);
        String ans="";
        if(!res.isEmpty()){
            ans=((Vector) res.get(0)).get(0).toString();
        }
        return ans;
    }
}
