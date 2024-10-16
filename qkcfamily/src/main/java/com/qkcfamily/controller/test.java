package com.qkcfamily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class test {

	    
	    @GetMapping("/exportPage")
	    public String showExportPage() {
	        return "AboutUs/Export";  // JSP 경로 반환 (prefix, suffix 제외)
	    }
	    
	    @GetMapping("/Adm/LoginMain")
	    public String showExpotPage() {
	        return "Adm/LoginMain";  // JSP 경로 반환 (prefix, suffix 제외)
	    }
	    
	    @GetMapping("/showPage")
	    public String showPage() {
			return "uploadLogo";
	    	
	    }
	    @GetMapping("/showAdmin")
	    public String showAdmin() {
			return "Adm/Products";
	    }
	    
	    @GetMapping("/TuploadLogo")
	    public String TuploadLogo() {
			return "uploadLogo";
	    	
	    }
	    
	    @GetMapping("/TuserManagement")
	    public String TuserManagement() {
			return "userManagement";
	    }
}
