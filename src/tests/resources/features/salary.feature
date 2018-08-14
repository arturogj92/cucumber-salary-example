Feature: Dar de alta un nuevo empleado

	Background:
		Given un usuario con privilegios de administrador
			
	Scenario Outline: Dar de alta un nuevo empleado
	Given los datos de entrada <nombre> <apellido> <dni> <cumpleanos> <email> <telefono> <sexo> <rol> <categoria> <tipoContrato> <fechaInicio> <fechaFin> <salario> <moneda> <cuentaBancaria>	
	When se envia el formulario de alta nueva al sistema
	Then el sistema devuelve el resultado <resultado>
	And si el <resultado> no es "201", se devuelve el mensaje de error <mensaje>
	
	Examples:
|  TC	| nombre		| apellido	| dni			|	cumpleanos					|	email				| telefono	| sexo	| rol	| categoria		| tipoContrato	|	fechaInicio					| fechaFin					| salario	| moneda| cuentaBancaria 			| resultado	| mensaje													| 
| TC001	| Fulanito   	| Aaa		| 12345678A  	|  2000-01-01T00:00:00.000Z  	|  fulanitoa@email.com	| 666666666	| M		| QA	| 1           	|	F       	|   2018-07-12T00:00:00.000Z 	|							| 12000		| €		| ES9389392982837439423453	| 201		| 															| 
| TC002	| Fulanito   	| Bbb		| 12345123B   	|  1990-02-02T00:00:00.000Z  	|  fulanitob@email.com	| 666666667	| F		| DSW	| 2           	|	D       	|   2018-08-10T00:00:00.000Z 	|							| 28000		| 		| ES9389392982837439423454	| 201		| 															| 
| TC003	| Pepito     	| Ccc		| 98765423C  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666666668	| 		| Admin	| 3          	|	U       	|   2018-07-29T00:00:00.000Z  	|							| 36000		| 		| ES9389392982837439423455	| 201		| 															| 
| TC004	| Pepito     	| Ddd		| 98765423D  	|  1970-04-04T00:00:00.000Z  	|  pepito.d@email.com	| 666666669	| 		| TL	| 4          	|	U       	|   2018-06-14T00:00:00.000Z  	|							| 33000		| $		| ES9389392982837439423456	| 201		| 															| 
| TC005	| Pepito     	| Aaa		| X8765423E  	|  1970-05-04T00:00:00.000Z  	|  pepitoe@email.com	| 666666670	| 		| TL	| 4          	|	U       	|   2018-06-14T00:00:00.000Z  	|							| 33000		| 		| ES9389392982837439423457	| 201		| 															| 
| TC006	| Pepito     	| Fff		| 123451233		|  1981-03-03T00:00:00.000Z  	|  pepitof@email.com	| 666666671	| 		| QA	| 3          	|	U       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES9389392982837439423453	| 201		| 															| 
| TC007	| 				| Ddd		| 12345678A  	|  2000-01-01T00:00:00.000Z  	|  fulanitoa@email.com	| 665666666	| 		| QA	| 1           	|	F       	|   2018-07-12T00:00:00.000Z 	|							| 12000		|  		| ES7389392982837439423453	| 400		| Es necesario introducir el nombre 						| 
| TC008	| Fulanito   	| 			| 12345123B   	|  1990-02-02T00:00:00.000Z  	|  fulanitob@email.com	| 666566667	| 		| DSW	| 2           	|	O       	|   2018-08-10T00:00:00.000Z 	|							| 28000		|  		| ES7389392982837439423453	| 400		| Es necesario introducir el apellido 						|
| TC009	| Pepito     	| Ccc		| 				|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| Admin	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	|							| 35000		|  		| ES7389392982837439423453	| 400		| Es necesario introducir el dni	 						| 
| TC010	| Fulanito   	| Ddd		| 12345123D   	|  								|  fulanitob@email.com	| 666656667	| 		| DSW	| 2           	|	O       	|   2018-08-10T00:00:00.000Z 	|							| 28000		|  		| ES7389392982837439423453	| 400		| Es necesario introducir el cumpleanos						| 
| TC011	| Fulanito		| Ddd		| 12345678A  	|  2000-01-01T00:00:00.000Z  	|  						| 666766666	| 		| QA	| 1           	|	F       	|   2018-07-12T00:00:00.000Z 	|							| 12000		|  		| ES7389392982837439423453	| 400		| Es necesario introducir el email 							| 
| TC012	| Fulanito   	| Ddd		| 12345123H   	|  1990-02-02T00:00:00.000Z  	|  fulanitob@email.com	| 			| 		| DSW	| 2           	|	O       	|   2018-08-10T00:00:00.000Z 	|							| 28000		|  		| ES7389392982837439423453	| 400		| Es necesario introducir el telefono 						| 
| TC013	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| 		| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	|							| 35000		|  		| ES7389392982837439423453	| 400		| Es necesario introducir el rol	 						| 
| TC014	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	|           	|	I       	|   2018-07-29T00:00:00.000Z  	|							| 35000		|  		| ES7389392982837439423453	| 400		| Es necesario introducir la categoria 						| 
| TC015	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	        	|   2018-07-29T00:00:00.000Z  	|							| 35000		|  		| ES7389392982837439423453	| 400		| Es necesario introducir el tipo de contrato	 			| 
| TC016	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   							|							| 35000		|  		| ES7389392982837439423453	| 400		| Es necesario introducir la fecha de inicio				| 
| TC017	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	|							|   		|  		| ES7389392982837439423453	| 400		| Es necesario introducir el salario	 					| 
| TC018	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	|							| 35000		|  		| 							| 400		| Es necesario introducir la cuenta bancaria				| 
| TC019	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 2018-07-29T00:00:00.000Z	| 35000		|  		| ES7389392982837439423453	| 400		| No se puede insertar la fecha fin al dar de alta			| 
| TC020	| P				| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El nombre debe tener al menos 3 caracteres				| 
| TC021	| Pep1to     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El nombre no debe llevar numeros							| 
| TC022	| Pepito     	| C			| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El apellido debe tener al menos 3 caracteres				| 
| TC023	| Pepito     	| Cc0		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El apellido no debe llevar numeros						| 
| TC024	| Pepito     	| Ccc		| 1234523B   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El dni debe tener 8 numeros y una letra al final			| 
| TC025	| Pepito     	| Ccc		| 123451235B	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El dni debe tener 8 numeros y una letra al final			|	 
| TC026	| Pepito     	| Ccc		| 1234512B3   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El dni debe tener 8 numeros y una letra al final			|	 
| TC027	| Pepito     	| Ccc		| 1234B123B   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El dni debe tener 8 numeros y una letra al final			| 
| TC028	| Pepito     	| Ccc		| T2344123B   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El nie debe tener X,Y o Z, 7 numeros y una letra al final	| 
| TC029	| Pepito     	| Ccc		| T23441233   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El nie debe tener X,Y o Z, 7 numeros y una letra al final	| 
| TC030	| Pepito     	| Ccc		| T23441234B  	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El nie debe tener X,Y o Z, 7 numeros y una letra al final	| 
| TC031	| Pepito     	| Ccc		| T234T123B   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El nie debe tener X,Y o Z, 7 numeros y una letra al final	| 
| TC032	| Pepito     	| Ccc		| 12345123H   	|  2003-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El empleado debe tener al menos 16 anos					| 
| TC033	| Pepito     	| Ccc		| 12345123H   	|  1940-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El empleado debe tener menos de 65 anos					| 
| TC034	| Pepito     	| Ccc		| 12345123H   	|  07/04/2000					|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El formato de fecha no es correcto						| 
| TC035	| Pepito     	| Ccc		| 12345123H   	|  07-04-2000					|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El formato de fecha no es correcto						| 
| TC036	| Pepito     	| Ccc		| 12345123H   	|  1980-13-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El mes no puede ser mayor a 12							| 
| TC037	| Pepito     	| Ccc		| 12345123H   	|  1980-00-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El mes no puede ser menor a 1								| 
| TC038	| Pepito     	| Ccc		| 12345123H   	|  1980-03-33T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El dia no puede ser mayor a 31							| 
| TC039	| Pepito     	| Ccc		| 12345123H   	|  1980-03-00T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El dia no puede ser menor a 1								| 
| TC040	| Pepito     	| Ccc		| 12345123H   	|  1980-04-31T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El mes no tiene tantos dias								| 
| TC041	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  p@s.e				| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El email debe tener al menos 6 caracteres					| 
| TC042	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email		| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El apellido debe tener un dominio							| 
| TC043	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc.email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El apellido debe tener una @								| 
| TC044	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepit@c@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El apellido debe tener una @								| 
| TC045	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 66666666	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El numero de telefono debe tener 9 caracteres				| 
| TC046	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 866666668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El numero de telefono debe empezar por 6 o 7				| 
| TC047	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| H		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El sexo solo puede ser M o F								| 
| TC048	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| hola	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El rol introducido no existe								| 
| TC049	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 1          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| La categoria debe ser del 2 al 11							| 
| TC050	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 12          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| La categoria debe ser del 2 al 11							| 
| TC051	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| A          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| La categoria debe ser del 2 al 11							| 
| TC052	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	H       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El tipo de contrato solo puede ser O, F o I				| 
| TC053	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	II      	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El tipo de contrato solo puede ser O, F o I				|
| TC054	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	7       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El tipo de contrato solo puede ser O, F o I				|	 
| TC055	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018/07/29					| 							| 35000		|  		| ES7389392982837439423453	| 400		| El formato de fecha no es correcto						| 
| TC056	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29					| 							| 35000		|  		| ES7389392982837439423453	| 400		| El formato de fecha no es correcto						| 
| TC057	| Pepito     	| Ccc		| 12345123H   	|  1980-13-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El mes no puede ser mayor a 12							| 
| TC058	| Pepito     	| Ccc		| 12345123H   	|  1980-00-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El mes no puede ser menor a 1								|
| TC059	| Pepito     	| Ccc		| 12345123H   	|  1980-03-33T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El dia no puede ser mayor a 31							| 
| TC060	| Pepito     	| Ccc		| 12345123H   	|  1980-03-00T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El dia no puede ser menor a 1								| 
| TC061	| Pepito     	| Ccc		| 12345123H   	|  1980-02-29T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El mes no tiene tantos dias								| 
| TC062	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2020-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| La fecha de inicio debe ser como maximo hoy				| 
| TC063	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 2018/07/29				| 35000		|  		| ES7389392982837439423453	| 400		| El formato de fecha no es correcto						| 
| TC064	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 2018-07-29				| 35000		|  		| ES7389392982837439423453	| 400		| El formato de fecha no es correcto						| 
| TC065	| Pepito     	| Ccc		| 12345123H   	|  1980-13-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 2018-17-29T00:00:00.000Z	| 35000		|  		| ES7389392982837439423453	| 400		| El mes no puede ser mayor a 12							| 
| TC066	| Pepito     	| Ccc		| 12345123H   	|  1980-00-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 2018-00-05T00:00:00.000Z	| 35000		|  		| ES7389392982837439423453	| 400		| El mes no puede ser menor a 1								| 
| TC067	| Pepito     	| Ccc		| 12345123H   	|  1980-03-33T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 2018-07-33T00:00:00.000Z	| 35000		|  		| ES7389392982837439423453	| 400		| El dia no puede ser mayor a 31							| 
| TC068	| Pepito     	| Ccc		| 12345123H   	|  1980-03-00T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 2018-07-00T00:00:00.000Z	| 35000		|  		| ES7389392982837439423453	| 400		| El dia no puede ser menor a 1								| 
| TC069	| Pepito     	| Ccc		| 12345123H   	|  1980-02-29T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 2018-02-29T00:00:00.000Z	| 35000		|  		| ES7389392982837439423453	| 400		| El mes no tiene tantos dias								|
| TC070	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 3A000   	|  		| ES7389392982837439423453	| 400		| El salario no puede contener letras						| 
| TC071	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  E	| ES7389392982837439423453	| 400		| La moneda solo puede ser € o $							| 
| TC072	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  6	| ES7389392982837439423453	| 400		| La moneda solo puede ser € o $							| 
| TC073	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES938939298283743942345	| 400		| La cuenta bancaria debe tener 24 caracteres				| 
| TC074	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES73893929828374394234533	| 400		| La cuenta bancaria debe tener 24 caracteres				| 
| TC075	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| E59389392982837439423453	| 400	 	| El formato de la cuenta bancaria son 2 letras y 22 numeros|
| TC076	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES93893929828Y7439423453	| 400	 	| El formato de la cuenta bancaria son 2 letras y 22 numeros|
| TC077	| Pepito     	| Ccc		| 98765423C   	|  1980-03-03T00:00:00.000Z  	|  pepitoh@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El dni ya esta dado de alta en el sistema					| 
| TC078	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666656668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El email ya esta dado de alta en el sistema				| 
| TC079	| Pepito     	| Ccc		| 12345123H   	|  1980-03-03T00:00:00.000Z  	|  pepitoc@email.com	| 666666668	| 		| QA	| 3          	|	I       	|   2018-07-29T00:00:00.000Z  	| 							| 35000		|  		| ES7389392982837439423453	| 400		| El telefono ya esta dado de alta en el sistema			| 
	

	Scenario Outline: Buscar datos de empleados
	Given los datos de busqueda <campoBusqueda> <valor1Busqueda> <valor2Busqueda>	
	When se envia el formulario de consulta al sistema
	Then el sistema devuelve el resultado <resultado>
	And si el <resultado> es "200", devuelve <num> resultados
	And si el <resultado> es "400", devuelve <mensaje>

	Examples:
