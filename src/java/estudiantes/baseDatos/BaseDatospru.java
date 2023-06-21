package estudiantes.baseDatos;

import java.io.*;
import java.util.Vector;
import java.sql.*;
import java.net.*;
//import intraeci.configuracion.configECI;

/** Esta clase es utilizada como la clase principal dentro del paquete. De
 * esta clase herendan todas la mayor�a de las otras clases incluidas en
 * el paquete. Esta clase establece los m�todos b�sicos a ser utiizados en
 * una conexi�n en la base de datos, tales como el de establecer la conexi�n,
 * establecer el usuario, la clave, etc ...
 */
public class BaseDatospru {

     /** Numero de registros leidos, insertados, etc, bien sea en una consulta
     * una insercion, un update u otro tipo de operaci�n para la cual pueda
     * se �til el conteo de registros.
     */
    protected 	int           numRegs;
    
    /** Indica si se encuenta una conexi�n activa a la base de datos */
    protected 	boolean       conectado;

    /** El usuario que se conecta a la base de datos */
    protected 	String        usuario;

    /** La clave del usuario mencionado anteriormente para conectarse con la base
        de datos */
    protected 	String        clave;

    /** Direcci�n url para la fuente de los datos. Para este caso espec�fico la
        fuente utiliza el driver odbc cuyo nombre es ecisis. Si no existe una
        fuente odbc con este nombre, la conexi�n a la base de datos no funcionara
        o si este se configura de forma equivocada, lo mismo suceder� */
        
    protected 	String dbUrl = "jdbc:jtds:sqlserver://10.1.1.40/REGISTRO";
    //protected 	String dbUrl = "jdbc:jtds:sqlserver://10.1.3.128/REGISTRO";
    /**
    	Este atributo es el encargado de mantener la informaci�n de la 
    	conexi�n que se establece con la base de datos. Una misma conexi�n
    	puede ser usada por varias instancias de un applet para obtener
    	informaci�n o actualizar la base de datos. En el caso del
    	applet que maneja las hojas de vida, el servidor rmi establece
    	una conexi�n al levantarse que se mantiene vigente durante todo
    	el tiempo, y por medio de la cual todos los applets hacen sus
    	consultas y actualizaciones.
    */
    protected	Connection    conexion = null;
    
    /**
    	El nombre del driver de conexi�n, que se encuentra dentro
    	de un paquete suministrado por el fabricante. El nombre
    	del paquete es Sprinta2000.jar y si es instalado como
    	una extensi�n del JRE, se debe encontrar en el directorio
    	ext de el servidor, dentro de la jerarqu�a de directorios
    	en la que se encuentra la m�quina virtual.
    */
    //private String      driver = "com.internetcds.jdbc.tds.Driver" ;
    private String      driver = "net.sourceforge.jtds.jdbc.Driver" ;
    /**
    	En este atributo de clase se almacenan todos los mensajes
    	cuando se ejecutan acciones sobre la base de datos. Es importante
    	tener en cuenta que s�lo el �ltimo mensaje est� disponible,
    	porque con cada nueva acci�n, el mensaje es actualizado.
    */
    protected 	String        mensaje;
    
    /** Crea una instancia del objeto base de datos para ser usada por otros
     * objetos. Coloca el numero de registros en -1 y no hay conexion aun :
     * conectado = false
     */
    public BaseDatospru () {
        numRegs = -1;
        conectado = false;
    }
    
    /** Establece el usuario con el que se desea trabajar al realizar la conexion
     * a la base de datos, esto se hace normalmente antes de utilizar el m�todo
     * conectar de esta misma clase.
     * @param usuarioExt Es el usuario externo que se quiere establecer para
     * este objeto. El usuario externo es un par�metro de
     * entrada y es establecido al objeto BaseDatos. Con
     * este usuario se realizar�n las conexiones posteriores
     * a menos que se cambie el usuario expl�citamente.
     */
    public void setUsuario (String usuarioExt) {
        usuario = new String(usuarioExt);
    }

    /** Establece la clave con la que se desea trabajar al realizar la conexi�n
     * a la base de datos, esto se hace normalmente antes de utilizar el m�todo
     * conectar de esta misma clase. La clave est� ligada al usuario utilizado.
     * @param claveExt Este par�metro es de entrada y establece la clave
     * con la que se van a realizar las conexiones para un
     * usuario tambi�n establecido mediante el m�todo
     * setUsuario de esta misma clase o en el m�todo
     * constructor.
     */
    public void setClave (String claveExt) {
        clave = new String(claveExt);
    }
    
