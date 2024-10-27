package com.qkcfamily.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qkcfamily.entity.Admin;
import com.qkcfamily.entity.Product;
import com.qkcfamily.mapper.ProductMapper;

@Controller
public class AdminContentsController {
	
	@Autowired
	ProductMapper productMapper;
	
	
	
	@PostMapping("Adm/AdminProduct")
	public String loadPageContent(@RequestParam("selectedPage") String selectedPage,Model model ,HttpSession session) {
		
		System.out.println(selectedPage);
		
		Admin admin = (Admin) session.getAttribute("admin");
		String admin_id = admin.getAdmin_id();
		System.out.println(admin_id);
		if ("edit_mushroom".equals(selectedPage)) {
			
			
			ArrayList<Product> mushroomList = productMapper.allMushroom(admin_id);
			model.addAttribute("ProductList", mushroomList);
			
            return "Adm/Content";  // edit_aboutM.jsp로 연결
        } else if ("edit_snack".equals(selectedPage)) {
        	
        	ArrayList<Product> snackList = productMapper.allSnack(admin_id);
			model.addAttribute("ProductList", snackList);
        	
            return "Adm/Content";  // edit_products.jsp로 연결
        } else if ("edit_foodstuffs".equals(selectedPage)) {
        	
        	ArrayList<Product> foodStuffsList = productMapper.allFoodStuffs(admin_id);
			model.addAttribute("ProductList", foodStuffsList);
        	
            return "Adm/Content";  // edit_news.jsp로 연결
        } else if ("edit_import".equals(selectedPage)) {
        	
        	System.out.println("도착");
        	ArrayList<Product> importList = productMapper.allImport(admin_id);
			model.addAttribute("ProductList", importList);
        	
            return "Adm/Content";  // edit_contactUs.jsp로 연결
        } else if("edit_etc".equals(selectedPage)) {
        	
        	ArrayList<Product> EtcList = productMapper.allEtc(admin_id);
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
