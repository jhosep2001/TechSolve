/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelos.Conexion;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import sqlClass.Consultas;

/**
 *
 * @author jhosepgranda
 */

@Controller
public class firstController {
    
    private JdbcTemplate jdbctem;
    
    public firstController(){
        Conexion conexion = new Conexion();
        this.jdbctem = new JdbcTemplate(conexion.conexion());
    }
    //Nombre del metodo no importa-- controlador es puente entre datos y presentación
    
    @RequestMapping("index.htm") //llamada que va a llamar el metodo
    public ModelAndView home(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("index"); //este es el nombre del archivo JSP que cargaria la vista
        return mv;
    }
    
    @RequestMapping("verVuelos.htm") //llamada que va a llamar el metodo
    public ModelAndView verVuelos(){
        ModelAndView mv = new ModelAndView();
        Consultas consultas = new Consultas();
        String consulta = consultas.consultaVuelos();
        List vuelos = this.jdbctem.queryForList(consulta);

        mv.addObject("datos", vuelos);
        mv.setViewName("verVuelos"); //este es el nombre del archivo JSP que cargaria la vista
        return mv;
    }
    
    @RequestMapping("reservas.htm") //llamada que va a llamar el metodo
    public ModelAndView verReservas(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("reservas"); //este es el nombre del archivo JSP que cargaria la vista
        return  mv;
    }
    
    @RequestMapping(value="reservas.htm", method = RequestMethod.POST)
    public ModelAndView verReservas(HttpServletRequest request, 
            @RequestParam(value="cedula") String cedula, ModelMap model){  
        ModelAndView mv = new ModelAndView();
        Consultas consultas = new Consultas();
        String consulta = consultas.consultaReservas(cedula);
        List reservas = this.jdbctem.queryForList(consulta);
        if(reservas.isEmpty()){
            mv.addObject("datos", null);
        }
        else {
            mv.addObject("datos", reservas);          
        }
        mv.setViewName("reservas");
     
        return mv;
    }
    
    
}
