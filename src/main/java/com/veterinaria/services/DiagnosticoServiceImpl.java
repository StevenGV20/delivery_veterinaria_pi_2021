package com.veterinaria.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.Diagnostico;
import com.veterinaria.entity.Historial;
import com.veterinaria.repository.DiagnosticoRepository;
import com.veterinaria.repository.HistorialRepository;

@Service
public class DiagnosticoServiceImpl implements DiagnosticoService{

	@Autowired
	private DiagnosticoRepository repository;
	
	@Autowired
	private HistorialRepository historialRepository;
	
	@Override
	public Diagnostico registraDiagnostico(Diagnostico bean) {
		return repository.save(bean);
	}

	@Override
	public List<Historial> listaHistorial() {
		return historialRepository.findAll();
	}

	@Override
	public Optional<Historial> listaHistorialByMascota(int id) {
		return historialRepository.listaHistorialByMascota(id);
	}

	@Override
	public Optional<Historial> buscaHistorialById(int id) {
		return historialRepository.findById(id);
	}

	@Override
	public List<Diagnostico> listaByHistorial(int historial) {
		return repository.listaDiagnosticoByHistorial(historial);
	}

}
