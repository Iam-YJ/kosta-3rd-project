package kosta.pro.rgmall.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kosta.pro.rgmall.domain.FAQ;
import kosta.pro.rgmall.service.AdminService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private final AdminService adminService;
	
	/**
	 *  전체 검색
	 * */
	@RequestMapping("/list")
	public String list(Model model) {
		List<FAQ> list = adminService.selectAllFAQ();
		/*for(FAQ f : list) {
			System.out.println(f);
		}*/
		model.addAttribute("list", list);
		/*page처리
		Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC, "faqNo");
		Page<FAQ> pageList = service.selectAll(pageable);
		
		//pageList.getNumber()
		model.addAttribute("pageList" , pageList);*/
		return "main/cs/faq";
	}
	
	/*
	 * faq 
	 * */
	
	
	/* 
	 *  수정완료하기
	 */
	@RequestMapping("/update")
	public String update(FAQ faq) {
		adminService.updateFAQ(faq);
		
		return "redirect:/board/read/";  //controller에서 controller 로 찾아 가는데 기존에 가지고있는 것은 버리고
	}
	
	/*
	 *  삭제하기
	 * */
	@RequestMapping("/delete")
	public String delete(FAQ faq) {
		adminService.deleteFAQ(faq);
		
		return "redirect:/board/list";
	}
	
	






}//class
