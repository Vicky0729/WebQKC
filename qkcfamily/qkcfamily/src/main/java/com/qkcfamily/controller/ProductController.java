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

	// 제품 메인 페이지
	@GetMapping("/Products/Main")
	public String pdMainPage() {

		return "Products/Main";
	}

	// 버섯 제품 페이지
	@GetMapping("/Products/Mushroom")
	public String MushroomPage() {

		return "Products/Mushroom";
	}

	// 식료품 페이지
	@GetMapping("/Products/Groceries")
	public String GroceriesPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		final int PAGE_SIZE = 16;
		int offset = (page - 1) * PAGE_SIZE;
		List<Product> List = productMapper.getGroceriesList(offset, PAGE_SIZE);
		int Count = productMapper.getGroceriesCount();
		int totalPages = (int) Math.ceil((double) Count / PAGE_SIZE);

		model.addAttribute("groceriesList", List);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "Products/Groceries";
	}

	// "상온" 식료품 페이지
	@GetMapping("/Products/G_ambient")
	public String G_ambientPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		final int PAGE_SIZE = 16;
		int offset = (page - 1) * PAGE_SIZE;
		List<Product> List = productMapper.getAmbientList(offset, PAGE_SIZE);
		int Count = productMapper.getAmbientCount();
		int totalPages = (int) Math.ceil((double) Count / PAGE_SIZE);

		model.addAttribute("List", List);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "Products/G_ambient";
	}

	// "냉장" 식료품 페이지
	@GetMapping("/Products/G_fresh")
	public String G_freshPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		final int PAGE_SIZE = 16;
		int offset = (page - 1) * PAGE_SIZE;
		List<Product> List = productMapper.getFreshList(offset, PAGE_SIZE);
		int Count = productMapper.getFreshCount();
		int totalPages = (int) Math.ceil((double) Count / PAGE_SIZE);

		model.addAttribute("List", List);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "Products/G_fresh";
	}

	// "냉장" 식료품 페이지
	@GetMapping("/Products/G_frozen")
	public String G_frozenPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		final int PAGE_SIZE = 16;
		int offset = (page - 1) * PAGE_SIZE;
		List<Product> List = productMapper.getFrozenList(offset, PAGE_SIZE);
		int Count = productMapper.getFrozenCount();
		int totalPages = (int) Math.ceil((double) Count / PAGE_SIZE);

		model.addAttribute("List", List);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "Products/G_frozen";
	}

	// 제과 제품 페이지
	@GetMapping("/Products/Snack")
	public String SnackPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

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

	// "쿠키류" 제과 페이지
	@GetMapping("/Products/S_cookies")
	public String S_cookiesPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		final int PAGE_SIZE = 16;
		int offset = (page - 1) * PAGE_SIZE;
		List<Product> List = productMapper.getCookiesList(offset, PAGE_SIZE);
		int Count = productMapper.getCookiesCount();
		int totalPages = (int) Math.ceil((double) Count / PAGE_SIZE);

		model.addAttribute("List", List);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "Products/S_cookies";
	}

	// "스낵류" 제과 페이지
	@GetMapping("/Products/S_snacks")
	public String S_snackPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		final int PAGE_SIZE = 16;
		int offset = (page - 1) * PAGE_SIZE;
		List<Product> List = productMapper.getSnacksList(offset, PAGE_SIZE);
		int Count = productMapper.getSnacksCount();
		int totalPages = (int) Math.ceil((double) Count / PAGE_SIZE);

		model.addAttribute("List", List);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "Products/S_snacks";
	}

	// "비스켓류" 제과 페이지
	@GetMapping("/Products/S_biscuits")
	public String S_biscuitsPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		final int PAGE_SIZE = 16;
		int offset = (page - 1) * PAGE_SIZE;
		List<Product> List = productMapper.getBiscuitsList(offset, PAGE_SIZE);
		int Count = productMapper.getBiscuitsCount();
		int totalPages = (int) Math.ceil((double) Count / PAGE_SIZE);

		model.addAttribute("List", List);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "Products/S_biscuits";
	}

	// 기타 제품 페이지
	@GetMapping("/Products/Etc")
	public String EtcPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		final int PAGE_SIZE = 16;
		int offset = (page - 1) * PAGE_SIZE;
		List<Product> List = productMapper.getEtcList(offset, PAGE_SIZE);
		int Count = productMapper.getEtcCount();
		int totalPages = (int) Math.ceil((double) Count / PAGE_SIZE);

		model.addAttribute("List", List);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "Products/Etc";
	}
	
	// 수입품 페이지
	@GetMapping("/ImportBusiness/Product")
	public String ImportPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		final int PAGE_SIZE = 16;
		int offset = (page - 1) * PAGE_SIZE;
		List<Product> List = productMapper.getImportList(offset, PAGE_SIZE);
		int Count = productMapper.getImportCount();
		int totalPages = (int) Math.ceil((double) Count / PAGE_SIZE);

		model.addAttribute("List", List);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		
		return "ImportBusiness/Product";
	}

	@PostMapping("/Common/HeadSearch")
	public String p_search(@RequestParam("search_str") String searchProduct, Model model) {

	
		ArrayList<Product> SearchList = productMapper.productSearch(searchProduct);
		int SearchCount = productMapper.SearchCount(searchProduct);
		model.addAttribute("SearchList", SearchList);
		model.addAttribute("searchProduct", searchProduct);
		model.addAttribute("SearchCount",SearchCount);
		return "Common/HeadSearch";
	}

	@GetMapping("/Products/productDetail")
	public String DetailPage() {

		return "Products/productDetail";
	}
}
