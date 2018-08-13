package com.abeldevelop.cucumber.salaryexample.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import com.abeldevelop.cucumber.salaryexample.converter.ConverterEmployeeResourceToModel;
import com.abeldevelop.cucumber.salaryexample.entity.EmployeeEntity;
import com.abeldevelop.cucumber.salaryexample.exception.UserNotFoundException;
import com.abeldevelop.cucumber.salaryexample.repository.EmployeeSearchRepository;
import com.abeldevelop.cucumber.salaryexample.repository.EmployeeSpringDataRepository;
import com.abeldevelop.cucumber.salaryexample.resource.Employee;
import com.abeldevelop.cucumber.salaryexample.service.EmployeeService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@Service
public class EmployeeServiceImpl implements EmployeeService {

	private final MessageSource messageSource;
	private final EmployeeSpringDataRepository employeeSpringDataRepository;
	private final EmployeeSearchRepository employeeSearchRepository;
	
	@Override
	public Employee crearUsuario(Employee employee) {
		EmployeeEntity employeeEntity = ConverterEmployeeResourceToModel.resourceToModel(employee); 
		employeeSpringDataRepository.save(employeeEntity);
		return ConverterEmployeeResourceToModel.modelToResource(employeeEntity);
	}

	@Override
	public void actualizarUsuario(Employee employee) {
		if(employee.getId() == null) {
			throw new UserNotFoundException(messageSource.getMessage("message.error.userNotFound", null, LocaleContextHolder.getLocale()));
		}
		
		Optional<EmployeeEntity> employeeInDatabaseOptional = employeeSpringDataRepository.findById(Long.parseLong(employee.getId()));
		EmployeeEntity employeeInDatabase = null;
		if(!employeeInDatabaseOptional.isPresent()) {
			throw new UserNotFoundException(messageSource.getMessage("message.error.userNotFound", null, LocaleContextHolder.getLocale()));
		}
		employeeInDatabase = employeeInDatabaseOptional.get();
		
		employeeInDatabase.setNombre(employee.getNombre());
		employeeInDatabase.setApellido(employee.getApellido());
		employeeInDatabase.setEmail(employee.getEmail());
		employeeInDatabase.setDni(employee.getDni());
		employeeInDatabase.setCumpleanos(employee.getCumpleanos());
		employeeInDatabase.setTelefono(employee.getTelefono());
		employeeInDatabase.setSexo(employee.getSexo());
		employeeInDatabase.setRol(employee.getRol());
		employeeInDatabase.getContrato().setCategoria(employee.getContrato().getCategoria());
		employeeInDatabase.getContrato().setTipoContrato(employee.getContrato().getTipoContrato());
		employeeInDatabase.getContrato().setFechaInicio(employee.getContrato().getFechaInicio());
		employeeInDatabase.getContrato().setFechaFin(employee.getContrato().getFechaFin());
		employeeInDatabase.getContrato().setSalario(employee.getContrato().getSalario());
		employeeInDatabase.getContrato().setMoneda(employee.getContrato().getMoneda());
		employeeInDatabase.getContrato().setCuentaBancaria(employee.getContrato().getCuentaBancaria());
		
		employeeSpringDataRepository.save(employeeInDatabase);
	}

	@Override
	public void borrarUsuario(String id) {
		Optional<EmployeeEntity> employeeInDatabaseOptional = employeeSpringDataRepository.findById(Long.parseLong(id));
		if(!employeeInDatabaseOptional.isPresent()) {
			throw new UserNotFoundException(messageSource.getMessage("message.error.userNotFound", null, LocaleContextHolder.getLocale()));
		}
		employeeSpringDataRepository.deleteById(Long.parseLong(id));
	}

	@Override
	public List<Employee> recuperarTodos() {
		List<Employee> employeeList = new ArrayList<>();  
		List<EmployeeEntity> employeeEntityList = employeeSpringDataRepository.findAll();
		for(EmployeeEntity employeeEntity: employeeEntityList) {
			employeeList.add(ConverterEmployeeResourceToModel.modelToResource(employeeEntity));
		}
		return employeeList;
	}

	@Override
	public Employee recuperarPorId(String id) {
		log.info(""+LocaleContextHolder.getLocale());
		Optional<EmployeeEntity> findById = employeeSpringDataRepository.findById(Long.parseLong(id));
		if(findById.isPresent()) {
			return ConverterEmployeeResourceToModel.modelToResource(findById.get());
		}
		else {
			throw new UserNotFoundException(messageSource.getMessage("message.error.userNotFound", null, LocaleContextHolder.getLocale()));
		}
	}

	@Override
	public List<Employee> busquedaSimple(String data) {
		List<Employee> employee = new ArrayList<>();
		List<EmployeeEntity> employeeEntityList = employeeSearchRepository.busquedaSimple(data);
		for(EmployeeEntity employeeEntity : employeeEntityList) {
			employee.add(ConverterEmployeeResourceToModel.modelToResource(employeeEntity));
		}
		return employee;
	}

	@Override
	public List<Employee> busquedaPorSalario(String minSalary, String maxSalary, String comparator) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
