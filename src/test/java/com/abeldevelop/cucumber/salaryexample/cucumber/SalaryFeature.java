package com.abeldevelop.cucumber.salaryexample.cucumber;

import static org.hamcrest.Matchers.hasSize;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import java.util.List;
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
	private String tc;
	
	@Given("^los datos de entrada$")
    //public void crearEmployee(String nombre, String apellido, String dni, String cumpleanos, String email, String telefono, String sexo, String rol, String categoria, String tipoContrato, String fechaInicio, String fechaFin, String salario, String moneda, String cuentaBancaria) {
	public void crearEmployee(DataTable dataTable) {
		List<String> data = dataTable.raw().get(0);
		//driver.findElement(By.id("log")).sendKeys(data.get(0).get(0));
		int contador = 0;
		employee = new Employee();
		employee.setNombre(StringUtils.setNull(data.get(contador++)));
		employee.setApellido(StringUtils.setNull(data.get(contador++)));
		employee.setDni(StringUtils.setNull(data.get(contador++)));
		employee.setCumpleanos(StringUtils.setNull(data.get(contador++)));
		employee.setEmail(StringUtils.setNull(data.get(contador++)));
		employee.setTelefono(StringUtils.setNull(data.get(contador++)));
		employee.setSexo(StringUtils.setNull(data.get(contador++)));
		employee.setRol(StringUtils.setNull(data.get(contador++)));
		employee.setContrato(new Contract());
		employee.getContrato().setCategoria(StringUtils.setNull(data.get(contador++)));
		employee.getContrato().setTipoContrato(StringUtils.setNull(data.get(contador++)));
		employee.getContrato().setFechaInicio(StringUtils.setNull(data.get(contador++)));
		employee.getContrato().setFechaFin(StringUtils.setNull(data.get(contador++)));
		employee.getContrato().setSalario(StringUtils.setNull(data.get(contador++)));
		employee.getContrato().setMoneda(StringUtils.setNull(data.get(contador++)));
		employee.getContrato().setCuentaBancaria(StringUtils.setNull(data.get(contador++)));
    }

	@Given("^los datos de busqueda (.*) \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
    public void crearDatosBusqueda(String tc, String campoBusqueda, String valor1Busqueda, String valor2Busqueda) {
		this.tc = StringUtils.setNull(tc);
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
