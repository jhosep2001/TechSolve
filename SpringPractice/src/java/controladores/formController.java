/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import static java.lang.Integer.parseInt;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import modelos.Conexion;
import modelos.Reserva;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.LinkedCaseInsensitiveMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import sqlClass.Consultas;

/**
 *
 * @author jhosepgranda
 */
@Controller
public class formController {
    
     private JdbcTemplate jdbctem;

    //Conexion con base de datos mysql
    public formController() {
        Conexion conexion = new Conexion();
        this.jdbctem = new JdbcTemplate(conexion.conexion());
    }     
    
    @RequestMapping(value="reservar.htm",method = RequestMethod.GET) //llamada que va a llamar el metodo
    public ModelAndView reservar(){  
        ModelAndView mv = new ModelAndView("nuevaReserva","command",new Reserva());
        
        Consultas consultas = new Consultas();
        String consulta = consultas.consultaVuelos();
        List vuelos = this.jdbctem.queryForList(consulta);
        List vuelosLibres = new ArrayList();
        for (int i = 0; i < vuelos.size(); i++) {
            LinkedCaseInsensitiveMap v = (LinkedCaseInsensitiveMap) vuelos.get(i);
            consulta = consultas.consultaVuelosDisponibles(v.get("código").toString()); //consulta si hay asientos en ese vuelo
            vuelosLibres.add(this.jdbctem.queryForList(consulta));            
        }
        mv.addObject("errors", "");
        mv.addObject("vuelosDis", vuelosLibres);
        return mv;
    }
    /*
    Con este metodo se realiza la reserva de la personas, con validando las condiciones de:
        Mayoria de edad
        No tener el mismo Vuelo O Otro vuelo en la misma fecha de la actual reserva
    */
    @RequestMapping(value="reservar.htm",method = RequestMethod.POST)
    public ModelAndView hacerReserva(Reserva res, ModelMap model){
        model.addAttribute("nombre",res.getNombre());
        model.addAttribute("documento",res.getDocumento());
        model.addAttribute("nacimiento",res.getNacimiento());
        model.addAttribute("codigoVuelo",res.getCodigoVuelo());
        
        Consultas consultas = new Consultas();
        
        //Controlando el formato de la fecha manualmente para ***navegador chrome****
        String[] vector = res.getNacimiento().split("-");
        int año = parseInt(vector[0]);
        int mes = parseInt(vector[1]);
        int dia = parseInt(vector[2]);
        
        //Validando mayoria de edad
        if((LocalDateTime.now().getYear()-año)>18){
            System.out.println("Cumple la edad");
            
            //Validando solo una reserva para la misma fecha y el mismo vuelo
            String fechaVuelo = consultas.consultaVueloPorCodigo(res.getCodigoVuelo());
            String reservas = consultas.consultaFechasReservasDocumento(res.getDocumento());
            
            List fechayCodVuelo = this.jdbctem.queryForList(fechaVuelo);
            List reservasPrevias = this.jdbctem.queryForList(reservas);
            
            LinkedCaseInsensitiveMap actual = (LinkedCaseInsensitiveMap) fechayCodVuelo.get(0);
            String fechaActual = actual.get("fecha").toString();
            String codigoActual = actual.get("código").toString(); 
            
            for (int i = 0; i < reservasPrevias.size(); i++) {
                LinkedCaseInsensitiveMap prev = (LinkedCaseInsensitiveMap) reservasPrevias.get(i);
                String fechaOcupada = prev.get("fecha").toString();
                String codigoOcupado =prev.get("codigoVuelo").toString();
                
                if(fechaOcupada.equals(fechaActual) || codigoOcupado.equals(codigoActual)){
                    ModelAndView mv = new ModelAndView("nuevaReserva","command",new Reserva());
                    mv.addObject("errors", "Ya cuenta con una reserva para la fecha de ese vuelo o para ese mismo codigo de vuelo");
                    return mv;
                }
            }
            
            //Ejecucion de la sentencia sql para insertar nueva reserva
            String insert = consultas.insertarReserva(res.getNombre(), res.getDocumento(), 
                                res.getNacimiento(), res.getCodigoVuelo());
            try {
                 jdbctem.execute(insert);
            } catch (DataAccessException e) {
                ModelAndView mv = new ModelAndView("nuevaReserva","command",new Reserva());
                mv.addObject("errors", "Ha ocurrido un error ingresando la reserva-");
                return mv;
            }
          return new ModelAndView("reservado");
        }
        else{
            ModelAndView mv = new ModelAndView("nuevaReserva","command",new Reserva());
            mv.addObject("errors", "No cumple con la mayoria de edad");
            return mv;
        }
    }
    
    
    
  
}
