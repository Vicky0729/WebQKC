package com.qkcfamily.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qkcfamily.entity.Product;
import com.qkcfamily.mapper.ProductMapper;

@Controller
public class AdminContentsController {
	
	@Autowired
	ProductMapper productMapper;
	
	@GetMapping("/contentsManagement.do")
	public String contentsManagement() {
		
		
		
		
		return "contentsManagement";
	}
	
	@GetMapping("/editPage.do/{pageName}")
	public String loadPageContent(@PathVariable("pageName") String pageName,Model model) {
		
		System.out.println(pageName);
		
		if ("edit_mushroom".equals(pageName)) {
			ArrayList<Product> mushroomList = productMapper.allMushroom();
			model.addAttribute("mushroomList", mushroomList);
			
            return "editViews/Editmushroom";  // edit_aboutM.jsp로 연결
        } else if ("edit_snack".equals(pageName)) {
        	
        	ArrayList<Product> snackList = productMapper.allSnack();
			model.addAttribute("snackList", snackList);
        	
            return "editViews/Editsnack";  // edit_products.jsp로 연결
        } else if ("edit_foodstuffs".equals(pageName)) {
        	
        	ArrayList<Product> foodStuffsList = productMapper.allFoodStuffs();
			model.addAttribute("foodStuffsList", foodStuffsList);
        	
            return "editViews/Editfoodstuffs";  // edit_news.jsp로 연결
        } else if ("edit_import".equals(pageName)) {
        	
        	System.out.println("도착");
        	ArrayList<Product> importList = productMapper.allImport();
			model.addAttribute("importList", importList);
        	
            return "editViews/Editimport";  // edit_contactUs.jsp로 연결
        } else if("edit_etc".equals(pageName)) {
        	
        	ArrayList<Product> EtcList = productMapper.allEtc();
			model.addAttribute("EtcList", EtcList);
        	
        	return "editViews/Editetc";
        }else{
        	return "error/404";
        } 
        
		
		
		
		
	}
	
	
	
}
