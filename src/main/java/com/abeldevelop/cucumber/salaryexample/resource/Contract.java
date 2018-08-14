package com.abeldevelop.cucumber.salaryexample.resource;

import java.time.LocalDate;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Contract {

	
	@NotNull
	private String categoria;
	
	@NotNull
	private String tipoContrato;
	
	@NotNull
	private String fechaInicio;
	private String fechaFin;
	
	private String salario;
	
	@NotNull
	private String moneda;
	
	@NotNull
	private String cuentaBancaria;
	
}
