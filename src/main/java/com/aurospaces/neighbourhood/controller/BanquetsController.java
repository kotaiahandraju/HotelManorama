package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BanquetsController {
		@RequestMapping("/meetings")
		public String meetings()
		{
			System.out.println("Meetings Page");
			return "meetings";
		}

	}



