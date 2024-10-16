package com.qkcfamily.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qkcfamily.entity.Product;
import com.qkcfamily.mapper.ProductMapper;

@Controller
public class ProductController {

	@Autowired
	ProductMapper productMapper;

	@GetMapping("/productsM.do")
	public String Products() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "productsM";
	}

	@GetMapping("/p_mushroom.do")
	public String p_mushroom() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "p_mushroom";
	}

	@GetMapping("/p_foodstuffs.do")
	public String p_foodstuffs() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "p_foodstuffs";
	}

	@GetMapping("/p_frozen.do")
	public String p_frozen() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "p_frozen";
	}

	@GetMapping("/p_roomtemp.do")
	public String p_roomtemp() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "p_roomtemp";
	}

	@GetMapping("/Products/Snack")
	public String getSnackList(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		final int PAGE_SIZE = 16;
		int offset = (page - 1) * PAGE_SIZE; // 페이지 번호에 맞춰 offset 계산
		List<Product> snackList = productMapper.getSnackList(offset, PAGE_SIZE);
		int totalSnackCount = productMapper.getTotalSnackCount();
		int totalPages = (int) Math.ceil((double) totalSnackCount / PAGE_SIZE);

		model.addAttribute("snackList", snackList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "Products/Snack";
	}

	@GetMapping("/p_etc.do")
	public String p_etc() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "p_etc";
	}

	@GetMapping("/p_importP.do")
	public String p_importP() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "p_importP";
	}

	@PostMapping("/p_search.do")
	public String p_search(@RequestParam("search_str") String search_str, Model model) {

		System.out.println(search_str);
		ArrayList<Product> SearchList = productMapper.productSearch(search_str);
		System.out.println(SearchList);
		model.addAttribute("SearchList", SearchList);

		return "p_search";
	}
}
