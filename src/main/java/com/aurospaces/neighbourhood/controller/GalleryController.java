package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class GalleryController {
	
	@RequestMapping("/gallery")
				public String gallery()
				{
					System.out.println("Gallery Page");
					return "gallery";
				}

			}



