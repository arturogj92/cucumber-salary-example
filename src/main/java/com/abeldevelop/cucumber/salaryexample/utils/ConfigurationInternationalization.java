package com.abeldevelop.cucumber.salaryexample.utils;

import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
public class ConfigurationInternationalization implements WebMvcConfigurer{

	@Bean
	public LocaleResolver localeResolver() {
	    SessionLocaleResolver slr = new SessionLocaleResolver();
	    slr.setDefaultLocale(Locale.US);
	    return slr;
	}
	
	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor(Locale locale) {
		log.error("AFG 2 => " + locale);
	    LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
	    lci.setParamName("Accept-Language");
	    return lci;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		log.error("AFG 1 => " + LocaleContextHolder.getLocale());
	    registry.addInterceptor(localeChangeInterceptor(LocaleContextHolder.getLocale()));
	}
}
