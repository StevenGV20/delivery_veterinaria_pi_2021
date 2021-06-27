package com.veterinaria.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Cita;
import com.veterinaria.entity.Diagnostico;
import com.veterinaria.entity.Historial;
import com.veterinaria.services.CitaService;
import com.veterinaria.services.DiagnosticoService;
import com.veterinaria.util.Constantes;

@Controller
public class HistorialController {

	@Autowired
	private DiagnosticoService serviceDiagnostico; 
	@Autowired
	private CitaService citaService;
	

	@RequestMapping(value = "/listaHistorial")
	@ResponseBody
	public List<Historial> listaHistorial(){
		List<Historial> lista=serviceDiagnostico.listaHistorial();
		return lista;
	}

	@RequestMapping("/listaCitaByHistorial") 
	@ResponseBody
	public List<Cita> listaCitaByHistorial(int cod){
		List<Cita> lista= citaService.listarCitaByHistorial(cod);
		return lista;
	}

	@RequestMapping(value = "/listaHistorialByMascota")
	@ResponseBody
	public Optional<Historial> listaHistorialByMascota(int id){
		Optional<Historial> historial=serviceDiagnostico.listaHistorialByMascota(id);
		return historial;
	}
	
	@RequestMapping(value = "/buscaHistorialById")
	@ResponseBody
	public Optional<Historial> buscaHistorialById(int id){
		Optional<Historial> historial=serviceDiagnostico.buscaHistorialById(id);
		return historial;
	}
	
	@RequestMapping(value = "/listaDiagnosticoByHistorial")
	@ResponseBody
	public List<Diagnostico> listaDiagnosticoByHistorial(int cod){
		List<Diagnostico> lista=serviceDiagnostico.listaByHistorial(cod);
		return lista;
	}
	

	@RequestMapping(value = "/registraDiagnostico")
	@ResponseBody
	public Map<String, Object> registraDiagnostico(Diagnostico bean, HttpSession session){
		Map<String, Object> salida=new HashMap<String, Object>();
		try {
			bean.setFechaRegistro(new Date());
			Diagnostico objSalida=serviceDiagnostico.registraDiagnostico(bean);
			if(objSalida==null)
				salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			else {
				Optional<Historial> historial=buscaHistorialById(objSalida.getHistorial().getIdhistorial());
				salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
				salida.put("historial", historial);
			}
		} catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			e.printStackTrace();
		}
		return salida;
	}
	
	
}
