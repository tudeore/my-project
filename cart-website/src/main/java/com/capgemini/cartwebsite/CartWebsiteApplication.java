package com.capgemini.cartwebsite;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
public class CartWebsiteApplication {

	public static void main(String[] args) {
		SpringApplication.run(CartWebsiteApplication.class, args);
	}

	@Bean
	public RestTemplate getRestTemplate() {
		
		return new RestTemplate();
	}
}

