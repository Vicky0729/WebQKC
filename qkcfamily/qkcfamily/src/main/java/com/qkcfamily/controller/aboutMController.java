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
	@GetMapping("/AboutUs/CEO")
	public String aboutM_CEO() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "AboutUs/CEO";
	}
	@GetMapping("/AboutUs/CIBrand")
	public String aboutM_CIBrand() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "AboutUs/CIBrand";
	}
	@GetMapping("/AboutUs/Import")
	public String aboutM_Import() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "AboutUs/Import";
	}

	
	/*
	 * @GetMapping("/ContactUs/contactUs") public String contactUsPage() {
	 * 
	 * // 단순 페이지 이동 // 출력데이터 가져오기
	 * 
	 * 
	 * return "ContactUs/contactUs"; }
	 */

	@GetMapping("/AboutUs/OurBrand")
	public String aboutM_Ourbrand() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기		
		
		return "AboutUs/OurBrand";	
	
	
	}
	
}
