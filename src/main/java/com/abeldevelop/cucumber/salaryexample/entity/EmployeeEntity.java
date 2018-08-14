package com.abeldevelop.cucumber.salaryexample.entity;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.Formula;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

@Entity
@SequenceGenerator(name="EMPLOYEE_SEQ", sequenceName="employee_seq")
public class EmployeeEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="EMPLOYEE_SEQ")
	private Long id;
    private String nombre;
    private String apellido;
    private String email;
    private String dni;
    private String cumpleanos;
    private String telefono;
    private String sexo;
    private String rol;
    
    @OneToOne(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "contract_id")
    private ContractEntity contrato;
    
    @Formula(value = "nombre || apellido")
    private String nombreCompleto;


}
