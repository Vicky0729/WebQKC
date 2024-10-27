package com.qkcfamily.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.qkcfamily.entity.Admin;
import com.qkcfamily.entity.Product;
import com.qkcfamily.mapper.ProductMapper;

@RestController
public class AdminContentsRESTController {

	@Autowired
	ProductMapper productMapper;

	@DeleteMapping("Adm/deleteProduct/{productIdx}")
	public void deleteProduct(@PathVariable("productIdx")int pd_idx){
		
		productMapper.deleteProduct(pd_idx);
		
	}
	
	@DeleteMapping("Adm/deleteScrap/{productIdx}")
	public void deleteScrap(@PathVariable("productIdx")int pd_idx, HttpSession session){
		
		System.out.println("deleteScrap들어옴");
		
		Admin admin = (Admin) session.getAttribute("admin");
		String admin_id = admin.getAdmin_id();
		
		productMapper.deleteScrap(pd_idx, admin_id);
		
		
	}

	
	@GetMapping("Adm/addScrap/{productIdx}")
	public void addScrap(@PathVariable("productIdx")int pd_idx, HttpSession session) {
		
		System.out.println("addScrap들어옴");
		
		Admin admin = (Admin) session.getAttribute("admin");
		String admin_id = admin.getAdmin_id();
		
		productMapper.addScrap(pd_idx, admin_id);	
		
	}

}
