package com.qkcfamily.controller;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qkcfamily.entity.Popup;
import com.qkcfamily.entity.Product;
import com.qkcfamily.mapper.PopupMapper;
import com.qkcfamily.mapper.ProductMapper;

@Controller
public class HomeController {

	@Autowired
	ProductMapper productMapper;
	
	 @Autowired
	 PopupMapper popupMapper;
	
	@GetMapping("/homeMain.do")
	public String HomeMain(Model model) {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "homeMain";
	}
	
	@GetMapping("/contactUsPage.do")
	public String contactUs() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "ContactUs/contactUs";
	}
	
	  
	      

	   @GetMapping("/HomeMain.do")
	   public String boardDetail(Model model) {

	      Popup popup = popupMapper.getPopup();
	      model.addAttribute("popup", popup);

	      return "homeMain";
	   }
	   
	   @GetMapping("/aboutUsPage.do")
	   public String aboutUs(){
		   
		   return "AboutUs/Company";
		   
	   }

	@GetMapping("/ProductsPage.do")
	public String Products(){
		
		
		return "Products/Main";
	}
	
	@GetMapping("/NewsPage.do")
	public String News() {
		
		return "News/News";
	}
	
	
}
