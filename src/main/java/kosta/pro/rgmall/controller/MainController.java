package kosta.pro.rgmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

	// 고객센터 - 메인페이지
	@RequestMapping("/cs/main")
	public ModelAndView csMain() {
		return new ModelAndView("cs/main");
	}

	// 고객센터 - FAQ
	@RequestMapping("/cs/FAQ")
	public ModelAndView csFAQ() {
		System.out.println("11");
		List<FAQ> list = adminService.selectAllFAQ();

		/*
		 * page처리 Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC,
		 * "faqNo"); Page<FAQ> pageList = service.selectAll(pageable);
		 * 
		 * //pageList.getNumber() model.addAttribute("pageList" , pageList);
		 */

		return new ModelAndView("cs/FAQ", "list", list);
	}

	// 고객센터 - 공지사항
	@RequestMapping("/cs/notice")
	public ModelAndView csNotice() {

		List<Notice> list = mainService.selectAllNotice();

		return new ModelAndView("cs/notice", "list", list);
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

		return "main/index";
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

		return "main/index";
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
		return "main/index";
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
			result = "main/index";
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
	 * */
	@ResponseBody
	@RequestMapping(value = "/goodsListKeyword", method = RequestMethod.POST)
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
		List<GoodsAnswer> goodsAnswerList = null;

		RegisterGoods registerGoods = mainService.goodsDetail(regNo);

		List<GoodsQuestion> goodsQuestionList = mainService.selectGoodsQuestions(regNo);
		for (int i = 0; i < goodsQuestionList.size(); i++) {
			goodsAnswerList = mainService.selectGoodsAnswer((long) goodsQuestionList.get(i).getQgoodsNo());
		}

		goodsQuestionMap.put("registerGoods", registerGoods);
		goodsQuestionMap.put("goodsQuestionList", goodsQuestionList);
		
		List<Review> review = mainService.selectReview(regNo);
		goodsQuestionMap.put("review",review);
		
		ModelAndView mv = new ModelAndView("main/goodsDetail", "goodsQuestionMap", goodsQuestionMap);
		return mv;
	}


	/**
	 * 상품문의 A에 대한 기능(only 관리자)
	 */
	@RequestMapping("/goodsDetail/{qgoodsNo}/goodsAnswer/{state}") // 나중에 세션 인수로 받아야할듯?
	public String UpdateGoodsAnswer(@PathVariable Long qgoodsNo, @PathVariable String state,
			HttpServletRequest request) {

		if (state.equals("update")) {
			String content = request.getParameter("content");

			GoodsQuestion goodsQuestion = new GoodsQuestion(qgoodsNo);
			GoodsAnswer goodsAnswer = new GoodsAnswer(content, goodsQuestion);

			mainService.updateGoodsAnswer(goodsAnswer);

		} else if (state.equals("delete")) {
			mainService.deleteGoodsAnswer(qgoodsNo);
		} else if (state.equals("insert")) {

			String content = request.getParameter("content");

			GoodsQuestion goodsQuestion = new GoodsQuestion(qgoodsNo);
			GoodsAnswer goodsAnswer = new GoodsAnswer(content, goodsQuestion);

			mainService.insertGoodsAnswer(goodsAnswer);

		}

		return "redirect:/main/goodsList/0/0/0";
	}

	/**
	 * 상품문의 Q에 대한 기능(유저)
	 */
	@RequestMapping("/goodsDetail/{regNo}/goodsQuestion/{state}") // 나중에 세션 인수로 받아야할듯?
	public String UpdateGoodsQuestion(@PathVariable Long regNo, @PathVariable String state,
			HttpServletRequest request) {

		if (state.equals("update")) {

			String content = request.getParameter("content");

			GoodsQuestion goodsQuestion = new GoodsQuestion(regNo, content);

			mainService.updateGoodsQuestion(goodsQuestion);

		} else if (state.equals("delete")) {
			mainService.deleteGoodsQuestion(regNo);
		} else if (state.equals("insert")) {

			String content = request.getParameter("content");

			UserList userList = new UserList(93L);
			RegisterGoods registerGoods = new RegisterGoods(regNo);

			GoodsQuestion goodsQuestion = new GoodsQuestion(content, userList, registerGoods);

			mainService.insertGoodsQuestion(goodsQuestion);

		}

		return "redirect:/main/goodsList/0/0/0";
	}
	
	/**
	 * FAQ에서 검색
	 */
	@ResponseBody
	@RequestMapping(value = "/csForm", method = RequestMethod.POST)
	public List<FAQ> searchCS(String word) {
		List<FAQ> faq = mainService.findFAQByWord(word);
		return faq;
	}

	
	
	/**
	 * 우편번호 api test
	 */
	@RequestMapping("/testtt")
	public void APITest() {
		
	}
	
}// class
