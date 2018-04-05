package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class DiningController 
{
	@RequestMapping("/dining")
			public String dining()
			{
				System.out.println("dining Page");
				return "dining";
			}

		}



