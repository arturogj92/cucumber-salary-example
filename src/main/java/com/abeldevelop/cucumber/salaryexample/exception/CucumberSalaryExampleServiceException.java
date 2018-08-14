package com.abeldevelop.cucumber.salaryexample.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class CucumberSalaryExampleServiceException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public CucumberSalaryExampleServiceException(String message) {
		super(message);
	}
}
