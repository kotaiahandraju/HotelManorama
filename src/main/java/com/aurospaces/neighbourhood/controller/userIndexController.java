package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class userIndexController {
	
	@RequestMapping("/userindex")
					public String userindex()
					{
						System.out.println("Home Page");
						return "userindex";
					}

				}



