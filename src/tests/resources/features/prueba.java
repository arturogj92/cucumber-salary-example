package features;

public class prueba {

	@Given("^los datos de entrada (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*) (.*)$")
    public void datosDeEntrada(String nombre, String apellido, String dni, Date cumpleanos, String email, int telefono, String sexo, String rol, int categoria, String tipoContrato, Date fechaInicio, Date fechaFin, int salario, String moneda, String cuentaBancaria) {
        //Crear la peticion
    }
	
	@Given("^los datos de busqueda (.*) (.*) (.*) (.*)$")
    public void datosDeEntrada(String campo, String valor1, String valor2, String tipo) {
        //Crear la peticion
    }
 
    @When("^se envia el formulario de alta nueva al sistema$")
    public void enviaAlta(Obj peticion){
        //Hacer el post contra el sistema
    }
    
    @When("^se envia el formulario de consulta al sistema$")
    public void enviaConsulta(Obj peticion){
    	//Hacer el get contra el sistema
    }
 
    @Then("^el sistema devuelve el resultado (.*)$")
    public int resultadoCabecera(Obj respuesta) {
        //return cabecera;
    }
    
    @Then("^si el (.*) no es \"201\", se devuelve el mensaje de error (.*)$")
    public void validaError(Obj respuesta, String mensaje) {
        //Assert sobre el texto del mensaje de error
    }
    
    @Then("^si el (.*) es \"200\", devuelve (.*) resultados$")
    public void validaError(Obj respuesta, int resultados) {
        //Assert sobre el numero de elementos en la respuesta
    }
    
    @Then("^si el (.*) es \"200\", devuelve (.*)$")
    public void validaError(Obj respuesta, String mensaje) {
    	//Assert sobre el texto del mensaje de error
    }
	
}



/*
  	Given los datos de entrada <nombre> <apellido> <dni> <cumpleanos> <email> <telefono> <sexo> <rol> <categoria> <tipoContrato> <fechaInicio> <fechaFin> <salario> <moneda> <cuentaBancaria>	
	When se envia el formulario de alta nueva al sistema
	Then el sistema devuelve el resultado <resultado>
	And si el <resultado> no es "201", se devuelve el mensaje de error <mensaje>
 
 	Given los datos de busqueda <campo> <valor1> <valor> <tipo>	
	When se envia el formulario de consulta al sistema
	Then el sistema devuelve el resultado <resultado>
	And si el <resultado> es "200", devuelve <num> resultados
	And si el <resultado> es "400", devuelve <mensaje>
 */
