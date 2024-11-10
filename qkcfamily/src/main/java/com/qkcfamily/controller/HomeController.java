package com.qkcfamily.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qkcfamily.entity.News;
import com.qkcfamily.entity.Popup;
import com.qkcfamily.entity.Product;
import com.qkcfamily.entity.Visit;
import com.qkcfamily.mapper.NewsMapper;
import com.qkcfamily.mapper.PopupMapper;
import com.qkcfamily.mapper.ProductMapper;
import com.qkcfamily.mapper.VisitMapper;

@Controller
public class HomeController {

	@Autowired
	ProductMapper productMapper;

	@Autowired
	PopupMapper popupMapper;

	@Autowired
	VisitMapper visitMapper;

	@Autowired
	NewsMapper newsMapper;

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
	/* 10/21 homemain 상단메뉴 추가 부분 */
	@GetMapping("/ImpotBusiness/Product")
	public String impotBusiness() {
		// 단순 페이지 이동
		// 출력데이터 가져오기
		return "ImpotBusiness/Product";
	}

	@GetMapping("/News/News")
	public String news(Model model) {
		List<News> newsList = newsMapper.getAllNews();
		System.out.println("News List: " + newsList);
		model.addAttribute("newsList", newsList);
		return "News/News";
	}

	@GetMapping("/ContactUs/contactUs")
	public String contactUs() {
		// 단순 페이지 이동
		// 출력데이터 가져오기
		return "ContactUs/contactUs";
	}
	/* 10/21 homemain 상단메뉴 추가 부분 */

	@GetMapping("/")
	public String HomeMain(Model model) {

		ArrayList<Product> bestList = productMapper.bestProduct();

		ArrayList<Popup> popupList = popupMapper.getPopup();

		// 오늘 날짜를 java.sql.Date로 변환
		Date today = Calendar.getInstance().getTime();
		java.sql.Date sqlDate = new java.sql.Date(today.getTime());

		// 오늘의 방문자 수 조회 (존재 여부 확인)
		Visit todayVisit = visitMapper.selectVisitByDate(sqlDate);
		System.out.println("조회 결과: " + todayVisit);

		if (todayVisit == null) {
			// 오늘 날짜에 해당하는 데이터가 없을 경우에만 새로 추가
			todayVisit = new Visit();
			todayVisit.setVisit_date(sqlDate);
			todayVisit.setVisit_count(1);
			visitMapper.insertVisit(todayVisit);
		} else {
			// 이미 존재할 경우 방문자 수 업데이트만 수행
			int updatedCount = todayVisit.getVisit_count() + 1;
			visitMapper.updateVisitCount(sqlDate, updatedCount);
		}

		model.addAttribute("popupList", popupList);
		model.addAttribute("bestList", bestList);
		return "homeMain";
	}

}
