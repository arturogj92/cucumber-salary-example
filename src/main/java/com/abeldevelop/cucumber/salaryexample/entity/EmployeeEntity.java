package com.abeldevelop.cucumber.salaryexample.entity;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

@Entity
public class EmployeeEntity {

	@Id
    @GeneratedValue
	private Long id;
    private String nombre;
    private String apellido;
    private String email;
    private String dni;
    private LocalDate cumpleanos;
    private String telefono;
    private String sexo;
    private String rol;
    
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "contract_id")
    private ContractEntity contrato;
}
