package com.abeldevelop.cucumber.salaryexample.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.abeldevelop.cucumber.salaryexample.converter.ConverterContractResourceToModel;
import com.abeldevelop.cucumber.salaryexample.converter.ConverterEmployeeResourceToModel;
import com.abeldevelop.cucumber.salaryexample.entity.EmployeeEntity;
import com.abeldevelop.cucumber.salaryexample.repository.ContractRepository;
import com.abeldevelop.cucumber.salaryexample.repository.EmployeeRepository;
import com.abeldevelop.cucumber.salaryexample.resource.Employee;
import com.abeldevelop.cucumber.salaryexample.service.EmployeeService;

import ch.qos.logback.core.pattern.Converter;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class EmployeeServiceImpl implements EmployeeService {

	private final EmployeeRepository employeeRepository;
	private final ContractRepository contractRepository;
	
	@Override
	public void crearUsuario(Employee employee) {
		EmployeeEntity employeeEntity = ConverterEmployeeResourceToModel.resourceToModel(employee); 
		contractRepository.save(employeeEntity.getContrato());
		employeeRepository.save(employeeEntity);
	}

	@Override
	public void actualizarUsuario(Employee employee) {
		if(employee.getId() == null) {
			//TODO => Pete por no venir el ID
		}
		
		Employee employee = recuperarPorId(Long.parseLong(employee.getId()));
		employeeRepository.save(ConverterEmployeeResourceToModel.resourceToModel(employee));
	}

	@Override
	public void borrarUsuario(Long id) {
		employeeRepository.deleteById(id);
	}

	@Override
	public List<Employee> recuperarTodos() {
		List<Employee> employeeList = new ArrayList<>();  
		List<EmployeeEntity> employeeEntityList = employeeRepository.findAll();
		for(EmployeeEntity employeeEntity: employeeEntityList) {
			employeeList.add(ConverterEmployeeResourceToModel.modelToResource(employeeEntity));
		}
		return employeeList;
	}

	@Override
	public Employee recuperarPorId(Long id) {
		Optional<EmployeeEntity> findById = employeeRepository.findById(id);
		if(findById.isPresent()) {
			return ConverterEmployeeResourceToModel.modelToResource(findById.get());
		}
		else {
			return null;
		}
	}

	@Override
	public List<Employee> busquedaAvanzada() {
		// TODO Auto-generated method stub
		return null;
	}

}
