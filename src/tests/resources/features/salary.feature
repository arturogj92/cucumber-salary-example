Feature: Dar de alta un nuevo empleado

	Background:
		Given un usuario con privilegios de administrador
			
	Scenario Outline: Dar de alta un nuevo empleado
	Given los datos de entrada <nombre> <apellido> <dni> <cumpleanos> <email> <telefono> <sexo> <rol> <categoria> <tipoContrato> <fechaInicio> <fechaFin> <salario> <moneda> <cuentaBancaria>	
	When se envia el formulario de alta nueva al sistema
	Then el sistema devuelve el resultado <resultado>
	And si el <resultado> no es "201", se devuelve el mensaje de error <mensaje>
	
	Examples:
| nombre		|	apellido	| dni			|	cumpleanos					|	email				| telefono	| sexo	| rol	|	categoria	|	tipoContrato	|	fechaInicio					| fechaFin					|	salario	| moneda	| cuentaBancaria 			| resultado	| mensaje													|
| Fulanito   	| Aaa			| 12345678A  	|  2000-01-01T00:00:00.000Z  	|  fulanitoa@email.com	| 666666666	| M		| QA	| 1           	|	F               |   2018-07-12T00:00:00.000Z 	|							|   12000   | €			| ES9389392982837439423453	| 201		|															|
| Fulanito   	| Bbb			| 12345123B   	|  1990-02-02T00:00:00.000Z  	|  fulanitob@email.com	| 666666667	| F		| DSW	| 2           	|	D               |   2018-08-10T00:00:00.000Z 	|							|   28000   | 			| ES9389392982837439423454	| 201		|															|
| Pepito     	| Ccc			| 98765423C  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666666668	| 		| Admin	| 3          	|	U               |   2018-07-29T00:00:00.000Z  	|							|   36000   | 			| ES9389392982837439423455	| 201		|															|
| Pepito     	| Ddd			| 98765423D  	|  1970-04-04T00:00:00.000Z  	|  pepito.d@email.com	| 666666669	| 		| TL	| 4          	|	U               |   2018-06-14T00:00:00.000Z  	|							|   33000   | $			| ES9389392982837439423456	| 201		|															|
| Pepito     	| Aaa			| X8765423E  	|  1970-05-04T00:00:00.000Z  	|  pepitoe@email.com	| 666666670	| 		| TL	| 4          	|	U               |   2018-06-14T00:00:00.000Z  	|							|   33000   | 			| ES9389392982837439423457	| 201		|															|
| Pepito     	| Fff			| 123451233	  	|  1981-03-03T00:00:00.000Z  	|  pepitof@email.com	| 666666671	| 		| QA	| 3          	|	U               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES9389392982837439423453	| 201		|															|
| 			   	| Ddd			| 12345678A  	|  2000-01-01T00:00:00.000Z  	|  fulanitoa@email.com	| 665666666	| 		| QA	| 1           	|	F               |   2018-07-12T00:00:00.000Z 	|							|   12000   |  			| ES7389392982837439423453	| 400		| Es necesario introducir el nombre 						|
| Fulanito   	| 				| 12345123B   	|  1990-02-02T00:00:00.000Z  	|  fulanitob@email.com	| 666566667	| 		| DSW	| 2           	|	O               |   2018-08-10T00:00:00.000Z 	|							|   28000   |  			| ES7389392982837439423453	| 400		| Es necesario introducir el apellido 						|		
| Pepito     	| Ccc			| 			  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| Admin	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	|							|   35000   |  			| ES7389392982837439423453	| 400		| Es necesario introducir el dni	 						|
| Fulanito   	| Ddd			| 12345123D   	|  							  	|  fulanitob@email.com	| 666656667	| 		| DSW	| 2           	|	O               |   2018-08-10T00:00:00.000Z 	|							|   28000   |  			| ES7389392982837439423453	| 400		| Es necesario introducir el cumpleanos						|
|			   	| Ddd			| 12345678A  	|  2000-01-01T00:00:00.000Z  	|  						| 666766666	| 		| QA	| 1           	|	F               |   2018-07-12T00:00:00.000Z 	|							|   12000   |  			| ES7389392982837439423453	| 400		| Es necesario introducir el email 							|
| Fulanito   	| 				| 12345123H   	|  1990-02-02T00:00:00.000Z  	|  fulanitob@email.com	| 			| 		| DSW	| 2           	|	O               |   2018-08-10T00:00:00.000Z 	|							|   28000   |  			| ES7389392982837439423453	| 400		| Es necesario introducir el telefono 						|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| 		| 3          	|	I               |   2018-07-29T00:00:00.000Z  	|							|   35000   |  			| ES7389392982837439423453	| 400		| Es necesario introducir el rol	 						|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	|           	|	I               |   2018-07-29T00:00:00.000Z  	|							|   35000   |  			| ES7389392982837439423453	| 400		| Es necesario introducir la categoria 						|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	                |   2018-07-29T00:00:00.000Z  	|							|   35000   |  			| ES7389392982837439423453	| 400		| Es necesario introducir el tipo de contrato	 			|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   						  	|							|   35000   |  			| ES7389392982837439423453	| 400		| Es necesario introducir la fecha de inicio				|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	|							|   		|  			| ES7389392982837439423453	| 400		| Es necesario introducir el salario	 					|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	|							|   35000   |  			| 							| 400		| Es necesario introducir la cuenta bancaria				|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 2018-07-29T00:00:00.000Z	|   35000   |  			| ES7389392982837439423453	| 400		| No se puede insertar la fecha fin al dar de alta			|
| P		     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El nombre debe tener al menos 3 caracteres				|
| Pep1to     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El nombre no debe llevar numeros							|
| Pepito     	| C				| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El apellido debe tener al menos 3 caracteres				|
| Pepito     	| Cc0			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El apellido no debe llevar numeros						|
| Pepito     	| Ccc			| 1234523B	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El dni debe tener 8 numeros y una letra al final			|
| Pepito     	| Ccc			| 123451235B	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El dni debe tener 8 numeros y una letra al final			|
| Pepito     	| Ccc			| 1234512B3	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El dni debe tener 8 numeros y una letra al final			|
| Pepito     	| Ccc			| 1234B123B	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El dni debe tener 8 numeros y una letra al final			|
| Pepito     	| Ccc			| T2344123B	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El nie debe tener X,Y o Z, 7 numeros y una letra al final	|
| Pepito     	| Ccc			| T23441233	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El nie debe tener X,Y o Z, 7 numeros y una letra al final	|
| Pepito     	| Ccc			| T23441234B  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El nie debe tener X,Y o Z, 7 numeros y una letra al final	|
| Pepito     	| Ccc			| T234T123B	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El nie debe tener X,Y o Z, 7 numeros y una letra al final	|
| Pepito     	| Ccc			| 12345123H	  	|  2003-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El empleado debe tener al menos 16 anos					|
| Pepito     	| Ccc			| 12345123H	  	|  1940-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El empleado debe tener menos de 65 anos					|
| Pepito     	| Ccc			| 12345123H	  	|  07/04/2000				  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El formato de fecha no es correcto						|
| Pepito     	| Ccc			| 12345123H	  	|  07-04-2000				   	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El formato de fecha no es correcto						|
| Pepito     	| Ccc			| 12345123H	  	|  1980-13-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El mes no puede ser mayor a 12							|
| Pepito     	| Ccc			| 12345123H	  	|  1980-00-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El mes no puede ser menor a 1								|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-33T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El dia no puede ser mayor a 31							|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-00T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El dia no puede ser menor a 1								|
| Pepito     	| Ccc			| 12345123H	  	|  1980-04-31T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El mes no tiene tantos dias								|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  p@s.e				| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El email debe tener al menos 6 caracteres					|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email		| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El apellido debe tener un dominio							|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc.email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El apellido debe tener una @								|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepit@c@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El apellido debe tener una @								|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 66666666	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El numero de telefono debe tener 9 caracteres				|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 866666668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El numero de telefono debe empezar por 6 o 7				|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| H		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El sexo solo puede ser M o F								|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| hola	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El rol introducido no existe								|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 1          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| La categoria debe ser del 2 al 11							|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 12          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| La categoria debe ser del 2 al 11							|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| A          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| La categoria debe ser del 2 al 11							|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	H               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El tipo de contrato solo puede ser O, F o I				|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	II              |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El tipo de contrato solo puede ser O, F o I				|		
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	7               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El tipo de contrato solo puede ser O, F o I				|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018/07/29				  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El formato de fecha no es correcto						|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29				  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El formato de fecha no es correcto						|
| Pepito     	| Ccc			| 12345123H	  	|  1980-13-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El mes no puede ser mayor a 12							|
| Pepito     	| Ccc			| 12345123H	  	|  1980-00-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El mes no puede ser menor a 1								|	
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-33T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El dia no puede ser mayor a 31							|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-00T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El dia no puede ser menor a 1								|
| Pepito     	| Ccc			| 12345123H	  	|  1980-02-29T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El mes no tiene tantos dias								|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2020-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| La fecha de inicio debe ser como maximo hoy				|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 2018/07/29				|   35000   |  			| ES7389392982837439423453	| 400		| El formato de fecha no es correcto						|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 2018-07-29				|   35000   |  			| ES7389392982837439423453	| 400		| El formato de fecha no es correcto						|
| Pepito     	| Ccc			| 12345123H	  	|  1980-13-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 2018-17-29T00:00:00.000Z	|   35000   |  			| ES7389392982837439423453	| 400		| El mes no puede ser mayor a 12							|
| Pepito     	| Ccc			| 12345123H	  	|  1980-00-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 2018-00-05T00:00:00.000Z	|   35000   |  			| ES7389392982837439423453	| 400		| El mes no puede ser menor a 1								|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-33T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 2018-07-33T00:00:00.000Z	|   35000   |  			| ES7389392982837439423453	| 400		| El dia no puede ser mayor a 31							|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-00T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 2018-07-00T00:00:00.000Z	|   35000   |  			| ES7389392982837439423453	| 400		| El dia no puede ser menor a 1								|
| Pepito     	| Ccc			| 12345123H	  	|  1980-02-29T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 2018-02-29T00:00:00.000Z	|   35000   |  			| ES7389392982837439423453	| 400		| El mes no tiene tantos dias								|	
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   3A000   |  			| ES7389392982837439423453	| 400		| El salario no puede contener letras						|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  E		| ES7389392982837439423453	| 400		| La moneda solo puede ser € o $							|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  6		| ES7389392982837439423453	| 400		| La moneda solo puede ser € o $							|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES938939298283743942345	| 400		| La cuenta bancaria debe tener 24 caracteres				|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES73893929828374394234533	| 400		| La cuenta bancaria debe tener 24 caracteres				|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| E59389392982837439423453	| 400		| El formato de la cuenta bancaria son 2 letras y 22 numeros|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES93893929828Y7439423453	| 400		| El formato de la cuenta bancaria son 2 letras y 22 numeros|
| Pepito     	| Ccc			| 98765423C	  	|  1980-03-03T00:00:00.000Z  	|  pepitoh@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El dni ya esta dado de alta en el sistema					|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El email ya esta dado de alta en el sistema				|
| Pepito     	| Ccc			| 12345123H	  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666666668	| 		| QA	| 3          	|	I               |   2018-07-29T00:00:00.000Z  	| 							|   35000   |  			| ES7389392982837439423453	| 400		| El telefono ya esta dado de alta en el sistema			|
	
	Scenario Outline: Buscar datos de empleados
	Given los datos de busqueda <campo> <valor1> <valor2> <tipo>	
	When se envia el formulario de consulta al sistema
	Then el sistema devuelve el resultado <resultado>
	And si el <resultado> es "200", devuelve <num> resultados
	And si el <resultado> es "400", devuelve <mensaje>

	Examples:
