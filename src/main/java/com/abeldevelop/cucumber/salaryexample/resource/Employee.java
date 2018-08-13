package com.abeldevelop.cucumber.salaryexample.resource;

import java.time.LocalDate;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Employee {

	private String id;
	
	@NotNull(message="El nombre no puede ser nulo")
    private String nombre;
	
	@NotNull
    private String apellido;
	
	@NotNull
    private String email;
	
	@NotNull
    private String dni;
	
	@NotNull
    private LocalDate cumpleanos;
	
	@NotNull
    private String telefono;
	
	
    private String sexo;
    
    @NotNull
    private String rol;
    
    @NotNull
    private Contract contrato;

    
}
