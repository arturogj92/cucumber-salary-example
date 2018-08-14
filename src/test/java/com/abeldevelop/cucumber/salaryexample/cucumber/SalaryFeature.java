package com.abeldevelop.cucumber.salaryexample.cucumber;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.time.ZoneId;
import java.util.Date;

import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import com.abeldevelop.cucumber.salaryexample.resource.Contract;
import com.abeldevelop.cucumber.salaryexample.resource.Employee;
import com.fasterxml.jackson.databind.ObjectMapper;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class SalaryFeature extends SpringIntegrationTest {

	private Employee employee;
	private String campoBusqueda;
	private String valor1Busqueda;
	private String valor2Busqueda;
	
	@Given("^los datos de entrada (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*)$")
    public void crearEmployee(String nombre, String apellido, String dni, String cumpleanos, String email, String telefono, String sexo, String rol, String categoria, String tipoContrato, String fechaInicio, String fechaFin, String salario, String moneda, String cuentaBancaria) {
		employee = new Employee();
		employee.setNombre(nombre);
		employee.setApellido(apellido);
		employee.setEmail(email);
		employee.setDni(dni);
		employee.setCumpleanos(cumpleanos);
		employee.setTelefono(telefono);
		employee.setSexo(sexo);
		employee.setRol(rol);
		employee.setContrato(new Contract());
		employee.getContrato().setCategoria(categoria);
		employee.getContrato().setTipoContrato(tipoContrato);
		employee.getContrato().setFechaInicio(fechaInicio);
		employee.getContrato().setFechaFin(fechaFin);
		employee.getContrato().setSalario(salario);
		employee.getContrato().setMoneda(moneda);
		employee.getContrato().setCuentaBancaria(cuentaBancaria);
		System.out.println("AFG " + employee);
    }

	@Given("^los datos de busqueda (.*) (.*) (.*) (.*)$")
    public void crearDatosBusqueda(String campoBusqueda, String valor1Busqueda, String valor2Busqueda) {
		System.out.println("AFG " + campoBusqueda + ", " + valor1Busqueda + ", " + valor2Busqueda);
		this.campoBusqueda = campoBusqueda;
		this.valor1Busqueda = valor1Busqueda;
		this.valor2Busqueda = valor2Busqueda;
    }
	
    @When("^se envia el formulario de alta nueva al sistema$")
    public void enviaAlta() throws Exception{
    	perform = this.mvc
		.perform(
				post("/employee")
				.contentType(MediaType.APPLICATION_JSON_UTF8)
				.content(objectoToJsonString(employee))
				
		);
    }
    
    
    @Then("^el sistema devuelve el resultado (\\d+)$")
	public void checkResultNewEmployee(int code) throws Exception {
    	System.out.println("AFG code " + code);
    	perform.andExpect(MockMvcResultMatchers.status().is(code));
	}
    
    @Then("^si el (.*) no es \"201\", se devuelve el mensaje de error (.*)$")
    public void validaErrorAlta(int resultado, String mensaje) throws Exception {
    	System.out.println("AFG resultado, mensaje " + resultado + ", " + mensaje);
    	if(resultado != 201) {
    		perform.andExpect(
    				MockMvcResultMatchers.jsonPath("[0].message").value(mensaje)
    		);
    	}
    }

    
    
    
    
    
    
    
    
}
