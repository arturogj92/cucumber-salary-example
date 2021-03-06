package com.abeldevelop.cucumber.salaryexample.repository;

import java.util.List;

import com.abeldevelop.cucumber.salaryexample.entity.EmployeeEntity;

public interface EmployeeSearchRepository {

	public List<EmployeeEntity> busquedaSimple(String data);
	
	public List<EmployeeEntity> busquedaPorSalario(String minSalary, String maxSalary);

	public List<EmployeeEntity> checkIsEmployeeExist(String dni, String email, String telefono);
}
