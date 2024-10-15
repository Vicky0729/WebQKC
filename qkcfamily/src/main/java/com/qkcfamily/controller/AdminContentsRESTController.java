package com.qkcfamily.controller;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.qkcfamily.entity.Product;
import com.qkcfamily.mapper.ProductMapper;

@RestController
public class AdminContentsRESTController {

	@Autowired
	ProductMapper productMapper;

	@PostMapping("/EditProduct.do")
	public Product EditProduct(@RequestParam("productIdx") int pd_idx) {

		Product EditList = productMapper.EditProduct(pd_idx);

		Gson gson = new GsonBuilder().create();

		gson.toJson(EditList);

		return EditList;

	}

	@PostMapping("/UpdateProduct.do")
	public String updateProduct(Product product) {


		productMapper.updateProduct(product);

		return "success"; // 클라이언트에게 성공 응답 반환
	}
	
	
	@PostMapping("/InsertProducts.do")
	 public String insertProducts(Product product) {
		 
		
		
		 System.out.println("컨트롤러 도착");
		 
	  productMapper.InsertProduct(product);
		 
		 
		return "success";
		 
	 }

}
