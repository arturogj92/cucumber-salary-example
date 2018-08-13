package com.abeldevelop.cucumber.salaryexample.repository.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.abeldevelop.cucumber.salaryexample.entity.EmployeeEntity;
import com.abeldevelop.cucumber.salaryexample.entity.EmployeeEntity_;
import com.abeldevelop.cucumber.salaryexample.repository.EmployeeSearchRepository;

@Repository
public class EmployeeSearchRepositoryImpl implements EmployeeSearchRepository {

	@Autowired
	private EntityManager em;

	@Override
	public List<EmployeeEntity> busquedaSimple(String data) {

//		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
//		CriteriaQuery<EmployeeEntity> criteriaQuery = criteriaBuilder.createQuery(EmployeeEntity.class);
//		Root<EmployeeEntity> root = criteriaQuery.from(EmployeeEntity.class);
		
		CriteriaBuilder criteriaBuilder = em.getCriteriaBuilder();
		CriteriaQuery<EmployeeEntity> criteriaQuery = criteriaBuilder.createQuery(EmployeeEntity.class);
		Root<EmployeeEntity> root = criteriaQuery.from(EmployeeEntity.class);
		
		Predicate condition = criteriaBuilder.equal(root.get("nombre"), data);
//		Predicate predicate = criteriaBuilder.conjunction();
//		predicate = criteriaBuilder.and(predicate, criteriaBuilder.equal(root.get("nombre"), data));
		
		
		
		criteriaQuery.select(root).where(condition);
		
				
		List<EmployeeEntity> result = em.createQuery(criteriaQuery).getResultList();
		
		
		
//		List<EmployeeEntity> resultList = em.createQuery(criteriaQuery).getResultList();
		return result;
	}

	@Override
	public List<EmployeeEntity> busquedaPorSalario(String minSalary, String maxSalary, String comparator) {
//		q.where(
//			      cb.gt(c.get("population"), p),
//			      cb.lt(c.get("area"), a)
//			  );
		return null;
	}
}
