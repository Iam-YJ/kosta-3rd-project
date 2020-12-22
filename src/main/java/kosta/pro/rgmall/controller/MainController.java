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

import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.Notice;
import kosta.pro.rgmall.domain.RegisterGoods;
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

	@RequestMapping("/")
	public String main() {

		return "main/login";
	}

	@RequestMapping(value = "/kakaoLogin/{userNick}/{userEmail}")
	public String kakaoLogin(@PathVariable String userEmail, @PathVariable String userNick) {

		System.out.println("userEmail : " + userEmail);
		UserGrade userGrade = userService.loginAPIGrade(); //유저에서 등급 불러올 때만
		
		UserList userList = new UserList(999L, "test", "test", "test", "test", "test", userEmail, 0, "test",userGrade);
		mainService.userRegisterKakao(userList);
		return "main/registerFormKakao";
	}
	
	
	@RequestMapping(value = "/registerKakao")
	public String kakaoLoginUpdate(UserList userLsit) {

		//UserList userList = new UserList(userEmail);
		//mainService.userRegister(userList);
		mainService.updateUserKakao(userLsit);
		return "main/index";
	}
	
//////////////////////////////////////소은	
	@RequestMapping("/registerReady")
	public String registerReady() {
		return "main/register";
	}

	@RequestMapping("/registerForm")
	public String registerForm() {
		return "main/registerForm";
	}
	
	@ResponseBody
	@RequestMapping("/userIdCheck")
	public String userIdCheck(String userId) {
		//System.out.println(userId);
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
	public String login(String userId,String passWord,HttpServletRequest request) {
		String result = null;
		if(mainService.userLogin(userId, passWord)==null) {
			result = "main/loginFail";
		}else {
		UserList user = mainService.userLogin(userId, passWord);
		HttpSession session =request.getSession() ;
		session.setAttribute("user", user);
		result =  "main/index";
		}
		return result;
	}
	
	@RequestMapping("/findUserId")
	public String findUserId(UserList userList) {
		if(mainService.findUserId(userList)==null) {
			
		}
		return null;
	}

	
	
	@RequestMapping("/goodsList/{main}/{sub}/{sort}")
	public ModelAndView goodsList(@PathVariable int main, @PathVariable int sub, @PathVariable int sort) {
		Map<String, Object> goodsListMap = new HashMap<String, Object>();
		List<RegisterGoods> registerGoodsList = mainService.selectAllGoods(main, sub, sort);
		List<MainCategories> mainCategories = mainService.selectCategories();
		
		goodsListMap.put("registerGoodsList", registerGoodsList);
		goodsListMap.put("registerGoods", registerGoodsList.get(0));
		goodsListMap.put("mainCategories", mainCategories);
		goodsListMap.put("main", main);//main
		goodsListMap.put("sub", main);//main
		
		ModelAndView mv = new ModelAndView("main/goodsList", "goodsListMap", goodsListMap);

		return mv;
	}
	
	
	/**
	 * 전체검색
	 */
	@RequestMapping("/notice")
	public String selectAllNotice(Model model) {
		List<Notice> list = mainService.selectAllNotice();
		
		model.addAttribute("list", list);
		return "main/cs/notice";
	}
	

}// class
