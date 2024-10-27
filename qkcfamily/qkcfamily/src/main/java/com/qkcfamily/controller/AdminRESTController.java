package com.qkcfamily.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.qkcfamily.entity.Admin;
import com.qkcfamily.mapper.AdminMapper;

@RestController
public class AdminRESTController {

	
	   @Autowired
	   AdminMapper adminMapper;

	   @PostMapping(value = "/Adm/checkId", produces = "application/text; charset=UTF-8")
	   public String checkId(@RequestParam("admin_id") String adminId) {
	      int row = adminMapper.checkId(adminId);
	      if (row > 0)
	         return "중복";
	      else
	         return "중복아님";
	   }

	   @PostMapping(value = "/Adm/getAdminData", produces = "application/json; charset=UTF-8")
	   public String getAdminData(@RequestParam("admin_id") String adminId) {
	      Admin admin = adminMapper.getAdminById(adminId);
	      System.out.println(admin);
	       Gson gson = new Gson();
	       return gson.toJson(admin);  // Admin 객체를 JSON으로 변환하여 반환
	   }

	
	
}
