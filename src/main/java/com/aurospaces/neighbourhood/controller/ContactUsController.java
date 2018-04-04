package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ContactUsController {
	
			@RequestMapping("/contactus")
			public String contactus()
			{
				System.out.println("Contact Us Page");
				return "contact";
			}

		}




