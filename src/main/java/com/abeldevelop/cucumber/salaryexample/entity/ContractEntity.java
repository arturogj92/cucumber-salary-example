package com.abeldevelop.cucumber.salaryexample.entity;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter

@Entity
public class ContractEntity {

	@Id
    @GeneratedValue
	private Long id;
	private String categoria;
	private String tipoContrato;
	private LocalDate fechaInicio;
	private String salario;
	private String moneda;
	private String fechaFin;
	private String cuentaBancaria;
}