    /** Establece una conexi�n para la base de datos utilizando el usuario y
     * la clave dadas por el programador que es usuario de esta clase. Para
     * establecer el usuario se utiliza el m�todo setUsuario y para establecer
     * la clave se utiliza el m�todo setClave.
     * @return Cuando la conexi�n es establecida este m�todo retorna
     * el valor <B><I>true</I></B>. De lo contrario retorna
     * <B><I>false</I></B>.
     */
    public boolean conectar () {
        try {
            Class.forName(driver);
            conexion = DriverManager.getConnection(dbUrl, usuario, clave);
            conectado = true;
            return true;
        } catch (ClassNotFoundException e) {
            mensaje = new String ("No encontro el driver - " + e.getMessage());
            System.out.println("No encontro el driver - " + e.getMessage());
            return false;
        } catch (Exception e) {
            mensaje = new String (e.getMessage());
            System.out.println(mensaje);
            return false;
        }
    }

    /** Establece una conexi�n con la base de datos utilizando el usuario y
     * la clave dadas por el programador que es usuario de esta clase en los
     * par�metros del m�todo.
     * @param usuarioExt Define el usuario con el cual se realizar� la conexi�n
     * a la base de datos.
     * @param claveExt Define la clave para el usuario, por medio de la cual
     * se intentar� realizar la conexi�n con la base de datos.
     * Si el usuario y la clave no coinciden con la
     * informaci�n existente en la base de datos, la realizaci�n
     * de la conexi�n fallar�.
     * @return Si la conexi�n con la base de datos se puede establecer
     * este m�todo retorna <B><I>true</I></B>, de lo contrario
     * retorna el valor<B><I>false</I></B>.
     */
    public boolean conectar (String usuarioExt, String claveExt) {
        try {
            Class.forName(driver);
            conexion = DriverManager.getConnection(dbUrl, usuarioExt, claveExt);
            conectado = true;
            return conectado;
        } catch (Exception e) {
            mensaje = new String ("No encontro el driver - " + e.getMessage());
            System.out.println("No encontro el driver - " + e.getMessage());
            return false;
        }
    }

	/** Este m�todo sirve para obtener el mensaje apropiado, de acuerdo
     * con la �ltima acci�n que se haya realizado sobre la base
     * de datos.
     * @return El valor retornado coincide con el mensaje dejado
     * por la �ltima operaci�n que se haya realizado sobre
     * la base de datos, este mensaje puede ser de error
     * o de �xito.
     */
    public String getMensaje() {
        return mensaje;
    }

    /** Termina la conexi�n con la base de datos si esta se encontraba activa.
     * Si alg�n error llegase a ocurrir mediante el m�todo getMensaje se
     * podr� obtener informaci�n.
     * @return Este m�todo retorna <B><I>true</I></B> en caso de que
     * la desconexi�n con la base de datos se haya llevado
     * a cabo de forma correcta. De lo contrario se retorna
     * <B><I>false</I></B>
     *
     */
    public boolean desconectar() {
        try {
            conexion.close();
            conectado = false;
            return true;
        } catch (Exception e) {
            mensaje = e.getMessage();
            return false;
        }
    }

    /** Obtiene el n�mero de registros que fueron seleccionados en
     * una consulta, o bien el n�mero de registros que se actualizaron.
     * Al igual que el mensaje, este n�mero es sobreescrito con cada
     * operaci�n que se realiza.
     * @return Retorna el n�mero de registros afectados por la �ltima
     * operaci�n que se haya realizado sobre la base de datos.
     */ 
    public int getNumRegs() {
        return numRegs;
    }

	/** Establece una conexi�n a la base de datos, utilizando una conexi�n
     * hecha anteriormente por otro objeto. Si la conexion es inv�lida,
     * se pueden producir errores al ejecutar los llamados de los m�todos
     * que utilicen esta conexi�n.
     * @param c El par�metro que se pasa es de entrada y debe contener
     * una conexi�n v�lida realizada anteriormente por medio
     * de los m�todos <B><I>conectar</I></B> de esta misma
     * clase.
     */
	public void setConexion (Connection c)
	{
		conexion = c;
		conectado = true;
	}

	/** Teniendo establecida una conexi�n por medio de los m�todos apropiados
         * existentes en esta clase, se puede obtener esta conexi�n con el objeto
         * de utilizarla con otros m�todos u otros objetos.
         * @return Retorna la conexi�n que posee este objeto.
         */
	public Connection getConexion ()
	{
		return conexion;
	}

	/** Este m�todo retorna el usuario con el que se ha intentado
         * conectar a la base de datos, bien sea que esta conexi�n haya
         * sido exitosa o no. El atributo de clase es establecido
         * mediante el m�todo constructor de esta clase que recibe como
         * par�metros el usuario y la clave, o mediante el m�todo
         * setUsuario.
         * @return Se retorna el usuario que ha sido establecido para este
         * objeto y que se encuentra vigente.
         */
	public String getUsuario ()
	{
		return usuario;
	}

