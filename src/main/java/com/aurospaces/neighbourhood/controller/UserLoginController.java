package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserLoginController {
	@RequestMapping("/userlogin")
	public String userLogin()
	{
		System.out.println("UserLogin Page");
		return "login";
	}

}
