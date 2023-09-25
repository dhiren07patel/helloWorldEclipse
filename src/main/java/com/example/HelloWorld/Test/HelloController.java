package com.example.HelloWorld.Test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	@GetMapping("/")
	public String index() {
		System.out.println("\"Greetings from Spring Boot Eclipse! AND Deployed On Good cloud");
		return "Greetings from Spring Boot Eclipse! + Deployed On Good cloud";
	}

	@GetMapping("/getEclipse")
	public String getEclipse() {
		System.out.println("\"Greetings from Spring Boot Get Eclipse!\"");
		return "Greetings from Spring Boot Get Eclipse!";
	}
}