|  TC	| campoBusqueda	| valor1Busqueda| valor2Busqueda| resultado	| num	| mensaje												|
| TC001	| nombre		| epi			| 				| 200		| 4		|  														|
| TC002	| apellido		| aa			| 				| 200		| 2		| 														|
| TC003	| dni			| 123B			| 				| 200		| 2		| 														|
| TC004	| salario		| 35000			| 				| 200		| 2		| 														|
| TC005	| salario		|	 			| 28000			| 200		| 2		| 														|
| TC006	| salario		| 33000			| 				| 200		| 2		| 														|
| TC007	| salario		| 25000			| 36000			| 200		| 5		| 														|
| TC008	| nombre		| iii			| 				| 200		| 		|  														|
| TC009	| apellido		| ooo			| 				| 200		| 		| 														|
| TC010	| dni			| ppp			| 				| 200		| 		| 														|
| TC011	| salario		| 				| 11000			| 200		| 		| 														|
| TC012	| salario		| 35000			| 				| 200		| 		| 														|
| TC013	| salario		| 38000			| 40000			| 200		| 		| 														|
| TC014	| 				| epi			| 				| 400		| 4		| El campo de busqueda no puede estar vacio				|
| TC015	| nombre		| 				| 				| 400		| 4		| El valor de busqueda no puede estar vacio				|
| TC016	| apellido		| 				| 				| 400		| 4		| El valor de busqueda no puede estar vacio				|
| TC017	| dni			| 				| 				| 400		| 4		| El valor de busqueda no puede estar vacio				|
| TC018	| salario		| 				| 				| 400		| 4		| El valor de busqueda no puede estar vacio				|
| TC019	| nombre		| e				| 				| 400		| 4		| El valor de busqueda debe tener al menos 2 caracteres |
| TC020	| apellido		| e				| 				| 400		| 4		| El valor de busqueda debe tener al menos 2 caracteres |
| TC021	| dni			| e				| 				| 400		| 4		| El valor de busqueda debe tener al menos 2 caracteres |
| TC022	| salario		| 233e			| 				| 400		| 4		| El salario no puede contener caracteres				|
| TC023	| salario		| 35000			| 				| 400		| 4		| El tipo de busqueda no puede estar vacio				|
| TC024	| salario		| 35000			| 15000			| 400		| 4		| El primer valor debe ser menor que el segundo			|
