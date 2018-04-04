package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class FacilitiesController {
		@RequestMapping("/facilities")
		public String facilities()
		{
			System.out.println("Facilities Page");
			return "facilities";
		}

	}



