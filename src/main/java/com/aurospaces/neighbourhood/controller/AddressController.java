package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AddressController {
	
	@RequestMapping("/reach")
	public String reach()
	{
		System.out.println("Address page");
		return "reach";
	}

}
