package com.abeldevelop.cucumber.salaryexample.resource;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Employee {

	private String id;
	
	@NotNull(message="Es necesario introducir el nombre")
	@Size(min=1, message="Es necesario introducir el nombre")
    private String nombre;
	
	@NotNull
	@Size(min=1, message="Es necesario introducir el apellido")
    private String apellido;
	
	@NotNull
	@Size(min=1, message="Es necesario introducir el email")
    private String email;
	
	@NotNull
	@Size(min=1, message="Es necesario introducir el dni")
    private String dni;
	
	@NotNull
	@Size(min=1, message="Es necesario introducir el cumpleanos")
    private String cumpleanos;
	
	@NotNull
	@Size(min=1, message="Es necesario introducir el telefono")
    private String telefono;
	
	
    private String sexo;
    
    @NotNull
	@Size(min=1, message="Es necesario introducir el rol")
    private String rol;
    
    @NotNull
    @Valid
    private Contract contrato;

    
}
