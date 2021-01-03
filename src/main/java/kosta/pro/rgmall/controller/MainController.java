package kosta.pro.rgmall.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.Admin;
import kosta.pro.rgmall.domain.FAQ;
import kosta.pro.rgmall.domain.GoodsAnswer;
import kosta.pro.rgmall.domain.GoodsQuestion;
import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.Notice;
import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.Review;
import kosta.pro.rgmall.domain.UserGrade;
import kosta.pro.rgmall.domain.UserList;
import kosta.pro.rgmall.service.AdminService;
import kosta.pro.rgmall.service.MainService;
import kosta.pro.rgmall.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
public class MainController {

	private final MainService mainService;
	private final UserService userService;
	private final AdminService adminService;

	
	// 고객센터 - 폼열기
	@RequestMapping("/csForm")
	public ModelAndView csForm(HttpServletRequest request) {
		
		String state = request.getParameter("state");
		ModelAndView mv = new ModelAndView("main/csForm");
		if (state != null) {
			mv.addObject("state", state);
		}
		return mv;
	}
	
	// 고객센터 - 메인페이지
	@RequestMapping("/cs/main")
	public ModelAndView csMain() {
		
		ModelAndView mv = new ModelAndView("cs/main");
		
		return mv;
	}

	/**
	 * 고객센터 - FAQ에서 제목 검색
	 */
	@ResponseBody
	@RequestMapping(value = "/csFormAjax", method = RequestMethod.POST)
	public List<FAQ> searchCS(String word) {
		List<FAQ> faq = mainService.findFAQByWord(word);
		return faq;
	}
	
	// 고객센터 - FAQ폼열기
	@RequestMapping("/cs/FAQ")
	public ModelAndView csFAQ() {
		List<FAQ> faqList = adminService.selectAllFAQ();

		return new ModelAndView("cs/FAQ", "faqList", faqList);
	}

	// 고객센터 - 공지사항 폼열기
	@RequestMapping("/cs/notice")
	public ModelAndView csNotice() {

		List<Notice> noticeList = mainService.selectAllNotice();

		return new ModelAndView("cs/notice", "noticeList", noticeList);
	}

	
	@RequestMapping("/{url}")
	public void url() {
	}

	@RequestMapping("/")
	public String main() {

		return "main/login";
	}

	@RequestMapping("/payorder")
	public String payorder() {
		return "user/payorder";
	}

	@RequestMapping(value = "/kakaoLogin/{userEmail}")
	public String kakaoLogin(@PathVariable String userEmail, HttpSession session) {

		UserList userList = mainService.findUserEmail(userEmail);
		session.setAttribute("userList", userList);

		mainService.deleteUserByName("kakaoTest");

		return "redirect:/";
	}

	@RequestMapping(value = "/kakaoLogin/{userNick}/{userEmail}")
	public String kakaoLogin(@PathVariable String userEmail, @PathVariable String userNick) {

		System.out.println("userEmail : " + userEmail);
		UserGrade userGrade = userService.loginAPIGrade(); // 유저에서 등급 불러올 때만

		UserList userList = new UserList(99L, "kakaoTest", "kakaoTest", "kakaoTest", "kakaoTest", "kakaoTest",
				userEmail, 0, "kakaoTest", userGrade);

		mainService.userRegisterKakao(userList);
		return "main/registerFormKakao";
	}

	@RequestMapping(value = "/registerKakao")
	public String kakaoLoginUpdate(UserList userLsit, HttpSession session) {

		// UserList userList = new UserList(userEmail);
		// mainService.userRegister(userList);
		UserList userList = mainService.updateUserKakao(userLsit);
		session.setAttribute("userList", userList);

		return "redirect:/";
	}

	@RequestMapping("/registerReady")
	public String registerReady() {
		return "main/register";
	}

	@RequestMapping("/registerBefore")
	public String registerBefore() {
		return "main/registerBefore";
	}

	@RequestMapping("/registerForm")
	public String registerForm() {
		return "main/registerForm";
	}

	@ResponseBody
	@RequestMapping("/userIdCheck")
	public String userIdCheck(String userId) {
		// System.out.println(userId);
		return mainService.userIdCheck(userId);
	}

