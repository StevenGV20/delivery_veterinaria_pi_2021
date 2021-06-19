package com.veterinaria.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.veterinaria.entity.Cita;
import com.veterinaria.entity.Historial;
import com.veterinaria.entity.Servicio;
import com.veterinaria.entity.Usuario;
import com.veterinaria.services.CitaService;
import com.veterinaria.services.DiagnosticoService;
import com.veterinaria.services.ServicioService;
import com.veterinaria.util.Constantes;

@Controller
public class CitaController {
	@Autowired
	private CitaService citaService;

	@Autowired
	private DiagnosticoService diagnosticoService;
	
	@Autowired
	private ServicioService servicioService;
	
	@RequestMapping("/listAll")
	@ResponseBody
	public List<Cita> listAll(){
		List<Cita> lista= citaService.listarCita();
		return lista;
	}
	
	
	@RequestMapping("/buscaCitaById")
	@ResponseBody
	public Optional<Cita> buscaCitaById(int cod){
		Optional<Cita> lista= citaService.listarCitaById(cod);
		return lista;
	}
	
	@RequestMapping("/verCitas")
	public String verMisPedidos(HttpSession session,HttpServletRequest request) {
		Usuario user=(Usuario)session.getAttribute("objUsuario");
		if(user.getIdrol().getIdrol()<2) {
			List<Cita> lista= citaService.listarCitaByCliente(user.getIdusuario());
			request.setAttribute("citas", lista);
		}else if(user.getIdrol().getIdrol()<4) {
			List<Cita> lista=citaService.listarCita();
			request.setAttribute("citas", lista);
		}else if(user.getIdrol().getIdrol()==5) {
			List<Cita> lista=citaService.listarCitaByVeterinari(user.getIdusuario());
			request.setAttribute("citas", lista);
		}
		return "listaCitas";
	}

	
	@RequestMapping(value = "/mantenerCita")
	@ResponseBody
	public Map<String, Object> mantenerCita(Cita obj, HttpSession session){
		Map<String, Object> salida=new HashMap<String, Object>();
		Cita objSalida=null;
		try {
			Usuario cliente=(Usuario) session.getAttribute("objUsuario");
			Date dia=new Date();
			if(obj.getFechaAtencion().before(dia)) {
				salida.put("mensaje", "Solo puede sacar cita con Fecha de Atencion a partir de mañana");
				salida.put("estado", 0);
				return salida;
			}else {
				System.out.println("SERVICIO: "+obj.getServicio().getIdservicio());
				Optional<Servicio> servicio=servicioService.buscarServicioxID(obj.getServicio().getIdservicio());
				Date inicio=new SimpleDateFormat("HH:mm").parse(servicio.get().getHoraInicio().toString());
				Date h_final =new SimpleDateFormat("HH:mm").parse(servicio.get().getHoraFinal().toString());
				if(obj.getHoraAtencion().after(inicio) && obj.getHoraAtencion().before(h_final)) {
					Historial his=diagnosticoService.listaHistorialByMascota(obj.getMascota().getIdmascota()).get();
					System.out.println(his.getIdhistorial());
					obj.setCliente(cliente);
					obj.setHistorial(his);
					obj.setEstado("PENDIENTE");
					objSalida = citaService.mantenerCita(obj);
					salida.put("estado", 1);
					if(objSalida==null)
						salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
					else
						salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);	
				}else {
					salida.put("mensaje", "La cita debe ser a la hora disponible para el servicio");
					salida.put("estado", 0);
					return salida;
				}
			}
		}catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			e.printStackTrace();
		}
		return salida;
	}
	
	@RequestMapping("/asignaVeterinario")
	public String asignaTrabajador(Cita bean,HttpSession session){
		Map<String, Object> salida=new HashMap<String, Object>();
		//Optional<Track> option=service.buscaUsuarioPorId(id);
		try {
			//System.out.println(bean.getPedido().getIdpedido());
			//Usuario usu=(Usuario) session.getAttribute("objUsuario");
			/*Date dia=bean.getFechaAtencion();
			Date hora=bean.getHoraAtencion();
			bean.setFechaAtencion(dia);
			bean.setHoraAtencion(hora);*/
			bean.setEstado("APROBADO");
			citaService.mantenerCita(bean);
			salida.put("mensaje","Se asingo al trabajador correctamente");
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", "Hubo un error en el proceso");
		}finally {
		}
		return "redirect:/verCitas";
	}
	
	
	
}
