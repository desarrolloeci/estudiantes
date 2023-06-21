package estudiantes.baseDatos;

import java.sql.*;
import java.net.*;
import java.util.*;
import java.io.*;

/** Esta clase ha sido creada para realizar consultas y actualizaciones
	a la tablas relacionadas con Asignaturas
 */
 public class BdAsignatura extends BaseDatos {

    //configECI cfgEci = new configECI();  
     /** Crea una instancia del objeto base de datos para ser usada por otros
     * objetos. Coloca el numero de registros en -1 y no hay conexion aun :
     * conectado = false
     */
    public BdAsignatura() {
        super () ;
       // this.dbUrl = "jdbc:freetds:sqlserver://10.1.0.237/REGISTRO" ;
    }
       
    public Vector ConsultaAsig(String cod){
        String consulta = new String();     
       
        consulta=new String(" select id_asig, cod_asig, num_ulas_a, val_ele  " +
	"  from   registro.asignatura " +
	"  where cod_asig = '" + cod + "' and tipo_asig = 'N' ");     
        
        return this.consultar(consulta, 4);                 
    }   

    public Vector ConsultaAsigInter(String idEst, String cmax){
        String consulta = new String();     
       
       /* consulta=new String(" select registro.asignatura.id_asig, nom_asig + '-' + cod_asig + " +
        " ' Cred: ' + convert(varchar(2),num_ulas_a), num_ulas_a, num_ulas_b - count(*) " +
	"  from   registro.asignatura, registro.preins_int " +
	"  where registro.asignatura.id_asig *= registro.preins_int.id_asig  and " + cmax + 
        "   >= num_ulas_a + (select sum(num_ulas_a) from registro.preins_int, registro.asignatura " +
        "                      where registro.preins_int.id_asig = registro.asignatura.id_asig and " +
        "                      id_est = " + idEst + " ) and" +
        "  num_ulas_b > 0 and tipo_asig = 'N' " +
        " group by registro.asignatura.id_asig, nom_asig + '-' + cod_asig + ' Cred: ' + " +
        " convert(varchar(2),num_ulas_a), num_ulas_a, num_ulas_b " +
        " having num_ulas_b > count(*) " +
        " order by nom_asig + '-' + cod_asig + ' Cred: ' + convert(varchar(2),num_ulas_a), num_ulas_b" );     
        */

         consulta=new String(" select registro.asignatura.id_asig, nom_asig + '-' + cod_asig + " +
                "   ' Cred: ' + convert(varchar(2),num_ulas_a), num_ulas_a, num_ulas_b - count(*) " +
                "   from   registro.asignatura LEFT OUTER JOIN registro.preins_int ON registro.asignatura.id_asig = registro.preins_int.id_asig " +
                "   where  " + cmax + " >= num_ulas_a + (select sum(num_ulas_a) from registro.preins_int, registro.asignatura " +
                "   where registro.preins_int.id_asig = registro.asignatura.id_asig and " +
                "   id_est =  " + idEst + ") and num_ulas_b > 0 and tipo_asig = 'N' " +
                "   group by registro.asignatura.id_asig, nom_asig + '-' + cod_asig + ' Cred: ' + " +
                "   convert(varchar(2),num_ulas_a), num_ulas_a, num_ulas_b " +
                "   having num_ulas_b > count(*) " +
                "   order by nom_asig + '-' + cod_asig + ' Cred: ' + convert(varchar(2),num_ulas_a), num_ulas_b" );

        return this.consultar(consulta, 4);                 
    }   
    
    public Vector ConsultaAsigInter(){
        String consulta = new String();     
       
       /* consulta=new String(" select registro.asignatura.id_asig, nom_asig + '-' + cod_asig + " +
        " ' Cred: ' + convert(varchar(2),num_ulas_a), num_ulas_a, num_ulas_b - count(*) " +
	"  from   registro.asignatura, registro.preins_int " +
	"  where registro.asignatura.id_asig *= registro.preins_int.id_asig  and " +
        "  num_ulas_b > 0 and tipo_asig = 'N' " +
        " group by registro.asignatura.id_asig, nom_asig + '-' + cod_asig + ' Cred: ' + " +
        " convert(varchar(2),num_ulas_a), num_ulas_a, num_ulas_b " +
        " having num_ulas_b > count(*) " +
        " order by nom_asig + '-' + cod_asig + ' Cred: ' + convert(varchar(2),num_ulas_a), num_ulas_b" );     */
        
         consulta=new String(" select registro.asignatura.id_asig, nom_asig + '-' + cod_asig + " +
                "   ' Cred: ' + convert(varchar(2),num_ulas_a), num_ulas_a, num_ulas_b - count(*) " +
                "   from   registro.asignatura LEFT OUTER JOIN registro.preins_int ON registro.asignatura.id_asig = registro.preins_int.id_asig" +
                "   where  num_ulas_b > 0 and tipo_asig = 'N' " +
                "   group by registro.asignatura.id_asig, nom_asig + '-' + cod_asig + ' Cred: ' + " +
                "   convert(varchar(2),num_ulas_a), num_ulas_a, num_ulas_b " +
                "   having num_ulas_b > count(*) " +
                "   order by nom_asig + '-' + cod_asig + ' Cred: ' + convert(varchar(2),num_ulas_a), num_ulas_b" );
        
        return this.consultar(consulta, 4);                 
    }   

    public Vector ConsultaCuposIntermedio(){
        String consulta = new String();     
       
        consulta=new String(" select registro.asignatura.id_asig, nom_asig, cod_asig, num_ulas_a, num_ulas_b, count(*) " +
            "   from   registro.asignatura LEFT OUTER JOIN registro.preins_int ON registro.asignatura.id_asig = registro.preins_int.id_asig " +
            "   and registro.preins_int.id_pre >= 200000 and tanda = 3" +
            "   where  num_ulas_b > 0 and tipo_asig = 'N'" +
            "   group by registro.asignatura.id_asig, nom_asig, cod_asig, num_ulas_a, num_ulas_b " +
            "   order by nom_asig " );        
        
        return this.consultar(consulta, 6);                 
    }   
    
}
