Feature: Dar de alta un nuevo empleado
			
	Scenario Outline: Dar de alta un nuevo empleado
	Given los datos de entrada 
	| nombre	| apellido	| dni	| cumpleanos	| email		| telefono	| sexo	| rol	| contrato.categoria	| contrato.tipoContrato	| contrato.fechaInicio	| contrato.fechaFin	| contrato.salario	| contrato.moneda	| contrato.cuentaBancaria 	|
	| <nombre> 	| <apellido>| <dni> |<cumpleanos> 	| <email> 	|<telefono> |<sexo> |<rol> 	| <contrato.categoria> 	|<contrato.tipoContrato>|<contrato.fechaInicio> |<contrato.fechaFin>|<contrato.salario> |<contrato.moneda> 	|<contrato.cuentaBancaria>	|
	When se envia el formulario de alta nueva al sistema
	Then el sistema devuelve el resultado <resultado>
	And si el <resultado> no es "201", se devuelve el mensaje de error <mensaje>
	
	@Regression
	Examples:
|  TC	| nombre		| apellido	| dni			|	cumpleanos					|	email				| telefono	| sexo	| rol	| contrato.categoria	| contrato.tipoContrato	|	contrato.fechaInicio		| contrato.fechaFin			| contrato.salario	| contrato.moneda	| contrato.cuentaBancaria 	| resultado	| mensaje													| 
| TC001	| Fulanito   	| Aaa		| 12345678A  	|  2000-01-01T00:00:00.000Z  	|  fulanitoa@email.com	| 666666666	| M		| QA	| 1           			|	F       			|   2018-07-12T00:00:00.000Z 	|							| 12000				| €					| ES9389392982837439423453	| 201		| 															| 
| TC002	| Fulanito   	| Bbb		| 12345123B   	|  1990-02-02T00:00:00.000Z  	|  fulanitob@email.com	| 666666667	| F		| DSW	| 2           			|	D       			|   2018-08-10T00:00:00.000Z 	|							| 28000				| 					| ES9389392982837439423454	| 201		| 															| 
| TC003	| Pepito     	| Ccc		| 98765423C  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666666668	| 		| Admin	| 3          			|	U       			|   2018-07-29T00:00:00.000Z  	|							| 36000				| 					| ES9389392982837439423455	| 201		| 															| 
| TC004	| Pepito     	| Ddd		| 98765423D  	|  1970-04-04T00:00:00.000Z  	|  pepito.d@email.com	| 666666669	| 		| TL	| 4          			|	U       			|   2018-06-14T00:00:00.000Z  	|							| 33000				| $					| ES9389392982837439423456	| 201		| 															| 
| TC005	| Pepito     	| Aaa		| X8765423E  	|  1970-05-04T00:00:00.000Z  	|  pepitoe@email.com	| 666666670	| 		| TL	| 4          			|	U       			|   2018-06-14T00:00:00.000Z  	|							| 33000				| 					| ES9389392982837439423457	| 201		| 															| 
| TC006	| Pepito     	| Fff		| 123451233		|  1981-03-03T00:00:00.000Z  	|  pepitof@email.com	| 666666671	| 		| QA	| 3          			|	U       			|   2018-07-29T00:00:00.000Z  	| 							| 35000				|  					| ES9389392982837439423453	| 201		| 															| 
| TC007	| 				| Ddd		| 12345678A  	|  2000-01-01T00:00:00.000Z  	|  fulanitoa@email.com	| 665666666	| 		| QA	| 1           			|	F       			|   2018-07-12T00:00:00.000Z 	|							| 12000				|  					| ES7389392982837439423453	| 400		| Es necesario introducir el nombre 						| 
| TC008	| Fulanito   	| 			| 12345123B   	|  1990-02-02T00:00:00.000Z  	|  fulanitob@email.com	| 666566667	| 		| DSW	| 2           			|	O       			|   2018-08-10T00:00:00.000Z 	|							| 28000				|  					| ES7389392982837439423453	| 400		| Es necesario introducir el apellido 						|
| TC009	| Pepito     	| Ccc		| 				|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| Admin	| 3          			|	I       			|   2018-07-29T00:00:00.000Z  	|							| 35000				|  					| ES7389392982837439423453	| 400		| Es necesario introducir el dni	 						| 
| TC010	| Fulanito   	| Ddd		| 12345123D   	|  								|  fulanitob@email.com	| 666656667	| 		| DSW	| 2           			|	O       			|   2018-08-10T00:00:00.000Z 	|							| 28000				|  					| ES7389392982837439423453	| 400		| Es necesario introducir el cumpleanos						| 
| TC011	| Fulanito		| Ddd		| 12345678A  	|  2000-01-01T00:00:00.000Z  	|  						| 666766666	| 		| QA	| 1           			|	F       			|   2018-07-12T00:00:00.000Z 	|							| 12000				|  					| ES7389392982837439423453	| 400		| Es necesario introducir el email 							| 
| TC012	| Fulanito   	| Ddd		| 12345123H   	|  1990-02-02T00:00:00.000Z  	|  fulanitob@email.com	| 			| 		| DSW	| 2           			|	O       			|   2018-08-10T00:00:00.000Z 	|							| 28000				|  					| ES7389392982837439423453	| 400		| Es necesario introducir el telefono 						| 
| TC013	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| 		| 3          			|	I       			|   2018-07-29T00:00:00.000Z  	|							| 35000				|  					| ES7389392982837439423453	| 400		| Es necesario introducir el rol	 						| 
| TC014	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	|           			|	I       			|   2018-07-29T00:00:00.000Z  	|							| 35000				|  					| ES7389392982837439423453	| 400		| Es necesario introducir la categoria 						| 
| TC015	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          			|	        			|   2018-07-29T00:00:00.000Z  	|							| 35000				|  					| ES7389392982837439423453	| 400		| Es necesario introducir el tipo de contrato	 			| 
| TC016	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          			|	I       			|   							|							| 35000				|  					| ES7389392982837439423453	| 400		| Es necesario introducir la fecha de inicio				| 
| TC017	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          			|	I       			|   2018-07-29T00:00:00.000Z  	|							|   				|  					| ES7389392982837439423453	| 400		| Es necesario introducir el salario	 					| 
| TC018	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          			|	I       			|   2018-07-29T00:00:00.000Z  	|							| 35000				|  					| 							| 400		| Es necesario introducir la cuenta bancaria				| 

	@Smoke
	Examples:
