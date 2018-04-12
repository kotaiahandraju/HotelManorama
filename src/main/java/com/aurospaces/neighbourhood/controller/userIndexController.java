package com.aurospaces.neighbourhood.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class userIndexController {
	
	@RequestMapping("/userindex")
public String userindex(HttpServletRequest request)
					{
		
		System.out.println("userindex");
		
						return "../../userindex";
					}

				}



