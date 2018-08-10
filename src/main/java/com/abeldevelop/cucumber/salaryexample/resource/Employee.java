package com.abeldevelop.cucumber.salaryexample.resource;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Employee {

	private String id;
    private String nombre;
    private String apellido;
    private String email;
    private String dni;
    private LocalDate cumpleanos;
    private String telefono;
    private String sexo;
    private String rol;
    private Contract contrato;
    
}