|  TC	| nombre		| apellido	| dni			|	cumpleanos					|	email				| telefono	| sexo	| rol	| contrato.categoria	| contrato.tipoContrato	|	contrato.fechaInicio		| contrato.fechaFin			| contrato.salario	| contrato.moneda	| contrato.cuentaBancaria 	| resultado	| mensaje													|
| TC077	| Pepito     	| Uno		| 98765423C   	|  1980-03-03T00:00:00.000Z  	|  pepitoh@email.com	| 666656668	| 		| QA	| 3          			|	I       			|   2018-07-29T00:00:00.000Z  	| 							| 35000				|  					| ES7389392982837439423453	| 400		| El dni ya esta dado de alta en el sistema					| 
| TC078	| Pepito     	| Dos		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          			|	I       			|   2018-07-29T00:00:00.000Z  	| 							| 35000				|  					| ES7389392982837439423453	| 400		| El email ya esta dado de alta en el sistema				| 
| TC079	| Pepito     	| Tres		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoh@email.com	| 666666668	| 		| QA	| 3          			|	I       			|   2018-07-29T00:00:00.000Z  	| 							| 35000				|  					| ES7389392982837439423453	| 400		| El telefono ya esta dado de alta en el sistema			|


	Scenario Outline: Buscar datos de empleados
	Given los datos de busqueda <TC> "<campoBusqueda>" "<valor1Busqueda>" "<valor2Busqueda>"	
	When se envia el formulario de consulta al sistema
	Then el sistema devuelve el resultado <resultado>
	And si el <resultado> es "200", devuelve <num> resultados
	And si el <resultado> es "400", devuelve <mensaje>

	Examples:
| TC	| campoBusqueda	| valor1Busqueda| valor2Busqueda| resultado	| num	| mensaje												|
| TC001	| nombre		| epi			| 				| 200		| 4		|  														|
| TC002	| apellido		| aa			| 				| 200		| 2		| 														|
| TC003	| dni			| 123B			| 				| 200		| 1		| 														|
| TC004	| salario		| 35000			| 				| 200		| 2		| 														|
| TC005	| salario		|	 			| 28000			| 200		| 2		| 														|
| TC006	| salario		| 33000			| 				| 200		| 4		| 														|
| TC007	| salario		| 25000			| 36000			| 200		| 5		| 														|
| TC008	| nombre		| iii			| 				| 200		| 0		|  														|
| TC009	| apellido		| ooo			| 				| 200		| 0		| 														|
| TC010	| dni			| ppp			| 				| 200		| 0		| 														|
| TC011	| salario		| 				| 11000			| 200		| 0 	| 														|
| TC012	| salario		| 35000			| 				| 200		| 2		| 														|
| TC013	| salario		| 38000			| 40000			| 200		| 0		| 														|
| TC015	| nombre		| 				| 				| 400		| 1		| El valor de busqueda no puede estar vacio				|
| TC016	| apellido		| 				| 				| 400		| 		| El valor de busqueda no puede estar vacio				|
| TC017	| dni			| 				| 				| 400		| 		| El valor de busqueda no puede estar vacio				|
| TC018	| salario		| 				| 				| 400		| 		| El valor de busqueda no puede estar vacio				|
| TC019	| nombre		| e				| 				| 400		| 		| El valor de busqueda debe tener al menos 2 caracteres |
| TC020	| apellido		| e				| 				| 400		| 		| El valor de busqueda debe tener al menos 2 caracteres |
| TC021	| dni			| e				| 				| 400		| 		| El valor de busqueda debe tener al menos 2 caracteres |
| TC022	| salario		| 233e			| 				| 400		| 		| El salario no puede contener caracteres				|
| TC024	| salario		| 35000			| 15000			| 400		| 		| El primer valor debe ser menor que el segundo			|