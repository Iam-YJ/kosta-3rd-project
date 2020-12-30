package kosta.pro.rgmall.controller;

import java.io.File;	
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
import kosta.pro.rgmall.domain.SubCategories;
import kosta.pro.rgmall.domain.UserList;
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

	private final MainController mainController;

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
		List<RegisterGoods> listRegisterGoods = adminService.selectGoods(0);
		return new ModelAndView("myPage/adminGoodsList","listRegisterGoods",listRegisterGoods);
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
		
		//0 지난주문 조회    1은 신규주문조회
		List<Orders> lastOrders = adminService.selectOrders(0);
		
		List<Orders> newOrders = adminService.selectOrders(1);
		
		mv.addObject("lastOrders", lastOrders);
		mv.addObject("newOrders", newOrders);
		
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
	 * 환불승인
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
	//@RequestMapping("/maPage/goodsStockListUpdate/{regNo}")

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
	 * 
	 */
	@RequestMapping("/myPage/goodsQuestionListAnswer/{regNo}")
	public String GoodsQuestionListAnswer(@PathVariable Long regNo, String refundReply) {

		GoodsQuestion goodsQuestion = new GoodsQuestion(regNo);
		GoodsAnswer goodsAnswer = new GoodsAnswer(refundReply, goodsQuestion);

		adminService.insertGoodsAnswer(goodsAnswer);

		return "redirect:/user/myPage";

	}
	
	@RequestMapping("/myPage/goodsQuestionUpdateAnswer/{agoodsNo}")
	public String GoodsQuestionUpdateAnswer(@PathVariable Long agoodsNo, String refundReply) {

		adminService.updateGoodsAnswer(agoodsNo, refundReply);

		return "redirect:/user/myPage";

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
	 * 관리자 마이페이지 - 총매출조회
	 */
	@RequestMapping("/myPage/profit")
	public ModelAndView profit(String startDate, String endDate) {
		int profit = adminService.checkProfit(startDate, endDate);
		return new ModelAndView("myPage/adminProfit", "profit",profit);
	}
	/*
	@RequestMapping("/myPage/dayprofit")
	public ModelAndView dayProfit(String orderDate) {
		List<Orders> dayProfit = adminService.checkDayProfit(orderDate);
		return new ModelAndView("myPage/adminProfit","dayProfit", dayProfit);
	}*/
	
	/**
	 * 관리자 마이페이지 - 회원조회
	 */
	@RequestMapping("/myPage/clientList")
	public ModelAndView clientList(String grade, String keyword) {
		List<UserList> userList = adminService.searchAllUser(grade, keyword);
		return new ModelAndView("myPage/adminClientList", "userList", userList);
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
			result = "main/index";
		}
		return result;
	}

	/**
	 * 공지사항 전체검색
	 */
	@RequestMapping("/notice")
	public void selectAllNotice(Model model) {
		List<Notice> list = mainService.selectAllNotice();

		model.addAttribute("list", list);
	}

	/**
	 * 공지사항 등록하기 폼
	 */
	@RequestMapping("/writeNotice")
	public String writeNotice() {

		return "main/cs/writeNotice";
	}

	/**
	 * 공지사항 등록하기
	 */
	@RequestMapping("/insert")
	public String insertNotice(Notice notice) {
		// content에 스크립트 요소(태그)를 문자로 교체
		String content = notice.getContent().replace("<", "&lt;");
		notice.setContent(content);

		adminService.insertNotice(notice);

		return "redirect:/main/notice";
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
	 * 공지사항 상세보기
	 */
	@RequestMapping("/readNotice/{noticeNo}")
	public ModelAndView readNotice(@PathVariable Long noticeNo) {

		Notice notice = adminService.selectByNotice(noticeNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/cs/readNotice"); // /WEB-INF/views/read.jsp
		mv.addObject("notice", notice);

		return mv;
	}

	/**
	 * 삭제하기
	 */
	@RequestMapping("/deleteNotice")
	public String deleteNotice(Long noticeNo) {
		adminService.deleteNotice(noticeNo);
		return "redirect:/main/notice";
	}

	/*
	 * faq 수정등록 폼
	 */
	@RequestMapping("/updateForm")
	public ModelAndView faqUpdateForm(Long faqNo) {
		FAQ faq = adminService.selectByFaq(faqNo);
		System.out.println(faq);
		return new ModelAndView("main/cs/updateFAQForm", "faq", faq);
	}

	/*
	 * 수정완료하기
	 */
	@RequestMapping("/update")
	public String faqUpdate(FAQ faq) {
		adminService.updateFAQ(faq);

		return "redirect:/admin/read/" + faq.getFaqNo();// controller에서 controller 로 찾아 가는데 기존에 가지고있는 것은 버리고
	}

	/*
	 * 삭제하기
	 */
	@RequestMapping("/delete")
	public String faqDelete(FAQ faq) {
		adminService.deleteFAQ(faq);

		return "redirect:/admin/cs/list";
	}

	/*
	 * FAQ 상세보기
	 */
	@RequestMapping("/read/{faqNo}")
	public ModelAndView read(@PathVariable Long faqNo) {

		FAQ faq = adminService.selectByFaq(faqNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/cs/readFAQ"); // /WEB-INF/views/read.jsp
		mv.addObject("faq", faq);

		return mv;
	}

	/**
	 * FAQ 등록하기 폼
	 */
	@RequestMapping("/writeFAQ")
	public String write() {
		return "main/cs/writeFAQ";
	}

	/**
	 * FAQ 등록하기
	 */
	@RequestMapping("/insertFAQ")
	public String insert(String question, String answer) {

		FAQ faq = new FAQ(null, question, answer);
		adminService.insertFAQ(faq);

		return "redirect:/admin/cs/list";
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
