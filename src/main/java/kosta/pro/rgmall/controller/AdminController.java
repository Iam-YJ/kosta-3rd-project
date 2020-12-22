package kosta.pro.rgmall.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.FAQ;
import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.Notice;
import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.SubCategories;
import kosta.pro.rgmall.service.AdminService;
import kosta.pro.rgmall.service.MainService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private final AdminService adminService;
	private final MainService mainService;
	private final MainCategories mainCategories;
	private final SubCategories subCategories;
	
	/**
	 * 관리자 마이페이지 - 상품등록
	 */
	@RequestMapping("/myPage/insertGoodsForm")
	public ModelAndView insertGoodsForm(Model model) {
			model.addAttribute("list", mainService.selectCategories());
		return new ModelAndView("myPage/adminInsertGoodsForm");
	}
	
	/**
	 * 관리자 마이페이지 - 판매상품목록 조회
	 */
	@RequestMapping("/myPage/goodsList")
	public ModelAndView goodsList() {
		return new ModelAndView("myPage/adminGoodsList");
	}
	
	/**
	 * 관리자 마이페이지 - 신규 주문조회
	 */
	@RequestMapping("/myPage/newOrderList")
	public ModelAndView newOrderList() {
		return new ModelAndView("myPage/adminNewOrderList");
	}
	
	/**
	 * 관리자 마이페이지 - 상품 배송조회
	 */
	@RequestMapping("/myPage/orderDeliveryList")
	public ModelAndView orderDeliveryList() {
		return new ModelAndView("myPage/adminOrderDeliveryList");
	}
	
	/**
	 * 관리자 마이페이지 - 환불신청 상품조회
	 */
	@RequestMapping("/myPage/orderRefundList")
	public ModelAndView orderRefundList() {
		return new ModelAndView("myPage/adminOrderRefundList");
	}
	
	/**
	 * 관리자 마이페이지 - 재고량 조회
	 */
	@RequestMapping("/myPage/goodsStockList")
	public ModelAndView goodsStockList() {
		return new ModelAndView("myPage/adminGoodsStockList");
	}
	
	/**
	 * 관리자 마이페이지 - 광고상품 조회
	 */
	@RequestMapping("/myPage/goodsADList")
	public ModelAndView goodsADList() {
		return new ModelAndView("myPage/adminGoodsADList");
	}
	
	/**
	 * 관리자 마이페이지 - 공지사항
	 */
	@RequestMapping("/myPage/noticeList")
	public ModelAndView noticeList() {
		return new ModelAndView("myPage/adminNoticeList");
	}
	
	/**
	 * 관리자 마이페이지 - FAQ
	 */
	@RequestMapping("/myPage/FAQList")
	public ModelAndView FAQList() {
		return new ModelAndView("myPage/adminFAQList");
	}
	
	/**
	 * 관리자 마이페이지 - 상품문의 내역
	 */
	@RequestMapping("/myPage/goodsQuestionList")
	public ModelAndView GoodsQuestionList() {
		return new ModelAndView("myPage/adminGoodsQuestionList");
	}
	
	/**
	 * 관리자 마이페이지 - 구매후기 내역
	 */
	@RequestMapping("/myPage/goodsReviewList")
	public ModelAndView GoodsReviewList() {
		return new ModelAndView("myPage/adminGoodsReviewList");
	}
	
	/**
	 * 관리자 마이페이지 - 상품 카테고리
	 */
	@RequestMapping("/myPage/categoryList")
	public ModelAndView categoryList() {
		return new ModelAndView("myPage/adminCategoryList");
	}
	
	/**
	 * 관리자 마이페이지 - 매출조회
	 */
	@RequestMapping("/myPage/profit")
	public ModelAndView profit() {
		return new ModelAndView("myPage/adminProfit");
	}
	
	/**
	 * 관리자 마이페이지 - 회원조회
	 */
	@RequestMapping("/myPage/clientList")
	public ModelAndView clientList() {
		return new ModelAndView("myPage/adminClientList");
	}
	
	/**
	 * 전체검색
	 */
	@RequestMapping("/notice")
	public void selectAllNotice(Model model) {
		List<Notice> list = mainService.selectAllNotice();
		
		model.addAttribute("list", list);
	}
	
	
	/**
	 * 전체 검색
	 */
	@RequestMapping("/list")
	public String selectAllFAQ(Model model) {
		List<FAQ> list = adminService.selectAllFAQ();
		/*
		 * for(FAQ f : list) { System.out.println(f); }
		 */
		model.addAttribute("list", list);
		/*
		 * page처리 Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC,
		 * "faqNo"); Page<FAQ> pageList = service.selectAll(pageable);
		 * 
		 * //pageList.getNumber() model.addAttribute("pageList" , pageList);
		 */
		return "main/cs/faq";
	}

	/*
	 * faq
	 */

	/*
	 * 수정완료하기
	 */
	@RequestMapping("/update")
	public String update(FAQ faq) {
		adminService.updateFAQ(faq);

		return "redirect:/board/read/"; // controller에서 controller 로 찾아 가는데 기존에 가지고있는 것은 버리고
	}

	/*
	 * 삭제하기
	 */
	@RequestMapping("/delete")
	public String delete(FAQ faq) {
		adminService.deleteFAQ(faq);

		return "redirect:/board/list";
	}

	@RequestMapping("myPage/main")
	public void adminMyPage() {
	};

	@PostMapping(value = "/subcategories")
	@ResponseBody
	public List<SubCategories> subCate(Long mainCateNo) {
		/*
		 * for(SubCategories s :mainService.selectSubCategories(mainCateNo)) {
		 * System.out.println(s.getSubCategoryName()); }
		 */
		return mainService.selectSubCategories(mainCateNo);
	}// subCate

	@PostMapping("myPage/insertGoods")
	public ModelAndView insertGoods(RegisterGoods registerGoods, Long mainCateNo, Long subCateNo,
			@RequestParam("tfile") MultipartFile tfile, @RequestParam("adfile") MultipartFile adfile) {

		String path = "C:\\Edu\\Spring\\SpringWork\\RGMALL\\src\\main\\webapp\\WEB-INF\\adimg";
		String tfileName = tfile.getOriginalFilename();
		String adfileName = adfile.getOriginalFilename();

		System.out.println("tfileName = " + tfileName);
		System.out.println("adfileName = " + adfileName);
		mainCategories.setMainCategoryNo(mainCateNo);
		subCategories.setSubCategoryNo(subCateNo);
		registerGoods.setSubCategories(subCategories);
		registerGoods.setMainCategories(mainCategories);
		registerGoods.setThumbnailImg(tfileName);
		registerGoods.setAdImg(adfileName);

		try {
			// 파일을 저장
			tfile.transferTo(new File(path + "/" + tfileName));
			adfile.transferTo(new File(path + "/" + adfileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

		adminService.insertGoods(registerGoods);

		return new ModelAndView("redirect:/admin/myPage/insertGoodsForm", "registerGoods", registerGoods);

	}// insertGoods
	
	//카테고리 수정 폼 띄우기
	@RequestMapping("/myPage/modiCategories")
	public ModelAndView modiCategories() {
		List<MainCategories> mainList = mainService.selectCategories();
		return new ModelAndView("admin/myPage/modiCategories", "list", mainList);
	}
	
	@RequestMapping("/myPage/insertMainCategory")
	public ModelAndView  insertMainCategory(MainCategories mainCategories) {
		 adminService.insertMainCategory(mainCategories);
		 List<MainCategories>mainList = mainService.selectCategories();
		 return new ModelAndView("admin/myPage/modiCategories", "list", mainList);
	}//insertMainCategory
	
	@RequestMapping("/myPage/insertSubCategory")
	public int insertSubCategory(SubCategories subCategories) {
		subCategories.getMainCategory();
		return adminService.insertSubCategory(subCategories);
	}//insertSubCategory
	
	@RequestMapping("/myPage/updateMainCategory")
	public int updateMainCategory(MainCategories mainCategories) {
		return adminService.updateMainCategory(mainCategories);
	}//updateMainCategory
	
	@RequestMapping("/myPage/updateSubCategory")
	public int updateSubCategory(SubCategories subCategories) {
		return adminService.updateSubCategory(subCategories);
	}//updateSubCategory
}// class
