package com.veterinaria.repository;

import java.util.Date;
import java.util.Optional;

import javax.websocket.server.PathParam;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.veterinaria.entity.Historial;

public interface HistorialRepository extends JpaRepository<Historial, Integer>{

	@Modifying
	@Query("Update Historial h set h.fechaModificacion = :fecha where h.idhistorial= :id")
	public abstract void actualizaModificacion(@PathParam("fecha")Date fecha,@PathParam("id")int id);
	

	@Query("Select h from Historial h where h.mascota.idmascota = :cod")
	public Optional<Historial> listaHistorialByMascota(@PathParam("cod") int cod);
	
}
