package com.abeldevelop.cucumber.salaryexample.resource;

import java.time.LocalDate;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Contract {

	
	@NotNull
	@Size(min=1, message="Es necesario introducir la categoria")
	private String categoria;
	
	@NotNull
	@Size(min=1, message="Es necesario introducir el tipo de contrato")
	private String tipoContrato;
	
	@NotNull
	@Size(min=1, message="Es necesario introducir la fecha de inicio")
	private String fechaInicio;
	
	private String fechaFin;
	
	@NotNull
	@Size(min=1, message="Es necesario introducir el salario")
	private String salario;
	
	private String moneda;
	
	@NotNull
	@Size(min=1, message="Es necesario introducir la cuenta bancaria")
	private String cuentaBancaria;
	
}
