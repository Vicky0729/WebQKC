package com.qkcfamily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class aboutMController {

	
	@GetMapping("/AboutUs/Company")
	public String aboutM() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "AboutUs/Company";
	}
	@GetMapping("/AboutUs/Export")
	public String aboutM_Export() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "AboutUs/Export";
	}
	@GetMapping("/AboutUs/History")
	public String aboutM_History() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "AboutUs/History";
	}
	@GetMapping("/AboutUs/Import")
	public String aboutM_Import() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "AboutUs/Import";
	}

	@GetMapping("/AboutUs/Oem")
	public String aboutM_OEM() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "AboutUs/Oem";
	}

	@GetMapping("/AboutUs/OurBrand")
	public String aboutM_Ourbrand() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기		
		
		return "AboutUs/OurBrand";	
	
	
	}
	
}
