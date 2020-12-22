package kosta.pro.rgmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.GoodsAnswer;
import kosta.pro.rgmall.domain.GoodsQuestion;
import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.Notice;
import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.Review;
import kosta.pro.rgmall.domain.UserGrade;
import kosta.pro.rgmall.domain.UserList;
import kosta.pro.rgmall.service.MainService;
import kosta.pro.rgmall.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
public class MainController {

	private final MainService mainService;
	private final UserService userService;

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

	@RequestMapping(value = "/kakaoLogin/{userNick}/{userEmail}")
	public String kakaoLogin(@PathVariable String userEmail, @PathVariable String userNick) {

		System.out.println("userEmail : " + userEmail);
		UserGrade userGrade = userService.loginAPIGrade(); // 유저에서 등급 불러올 때만

		UserList userList = new UserList(999L, "test", "test", "test", "test", "test", userEmail, 0, "test", userGrade);
		mainService.userRegisterKakao(userList);
		return "main/registerFormKakao";
	}

	@RequestMapping(value = "/registerKakao")
	public String kakaoLoginUpdate(UserList userLsit) {

		// UserList userList = new UserList(userEmail);
		// mainService.userRegister(userList);
		mainService.updateUserKakao(userLsit);
		return "main/index";
	}

//////////////////////////////////////소은	
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
	public ModelAndView goodsList(@PathVariable Long main, @PathVariable Long sub, @PathVariable int sort) {
		Map<String, Object> goodsListMap = new HashMap<String, Object>();
		List<RegisterGoods> registerGoodsList = mainService.selectAllGoods(main, sub, sort);
		List<MainCategories> mainCategories = mainService.selectCategories();

		goodsListMap.put("registerGoodsList", registerGoodsList);
		goodsListMap.put("registerGoods", registerGoodsList.get(0));
		goodsListMap.put("mainCategories", mainCategories);
		goodsListMap.put("main", main);// main
		goodsListMap.put("sub", sub);// sub

		ModelAndView mv = new ModelAndView("main/goodsList", "goodsListMap", goodsListMap);

		return mv;
	}

	/**
	 * 공지사항 전체검색
	 */
	@RequestMapping("/notice")
	public String selectAllNotice(Model model) {
		List<Notice> list = mainService.selectAllNotice();

		model.addAttribute("list", list);
		return "main/cs/notice";
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

		ModelAndView mv = new ModelAndView("main/goodsDetail", "goodsQuestionMap", goodsQuestionMap);
		return mv;
	}

	/**
	 * 상품상세보기에서 후기 보는 탭
	 */
	@RequestMapping("/selectReview/{regNo}")
	public ModelAndView selectReview(@PathVariable Long regNo) {
		List<Review> review = mainService.selectReview(regNo);
		ModelAndView mv = new ModelAndView();
		if (review == null) {
			mv.setViewName("main/review");
			mv.addObject("review", "리뷰가 존재하지 않습니다.");
		} else {
			mv.addObject("review", review);
			mv.setViewName("main/review");
		}
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

}// class
