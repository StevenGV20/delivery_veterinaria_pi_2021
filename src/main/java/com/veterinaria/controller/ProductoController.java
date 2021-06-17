package com.veterinaria.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.veterinaria.entity.Categoria;
import com.veterinaria.entity.Producto;
import com.veterinaria.services.ProductoService;
import com.veterinaria.util.Constantes;

@Controller
public class ProductoController {
	@Autowired
	private ProductoService service;
		
	//METODOS GET DE LISTAS O CONSULTAS 
	@RequestMapping("/listaCategorias")
	@ResponseBody
	public List<Categoria> listaCategoria(){
		List<Categoria> listaCategoria= service.listaCategeoria();
		return listaCategoria;
	}
	
	@RequestMapping("/listaProductos")
	@ResponseBody
	public List<Producto> listaProductos(){
		List<Producto> lista= service.listaProducto();
		return lista;
	}
	
	@RequestMapping("/listaProductosByNombre")
	@ResponseBody
	public List<Producto> listaProductosByNombre(String nombre){
		List<Producto> lista= service.listaProductoByNombre(nombre);
		return lista;
	}
	
	@RequestMapping("/listaProductosByPage")
	@ResponseBody
	public Page<Producto> listaProductosByPage(int page){
		int size=6;
		Pageable pageable=PageRequest.of(page,size);
		return service.listaProductoByPage(pageable);
	}
	
	@RequestMapping("/listaProductosByNombreAaZ")
	@ResponseBody
	public Page<Producto> listaProductosByAaZ(int page){
		int size=6;
		Pageable pageable=PageRequest.of(page,size);
		Page<Producto> lista= service.listaProductoByNombreAaZ(pageable);
		return lista;
	}
	@RequestMapping("/listaProductosByNombreZaA")
	@ResponseBody
	public Page<Producto> listaProductosByNombreZaA(int page){
		int size=6;
		Pageable pageable=PageRequest.of(page,size);
		Page<Producto> lista= service.listaProductoByNombreZaA(pageable);
		return lista;
	}
	@RequestMapping("/listaProductoByPrecioMenorMayor")
	@ResponseBody
	public Page<Producto> listaProductoByPrecioMenorMayor(int page){
		int size=6;
		Pageable pageable=PageRequest.of(page,size);
		Page<Producto> lista= service.listaProductoByPrecioMenorMayor(pageable);
		return lista;
	}
	@RequestMapping("/listaProductoByPrecioMayoraMenor")
	@ResponseBody
	public Page<Producto> listaProductoByPrecioMayoraMenor(int page){
		int size=6;
		Pageable pageable=PageRequest.of(page,size);
		Page<Producto> lista= service.listaProductoByPrecioMayoraMenor(pageable);
		return lista;
	}
	
	
	@RequestMapping("/buscaProductoXID")
	@ResponseBody
	public Optional<Producto> buscaProductoXID(int id){
		Optional<Producto> producto= service.buscaProductoPorId(id);
		return producto;
	}
	
	//METODOS PARA CARRITO
	@RequestMapping("/detalleProductoXID")
	@ResponseBody
	public String detalleProductoXID(int id,RedirectAttributes salida){
		Optional<Producto> producto= service.buscaProductoPorId(id);
		salida.addFlashAttribute("producto", producto);
		return "crudProducto";
	}
	
	//METODOS PARA CRUD
	@PostMapping("/registraFoto")
	public String guardarImagenes(@RequestParam(name = "foto",required= false)
		MultipartFile foto, Producto obj,RedirectAttributes flash) {
		System.out.println("Aqui esta");
		if(!foto.isEmpty()) {
			
			try {
				System.out.println("Parte 2");
				service.saveFile(foto);
				obj.setFoto1(foto.getOriginalFilename());
				System.out.println("leyo la foto");
			} catch (Exception e) {
				e.printStackTrace();
			}
			service.mantenerProducto(obj);
			flash.addFlashAttribute("success","Foto subida");
			return "redirect:/";
		}
		else {
			return "crudProductos";
		}
	}
	/*
	@RequestMapping("/registrarProducto")
	@ResponseBody
	public Map<String, Object> registra(Producto obj){
		Map<String, Object> salida=new HashMap<String,Object>();
		Producto objSalida=null;
		try {
			objSalida=service.mantenerProducto(obj);
			if(objSalida == null) {
				salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_REG_EXITOSO);
			}
		} catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
		}finally {
			List<Producto> lista=service.listaProducto();
			salida.put("lista", lista);
		}
		return salida;		
	}*/
	
