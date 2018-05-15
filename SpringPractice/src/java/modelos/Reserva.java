/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 *
 * @author jhosepgranda
 */
public class Reserva {
    
    private int id;
    private String nombre;
    private String documento;
    private String nacimiento;
    private String codigoVuelo;

    public Reserva() {
    }

    public Reserva(String nombre, String documento, String nacimiento, String codigoVuelo) {
        this.nombre = nombre;
        this.documento = documento;
        this.nacimiento = nacimiento;
        this.codigoVuelo = codigoVuelo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(String nacimiento) {
        this.nacimiento = nacimiento;
    }

    public String getCodigoVuelo() {
        return codigoVuelo;
    }

    public void setCodigoVuelo(String codigoVuelo) {
        this.codigoVuelo = codigoVuelo;
    }

}
