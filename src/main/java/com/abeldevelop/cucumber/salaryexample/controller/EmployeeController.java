package com.abeldevelop.cucumber.salaryexample.controller;

import java.net.URI;
import java.util.List;

import javax.validation.Valid;
import javax.websocket.server.PathParam;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.abeldevelop.cucumber.salaryexample.resource.Employee;
import com.abeldevelop.cucumber.salaryexample.service.EmployeeService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
public class EmployeeController {

	private final EmployeeService employeeService;
	
	
	@PostMapping("/employee")
	public ResponseEntity<Void> crearUsuario(@Valid @RequestBody Employee employee) {
		Employee employeeInserted = employeeService.crearUsuario(employee);
		
		URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(employeeInserted.getId()).toUri();
			
		return ResponseEntity.created(location).build();
	}
	
	@PutMapping("/employee")
	public ResponseEntity<Void> actualizarUsuario(@RequestBody Employee employee) {
		employeeService.actualizarUsuario(employee);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@DeleteMapping("/employee/{id}")
	public ResponseEntity<Void> borrarUsuario(@PathVariable String id) {
		employeeService.borrarUsuario(id);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@GetMapping("/employee")
	public ResponseEntity<List<Employee>> recuperarTodos() {
		List<Employee> employees = employeeService.recuperarTodos();
		return new ResponseEntity<>(employees, HttpStatus.OK);
	}
	
	@GetMapping("/employee/{id}")
	public ResponseEntity<Employee> recuperarPorId(@PathVariable String id) {
		return new ResponseEntity<>(employeeService.recuperarPorId(id), HttpStatus.OK);
	}

	//Busca por nombre, apellido o dni
	@GetMapping("/employee/search/{data}")
	public ResponseEntity<List<Employee>> busquedaSimple(@PathVariable String data) {
		return new ResponseEntity<>(employeeService.busquedaSimple(data), HttpStatus.OK);
	}
	
	@GetMapping("/employee/search")
	public ResponseEntity<List<Employee>> busquedaPorSalario(@PathParam("minSalary") String minSalary, @PathParam("maxSalary") String maxSalary, @PathParam("comparator") String comparator) {
		return new ResponseEntity<>(employeeService.busquedaPorSalario(minSalary, maxSalary, comparator), HttpStatus.OK);
	}
	
}
