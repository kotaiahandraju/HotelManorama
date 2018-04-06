package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EnquiryController {
	
@RequestMapping("/enquiry")
						public String enquiry()
						{
							System.out.println("Enquiry Page");
							return "enquiry";
						}

					}


