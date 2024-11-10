package com.qkcfamily.controller;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.qkcfamily.entity.Visit;
import com.qkcfamily.mapper.VisitMapper;

public class VisitController {

	 @Autowired
	    private VisitMapper visitMapper;

	   /* @GetMapping("/Adm/")
	    public String home(Model model) {
	        // 오늘 날짜 가져오기
	        Date today = Calendar.getInstance().getTime();

	        // 오늘의 방문자 수 가져오기
	        Visit todayVisit = visitMapper.selectVisitByDate(today);

	        if (todayVisit == null) {
	            // 오늘 데이터가 없으면 새로운 날짜로 데이터 추가
	            todayVisit = new Visit();
	            todayVisit.setVisitDate(null);
	            todayVisit.setVisitCount(1);
	            visitMapper.insertVisit(todayVisit);
	        } else {
	            // 오늘 데이터가 있으면 방문자 수 1 증가
	            int updatedCount = todayVisit.getVisitCount() + 1;
	            visitMapper.updateVisitCount(today, updatedCount);
	            todayVisit.setVisitCount(updatedCount);
	        }*/

		/*
		 * // 모델에 방문자 수 추가 model.addAttribute("visitCount", todayVisit.getVisitCount());
		 * 
		 * return "home"; // home.jsp 파일로 이동 }
		 */
	
}
