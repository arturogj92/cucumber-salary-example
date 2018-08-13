package com.abeldevelop.cucumber.salaryexample.resource;

import java.time.LocalDate;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Contract {

	
	@NotNull
	private String categoria;
	
	@NotNull
	private String tipoContrato;
	
	@NotNull
	private LocalDate fechaInicio;
	private LocalDate fechaFin;
	
	private String salario;
	
	@NotNull
	private String moneda;
	
	@NotNull
	private String cuentaBancaria;
	
}
