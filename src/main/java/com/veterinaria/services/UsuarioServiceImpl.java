package com.veterinaria.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.veterinaria.entity.Distrito;
import com.veterinaria.entity.Rol;
import com.veterinaria.entity.Trabajador;
import com.veterinaria.entity.Usuario;
import com.veterinaria.repository.RolRepository;
import com.veterinaria.repository.UsuarioRepository;

@Service
public class UsuarioServiceImpl implements UsuarioService{

	@Autowired
	private UsuarioRepository repository;
	
	@Autowired
	private RolRepository rolrepository;
	
	@Override
	public List<Usuario> listaUsuarioPorRol(int idrol) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Trabajador mantenerTrabajador(Trabajador bean) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Rol> listaRol() {
		return rolrepository.findAll();
	}

	@Override
	public List<Usuario> listaUsuario() {
		
		return repository.findAll();
	}

	@Override
	public Usuario registraUsuario(Usuario bean) {
		return repository.save(bean);
	}

	@Override
	public Optional<Usuario> buscaUsuarioPorId(int idusuario) {
		
		return repository.findById(idusuario);
	}

	@Override
	public void eliminaUsuario(int idusuario) {
		repository.deleteById(idusuario);
		
	}

	@Override
	public Usuario buscarUsuarioXRol(int idusuario) {
		
		return repository.findById(idusuario).orElse(null);
	}



}
