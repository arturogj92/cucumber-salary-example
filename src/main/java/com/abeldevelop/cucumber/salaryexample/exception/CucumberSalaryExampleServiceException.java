package com.abeldevelop.cucumber.salaryexample.exception;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class CucumberSalaryExampleServiceException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	private List<String> messages;

	public CucumberSalaryExampleServiceException(String message) {
		messages = new ArrayList<>();
		messages.add(message);
	}

	public List<String> getMessages() {
		return messages;
	}

}
