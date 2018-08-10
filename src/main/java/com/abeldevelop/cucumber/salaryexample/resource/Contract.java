package com.abeldevelop.cucumber.salaryexample.resource;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Contract {

	private String categoria;
	private String tipoContrato;
	private LocalDate fechaInicio;
	private String salario;
	private String moneda;
	private String fechaFin;
	private String cuentaBancaria;
	
}