	@RequestMapping("/registrarProducto")
	@ResponseBody
	public Map<String, Object>  registra(/*@RequestParam("files") List<MultipartFile> files,*/ Producto obj, RedirectAttributes flash){
		Map<String, Object> salida=new HashMap<String,Object>();
		//Producto objSalida=null;
		try {
			/*
			if(files.size()!=0) {
				service.saveFotos(files);
				int c=0;
				for(MultipartFile file:files) {
					
					if(!(file.getBytes()==null)) {
						System.out.println("FILE: "+file.getOriginalFilename());
						if(c==0) obj.setFoto1(file.getOriginalFilename());
						else if(c==1)obj.setFoto2(file.getOriginalFilename());
						else if(c==2) obj.setFoto3(file.getOriginalFilename());						
					}else {
						if(c==0) obj.setFoto1("image-not-found.png");
						else if(c==1)obj.setFoto2("image-not-found.png");
						else if(c==2) obj.setFoto3("image-not-found.png");
					}
					System.out.println(c);
					c++;
				}
				//if(!files.get(0).isEmpty()) obj.setFoto1(files.get(0).getOriginalFilename());
				//if(!file.)
			}
			*/
			Optional<Producto> option = service.buscaProductoPorId(obj.getIdproducto());
			service.mantenerProducto(obj);
			if(!option.isPresent())
				salida.put("data", obj);
			else 
				salida.put("data", option);
			//return "redirect:/verCrudProductos";	
			
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("mensaje", Constantes.MENSAJE_REG_ERROR);
			//return "redirect:/verCrudProductos";
		}
		return salida;
	}
	
	@RequestMapping("/actualizaProducto")
	@ResponseBody
	public Map<String, Object> actualizaProducto(Producto bean){
		Map<String, Object> salida=new HashMap<String, Object>();
		Optional<Producto> option = service.buscaProductoPorId(bean.getIdproducto());
		try {
			if(option.isPresent()) {
				Producto objSalida= service.mantenerProducto(bean);
				if(objSalida == null) {
					salida.put("mensaje", Constantes.MENSAJE_ACT_ERROR);
				}else {
					salida.put("mensaje", Constantes.MENSAJE_ACT_EXITOSO);
				}
			}else {
				salida.put("mensaje", Constantes.MENSAJE_ACT_NO_EXISTE_ID);
			}			
		} catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_ACT_ERROR);
		}finally {
			List<Producto> lista = service.listaProducto();
			salida.put("lista", lista);
		}
		return salida;
	}
	
	@RequestMapping("/eliminaProducto")
	@ResponseBody
	public Map<String, Object> eliminaProducto(int id){
		Map<String, Object> salida=new HashMap<String, Object>();
		Optional<Producto> option=service.buscaProductoPorId(id);
		try {
			if(option.isPresent()) {
				service.eliminaProducto(id);
				salida.put("mensaje", Constantes.MENSAJE_ELI_EXITOSO);
			}else {
				salida.put("mensaje", Constantes.MENSAJE_ELI_NO_EXISTE_ID);
			}
		} catch (Exception e) {
			salida.put("mensaje", Constantes.MENSAJE_ELI_ERROR);
		}finally {
			List<Producto> lista=service.listaProducto();
			salida.put("lista", lista);
		}
		return salida;
	}
	

	
	
	
	
	
}
