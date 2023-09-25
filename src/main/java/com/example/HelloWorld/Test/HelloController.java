package com.example.HelloWorld.Test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	@GetMapping("/")
	public String index() {
		System.out.println("1");
		return "2";
	}

	@GetMapping("/getEclipse")
	public String getEclipse() {
		System.out.println("3");
		return "4";
	}
}
