package com.veterinaria.entity;

import java.io.Serializable;

import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "detalle_pedido_productos")
public class Seleccion implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idpedido;
	private int idproducto;
	private int cantidad;
	private double precio;
	private double precioTotal;
	private double importe;
	private double descuento;
	private double igv;
	private double montoTotal;
}
