package com.veterinaria.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.veterinaria.entity.Servicio;

public interface ServicioRepository extends JpaRepository<Servicio, Integer>{
	@Query("Select s from Servicio s where s.nombre like :nombre")
	public abstract List<Servicio> listaServicioByName(@Param("nombre") String nombre);
	
	@Query("Select s from Servicio s order by s.nombre asc")
	public abstract List<Servicio> listaServicioByNameAaZ();
	
	@Query("Select s from Servicio s order by s.nombre desc")
	public abstract List<Servicio> listaServicioByNameZaA();

	@Query("Select s from Servicio s order by s.precio desc")
	public abstract List<Servicio> listaServicioByPrecioMayor();

	@Query("Select s from Servicio s order by s.precio asc")
	public abstract List<Servicio> listaServicioByPrecioMenor();
	

	@Query("Select s from Servicio s")
	public abstract List<Servicio> listaServicioByPage(Pageable pageable);
}
