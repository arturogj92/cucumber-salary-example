package com.abeldevelop.cucumber.salaryexample.repository.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Fetch;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.abeldevelop.cucumber.salaryexample.entity.ContractEntity;
import com.abeldevelop.cucumber.salaryexample.entity.ContractEntity_;
import com.abeldevelop.cucumber.salaryexample.entity.EmployeeEntity;
import com.abeldevelop.cucumber.salaryexample.entity.EmployeeEntity_;
import com.abeldevelop.cucumber.salaryexample.repository.EmployeeSearchRepository;

@Repository
public class EmployeeSearchRepositoryImpl implements EmployeeSearchRepository {

	@Autowired
	private EntityManager em;

	@Override
	public List<EmployeeEntity> busquedaSimple(String data) {

		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		CriteriaQuery<EmployeeEntity> criteriaQuery = criteriaBuilder.createQuery(EmployeeEntity.class);
		Root<EmployeeEntity> root = criteriaQuery.from(EmployeeEntity.class);
		root.fetch(EmployeeEntity_.contrato);
		
		
		Predicate orPredicate = criteriaBuilder.or(
				criteriaBuilder.like(criteriaBuilder.upper(root.get(EmployeeEntity_.nombreCompleto)), "%"+data.toUpperCase()+"%"),
				criteriaBuilder.like(criteriaBuilder.upper(root.get(EmployeeEntity_.dni)), "%"+data.toUpperCase()+"%")
		);
		criteriaQuery.where(orPredicate);
		
		List<EmployeeEntity> result = em.createQuery(criteriaQuery).getResultList();
		return result;
	}

	@Override
	public List<EmployeeEntity> busquedaPorSalario(String minSalary, String maxSalary) {
		
		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		CriteriaQuery<EmployeeEntity> criteriaQuery = criteriaBuilder.createQuery(EmployeeEntity.class);
		Root<EmployeeEntity> root = criteriaQuery.from(EmployeeEntity.class);
		Join<EmployeeEntity, ContractEntity> join = (Join<EmployeeEntity, ContractEntity>)root.fetch(EmployeeEntity_.contrato);
		List<Predicate> predicates = new ArrayList<>();
		if(!StringUtils.isEmpty(minSalary) && !StringUtils.isEmpty(maxSalary)) {
			Predicate greaterThanOrEqualTo = criteriaBuilder.greaterThanOrEqualTo(join.get(ContractEntity_.salario), minSalary);
			Predicate lessThanOrEqualTo = criteriaBuilder.lessThanOrEqualTo(join.get(ContractEntity_.salario), maxSalary);
			predicates.add(criteriaBuilder.and(greaterThanOrEqualTo, lessThanOrEqualTo));
		}
		else if(!StringUtils.isEmpty(minSalary) && StringUtils.isEmpty(maxSalary)) {
			predicates.add(criteriaBuilder.greaterThanOrEqualTo(join.get(ContractEntity_.salario), minSalary));
		}
		else if(StringUtils.isEmpty(minSalary) && !StringUtils.isEmpty(maxSalary)) {
			predicates.add(criteriaBuilder.lessThanOrEqualTo(join.get(ContractEntity_.salario), maxSalary));
		}
		else {
			return new ArrayList<>();
		}
		
		criteriaQuery.where(predicates.toArray(new Predicate[predicates.size()]));
		List<EmployeeEntity> result = em.createQuery(criteriaQuery).getResultList();
		return result;
	}
}
