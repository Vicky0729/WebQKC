package com.qkcfamily.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qkcfamily.entity.Product;
import com.qkcfamily.mapper.ProductMapper;
import com.qkcfamily.mapper.ScrapMapper;

@Controller
public class AdminContentsController {
	
	@Autowired
	ProductMapper productMapper;
	
	@Autowired
	ScrapMapper scrapMapper;
	
	
	@PostMapping("Adm/AdminProduct")
	public String loadPageContent(@RequestParam("selectedPage") String selectedPage,Model model) {
		
		System.out.println(selectedPage);
		
		if ("edit_mushroom".equals(selectedPage)) {
			ArrayList<Product> mushroomList = productMapper.allMushroom();
			model.addAttribute("ProductList", mushroomList);
			
            return "Adm/Content";  
        } else if ("edit_snack".equals(selectedPage)) {
        	
        	ArrayList<Product> snackList = productMapper.allSnack();
			model.addAttribute("ProductList", snackList);
        	
            return "Adm/Content";  
        } else if ("edit_foodstuffs".equals(selectedPage)) {
        	
        	ArrayList<Product> foodStuffsList = productMapper.allFoodStuffs();
			model.addAttribute("ProductList", foodStuffsList);
        	
            return "Adm/Content"; 
        } else if ("edit_import".equals(selectedPage)) {
        	
        	System.out.println("도착");
        	ArrayList<Product> importList = productMapper.allImport();
			model.addAttribute("ProductList", importList);
        	
            return "Adm/Content";  
        } else if("edit_etc".equals(selectedPage)) {
        	
        	ArrayList<Product> EtcList = productMapper.allEtc();
			model.addAttribute("ProductList", EtcList);
        	
        	return "Adm/Content";
        }else{
        	return "error/404";
        } 
        
		
		
		
		
	}
	
	@GetMapping("Adm/addProductPage")
	public String addProductPage(){
		
		
		return "Adm/Products";
	}
	
	
	
	@PostMapping("Adm/insertProduct")
	public String insertProduct(Product product){
		
		
		
		productMapper.InsertProduct(product);
		
		
		return "Adm/Content";
	}
	
	@GetMapping("Adm/updateProductPage")
	public String updateProductPage(@RequestParam("pd_idx") int pd_idx, Model model) {
	    
		Product	productOne =  productMapper.SelectById(pd_idx);
		
		model.addAttribute("productOne", productOne);
		
		return "Adm/ProductList";
	}
	
	@PostMapping("Adm/updateProduct")
	public String updateProduct(Product product){
		
		
		
		productMapper.updateProduct(product);
		
		
		return "Adm/Content";
	}
	

	
	
}
