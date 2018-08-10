package com.abeldevelop.cucumber.salaryexample.service;

import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;

import com.abeldevelop.cucumber.salaryexample.resource.Employee;


public interface EmployeeService {

	public void crearUsuario(Employee employee);
	
	public void actualizarUsuario(Employee employee);
	
	public void borrarUsuario(@PathVariable Long id);
	
	public List<Employee> recuperarTodos();
	
	public Employee recuperarPorId(Long id);
	
	public List<Employee> busquedaAvanzada();
	
}
