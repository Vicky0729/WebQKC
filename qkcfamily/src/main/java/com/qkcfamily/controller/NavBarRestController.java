package com.qkcfamily.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.qkcfamily.entity.News;
import com.qkcfamily.mapper.NewsMapper;

@RestController
public class NavBarRestController {
	
	@Autowired
	private NewsMapper newsMapper;
	
	// DB에서 뉴스 목록 불러온 요청 처리
	@GetMapping("/api/nav/news")
	public List<News> getNewsList() {
		return newsMapper.getAllNews();
	}
	
	
	@GetMapping("/api/nav/about")
	public String loadAboutUs() {
	     return "AboutUs/AboutUs"; // About Us JSP 경로
	 }
	
	
	
	
	

}
