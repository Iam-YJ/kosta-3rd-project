package kosta.pro.rgmall.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kosta.pro.rgmall.domain.Notice;
import kosta.pro.rgmall.service.AdminService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main/cs")
@RequiredArgsConstructor
public class AdminController {
	private final AdminService service;
	
	
	/**
	 * 전체검색
	 */
	@RequestMapping("/notice")
	public void list(Model model) {
		List<Notice> list = service.selectAll();
		
		model.addAttribute("list", list);
		
	}
	
}//class