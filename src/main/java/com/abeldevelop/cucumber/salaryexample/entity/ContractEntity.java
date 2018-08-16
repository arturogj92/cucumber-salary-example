package com.abeldevelop.cucumber.salaryexample.entity;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter

@Entity
@Table(name="Contract")
@SequenceGenerator(name="CONTRACT_SEQ", sequenceName="contract_seq")
public class ContractEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="CONTRACT_SEQ")
	private Long id;
	private String categoria;
	private String tipoContrato;
	private String fechaInicio;
	private Double salario;
	private String moneda;
	private String fechaFin;
	private String cuentaBancaria;
}
