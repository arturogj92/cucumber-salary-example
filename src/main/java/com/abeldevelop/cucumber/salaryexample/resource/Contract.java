package com.abeldevelop.cucumber.salaryexample.resource;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Contract {

	
	@NotNull(message="Es necesario introducir la categoria")
	private String categoria;
	
	@NotNull(message="Es necesario introducir el tipo de contrato")
	private String tipoContrato;
	
	@NotNull(message="Es necesario introducir la fecha de inicio")
	private String fechaInicio;
	
	private String fechaFin;
	
	@NotNull(message="Es necesario introducir el salario")
	private String salario;
	
	private String moneda;
	
	@NotNull(message="Es necesario introducir la cuenta bancaria")
	private String cuentaBancaria;
	
}
