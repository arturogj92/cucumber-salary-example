package com.abeldevelop.cucumber.salaryexample.converter;

import com.abeldevelop.cucumber.salaryexample.entity.EmployeeEntity;
import com.abeldevelop.cucumber.salaryexample.resource.Employee;

public abstract class ConverterEmployeeResourceToModel {

	public static Employee modelToResource(EmployeeEntity employeeEntity) {
		Employee employee = new Employee();
		if(employeeEntity.getId() != null) {
			employee.setId(Long.toString(employeeEntity.getId()));
		}
		employee.setNombre(employeeEntity.getNombre());
		employee.setApellido(employeeEntity.getApellido());
		employee.setEmail(employeeEntity.getEmail());
		employee.setDni(employeeEntity.getDni());
		employee.setCumpleanos(employeeEntity.getCumpleanos());
		employee.setTelefono(employeeEntity.getTelefono());
		employee.setSexo(employeeEntity.getSexo());
		employee.setRol(employeeEntity.getRol());
		employee.setContrato(ConverterContractResourceToModel.modelToResource(employeeEntity.getContrato()));
		return employee;
	}
	
	
	public static EmployeeEntity resourceToModel(Employee employee) {
		EmployeeEntity employeeEntity = new EmployeeEntity();
		if(employee.getId() != null) {
			employeeEntity.setId(Long.parseLong(employee.getId()));
		}
		employeeEntity.setNombre(employee.getNombre());
		employeeEntity.setApellido(employee.getApellido());
		employeeEntity.setEmail(employee.getEmail());
		employeeEntity.setDni(employee.getDni());
		employeeEntity.setCumpleanos(employee.getCumpleanos());
		employeeEntity.setTelefono(employee.getTelefono());
		employeeEntity.setSexo(employee.getSexo());
		employeeEntity.setRol(employee.getRol());
		employeeEntity.setContrato(ConverterContractResourceToModel.resourceToModel(employee.getContrato()));
		return employeeEntity;
	}
}
