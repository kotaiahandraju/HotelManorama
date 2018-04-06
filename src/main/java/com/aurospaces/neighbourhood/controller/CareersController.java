package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CareersController {
	@RequestMapping("/careers")
	public String careers()
	{
		System.out.println("Careers Page");
		return "careers";
	}

}
