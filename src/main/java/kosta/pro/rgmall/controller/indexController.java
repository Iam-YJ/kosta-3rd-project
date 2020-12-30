package kosta.pro.rgmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.service.AdminService;
import kosta.pro.rgmall.service.MainService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public final class indexController {

	private final MainService mainService; 
	private final AdminService adminService;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("main/index");
		
		//Banner화면을 위한 광고상품 불러오기
		List<RegisterGoods> registerGoodsADList = adminService.selectGoods(1);
		mv.addObject("registerGoodsADList",registerGoodsADList);
		
		return mv;
	}

}//class
