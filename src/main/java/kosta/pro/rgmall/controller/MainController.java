package kosta.pro.rgmall.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.service.MainService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
public class MainController {

	private final MainService mainService;
	
	
	@RequestMapping("/goodsList/{main}/{sub}/{sort}")
	public ModelAndView goodsList(@PathVariable int main, @PathVariable int sub, @PathVariable int sort) {
		
		//List<RegisterGoods> registerGoodsList = mainService.selectAllGoods(main, sub, sort);
		
		ModelAndView mv = new ModelAndView("main/goodsList");
		return mv;
	}
	
}//class
