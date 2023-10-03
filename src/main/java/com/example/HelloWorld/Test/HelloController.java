package com.example.HelloWorld.Test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	@GetMapping("/")
	public String index() {
		System.out.println("Get Eclipse Hello World / method");
		return "Get Eclipse Hello World One / method";
	}

	@GetMapping("/getEclipse")
	public String getEclipse() {
		System.out.println("Get Eclipse Hello World /getEclipse method");
		return "Get Eclipse Hello World One /getEclipse method";
	}
}