| campo		| valor1	| valor2	| tipo		| resultado	| num	| mensaje												|
| nombre	| epi		| 			|			| 200		| 4		|  														|
| apellido	| aa		| 			|			| 200		| 2		| 														|
| dni		| 123B		| 			|			| 200		| 2		| 														|
| salario	| 35000		| 			| >=		| 200		| 2		| 														|
| salario	| 35000		| 			| >			| 200		| 1		| 														|
| salario	| 28000		| 			| <=		| 200		| 2		| 														|
| salario	| 28000		| 			| <			| 200		| 1		| 														|
| salario	| 33000		| 			| =			| 200		| 2		| 														|
| salario	| 25000		| 36000		| between	| 200		| 5		| 														|
| nombre	| iii		| 			|			| 200		| 		|  														|
| apellido	| ooo		| 			|			| 200		| 		| 														|
| dni		| ppp		| 			|			| 200		| 		| 														|
| salario	| 12000		| 			| <			| 200		| 		| 														|
| salario	| 36000		| 			| >			| 200		| 		| 														|
| salario	| 38000		| 40000		| between	| 200		| 		| 														|
| nombre	| 			| 			|			| 400		| 4		| El valor de busqueda no puede estar vacio				|
| apellido	| 			| 			|			| 400		| 4		| El valor de busqueda no puede estar vacio				|
| dni		| 			| 			|			| 400		| 4		| El valor de busqueda no puede estar vacio				|
| salario	| 			| 			|			| 400		| 4		| El valor de busqueda no puede estar vacio				|
| nombre	| e			| 			|			| 400		| 4		| El valor de busqueda debe tener al menos 2 caracteres |
| apellido	| e			| 			|			| 400		| 4		| El valor de busqueda debe tener al menos 2 caracteres |
| dni		| e			| 			|			| 400		| 4		| El valor de busqueda debe tener al menos 2 caracteres |
| salario	| 233e		| 			|			| 400		| 4		| El salario no puede contener caracteres				|
| salario	| 35000		| 			|			| 400		| 4		| El tipo de busqueda no puede estar vacio				|
| salario	| 35000		| 15000		| between	| 400		| 4		| El primer valor debe ser menor que el segundo			|

