package com.abeldevelop.cucumber.salaryexample.cucumber;

import static org.hamcrest.Matchers.hasSize;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import com.abeldevelop.cucumber.salaryexample.resource.Contract;
import com.abeldevelop.cucumber.salaryexample.resource.Employee;
import com.abeldevelop.cucumber.salaryexample.utils.StringUtils;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class SalaryFeature extends SpringIntegrationTest {

	private Employee employee;
	private String campoBusqueda;
	private String valor1Busqueda;
	private String valor2Busqueda;
	
	@Given("^los datos de entrada$")
	public void crearEmployee(DataTable dataTable) {
		Map<String, String> map = dataTable.asMaps(String.class, String.class).get(0);
		employee = new Employee();
		employee.setNombre(StringUtils.setNull(map.get("nombre")));
		employee.setApellido(StringUtils.setNull(map.get("apellido")));
		employee.setDni(StringUtils.setNull(map.get("dni")));
		employee.setCumpleanos(StringUtils.setNull(map.get("cumpleanos")));
		employee.setEmail(StringUtils.setNull(map.get("email")));
		employee.setTelefono(StringUtils.setNull(map.get("telefono")));
		employee.setSexo(StringUtils.setNull(map.get("sexo")));
		employee.setRol(StringUtils.setNull(map.get("rol")));
		employee.setContrato(new Contract());
		employee.getContrato().setCategoria(StringUtils.setNull(map.get("contrato.categoria")));
		employee.getContrato().setTipoContrato(StringUtils.setNull(map.get("contrato.tipoContrato")));
		employee.getContrato().setFechaInicio(StringUtils.setNull(map.get("contrato.fechaInicio")));
		employee.getContrato().setFechaFin(StringUtils.setNull(map.get("contrato.fechaFin")));
		employee.getContrato().setSalario(StringUtils.setNull(map.get("contrato.salario")));
		employee.getContrato().setMoneda(StringUtils.setNull(map.get("contrato.moneda")));
		employee.getContrato().setCuentaBancaria(StringUtils.setNull(map.get("contrato.cuentaBancaria")));
    }

	@Given("^los datos de busqueda \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void crearDatosBusqueda(String campoBusqueda, String valor1Busqueda, String valor2Busqueda) {
		this.campoBusqueda = StringUtils.setNull(campoBusqueda);
		this.valor1Busqueda = StringUtils.setNull(valor1Busqueda);
		this.valor2Busqueda = StringUtils.setNull(valor2Busqueda);
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
    		perform.andExpect(MockMvcResultMatchers.jsonPath("[0].message").value(mensaje));
    	}
    }

    @When("^se envia el formulario de consulta al sistema$")
    public void se_envia_el_formulario_de_consulta_al_sistema() throws Throwable {
    	if(campoBusqueda.equals("nombre") || campoBusqueda.equals("apellido") || campoBusqueda.equals("dni")) {
    		if(valor1Busqueda == null) {
    			perform = this.mvc.perform(get("/employee/search/"));
    		}
    		else {
	    		perform = this.mvc.perform(get("/employee/search/" + valor1Busqueda));
    		}
    	}
    	else if(campoBusqueda.equals("salario")) {
    		StringBuilder builder = new StringBuilder();
    		if(StringUtils.setNull(valor1Busqueda) != null) {
    			builder.append("minSalary=" + valor1Busqueda);
    		}
    		if(StringUtils.setNull(valor1Busqueda) != null && StringUtils.setNull(valor2Busqueda) != null) {
    			builder.append("&");
    		}
    		if(StringUtils.setNull(valor2Busqueda) != null) {
    			builder.append("maxSalary=" + valor2Busqueda);
    		}
    		perform = this.mvc.perform(get("/employee/search?" + builder.toString()));
    	}
    }

    @Then("^si el (\\d+) es \"200\", devuelve (.*) resultados$")
    public void si_el_es_devuelve_resultados(int resultado, Integer num) throws Throwable {
        if(resultado == 200) {
        	perform.andExpect(MockMvcResultMatchers.status().is(resultado));
        	perform.andExpect(MockMvcResultMatchers.jsonPath("$", hasSize(num)));
        }
    }

    @Then("^si el (\\d+) es \"400\", devuelve (.*)$")
    public void si_el_es_devuelve(Integer resultado, String mensaje) throws Throwable {
    	if(resultado == 400) {
    		perform.andExpect(MockMvcResultMatchers.status().is(resultado));
    		perform.andExpect(MockMvcResultMatchers.jsonPath("[0].message").value(mensaje));
        }
    }
    
}
