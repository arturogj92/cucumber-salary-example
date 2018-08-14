Feature: Dar de alta un nuevo empleado
			
	Scenario Outline: Dar de alta un nuevo empleado
	Given los datos de entrada <nombre> <apellido> <dni> <cumpleanos> <email> <telefono> <sexo> <rol> <categoria> <tipoContrato> <fechaInicio> <fechaFin> <salario> <moneda> <cuentaBancaria>	
	When se envia el formulario de alta nueva al sistema
	Then el sistema devuelve el resultado <resultado>
	And si el <resultado> no es "201", se devuelve el mensaje de error <mensaje>
	
	Examples:
|	TC	|	 nombre			|		apellido		|	 dni				|		cumpleanos						|		email					|	 telefono		|	 sexo		|	 rol		|		categoria		|		tipoContrato		|		fechaInicio						|	 fechaFin						|		salario		|	 moneda		|	 cuentaBancaria 				|	 resultado		|	 mensaje														|
|	1	|	 Fulanito   		|	 Aaa				|	 12345678A  		|	  2000-01-01T00:00:00.000Z  		|	  fulanitoa@email.com		|	 666666666		|	 M			|	 QA		|	 1           		|		F               	|	   2018-07-12T00:00:00.000Z 		|									|	12000	|	 â‚¬				|	 ES9389392982837439423453		|	 201			|																	|
|	2	|	 Fulanito   		|	 Bbb				|	 12345123B   		|	  1990-02-02T00:00:00.000Z  		|	  fulanitob@email.com		|	 666666667		|	 F			|	 DSW		|	 2           		|		D               	|	   2018-08-10T00:00:00.000Z 		|									|	28000	|	 				|	 ES9389392982837439423454		|	 201			|																	|
|	3	|	 Pepito     		|	 Ccc				|	 98765423C  		|	  1980-03-03T00:00:00.000Z  		|	  pepitoc@email.com		|	 666666668		|	 			|	 Admin		|	 3          		|		U               	|	   2018-07-29T00:00:00.000Z  		|									|	36000	|	 				|	 ES9389392982837439423455		|	 201			|																	|
|	4	|	 Pepito     		|	 Ddd				|	 98765423D  		|	  1970-04-04T00:00:00.000Z  		|	  pepito.d@email.com		|	 666666669		|	 			|	 TL		|	 4          		|		U               	|	   2018-06-14T00:00:00.000Z  		|									|	33000	|	 $				|	 ES9389392982837439423456		|	 201			|																	|
|	5	|	 Pepito     		|	 Aaa				|	 X8765423E  		|	  1970-05-04T00:00:00.000Z  		|	  pepitoe@email.com		|	 666666670		|	 			|	 TL		|	 4          		|		U               	|	   2018-06-14T00:00:00.000Z  		|									|	33000	|	 				|	 ES9389392982837439423457		|	 201			|																	|
|	6	|	 Pepito     		|	 Fff				|	 123451233	  		|	  1981-03-03T00:00:00.000Z  		|	  pepitof@email.com		|	 666666671		|	 			|	 QA		|	 3          		|		U               	|	   2018-07-29T00:00:00.000Z  		|	 								|	35000	|	  				|	 ES9389392982837439423453		|	 201			|																	|
|	7	|	 			   		|	 Ddd				|	 12345678A  		|	  2000-01-01T00:00:00.000Z  		|	  fulanitoa@email.com		|	 665666666		|	 			|	 QA		|	 1           		|		F               	|	   2018-07-12T00:00:00.000Z 		|									|	12000	|	  				|	 ES7389392982837439423453		|	 400			|	 Es necesario introducir el nombre 							|
|	8	|	 Fulanito   		|	 					|	 12345123B   		|	  1990-02-02T00:00:00.000Z  		|	  fulanitob@email.com		|	 666566667		|	 			|	 DSW		|	 2           		|		O               	|	   2018-08-10T00:00:00.000Z 		|									|	28000	|	  				|	 ES7389392982837439423453		|	 400			|	 Es necesario introducir el apellido 							|
|	9	|	 Pepito     		|	 Ccc				|	 			  		|	  1980-03-03T00:00:00.000Z  		|	  pepitoc@email.com		|	 666656668		|	 			|	 Admin		|	 3          		|		I               	|	   2018-07-29T00:00:00.000Z  		|									|	35000	|	  				|	 ES7389392982837439423453		|	 400			|	 Es necesario introducir el dni	 							|
|	10	|	 Fulanito   		|	 Ddd				|	 12345123D   		|	  							  		|	  fulanitob@email.com		|	 666656667		|	 			|	 DSW		|	 2           		|		O               	|	   2018-08-10T00:00:00.000Z 		|									|	28000	|	  				|	 ES7389392982837439423453		|	 400			|	 Es necesario introducir el cumpleanos							|
|	11	|	 Fulanito	   		|	 Ddd				|	 12345678A  		|	  2000-01-01T00:00:00.000Z  		|	  							|	 666766666		|	 			|	 QA		|	 1           		|		F               	|	   2018-07-12T00:00:00.000Z 		|									|	12000	|	  				|	 ES7389392982837439423453		|	 400			|	 Es necesario introducir el email 								|
|	12	|	 Fulanito   		|	 Ddd				|	 12345123H   		|	  1990-02-02T00:00:00.000Z  		|	  fulanitob@email.com		|	 				|	 			|	 DSW		|	 2           		|		O               	|	   2018-08-10T00:00:00.000Z 		|									|	28000	|	  				|	 ES7389392982837439423453		|	 400			|	 Es necesario introducir el telefono 							|
|	13	|	 Pepito     		|	 Ccc				|	 12345123H	  		|	  1980-03-03T00:00:00.000Z  		|	  pepitoc@email.com		|	 666656668		|	 			|	 			|	 3          		|		I               	|	   2018-07-29T00:00:00.000Z  		|									|	35000	|	  				|	 ES7389392982837439423453		|	 400			|	 Es necesario introducir el rol	 							|
|	14	|	 Pepito     		|	 Ccc				|	 12345123H	  		|	  1980-03-03T00:00:00.000Z  		|	  pepitoc@email.com		|	 666656668		|	 			|	 QA		|	           		|		I               	|	   2018-07-29T00:00:00.000Z  		|									|	35000	|	  				|	 ES7389392982837439423453		|	 400			|	 Es necesario introducir la categoria 							|
|	15	|	 Pepito     		|	 Ccc				|	 12345123H	  		|	  1980-03-03T00:00:00.000Z  		|	  pepitoc@email.com		|	 666656668		|	 			|	 QA		|	 3          		|		                	|	   2018-07-29T00:00:00.000Z  		|									|	35000	|	  				|	 ES7389392982837439423453		|	 400			|	 Es necesario introducir el tipo de contrato	 				|
|	16	|	 Pepito     		|	 Ccc				|	 12345123H	  		|	  1980-03-03T00:00:00.000Z  		|	  pepitoc@email.com		|	 666656668		|	 			|	 QA		|	 3          		|		I               	|	   						  		|									|	35000	|	  				|	 ES7389392982837439423453		|	 400			|	 Es necesario introducir la fecha de inicio					|
|	17	|	 Pepito     		|	 Ccc				|	 12345123H	  		|	  1980-03-03T00:00:00.000Z  		|	  pepitoc@email.com		|	 666656668		|	 			|	 QA		|	 3          		|		I               	|	   2018-07-29T00:00:00.000Z  		|									|	   			|	  				|	 ES7389392982837439423453		|	 400			|	 Es necesario introducir el salario	 						|
|	18	|	 Pepito     		|	 Ccc				|	 12345123H	  		|	  1980-03-03T00:00:00.000Z  		|	  pepitoc@email.com		|	 666656668		|	 			|	 QA		|	 3          		|		I               	|	   2018-07-29T00:00:00.000Z  		|									|	35000	|	  				|	 								|	 400			|	 Es necesario introducir la cuenta bancaria					|


	Scenario Outline: Buscar datos de empleados
	Given los datos de busqueda <campoBusqueda> <valor1Busqueda> <valor2Busqueda>	
	When se envia el formulario de consulta al sistema
	Then el sistema devuelve el resultado <resultado>
	And si el <resultado> es "200", devuelve <num> resultados
	And si el <resultado> es "400", devuelve <mensaje>

	Examples:
| TC	| campoBusqueda	| valor1Busqueda| valor2Busqueda| resultado	| num	| mensaje												|
| 1		| nombre		| epi			| 				| 200		| 4		|  														|
| 2		| apellido		| aa			| 				| 200		| 2		| 														|
| 3		| dni			| 123B			| 				| 200		| 1		| 														|
| 4		| salario		| 35000			| 				| 200		| 2		| 														|
