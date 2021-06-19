package com.veterinaria.entity;

import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "servicio")
public class Servicio {
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column (name = "idservicio")
	private int idservicio;
	private String nombre;
	private double precio;
	private String descripcion;
	private String horario;
	
	//@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "HH:mm")
	@DateTimeFormat(pattern = "HH:mm")
	@Column(name = "horaAtencionInicio")
	private LocalTime horaInicio;

	//@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "HH:mm")
	@JsonFormat(pattern = "HH:mm")
	@Column(name = "horaAtencionFinal")
	private LocalTime horaFinal;
	//private String fecha;
	private String foto;
	
	@JsonIgnoreProperties({"hibernateLazyInitializer","handler"})
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idcategoria")
	private Categoria idcategoria;
	/*
	public String getHorario() {
		horario= "Hora Inicio: "+horaInicio.toString()+" - Hora Final: "+horaFinal.toString();
		return horario;
	}
	/*
	public String getStrhoraInicioFormateada() {
		return FunctionUtil.toHoraString(horaInicio);
	}
	public String getStrhoraFinalFormateada() {
		return FunctionUtil.toHoraString(horaFinal);
	}
	*/
}
