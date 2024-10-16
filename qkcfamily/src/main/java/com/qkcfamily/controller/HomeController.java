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
	
	/*
	 * @PostMapping("/SearchService.do") public String
	 * SearchService(@RequestParam("search_str") String search_str, Model model){
	 * 
	 * ArrayList<Product> productList = productMapper.productSearch(search_str);
	 * 
	 * model.addAttribute("productList",productList);
	 * 
	 * return "detail"; }
	 */
	
	
	/*
	 * @GetMapping("/visitCount.do") public String VisitCount(){
	 * 
	 * LocalDate today = LocalDate.now();
	 * 
	 * 
	 * 
	 * }
	 */
	
	@GetMapping("/contactUs.do")
	public String contactUs() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "contactUs";
	}
	
	  
	      

	@GetMapping("/homeMain.do")
	   public String HomeMain(Model model) {

	      ArrayList<Popup> popupList = popupMapper.getPopup();
	      model.addAttribute("popupList", popupList);

	      return "homeMain";
	   }

	
	
}
