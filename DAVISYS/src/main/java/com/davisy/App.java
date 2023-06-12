package com.davisy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.davisy.controller.ErrorControllerHandle;

@SpringBootApplication
public class App {
	public static void main(String[] args) {
		SpringApplication.run(App.class, args);
	}
	
	@Bean
	public ErrorControllerHandle errorControllerHandle() {
		return new ErrorControllerHandle();
	}
}