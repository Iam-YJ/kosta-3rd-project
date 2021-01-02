package kosta.pro.rgmall.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hibernate.query.criteria.internal.expression.function.SubstringFunction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.Admin;
import kosta.pro.rgmall.domain.FAQ;
import kosta.pro.rgmall.domain.GoodsAnswer;
import kosta.pro.rgmall.domain.GoodsQuestion;
import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.Notice;
import kosta.pro.rgmall.domain.Orders;
import kosta.pro.rgmall.domain.Refund;
import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.Review;
import kosta.pro.rgmall.domain.SubCategories;
import kosta.pro.rgmall.domain.UserList;
import kosta.pro.rgmall.service.AdminService;
import kosta.pro.rgmall.service.MainService;
import lombok.RequiredArgsConstructor;
import oracle.net.aso.i;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

	private final AdminService adminService;
	private final MainService mainService;
	private final MainCategories mainCategories;
	private final SubCategories subCategories;

	private final MainController mainController;

	/**
	 * 관리자 마이페이지 - 상품등록폼 열기
	 */
	@RequestMapping("/myPage/insertGoodsForm")
	public ModelAndView insertGoodsForm(Model model) {
		model.addAttribute("list", mainService.selectCategories());
		return new ModelAndView("myPage/adminInsertGoodsForm");
	}

	/**
	 * 관리자 마이페이지 - 상품등록하기
	 */
	@PostMapping("myPage/insertGoods")
	public ModelAndView insertGoods(HttpSession session, RegisterGoods registerGoods, Long mainCateNo, Long subCateNo,
			@RequestParam("tfile") MultipartFile tfile, @RequestParam("adfile") MultipartFile adfile) {

		String realPath = session.getServletContext().getRealPath("/");

		String path = realPath + "/images";
		File Folder = new File(path);

		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		}

		path = realPath + "/images/thumbnail";
		Folder = new File(path);

		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		}

		path = realPath + "/images/banner";
		Folder = new File(path);

		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		}

		String currentTime = Long.toString(System.currentTimeMillis());

		String tfileName = currentTime + tfile.getOriginalFilename();
		String adfileName = currentTime + adfile.getOriginalFilename();
		RegisterGoods inRegisteGoods = new RegisterGoods(null, registerGoods.getTitle(), registerGoods.getDetail(),
				tfileName, adfileName, registerGoods.getName(), registerGoods.getOptions(), registerGoods.getArea(),
				registerGoods.getMethod(), registerGoods.getStock(), registerGoods.getPrice(), 0, registerGoods.getAd(),
				null, new MainCategories(mainCateNo), new SubCategories(subCateNo));
		RegisterGoods dbRegisteGoods = adminService.insertGoods(inRegisteGoods);

		try {
			tfile.transferTo(new File(realPath + "/images/thumbnail/" + tfileName));
			adfile.transferTo(new File(realPath + "/images/banner/" + adfileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return new ModelAndView("redirect:/main/goodsDetail/" + dbRegisteGoods.getRegNo());

	}// insertGoods

	/**
	 * 관리자 마이페이지 - 상품 수정하기 폼열기
	 */
	@RequestMapping("updateGoods/{regNo}")
	public ModelAndView updateGoodsForm(@PathVariable Long regNo) {
		
		RegisterGoods registerGoods = mainService.goodsDetail(regNo);
		
		ModelAndView mv = new ModelAndView("admin/updateGoodsForm", "registerGoods", registerGoods);
		mv.addObject("list", mainService.selectCategories());
		return mv;
	}
	
	/**
	 * 관리자 마이페이지 - 상품 수정하기
	 */
	@PostMapping("updateGoods/{regNo}")
	public ModelAndView updateGoods(HttpSession session, RegisterGoods registerGoods, Long mainCateNo, Long subCateNo, @PathVariable Long regNo,
			@RequestParam("tfile") MultipartFile tfile, @RequestParam("adfile") MultipartFile adfile) {

		String realPath = session.getServletContext().getRealPath("/");

		String path = realPath + "/images";
		File Folder = new File(path);

		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		}

		path = realPath + "/images/thumbnail";
		Folder = new File(path);

		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		}

		path = realPath + "/images/banner";
		Folder = new File(path);

		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} catch (Exception e) {
				e.getStackTrace();
			}
		}

		String currentTime = Long.toString(System.currentTimeMillis());
		String tfileName = currentTime + tfile.getOriginalFilename();
		String adfileName = currentTime + adfile.getOriginalFilename();
		
		registerGoods.setRegNo(regNo);
		registerGoods.setMainCategories(new MainCategories(mainCateNo));
		registerGoods.setSubCategories(new SubCategories(subCateNo));
		
		try {
			
			if(tfile.getSize() != 0) {
				System.out.println(1);
				System.out.println(tfileName);
				registerGoods.setThumbnailImg(tfileName);
				tfile.transferTo(new File(realPath + "/images/thumbnail/" + tfileName));
			}
			
			if(adfile.getSize() != 0) {
				System.out.println(2);
				System.out.println(adfileName);
				registerGoods.setAdImg(adfileName);
				adfile.transferTo(new File(realPath + "/images/banner/" + adfileName));
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		RegisterGoods dbRegisteGoods = adminService.updateGoodsDetail(registerGoods);
		
		return new ModelAndView("redirect:/main/goodsDetail/" + dbRegisteGoods.getRegNo());

	}// insertGoods
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 관리자 마이페이지 - 판매상품목록 조회
	 */
	@RequestMapping("/myPage/goodsList")
	public ModelAndView goodsList() {
		List<RegisterGoods> listRegisterGoods = adminService.selectGoods(0);
		return new ModelAndView("myPage/adminGoodsList", "listRegisterGoods", listRegisterGoods);
	}

	/**
	 * 관리자 마이페이지 - 신규 주문조회
	 */
	@RequestMapping("/myPage/newOrderList")
	public ModelAndView newOrderList() {

		List<Orders> orderList = adminService.selectOrders(1);
		return new ModelAndView("myPage/adminNewOrderList", "orderList", orderList);
	}

	/**
	 * 관리자 마이페이지 - 신규 주문조회 - 상품출고
	 */
	@RequestMapping("/myPage/newOrderList/goodsRelease/{orderNo}")
	public ModelAndView goodsRelease(@PathVariable Long orderNo) {

		adminService.updateDelState(orderNo);
		return new ModelAndView("redirect:/user/myPage");
	}

	/**
	 * 관리자 마이페이지 - 상품 배송조회
	 */
	@RequestMapping("/myPage/orderDeliveryList")
	public ModelAndView orderDeliveryList() {

		ModelAndView mv = new ModelAndView();

		// 0 지난주문 조회 1은 신규주문조회 2
		List<Orders> lastOrders = adminService.selectOrders(0); // 배송완료
		List<Orders> newOrders = adminService.selectOrders(1); // 배송준비중
		List<Orders> nowOrders = adminService.selectOrders(2); // 배송중
		
		mv.addObject("lastOrders", lastOrders);
		mv.addObject("newOrders", newOrders);
		mv.addObject("nowOrders", nowOrders);
		mv.setViewName("myPage/adminOrderDeliveryList");

		return mv;
	}

	/**
	 * 관리자 마이페이지 - 환불신청 상품조회
	 */
	@RequestMapping("/myPage/orderRefundList")
	public ModelAndView orderRefundList() {

		List<Refund> refundList = adminService.selectRefundGoods();

		return new ModelAndView("myPage/adminOrderRefundList", "refundList", refundList);
	}

	/**
	 * 관리자 마이페이지 - 환불승인
	 */
	@RequestMapping("/myPage/orderRefundList/accessRefund/{refundNo}")
	public ModelAndView accessRefund(@PathVariable Long refundNo) {

		adminService.refundGoods(refundNo, null, 0);

		return new ModelAndView("redirect:/user/myPage?state=1");
	}

	/**
	 * 관리자 마이페이지 - 환불신청 상품조회 - 환불거절
	 */
	@RequestMapping("/myPage/orderRefundList/rejectRefund/{refundNo}")
	public ModelAndView rejectRefund(@PathVariable Long refundNo, String refundReply) {

		adminService.refundGoods(refundNo, refundReply, 1);

		return new ModelAndView("redirect:/user/myPage?state=1");
	}

	/**
	 * 관리자 마이페이지 - 재고량 조회
	 */
	@RequestMapping("/myPage/goodsStockList")
	public ModelAndView goodsStockList() {
		List<RegisterGoods> list = adminService.selectGoods(2);
		return new ModelAndView("myPage/adminGoodsStockList", "list", list);
	}

	/**
	 * 관리자 마이페이지 - 재고량 수정
	 */
	@RequestMapping(value = "/myPage/updateGoods", method = RequestMethod.POST)
	public String updateGoods(RegisterGoods registerGoods) {
		adminService.updateGoods(registerGoods);
		return "redirect:/user/myPage";
	}

	/**
	 * 관리자 마이페이지 - 광고상품 조회
	 */
	@RequestMapping("/myPage/goodsADList")
	public ModelAndView goodsADList() {

		List<RegisterGoods> list = adminService.selectGoods(1);
		return new ModelAndView("myPage/adminGoodsADList", "list", list);
	}

	/**
	 * 관리자 마이페이지 - 광고상품 삭제
	 */
	@RequestMapping("/myPage/goodsADListDelete/{regNo}")
	public String deleteAdGoods(@PathVariable Long regNo) {
		adminService.deleteAdGoods(regNo);
		return "redirect:/user/myPage";
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

		List<GoodsQuestion> goodsQuestion = mainService.selectAllGoodsQuestion();
		List<GoodsAnswer> goodsAnswer = mainService.selectAllGoodsAnswer();

		ModelAndView mv = new ModelAndView();

		mv.addObject("GoodsQuestionList", goodsQuestion);
		mv.addObject("GoodsAnswerList", goodsAnswer);

		mv.setViewName("myPage/adminGoodsQuestionList");

		return mv;
	}

	/**
	 * 관리자 마이페이지 - 상품문의 내역 답변하기 regNo - 는 상품번호 userNo - 는 회원번호
	 */
	@RequestMapping("/myPage/goodsQuestionListAnswer/{regNo}")
	public String GoodsQuestionListAnswer(@PathVariable Long regNo, String refundReply) {

		GoodsQuestion goodsQuestion = new GoodsQuestion(regNo);
		GoodsAnswer goodsAnswer = new GoodsAnswer(refundReply, goodsQuestion);

		adminService.insertGoodsAnswer(goodsAnswer);

		return "redirect:/user/myPage?state=6";

	}

	@RequestMapping("/myPage/goodsQuestionUpdateAnswer/{agoodsNo}")
	public String GoodsQuestionUpdateAnswer(@PathVariable Long agoodsNo, String refundReply) {

		 adminService.updateGoodsAnswer(agoodsNo, refundReply);

		return "redirect:/user/myPage?state=6";

	}

	/**
	 * 관리자 마이페이지 - 구매후기 내역
	 */
	@RequestMapping("/myPage/goodsReviewList")
	public ModelAndView GoodsReviewList() {
		List<Review> review = adminService.selectReview();
		return new ModelAndView("myPage/adminGoodsReviewList", "review", review);
	}

	/**
	 * 관리자 마이페이지 - 상품 카테고리
	 */
	@RequestMapping("/myPage/categoryList")
	public ModelAndView categoryList() {
		return new ModelAndView("myPage/adminCategoryList");
	}

	/**
	 * 관리자 마이페이지 - 총매출조회
	 */
	@RequestMapping("/myPage/profit")
	public ModelAndView profit(String startDate, String endDate) {
		System.out.println();
		List<String> profit = adminService.checkProfit("2020-01-01", "2022-01-01");

		List<Integer> realProfit = new ArrayList<>();
		int comma = 0;
		Integer totalPay = 0;

		for (int i = 0; i < profit.size(); i++) {

			comma = profit.get(i).indexOf(",");
			totalPay = Integer.parseInt(profit.get(i).substring(comma + 1));
			realProfit.add(totalPay);
		}

		return new ModelAndView("myPage/adminProfit", "realProfit", realProfit);
	}

	/**
	 * 관리자 마이페이지 - 회원조회
	 */
	@RequestMapping("/myPage/clientList")
	public ModelAndView clientList() {

		List<UserList> sortGrade = adminService.searchAllUser(0);
		List<UserList> sortNo = adminService.searchAllUser(1);
		List<UserList> sortId = adminService.searchAllUser(2);
		ModelAndView mv = new ModelAndView();

		mv.addObject("sortGrade", sortGrade);
		System.out.println(sortGrade);
		mv.addObject("sortNo", sortNo);
		mv.addObject("sortId", sortId);
		mv.setViewName("myPage/adminClientList");
		return mv;
	}

	/**
	 * 관리자 로그인
	 */
	@RequestMapping("adminLogin")
	public String adminLogin(String adminId, String password, HttpSession session) {
		String result = null;
		Admin admin = adminService.adminLogin(adminId, password);
		if (admin == null) {
			result = "main/loginFail";
		} else {
			session.setAttribute("userList", admin);
			result = "redirect:/";
		}
		return result;
	}

	/**
	 * 상품상세조회 - 상품문의 - 답변달기
	 */
	@RequestMapping("/insert/goodsAnswer/{regNo}/{qgoodsNo}")
	public ModelAndView insertGoodsAnswer(@PathVariable Long regNo, @PathVariable Long qgoodsNo,
			GoodsAnswer goodsAnswer) {

		ModelAndView mv = new ModelAndView("redirect:/main/goodsDetail/" + regNo);

		goodsAnswer.setGoodsQuestion(new GoodsQuestion(qgoodsNo));
		adminService.insertGoodsAnswer(goodsAnswer);

		return mv;
	}

	/**
	 * 상품상세조회 - 상품문의 - 답변수정하기
	 */
	@RequestMapping("/update/goodsAnswer/{regNo}/{agoodsNo}")
	public ModelAndView updateGoodsAnswer(@PathVariable Long regNo, @PathVariable Long agoodsNo,
			GoodsAnswer goodsAnswer) {

		ModelAndView mv = new ModelAndView("redirect:/main/goodsDetail/" + regNo);

		goodsAnswer.setAgoodsNo(agoodsNo);
		adminService.updateGoodsAnswer(goodsAnswer);

		return mv;
	}

	/**
	 * 상품상세조회 - 상품문의 - 답변삭제하기
	 */
	@RequestMapping("/delete/goodsAnswer/{regNo}/{agoodsNo}")
	public ModelAndView deleteGoodsAnswer(@PathVariable Long regNo, @PathVariable Long agoodsNo) {
		System.out.println("regNo : " + regNo);
		System.out.println("agoodsNo : " + agoodsNo);
		ModelAndView mv = new ModelAndView("redirect:/main/goodsDetail/" + regNo);
		adminService.deleteGoodsAnswer(agoodsNo);

		return mv;
	}

	/**
	 * 고객센터 - FAQ - 등록폼 열기
	 */
	@RequestMapping("/writeFAQ")
	public String writeFAQForm() {
		return "/cs/writeFAQ";
	}
	
	
	/**
	 * 고객센터 - FAQ - 등록하기
	 */
	@RequestMapping("/insertFAQ")
	public String insert(FAQ faq) {

		adminService.insertFAQ(faq);

		return "redirect:/main/csForm?state=1";
	}
	
	/**
	 * 고객센터 - FAQ - 수정하기
	 */
	@RequestMapping("/updateFAQ/{faqNo}")
	public String faqUpdate(FAQ faq, @PathVariable Long faqNo) {
		faq.setFaqNo(faqNo);
		adminService.updateFAQ(faq);

		return "redirect:/main/csForm?state=1";
	}

	/*
	 * 고객센터 - FAQ - 삭제하기
	 */
	@RequestMapping("/deleteFAQ/{faqNo}")
	public String faqDelete(@PathVariable Long faqNo) {
		adminService.deleteFAQ(new FAQ(faqNo));

		return "redirect:/main/csForm?state=1";
	}

	/**
	 * 고객센터 - 공지사항 - 등록폼
	 */
	@RequestMapping("/writeNotice")
	public String writeNotice() {
		return "/cs/writeNotice";
	}
	
	/**
	 * 고객센터 - 공지사항 - 등록하기
	 */
	@RequestMapping("/insertNotice")
	public String insertNotice(Notice notice) {

		adminService.insertNotice(notice);

		return "redirect:/main/csForm?state=2";
	}

	/**
	 * 고객센터 - 공지사항 - 삭제하기
	 */
	@RequestMapping("/deleteNotice/{noticeNo}")
	public String deleteNotice(@PathVariable Long noticeNo) {
		adminService.deleteNotice(noticeNo);
		return "redirect:/main/csForm?state=2";
	}
	
	/**
	 * 공지사항 수정등록 폼
	 */
	@RequestMapping("/updateNoticeForm")
	public ModelAndView updateNoticeForm(Long noticeNo) {
		Notice notice = adminService.selectByNotice(noticeNo);
		return new ModelAndView("main/cs/updateNoticeForm", "notice", notice);
	}

	/**
	 * 공지사항 수정완료
	 */
	@RequestMapping("/updateNotice")
	public String updateNotice(Notice notice) {
		adminService.updateNotice(notice);
		return "redirect:/admin/readNotice/" + notice.getNoticeNo();
	}

	/**
	 * 회원정보 검색
	 * 
	 * @RequestMapping("/myPage/UserList") public ModelAndView userList(String
	 * grade, String keyword) { List<UserList> userList =
	 * adminService.searchAllUser(grade, keyword); System.out.println(userList);
	 * 
	 * return new ModelAndView("myPage/adminClientList", "userList", userList); }
	 */

	/**
	 * 회원 상세정보
	 */
	@RequestMapping("/myPage/userRead/{userId}")
	public ModelAndView userRead(@PathVariable String userId) {
		System.out.println(userId);
		UserList userList = adminService.searchById(userId);
		return new ModelAndView("myPage/adminClientRead", "userList", userList);
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

	// 카테고리 수정 폼 띄우기 //카테고리 수정
	@RequestMapping("/myPage/modiCategories")
	public ModelAndView modiCategories() {
		List<MainCategories> mainList = mainService.selectCategories();
		return new ModelAndView("admin/myPage/modiCategories", "list", mainList);
	}

	@RequestMapping("/myPage/insertMainCategory")
	public ModelAndView insertMainCategory(MainCategories mainCategories) {
		adminService.insertMainCategory(mainCategories);
		List<MainCategories> mainList = mainService.selectCategories();
		return new ModelAndView("admin/myPage/modiCategories", "list", mainList);
	}// insertMainCategory

	@RequestMapping("/myPage/insertSubCategory")
	public int insertSubCategory(SubCategories subCategories) {
		subCategories.getMainCategory();
		return adminService.insertSubCategory(subCategories);
	}// insertSubCategory

	@RequestMapping("/myPage/updateMainCategory")
	public int updateMainCategory(MainCategories mainCategories) {
		return adminService.updateMainCategory(mainCategories);
	}// updateMainCategory

	@RequestMapping("/myPage/updateSubCategory")
	public int updateSubCategory(SubCategories subCategories) {
		return adminService.updateSubCategory(subCategories);
	}// updateSubCategory
}// class
