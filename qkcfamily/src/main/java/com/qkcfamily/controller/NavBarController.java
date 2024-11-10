package com.qkcfamily.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.qkcfamily.entity.News;
import com.qkcfamily.mapper.NewsMapper;

@Controller
public class NavBarController {
	
    @Autowired
    private NewsMapper newsMapper;

    @GetMapping("Adm/NavBar")
    public String showNavBar() {
        return "Adm/NavBar";  // NavBar.jsp 경로
    }
    
    @GetMapping("/aboutUs")
    public String showAboutUs() {
    	return "AboutUs/AboutUs";
    }
    
    @GetMapping("/news")
    public String showNewsList(Model model) {
        List<News> newsList = newsMapper.getAllNews();
        System.out.println("News List: " + newsList);
        model.addAttribute("newsList", newsList);
        return "News/News";
    }
    
    
    @GetMapping("Adm/NewsForm")
    public String NewsFromPage() {
    	return "Adm/NewsForm";
    }
    
    
    @PostMapping("Adm/NewsForm/1")
	public String addNews(News news) {
		newsMapper.insertNews(news);

		return "redirect:/Adm/NavBar";
	}
    
    
    @GetMapping("Adm/UpNewsForm/{news_idx}")
    public String editNews(@PathVariable("news_idx") int newsIdx, Model model) {
        News news = newsMapper.getNewsById(newsIdx);
        model.addAttribute("newsOne", news);
        return "Adm/UpNewsForm";
    }
    
    @PostMapping("/Adm/updateNews")
    public String updateNews(@RequestParam("news_idx") int newsIdx,
                             @RequestParam("news_title") String newsTitle,
                             @RequestParam("news_content") String newsContent,
                             @RequestParam("news_img") String newsImg) {

        // 기존 뉴스 정보 불러오기 (선택사항)
        News news = newsMapper.getNewsById(newsIdx);
        news.setNews_title(newsTitle);
        news.setNews_content(newsContent);
        news.setNews_img(newsImg);

        // 뉴스 업데이트
        newsMapper.updateNews(news);
        
        return "redirect:/Adm/NavBar";
    }
    
    @PostMapping("Adm/deleteNews/{news_idx}")
    public String deleteNews(@PathVariable("news_idx") int newsIdx) {
        newsMapper.deleteNewsById(newsIdx);
        return "redirect:/Adm/NavBar"; // 삭제 성공 시 반환
    }
    
    
    
    
    
}
