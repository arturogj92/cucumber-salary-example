package com.abeldevelop.cucumber.salaryexample.entity;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter

@Entity
@SequenceGenerator(name="CONTRACT_SEQ", sequenceName="contract_seq")
public class ContractEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="CONTRACT_SEQ")
	private Long id;
	private String categoria;
	private String tipoContrato;
	private LocalDate fechaInicio;
	private String salario;
	private String moneda;
	private LocalDate fechaFin;
	private String cuentaBancaria;
}
