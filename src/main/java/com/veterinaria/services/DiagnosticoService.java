package com.veterinaria.services;

import java.util.List;
import java.util.Optional;

import com.veterinaria.entity.Diagnostico;
import com.veterinaria.entity.Historial;

public interface DiagnosticoService {
	public Diagnostico registraDiagnostico(Diagnostico bean);
	public List<Diagnostico> listaByHistorial(int historial);
	
	
	//HISTORIAL
	public abstract List<Historial> listaHistorial();
	public abstract Optional<Historial> listaHistorialByMascota(int id);
	public abstract Optional<Historial> buscaHistorialById(int id);
	
}
