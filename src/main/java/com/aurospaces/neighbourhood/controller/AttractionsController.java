package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttractionsController {
	
	@RequestMapping("/attractions")
	public String attractions()
	{
		System.out.println("Attractions page");
		return "attractions";
	}
	

}
