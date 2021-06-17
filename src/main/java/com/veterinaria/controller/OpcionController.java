package com.veterinaria.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.veterinaria.entity.Producto;
import com.veterinaria.entity.Servicio;
import com.veterinaria.services.ProductoService;
import com.veterinaria.services.ServicioService;

@Controller
@SessionAttributes({"LISTAPRODUCTOS","LISTASERVICIOS"})
public class OpcionController {
	
	@Autowired
	private ProductoService productoService;
	
	@Autowired
	private ServicioService servicioService;
	
	
	//VISTA CLIENTE
	/*@RequestMapping("/index")
	public String index() {
		return "index";
	}
	*/
	@RequestMapping("/")
	public String verInicio(ModelMap flash) {
		//int size=6;
		//int page=0;
		//Pageable pageable=PageRequest.of(page,size);
		/*List<Producto> productos= productoService.listaProductoByPage(pageable);
		List<Servicio> servicios= servicioService.listaServiciosByPage(pageable);
		flash.addAttribute("LISTAPRODUCTOS", productos);
		flash.addAttribute("LISTASERVICIOS", servicios);*/
		return "index";
	}
	
	//VISTA ADMINISTRADOR
	
	@RequestMapping("/verCrudClientes")
	public String verCliente() {
		return "crudClientes";
	}
	
	@RequestMapping("/verCarrito")
	public String verCarrito() {
		return "carritoCompras";
	}
	
	@RequestMapping("/verTracking")
	public String verTracking() {
		return "tracking";
	}

		
	@RequestMapping("/verRegistroCliente")
	public String verRegistroCliente() {
		return "registrarCliente";
	}
	
	@RequestMapping("/verLogin")
	public String verLogin() {
		return "login";
	}
	
	@RequestMapping("/verTablesConsultas")
	public String verTablesConsultas() {
		return "tablesConsultas";
	}
	
	@RequestMapping("/verTablesIncidencias")
	public String verTablesIncidencias() {
		return "tablesIncidencias";
	}
	
	@RequestMapping("/verTablesVendedor")
	public String verTablesVendedor() {
		return "tablesVendedor";
	}
//-----------------MIREEEEEEEEN ESTOOOOO---------------
	@RequestMapping("/verCrudMascotas")
	public String verCrudMascotas() {
		return "crudMascotas";
	}
	
	@RequestMapping("/verCrudProductos")
	public String verCrudProductos() {
		return "crudProductos";
	}
	
	@RequestMapping("/verDetalleProducto")
	public String verDetalleProducto(int id,HttpServletRequest request) {
		Producto obj=productoService.detalleProductoXID(id);
		request.setAttribute("objProducto", obj);
		return "detalleProducto";
	}
	
	@RequestMapping("/verListaProductos")
	public String verListaProductos(ModelMap flash) {
		List<Producto> productos= productoService.listaProducto();
		flash.addAttribute("LISTAPRODUCTOS", productos);
		return "listaProductos";
	}
	
	@RequestMapping("/verCrudServicios")
	public String verCrudServicios() {
		return "crudServicios";
	}
	
	@RequestMapping("/verListaServicios")
	public String verListaServicios(ModelMap flash) {
		List<Servicio> servicios= servicioService.listaServicios();
		flash.addAttribute("LISTASERVICIOS", servicios);
		return "listaServicios";
	}
	
	@RequestMapping("/verDetalleServicio")
	public String verDetalleServicio(int id, HttpServletRequest request) {
		Servicio objServicio=servicioService.detalleServicioXID(id);
		request.setAttribute("objServicio", objServicio);
		return "detalleServicio";
	}
	
	@RequestMapping("/verCrudTrabajadores")
	public String listaTrabajadores() {
		return "crudTrabajadores";
	}
	
	@RequestMapping("/verInicioAdmin")
	public String verInicioAdmin() {
		return "inicioAdmin";
	}
	
	@RequestMapping("/verRegistroMascotas")
	public String verRegistroMascotas() {
		return "registrarMascota";
	}
	
	@RequestMapping("/verRegistroDeCliente")
	public String verRegistroDeCliente() {
		return "registroCliente";
	}
	
	@RequestMapping("/verRegistroConsultas")
	public String verRegistroConsultas() {	return "registroConsultas";	}
	
	@RequestMapping("/verRegistroIncidencia")
	public String verRegistroIncidencia() {	return "registroIncidencia";	}
	
	@RequestMapping("/verRegistroPedido")
	public String verRegistroPedido() {	return "registroPedido";	}
}
