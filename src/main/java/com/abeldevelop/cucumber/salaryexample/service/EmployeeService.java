package com.abeldevelop.cucumber.salaryexample.service;

import java.util.List;

import com.abeldevelop.cucumber.salaryexample.resource.Employee;


public interface EmployeeService {

	public Employee crearUsuario(Employee employee);
	
	public void actualizarUsuario(Employee employee);
	
	public void borrarUsuario(String id);
	
	public List<Employee> recuperarTodos();
	
	public Employee recuperarPorId(String id);
	
	public List<Employee> busquedaSimple(String data);
	
	public List<Employee> busquedaPorSalario(String minSalary, String maxSalary);
	
}
