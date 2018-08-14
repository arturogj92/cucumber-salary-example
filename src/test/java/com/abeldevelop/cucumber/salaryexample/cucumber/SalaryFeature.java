package com.abeldevelop.cucumber.salaryexample.cucumber;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.time.ZoneId;
import java.util.Date;

import org.skyscreamer.jsonassert.JSONAssert;
import org.skyscreamer.jsonassert.JSONCompareMode;
import org.skyscreamer.jsonassert.comparator.ArraySizeComparator;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.util.StringUtils;

import com.abeldevelop.cucumber.salaryexample.resource.Contract;
import com.abeldevelop.cucumber.salaryexample.resource.Employee;
import com.fasterxml.jackson.databind.ObjectMapper;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import cucumber.deps.difflib.StringUtills;

import static org.hamcrest.Matchers.*;

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
    }

	@Given("^los datos de busqueda \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void crearDatosBusqueda(String campoBusqueda, String valor1Busqueda, String valor2Busqueda) {
		this.campoBusqueda = isStringNull(campoBusqueda);
		this.valor1Busqueda = isStringNull(valor1Busqueda);
		this.valor2Busqueda = isStringNull(valor2Busqueda);
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
    	perform.andExpect(MockMvcResultMatchers.status().is(code));
	}
    
    @Then("^si el (.*) no es \"201\", se devuelve el mensaje de error (.*)$")
    public void validaErrorAlta(int resultado, String mensaje) throws Exception {
    	if(resultado != 201) {
    		perform.andExpect(
    				MockMvcResultMatchers.jsonPath("[0].message").value(mensaje)
    		);
    	}
    }

    @When("^se envia el formulario de consulta al sistema$")
    public void se_envia_el_formulario_de_consulta_al_sistema() throws Throwable {
    	
    	if(campoBusqueda.equals("nombre") || campoBusqueda.equals("apellido") || campoBusqueda.equals("dni")) {
    		System.out.println("AA " + "/employee/search/" + valor1Busqueda);
    		perform = this.mvc.perform(get("/employee/search/" + valor1Busqueda));
    	}
    	else if(campoBusqueda.equals("salario")) {
    		StringBuilder builder = new StringBuilder();
    		if(!StringUtils.isEmpty(valor1Busqueda)) {
    			builder.append("minSalary=" + valor1Busqueda);
    		}
    		if(!StringUtils.isEmpty(valor1Busqueda) && !StringUtils.isEmpty(valor2Busqueda)) {
    			builder.append("&");
    		}
    		if(!StringUtils.isEmpty(valor2Busqueda)) {
    			builder.append("maxSalary=" + valor2Busqueda);
    		}
    		System.out.println("AA " + "/employee/search?" + builder.toString());
    		perform = this.mvc.perform(get("/employee/search?" + builder.toString()));
    	}
    	
    	
    }

    @Then("^si el (\\d+) es \"200\", devuelve (\\d+) resultados$")
    public void si_el_es_devuelve_resultados(int resultado, int num) throws Throwable {
        if(resultado == 200) {
        	perform.andExpect(MockMvcResultMatchers.status().is(resultado));
        	String ratings = MockMvcResultMatchers.content().toString();
        	perform.andExpect(MockMvcResultMatchers.jsonPath("$", hasSize(num)));
        	
        }
    }

    @Then("^si el (\\d+) es \"400\", devuelve (.*)$")
    public void si_el_es_devuelve(int resultado, String mensaje) throws Throwable {
    	if(resultado == 400) {
    		perform.andExpect(MockMvcResultMatchers.status().is(resultado));
    		perform.andExpect(MockMvcResultMatchers.jsonPath("message").value(mensaje));
        }
    }
    
    
    
    private String isStringNull(String strIn) {
    	if(StringUtils.isEmpty(strIn) || strIn.equals("null")) {
    		return null;
    	}
    	return strIn;
    }
    
}
