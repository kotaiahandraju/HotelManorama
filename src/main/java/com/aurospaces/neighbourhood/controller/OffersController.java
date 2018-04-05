package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OffersController {
	
				@RequestMapping("/offers")
					public String offers()
					{
						System.out.println("Offers Page");
						return "offers";
					}

				}



