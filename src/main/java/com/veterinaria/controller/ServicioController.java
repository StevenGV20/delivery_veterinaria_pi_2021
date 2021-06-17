package com.veterinaria.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.veterinaria.entity.Servicio;
import com.veterinaria.services.ServicioService;
import com.veterinaria.util.Constantes;

@Controller
public class ServicioController {
	
	@Autowired
	private ServicioService service;
	
	//METODOS DE LISTAS
	@RequestMapping("/listaServicios")
	@ResponseBody
	public List<Servicio> listaServicios(){
		List<Servicio> lista= service.listaServicios();
		return lista;
	}
	
	@RequestMapping("/listaServiciosByPage")
	@ResponseBody
	public List<Servicio> listaServiciosByPage(int page){
		int size=6;
		Pageable pageable=PageRequest.of(page,size);
		List<Servicio> lista= service.listaServiciosByPage(pageable);
		return lista;
	}
	
	@RequestMapping("/listaServiciosByName")
	@ResponseBody
	public List<Servicio> listaServiciosByName(String nombre){
		List<Servicio> lista= service.listaServicioByNombre(nombre);
		return lista;
	}
	@RequestMapping("/listaServiciosByNameAZ")
	@ResponseBody
	public List<Servicio> listaServiciosByNameAZ(){
		List<Servicio> lista= service.listaServicioByAaZ();
		return lista;
	}
	@RequestMapping("/listaServiciosByNameZA")
	@ResponseBody
	public List<Servicio> listaServiciosByNameZA(){
		List<Servicio> lista= service.listaServicioByZaA();
		return lista;
	}
	@RequestMapping("/listaServiciosByPrecioMenor")
	@ResponseBody
	public List<Servicio> listaServiciosByPrecioMenor(){
		List<Servicio> lista= service.listaServicioByPrecioMenor();
		return lista;
	}
	@RequestMapping("/listaServiciosByPrecioMayor")
	@ResponseBody
	public List<Servicio> listaServiciosByPrecioMayor(){
		List<Servicio> lista= service.listaServicioByPrecioMayor();
		return lista;
	}
	
	
	
	@RequestMapping("/buscaServicioXID")
	@ResponseBody
	public Optional<Servicio> buscaServicioXID(int id){
		Optional<Servicio> servicio= service.buscarServicioxID(id);
		return servicio;
	}
	
	@PostMapping("/mantenerServicio")
	public String mantenerServicio(@RequestParam(name = "file",required= false)
		MultipartFile foto, Servicio obj,RedirectAttributes flash) {
		//Map<String, Object> salida=new HashMap<String, Object>();
		System.out.println("Aqui esta");
		if(!foto.isEmpty()) {
			
			try {
				System.out.println("Parte 2");
				service.guardarFotoServicio(foto);
				obj.setFoto(foto.getOriginalFilename());
				System.out.println("leyo la foto");
			} catch (Exception e) {
				e.printStackTrace();
			}
			Optional<Servicio> option = service.buscarServicioxID(obj.getIdservicio());
			service.mantenerServicio(obj);
			//flash.addFlashAttribute("CORRECTO","Foto subida");
			if(!option.isPresent())
				flash.addFlashAttribute("CORRECTO","Se registro correctamente");
			else 
				flash.addFlashAttribute("CORRECTO","Se actualizo correctamente");
			return "redirect:/verCrudServicios";
		}
		else {
			flash.addFlashAttribute("ERROR",Constantes.MENSAJE_REG_ERROR);
			return "redirect:/verCrudServicios";
		}
	}
	
	@RequestMapping("/eliminaServicio")
	@ResponseBody
	public Map<String, Object> eliminaServicio(int id){
		System.out.println("elcodigo es: "+id);
		Map<String, Object> salida=new HashMap<String, Object>();
		Optional<Servicio> option=service.buscarServicioxID(id);
		try {
			if(option.isPresent()) {
				service.eliminaServicio(id);
				salida.put("mensaje", Constantes.MENSAJE_ELI_EXITOSO);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_ELI_NO_EXISTE_ID);
			}
		} catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);
		}finally {
			List<Servicio> lista=service.listaServicios();
			salida.put("lista", lista);
		}
		return salida;
	}
}
