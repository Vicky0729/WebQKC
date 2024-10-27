package com.qkcfamily.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qkcfamily.entity.Admin;
import com.qkcfamily.entity.Popup;
import com.qkcfamily.mapper.AdminMapper;
import com.qkcfamily.mapper.PopupMapper;

@Controller
public class AdminHomeController {

	@Autowired
	AdminMapper adminMapper;

	// 관리자 로그인 페이지
	@GetMapping("/admin")
	public String admin() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "admin";
	}

	// 관리자 메인 페이지 틀
	@PostMapping("/Adm/adminMain")
	public String adminMainPage(@RequestParam("admin_id") String admin_id, @RequestParam("admin_pw") String admin_pw,
			HttpSession session) {

		// DB에서 해당 admin_id에 해당하는 관리자 정보 가져오기 (해싱된 비밀번호 포함)
		Admin admin = adminMapper.getAdminById(admin_id);

		System.out.println("DB에서 가져온 비밀번호: " + admin.getAdmin_pw());
		System.out.println("입력한 비밀번호: " + admin_pw);
		System.out.println("비밀번호 일치 여부: " + BCrypt.checkpw(admin_pw, admin.getAdmin_pw()));

		// DB에 사용자 정보가 있고, 입력한 비밀번호가 해싱된 비밀번호와 일치하는지 확인
		if (admin != null && BCrypt.checkpw(admin_pw, admin.getAdmin_pw())) {
			// 로그인 성공
			session.setAttribute("admin", admin);
			return "Adm/adminMain"; // 로그인 성공 후 이동할 페이지
		} else {
			// 로그인 실패
			return "redirect:/admin"; // 로그인 실패 시 다시 로그인 페이지로 이동
		}
	}

	// 사용자 관리 페이지
	@GetMapping("/Adm/AdminList")
	public String userManagement(Model model) {

		// 원래 DB에 있는 게시글 정보 가져오기
		ArrayList<Admin> adminList = adminMapper.getAdminList();

		// 객체 바인딩 -> Spring에서 제공하는 Model 객체 활용
		model.addAttribute("adminList", adminList);

		return "Adm/AdminList";
	}

	// 관리자 추가 기능
	@PostMapping("Adm/admin/1")
	public String addAdmin(Admin admin) {

		// 비밀번호를 해싱
		String hashedPassword = BCrypt.hashpw(admin.getAdmin_pw(), BCrypt.gensalt());

		// 해싱된 비밀번호를 admin 객체에 다시 설정
		admin.setAdmin_pw(hashedPassword);

		// Mapper를 통해 데이터베이스에 저장
		adminMapper.addAdmin(admin);

		return "redirect:/Adm/AdminList";
	}

	// 관리자 수정 기능
	@PostMapping("Adm/admin/2")
	public String updateAdmin(Admin admin) {

		// 현재 데이터베이스에 저장된 기존 Admin 정보 가져오기
		Admin currentAdmin = adminMapper.getAdminById(admin.getAdmin_id());

		if (admin.getAdmin_pw() != null && !admin.getAdmin_pw().isEmpty()) {
			// 비밀번호가 입력된 경우에만 해싱 후 업데이트
			String hashedPassword = BCrypt.hashpw(admin.getAdmin_pw(), BCrypt.gensalt());
			admin.setAdmin_pw(hashedPassword);
		} else {
			// 비밀번호가 입력되지 않았으면 기존 비밀번호 유지
			admin.setAdmin_pw(currentAdmin.getAdmin_pw());
		}

		// 최종 업데이트 쿼리 실행
		adminMapper.updateAdmin(admin);
		return "redirect:/Adm/AdminList";
	}

	// 관리자 삭제 기능
	@PostMapping("Adm/admin/3")
	public String deleteAdmin(@RequestParam("admin_id") String adminId) {
		adminMapper.deleteAdminById(adminId); // MyBatis Mapper에서 해당 admin_id 삭제
		return "redirect:/Adm/AdminList"; // 삭제 후 관리자 목록 페이지로 리디렉션
	}

	// 대쉬보드 페이지
	@GetMapping("Adm/dashboard")
	public String DashboardPage() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "Adm/Dashboard";
	}

	@GetMapping("Adm/PopupList")
	public String PopupListPage(Model model) {

		ArrayList<Popup> popupList = adminMapper.getPopupList();
		model.addAttribute("popupList", popupList);

		return "Adm/PopupList";
	}

	// 팝업 추가 기능
	@PostMapping("Adm/popup/1")
	public String addPopup(Popup popup) {

		System.out.println("팝업추가진입");
		adminMapper.addPopup(popup);

		return "redirect:/Adm/PopupList";
	}

	// 팝업 수정 기능
	@PostMapping("Adm/popup/2")
	public String updatePopup(Popup popup) {

		// 최종 업데이트 쿼리 실행
		adminMapper.updatePopup(popup);
		return "redirect:/Adm/PopupList";
	}
	
	
	// 팝업 삭제 기능
		@PostMapping("Adm/popup/3")
		public String deletePopup(@RequestParam("pop_idx") String pop_idx) {
			adminMapper.deletePopupById(pop_idx); // MyBatis Mapper에서 해당 admin_id 삭제
			return "redirect:/Adm/PopupList"; // 삭제 후 관리자 목록 페이지로 리디렉션
		}

	@GetMapping("Adm/Popup")
	public String PopupPage() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "Adm/Popup";
	}

	@GetMapping("Adm/ProductList")
	public String ProductListPage() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "Adm/ProductList";
	}

	@GetMapping("Adm/Products")
	public String ProductsPage() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "Adm/Products";
	}

	@GetMapping("Adm/Content")
	public String ContentPage() {

		// 단순 페이지 이동
		// 출력데이터 가져오기

		return "Adm/Content";
	}

}
