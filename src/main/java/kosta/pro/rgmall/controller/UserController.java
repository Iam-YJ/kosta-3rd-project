package kosta.pro.rgmall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.UserGrade;
import kosta.pro.rgmall.domain.UserList;
import kosta.pro.rgmall.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/myPage/{userId}")
	public ModelAndView main(@PathVariable String userId) {
		System.out.println(userId);
		
		UserList userList = userService.selectPointandGrade(userId); //임의 회원 정보 넣음
		
		List<UserGrade> userGradeList = userService.selectAllUserGrade();
	
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/myPage/main");
		mv.addObject("userList", userList);
		mv.addObject("userGradeList",userGradeList);
		
		return mv;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main/index";
	}

}//class
