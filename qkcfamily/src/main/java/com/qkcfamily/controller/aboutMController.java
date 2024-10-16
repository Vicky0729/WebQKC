package com.qkcfamily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class aboutMController {

	
	@GetMapping("/AboutUsPage.do/{page}")
	public String AboutUsPage(@PathVariable("page")String page){
		
		if("History".equals(page)){
			return "AboutUs/History";
		}else if("Export".equals(page)){
			return "AboutUs/Export";
		}else if("Import".equals(page)){
			return "AboutUs/Import";
		}else if("Oem".equals(page)){
			return "AboutUs/Oem";
		}else if("OurBrand".equals(page)){
			return "AboutUs/OurBrand";
		}else if("Company".equals(page)){
			return "AboutUs/Company";
		}else {
			return "error/404";
		}
		
		
		
		
	}
	
	
	
	
	
	
}
