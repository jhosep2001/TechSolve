/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author jhosepgranda
 */
public class Conexion {
    
    //Hacinedo uso de jdbc se realiza la conexion con una base de datos mysql local
    public DriverManagerDataSource conexion(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost/vuelos");
        dataSource.setUsername("root");
        dataSource.setPassword("");
        return dataSource;
    }
    
}
