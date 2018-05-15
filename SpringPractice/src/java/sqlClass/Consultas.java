/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sqlClass;

import java.time.LocalDateTime;

/**
 *
 * @author jhosepgranda
 */
public class Consultas {
    
    public String consultaVuelos(){
        
        LocalDateTime dia = LocalDateTime.now();
        String[] vector = dia.toString().split("T");
        String fechaActual = vector[0];
        String consulta = "SELECT * "
                + "FROM VUELOS "
                + "Where fecha > '"+fechaActual+"'";
        return consulta;
    }
    
    public String consultaReservas(String cedula){
        String consulta = "SELECT nombre,documento,nacimiento,codigoVuelo,fecha,descripcion,precio "
                + "FROM `reservas`INNER JOIN `vuelos` "
                + "WHERE documento = '"+cedula+"' AND codigoVuelo = código";
        return consulta;
    }
    
    public String insertarReserva(String nombre, String cedula, String fecha, String codigo){
        String insert = "INSERT INTO `reservas` "
                + "(`id`, `nombre`, `documento`, `nacimiento`, `codigoVuelo`) "
                + "VALUES (NULL, '"+nombre+"', '"+cedula+"', "
                + "'"+fecha+"', '"+codigo+"');";
        return insert;   
    }

    public String consultaVuelosDisponibles(String codVuelo) {
        String consulta = "SELECT * FROM `vuelos` "
                + "WHERE asientos > (SELECT COUNT(documento) "
                + "FROM reservas WHERE `codigoVuelo` = '"+codVuelo+"') "
                + "AND código='"+codVuelo+"'";
        return consulta;
    }
    
    public String consultaVueloPorCodigo(String codVuelo){
        String consulta = "SELECT código,fecha, descripcion From vuelos"
                + " WHERE código='"+codVuelo+"'";
        return consulta;
    }
    
    public String consultaFechasReservasDocumento(String cedula){
        String consulta = "SELECT fecha,codigoVuelo,documento,descripcion "
                + "from vuelos INNER JOIN reservas "
                + " WHERE documento ='"+cedula+"' and código = codigoVuelo";
        return consulta;
    }
}
