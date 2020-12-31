package kosta.pro.rgmall.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.Review;
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
		
		Pageable pageable = PageRequest.of(0, 4);
		
		//Banner화면을 위한 광고상품 불러오기
		List<RegisterGoods> registerGoodsADList = adminService.selectGoods(1);
		mv.addObject("registerGoodsADList",registerGoodsADList);
		
		//Best상품(과일/채소/잡곡/견과류)
		Page<RegisterGoods> bestFruit = mainService.selectAllGoods(1L, 0L, 2, pageable);
		mv.addObject("bestFruit",bestFruit.getContent());
		
		Page<RegisterGoods> bestVegetable = mainService.selectAllGoods(2L, 0L, 2, pageable);
		mv.addObject("bestVegetable",bestVegetable.getContent());
		
		Page<RegisterGoods> bestGrain = mainService.selectAllGoods(3L, 0L, 2, pageable);
		mv.addObject("bestGrain",bestGrain.getContent());
		
		Page<RegisterGoods> bestNut = mainService.selectAllGoods(4L, 0L, 2, pageable);
		mv.addObject("bestNut",bestNut.getContent());
		
		//품절임박(과일/채소/잡곡/견과류)
		Page<RegisterGoods> soldFruit = mainService.selectAllGoods(1L, 0L, 4, pageable);
		mv.addObject("soldFruit",soldFruit.getContent());
		
		Page<RegisterGoods> soldVegetable = mainService.selectAllGoods(2L, 0L, 4, pageable);
		mv.addObject("soldVegetable",soldVegetable.getContent());
		
		Page<RegisterGoods> soldGrain = mainService.selectAllGoods(3L, 0L, 4, pageable);
		mv.addObject("soldGrain",soldGrain.getContent());
		
		Page<RegisterGoods> soldNut = mainService.selectAllGoods(4L, 0L, 4, pageable);
		mv.addObject("soldNut",soldNut.getContent());
		
		//리뷰 출력
		List<Review> reviewList = adminService.selectReview();
		mv.addObject("reviewList",reviewList);
		
		return mv;
	}

}//class
