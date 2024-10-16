package com.qkcfamily.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qkcfamily.entity.Product;
import com.qkcfamily.mapper.ProductMapper;

	

@Controller
public class ProductController {

	@Autowired
	ProductMapper productMapper;
	
	
	@GetMapping("/ProductPage.do/{page}")
	public String ProductPage(@PathVariable("page") String page){
		
		
		if("mushRoom".equals(page)){
			return "Products/Mushroom";
		}else if("groceries".equals(page)){
			return "Products/Groceries";
		}else if("snack".equals(page)){
			return "Products/Snack";
		}else if("other".equals(page)){
			return "Products/Other";
		}else {
			return "error/404";
		}
		
		
		
		
		
		
	}
	
	@PostMapping("/p_search.do")
	public String p_search(@RequestParam("search_str")String search_str , Model model){
		
		System.out.println(search_str);
		ArrayList<Product> SearchList = productMapper.productSearch(search_str);
		System.out.println(SearchList);
		model.addAttribute("SearchList", SearchList);
		
		return "p_search";
	}
}