	@RequestMapping("/register")
	public String register(UserList userList) {
		mainService.userRegister(userList);
		return "redirect:/";
	}

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "main/login";
	}

	@RequestMapping("/login")
	public String login(String userId, String passWord, HttpSession session) {
		String result = null;
		UserList userList = mainService.userLogin(userId, passWord);

		if (userList == null) {
			result = "main/loginFail";
		} else {
			session.setAttribute("userList", userList);
			result = "redirect:/";
		}
		return result;
	}

	// 아이디 비번찾기 폼
	@RequestMapping("/userForgetIdPwd")
	public void userForgetIdPwd() {

	}

	// 아이디찾기
	@RequestMapping("/findUserId")
	public ModelAndView findUserId(UserList userList) {
		ModelAndView mv = new ModelAndView();
		if (mainService.findUserId(userList) == "") {
			mv.setViewName("main/failUserSelect");
		} else {
			mv.addObject("userId", mainService.findUserId(userList));
			mv.setViewName("main/sucUserSelId");
		}
		return mv;
	}

	// 비밀번호찾기
	@RequestMapping("/findUserPwd")
	public ModelAndView findUserPwd(UserList userList) {
		ModelAndView mv = new ModelAndView();
		if (mainService.findUserPwd(userList) == null) {
			mv.setViewName("main/failUserSelect");
		} else {
			mv.addObject("userNo", mainService.findUserPwd(userList).getUserNo());
			mv.setViewName("main/sucUserSelPwd");
		}
		return mv;
	}

	// 비밀번호변경
	@RequestMapping("/updatepassWord/{user.userNo}")
	public String updatepassWord(UserList userList, @PathVariable("user.userNo") Long userNo) {
		userList.setUserNo(userNo);
		mainService.updatePassWord(userList);
		return "main/login";
	}
	
	/**
	 * Header의 인기 추천 상품
	 * */
	@RequestMapping("/bestGoods")
	public ModelAndView bestGoods() {
		List<RegisterGoods> full = mainService.bestGoods();
		return new ModelAndView("main/bestGoods", "registerGoods", full.subList(0, 15));
	}
	
	/**
	 * Header의 !품절 임박! 상품
	 * */
	@RequestMapping("/soldout")
	public ModelAndView soldout() {
		List<RegisterGoods> full = mainService.soldout();
		return new ModelAndView("main/soldout","registerGoods",full.subList(0, 15));
	}
	
	/**
	 * Header의 따끈 리뷰 상품
	 * */
	@RequestMapping("/reviewMain")
	public ModelAndView reviewMain(){
		List<Review> full = mainService.reviewMain();
		List<Long> noList = new ArrayList<Long>();
		List<Review> result = new ArrayList<Review>();
		for(int i=0;i<full.size();i++) {
			Long no = full.get(i).getRegisterGoods().getRegNo();
			if(!noList.contains(no)) {
				noList.add(no);
				result.add(full.get(i));
				//System.out.println(no);
			}
		}
		return new ModelAndView("main/reviewMain","review",result);
	}

	/**
	 * 상품리스트를 조회를 하는 Controller
	 */
	@RequestMapping("/goodsList/{main}/{sub}/{sort}")
	public ModelAndView goodsList(@PathVariable Long main, @PathVariable Long sub, @PathVariable int sort,
			@RequestParam(defaultValue = "0")int nowPage) {
		Map<String, Object> goodsListMap = new HashMap<String, Object>();
		Pageable pageable = PageRequest.of(nowPage, 16);
		Page<RegisterGoods> registerGoodsList = mainService.selectAllGoods(main, sub, sort,pageable);
		List<MainCategories> mainCategories = mainService.selectCategories();
		goodsListMap.put("sort", sort);
		goodsListMap.put("registerGoodsList", registerGoodsList);
		goodsListMap.put("regGoods",registerGoodsList.getContent());
		goodsListMap.put("registerGoods", registerGoodsList.getContent().get(0));
		goodsListMap.put("mainCategories", mainCategories);
		goodsListMap.put("main", main);// main
		goodsListMap.put("sub", sub);// sub

		ModelAndView mv = new ModelAndView("main/goodsList", "goodsListMap", goodsListMap);

		return mv;
	}

	/**
	 * 상품리스트를 정렬 하는 Controller
	 */
	@RequestMapping("/goodsListOrder/{main}/{sub}/{sort}")
	@ResponseBody
	public List<RegisterGoods> goodsListOrder(@PathVariable Long main, @PathVariable Long sub, @PathVariable int sort,
			@RequestParam(defaultValue = "0")int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 16);
		Page<RegisterGoods> registerGoodsList = mainService.selectAllGoods(main, sub, sort,pageable);
		return registerGoodsList.getContent();
	}

	/**
	 * 상품 keyword검색하는 Controller
	 */
	
	@RequestMapping(value = "/goodsListKeyword", method = RequestMethod.POST)
	@ResponseBody
	public List<RegisterGoods> goodsListKeyword(String keyword,@RequestParam(defaultValue = "0")int nowPage) {
		Pageable pageable = PageRequest.of(nowPage, 16);
		Page<RegisterGoods> registerGoodsList = mainService.searchGoods(keyword,pageable);
		return registerGoodsList.getContent();
	}

	/**
	 * 상품 상세조회를 하는 Controller
	 */
	@RequestMapping("/goodsDetail/{regNo}")
	public ModelAndView goodsDetail(@PathVariable Long regNo) {

		Map<String, Object> goodsQuestionMap = new HashMap<String, Object>();

		RegisterGoods registerGoods = mainService.goodsDetail(regNo);
		goodsQuestionMap.put("registerGoods", registerGoods);
		
		List<GoodsQuestion> goodsQuestionList = mainService.selectGoodsQuestions(regNo);
		goodsQuestionMap.put("goodsQuestionList", goodsQuestionList);

		List<Review> review = mainService.selectReview(regNo);
		goodsQuestionMap.put("review", review);

		ModelAndView mv = new ModelAndView("main/goodsDetail", "goodsQuestionMap", goodsQuestionMap);
		return mv;
	}



	/**
	 * 우편번호 api test
	 */
	@RequestMapping("/testtt")
	public void APITest() {

	}
	
	/**ExceptionHandler*/
	@ExceptionHandler(Exception.class)
	public ModelAndView error(Exception e) {
		return new ModelAndView("error/error","errMsg",e.getMessage());
	}//error

}// class
