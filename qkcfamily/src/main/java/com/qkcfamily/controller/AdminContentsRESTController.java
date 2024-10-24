package com.qkcfamily.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

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
import com.qkcfamily.entity.Product;
import com.qkcfamily.mapper.ProductMapper;
import com.qkcfamily.mapper.ScrapMapper;

@RestController
public class AdminContentsRESTController {

	@Autowired
	ProductMapper productMapper;

	@Autowired
    private ScrapMapper scrapMapper;

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
	
	@DeleteMapping("Adm/deleteProduct/{productIdx}")
	public void deleteProduct(@PathVariable("productIdx")int pd_idx){
		
		productMapper.deleteProduct(pd_idx);
		
	}
	
	
	

    // 스크랩 여부 확인 (아이콘 상태 초기화)
    @GetMapping("/scrap/status/{productId}")
    public Map<String, Boolean> isScrapped(@PathVariable int productId, HttpSession session) {
        String adminId = (String) session.getAttribute("admin_id");
        boolean isScrapped = scrapMapper.isScrapped(adminId, productId) > 0;

        Map<String, Boolean> response = new HashMap<>();
        response.put("scrapped", isScrapped);
        return response;
    }

    // 스크랩 추가
    @PostMapping("/scrap/add/{productId}")
    public String addScrap(@PathVariable int productId, HttpSession session) {
        String adminId = (String) session.getAttribute("admin_id");
        scrapMapper.addScrap(adminId, productId);
        return "스크랩 추가 성공";
    }

    // 스크랩 삭제
    @DeleteMapping("/scrap/remove/{productId}")
    public String removeScrap(@PathVariable int productId, HttpSession session) {
        String adminId = (String) session.getAttribute("admin_id");
        scrapMapper.removeScrap(adminId, productId);
        return "스크랩 삭제 성공";
    }
	
	
	

}