	/** Este m�todo retorna la clave con la que se ha intentado
         * conectar a la base de datos, bien sea que esta conexi�n haya
         * sido exitosa o no. El atributo de clase es establecido
         * mediante el m�todo constructor de esta clase que recibe como
         * par�metros el usuario y la clave, o mediante el m�todo
         * setClave.
         * @return Se retorna la clave que ha sido establecida para este
         * objeto y que se encuentra vigente.
         */
	public String getClave ()
	{
		return clave;
	}


  public String getMensajeBD() {
    return mensaje;
  }

  public boolean desconectarBD() {
    try {
      conexion.close();
      conectado = false;
      return true;
    } catch (Exception e) {
      mensaje = new String(e.getMessage());
      return false;
    }
  }
  
   public Vector consultar(String consulta, int nroCampos) {
    ResultSet resCons;
    int	cont ;
    String valor, nd = new String("No disponible") ;
    Vector lista = new Vector() ;
    //Vector BdGeneral = new Vector() ;
    PreparedStatement sentenciaConsulta;
     
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return lista ;
    }
    try {     
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
      resCons = sentenciaConsulta.executeQuery();
      try {
        while (resCons.next()) {
        Vector  obj = new Vector() ; 
          for (cont = 1; cont <= nroCampos; cont++) {
                valor = resCons.getString(cont) ;
                if (resCons.wasNull())
                        obj.addElement(nd) ;		  		
                else
                        obj.addElement(valor) ;		  		
          }
          lista.addElement(obj) ;
        }
        resCons.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + 
    e.getMessage());
      }  
    } catch (Exception e) {
      mensaje = e.getMessage();
    }
    return lista;
  }
  
    public String consultarborrar(String consulta, int nroCampos) {
    ResultSet resCons;
    int	cont ;
    String valor, nd = new String("No disponible") ;
    Vector lista = new Vector() ;
    //Vector BdGeneral = new Vector() ;
    PreparedStatement sentenciaConsulta;
     
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return mensaje;
    }
    try {     
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
      resCons = sentenciaConsulta.executeQuery();
      try {
        while (resCons.next()) {
        Vector  obj = new Vector() ; 
          for (cont = 1; cont <= nroCampos; cont++) {
                valor = resCons.getString(cont) ;
                if (resCons.wasNull())
                        obj.addElement(nd) ;		  		
                else
                        obj.addElement(valor) ;		  		
          }
          lista.addElement(obj) ;
        }
        resCons.close() ;
 	    sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + 
        e.getMessage());
      }  
    } catch (Exception e) {
      mensaje = new String("error " + e.getMessage());
    }
    return mensaje;
  } 
  
  public int actualizar(String consulta) {
     int resCons;
     //BdGeneral obj ;
     PreparedStatement sentenciaConsulta;

     if (!conectado) {
       mensaje = new String ("No hay conexion con la base de datos");
       return 10 ;
     }
     try {     
       sentenciaConsulta = conexion.prepareStatement(consulta) ;	
       resCons = sentenciaConsulta.executeUpdate();
       sentenciaConsulta.close();
     } catch (Exception e) {
       mensaje = e.getMessage();
       return 0 ;
     }
     return resCons ;
  }

    public String sigSecuencia(String entidad) {
    ResultSet resCons;
    PreparedStatement sentenciaConsulta;
    String consulta, secuencia = new String("")  ;
     
    if (!conectado) {
      mensaje = new String ("No hay conexion con la base de datos");
      return "-1" ;
    }
    try {     
      consulta = new String ("select convert(varchar(10), sig_sec) from registro.secuencias where nombre = '" + entidad + "' ") ;
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
      resCons = sentenciaConsulta.executeQuery();
      try {
        while (resCons.next()) 
	    secuencia = resCons.getString(1) ;
        resCons.close() ;
 	sentenciaConsulta.close();
      } catch (SQLException e) { 
      	mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente " + e.getMessage());
        return "-1" ;
      }  
    } catch (Exception e) {
      mensaje = e.getMessage();
      return "-1" ;
    }
    consulta = new String("update registro.secuencias set sig_sec = sig_sec + incr where nombre = '" + entidad + "' ") ; 
    try {     
      sentenciaConsulta = conexion.prepareStatement(consulta) ;	
      sentenciaConsulta.executeUpdate();
      sentenciaConsulta.close();
    } catch (Exception e) {
      mensaje = e.getMessage();
      return "-1" ;
    }
    return secuencia ;
  } 
  
}