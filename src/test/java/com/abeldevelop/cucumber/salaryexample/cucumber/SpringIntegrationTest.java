package com.abeldevelop.cucumber.salaryexample.cucumber;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;

import com.abeldevelop.cucumber.salaryexample.CucumberSalaryExampleApplication;
import com.fasterxml.jackson.databind.ObjectMapper;

@ContextConfiguration(
		  classes = CucumberSalaryExampleApplication.class
)
@WebAppConfiguration
@SpringBootTest
@AutoConfigureMockMvc
public class SpringIntegrationTest {

	@Autowired
	protected MockMvc mvc;
	
	protected ResultActions perform;
	
	
	protected String objectoToJsonString(final Object obj) {
	    try {
	        final ObjectMapper mapper = new ObjectMapper();
	        final String jsonContent = mapper.writeValueAsString(obj);
	        System.out.println(jsonContent);
	        return jsonContent;
	    } catch (Exception e) {
	        throw new RuntimeException(e);
	    }
	}
}