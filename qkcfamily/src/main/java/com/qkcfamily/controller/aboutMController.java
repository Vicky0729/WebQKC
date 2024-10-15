package com.qkcfamily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class aboutMController {

	
	@GetMapping("/aboutM.do")
	public String aboutM() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "aboutM";
	}
	@GetMapping("/aboutM_History.do")
	public String aboutM_History() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "aboutM_History";
	}
	@GetMapping("/aboutM_Export.do")
	public String aboutM_Export() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "aboutM_Export";
	}
	@GetMapping("/aboutM_Import.do")
	public String aboutM_Import() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "aboutM_Import";
	}
	@GetMapping("/aboutM_Im_pro.do")
	public String aboutM_Im_pro() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "aboutM_Im_pro";
	}
	@GetMapping("/aboutM_OEM.do")
	public String aboutM_OEM() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "aboutM_OEM";
	}
	@GetMapping("/aboutM_O_brand.do")
	public String aboutM_O_brand() {
		
		// 단순 페이지 이동 
		// 출력데이터 가져오기
		
		
		return "aboutM_O_brand";
	}
	
	
	
	
	
	
}
