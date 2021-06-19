package com.veterinaria.services;

import java.util.List;
import java.util.Optional;

import com.veterinaria.entity.Cita;

public interface CitaService {

	public abstract List<Cita> listarCita();
	public abstract List<Cita> listarCitaByUsuario(int cod_usu);
	public abstract List<Cita> listarCitaByCliente(int cod_usu);
	public abstract List<Cita> listarCitaByVeterinari(int cod_usu);
	public abstract List<Cita> listarCitaByEstado(String estado);
	public abstract List<Cita> listarCitaByHistorial(int cod);
	public abstract Optional<Cita> listarCitaById(int cod);
	public abstract Cita mantenerCita(Cita bean);
	public abstract void eliminaCita(int codigo);
	
}
