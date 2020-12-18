package kosta.pro.rgmall.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.SubCategories;
import kosta.pro.rgmall.service.AdminService;
import kosta.pro.rgmall.service.MainService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	private final MainService mainService;
	private final  MainCategories mainCategories;
	private final  SubCategories subCategories;
	private final AdminService adminService;
	
	@RequestMapping("myPage/main")
	public void adminMyPage() {};
	
	@RequestMapping("myPage/insertGoodsForm")
	public void insertGoodsForm(Model model) {
		model.addAttribute("list", mainService.selectCategories());
	}//insertGoodsForm
	
	@PostMapping(value ="/subcategories")
	@ResponseBody
	public List<SubCategories> subCate(Long mainCateNo) {
		/*
		 * for(SubCategories s :mainService.selectSubCategories(mainCateNo)) {
		 * System.out.println(s.getSubCategoryName()); }
		 */
		return  mainService.selectSubCategories(mainCateNo);
	}//subCate
	
	
	@PostMapping("myPage/insertGoods")
	public ModelAndView insertGoods(RegisterGoods registerGoods, Long mainCateNo, Long subCateNo
			, @RequestParam("tfile") MultipartFile tfile  ,@RequestParam("adfile") MultipartFile adfile ) {
		
		String path ="C:\\Edu\\Spring\\SpringWork\\RGMALL\\src\\main\\webapp\\WEB-INF\\adimg";
		String tfileName =tfile.getOriginalFilename();
		String adfileName =adfile.getOriginalFilename();
		
System.out.println("tfileName = "+tfileName);
System.out.println("adfileName = "+adfileName);
		
		mainCategories.setMainCategoryNo(mainCateNo);
		subCategories.setSubCategoryNo(subCateNo);
		registerGoods.setSubCategories(subCategories);
		registerGoods.setMainCategories(mainCategories);
		registerGoods.setThumnailImg(tfileName);
		registerGoods.setAdImg(adfileName);
		
		try {
			//파일을 저장
			tfile.transferTo(new File(path+"/"+tfileName));
			adfile.transferTo(new File(path+"/"+adfileName));
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		adminService.insertGoods(registerGoods);
		
		return new ModelAndView("redirect:/admin/myPage/insertGoodsForm","registerGoods",registerGoods);
		
	}//insertGoods

}//class
