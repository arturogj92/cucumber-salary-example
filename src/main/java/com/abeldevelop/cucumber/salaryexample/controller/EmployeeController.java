package com.abeldevelop.cucumber.salaryexample.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.abeldevelop.cucumber.salaryexample.resource.Employee;
import com.abeldevelop.cucumber.salaryexample.service.EmployeeService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
public class EmployeeController {

	private final EmployeeService employeeService;
	
	
	@PostMapping("/user")
	public ResponseEntity<Void> crearUsuario(@RequestBody Employee employee) {
		employeeService.crearUsuario(employee);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	@PutMapping("/user")
	public ResponseEntity<Void> actualizarUsuario(@RequestBody Employee employee) {
		employeeService.actualizarUsuario(employee);
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@DeleteMapping("/user/{id}")
	public ResponseEntity<Void> borrarUsuario(@PathVariable Long id) {
		employeeService.borrarUsuario(id);
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/user")
	public ResponseEntity<List<Employee>> recuperarTodos() {
		List<Employee> employees = employeeService.recuperarTodos();
		return new ResponseEntity<>(employees, HttpStatus.OK);
	}
	
	@GetMapping("/user/{id}")
	public ResponseEntity<Employee> recuperarPorId(@PathVariable Long id) {
		Employee employee = employeeService.recuperarPorId(id);
		if(employee != null) {
			return new ResponseEntity<>(employee, HttpStatus.OK);
		}
		else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	@GetMapping("/user/search")
	//salario > < y por rol
	public ResponseEntity<List<Employee>> busquedaAvanzada() {
		List<Employee> employees = null;
		
		return new ResponseEntity<>(employees, HttpStatus.OK);
	}
	
}
