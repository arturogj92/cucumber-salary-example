package com.abeldevelop.cucumber.salaryexample.converter;

import com.abeldevelop.cucumber.salaryexample.entity.ContractEntity;
import com.abeldevelop.cucumber.salaryexample.resource.Contract;

public abstract class ConverterContractResourceToModel {

	public static Contract modelToResource(ContractEntity contractEntity) {
		Contract contract = new Contract();
		contract.setCategoria(contractEntity.getCategoria());
		contract.setTipoContrato(contractEntity.getTipoContrato());
		contract.setFechaInicio(contractEntity.getFechaInicio());
		contract.setSalario(Double.toString(contractEntity.getSalario()));
		contract.setMoneda(contractEntity.getMoneda());
		contract.setFechaFin(contractEntity.getFechaFin());
		contract.setCuentaBancaria(contractEntity.getCuentaBancaria());
		return contract;
	}
	
	
	public static ContractEntity resourceToModel(Contract contract) {
		ContractEntity contractEntity = new ContractEntity();
		contractEntity.setCategoria(contract.getCategoria());
		contractEntity.setTipoContrato(contract.getTipoContrato());
		contractEntity.setFechaInicio(contract.getFechaInicio());
		contractEntity.setSalario(Double.parseDouble(contract.getSalario()));
		contractEntity.setMoneda(contract.getMoneda());
		contractEntity.setFechaFin(contract.getFechaFin());
		contractEntity.setCuentaBancaria(contract.getCuentaBancaria());
		return contractEntity;
	}
}
