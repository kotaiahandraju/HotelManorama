package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AboutUsController {
	@RequestMapping("/aboutus")
	public String aboutus()
	{
		System.out.println("About Us Page");
		return "about";
	}

}
