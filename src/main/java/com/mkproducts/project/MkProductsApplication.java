package com.mkproducts.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

@SpringBootApplication
public class MkProductsApplication {

	public static void main(String[] args) {
		SpringApplication.run(MkProductsApplication.class, args);
		System.out.println("MSR Products is ready to use........!");
		
	}

	
	 @Bean
	    public ObjectMapper objectMapper() {
	        ObjectMapper mapper = new ObjectMapper();
	        mapper.registerModule(new JavaTimeModule());
	        mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
	        return mapper;
	    }
}
