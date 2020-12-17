package kosta.pro.rgmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.UserList;
import kosta.pro.rgmall.service.MainService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main")
@RequiredArgsConstructor
public class MainController {

	private final MainService mainService;

	@RequestMapping("/")
	public String main() {

		return "main/login";
	}

	@RequestMapping(value = "/kakaoLogin/{userNick}/{userEmail}")
	public String kakaoLogin(@PathVariable String userEmail, @PathVariable String userNick) {

//	        System.out.println("userNick : " + userNick);
//	        System.out.println("userEmail : " + userEmail);

		UserList userList = new UserList(userEmail);
		mainService.userRegister(userList);

		ModelAndView mv = new ModelAndView();

		return "index";
	}

	@RequestMapping("/goodsList/{main}/{sub}/{sort}")
	public ModelAndView goodsList(@PathVariable int main, @PathVariable int sub, @PathVariable int sort) {

		// List<RegisterGoods> registerGoodsList = mainService.selectAllGoods(main, sub,
		// sort);

		ModelAndView mv = new ModelAndView("main/goodsList");
		return mv;
	}

}// class
