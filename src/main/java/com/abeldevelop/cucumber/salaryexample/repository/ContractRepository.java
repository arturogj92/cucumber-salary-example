package com.abeldevelop.cucumber.salaryexample.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abeldevelop.cucumber.salaryexample.entity.ContractEntity;

@Repository
public interface ContractRepository extends JpaRepository<ContractEntity, Long>{

}
