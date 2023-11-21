package com.example.openshift.openshiftdemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@SpringBootApplication
public class OpenshiftDemoApplication {

	@GetMapping("/")
	public String getMessage(){
		return ("here i'am replying and working V6");
	}

	public static void main(String[] args) {
		SpringApplication.run(OpenshiftDemoApplication.class, args);
	}

}

