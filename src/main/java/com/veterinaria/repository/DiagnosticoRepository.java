package com.veterinaria.repository;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.veterinaria.entity.Diagnostico;

public interface DiagnosticoRepository extends JpaRepository<Diagnostico, Integer>{


	@Query("Select d from Diagnostico d where d.historial.idhistorial = :cod")
	public List<Diagnostico> listaDiagnosticoByHistorial(@PathParam("cod") int cod);
	
}
