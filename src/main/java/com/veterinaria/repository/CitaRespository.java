package com.veterinaria.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.veterinaria.entity.Cita;

@Repository
public interface CitaRespository extends JpaRepository<Cita, Integer>{
	@Query("Select c from Cita c where c.cliente.idusuario = :usu")
	public abstract List<Cita> listaCitaByCliente(@Param("usu")int usu);
	
	@Query("Select c from Cita c where c.veterinario.idusuario = :usu")
	public abstract List<Cita> listaCitaByVeterinario(@Param("usu")int usu);
	
	@Query("Select c from Cita c where c.historial.idhistorial = :cod")
	public abstract List<Cita> listaCitasByHistorial(@Param("cod")int cod);
	
	@Query("Select c from Cita c where c.veterinario.idusuario = :vet and c.fechaAtencion = :dia and c.horaAtencion = :hora")
	public abstract List<Cita> listaCitaByDia(@Param("dia")Date dia, @Param("hora")Date hora,@Param("vet")int vet );

	@Query("Select c from Cita c where c.veterinario.idusuario = :vet and c.fechaAtencion = :dia")
	public abstract List<Cita> listaCitaHoy(@Param("dia")Date dia,@Param("vet")int vet );
	
}
