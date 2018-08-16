package com.abeldevelop.cucumber.salaryexample.cucumber;

import org.junit.runner.RunWith;
import org.springframework.boot.jdbc.EmbeddedDatabaseConnection;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.test.context.ActiveProfiles;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@ActiveProfiles("test")
@AutoConfigureTestDatabase(connection=EmbeddedDatabaseConnection.H2)
@RunWith(Cucumber.class)
@CucumberOptions(
	features = "src/test/resources/features",
	glue = {"com.abeldevelop.cucumber.salaryexample.cucumber"}
)
public class CucumberTest {
	
	
}