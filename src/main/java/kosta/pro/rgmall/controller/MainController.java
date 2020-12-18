package kosta.pro.rgmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.RegisterGoods;
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

		//UserList userList = new UserList(userEmail);
		//mainService.userRegister(userList);

		ModelAndView mv = new ModelAndView();

		return "index";
	}

	@RequestMapping("/goodsList/{main}/{sub}/{sort}")
	public ModelAndView goodsList(@PathVariable int main, @PathVariable int sub, @PathVariable int sort) {
		Map<String, Object> goodsListMap = new HashMap<String, Object>();
		List<RegisterGoods> registerGoodsList = mainService.selectAllGoods(main, sub, sort);
		List<MainCategories> mainCategories = mainService.selectAllMainCategories();
		
		goodsListMap.put("registerGoodsList", registerGoodsList);
		goodsListMap.put("registerGoods", registerGoodsList.get(0));
		goodsListMap.put("mainCategories", mainCategories);
		goodsListMap.put("main", main);//main
		goodsListMap.put("sub", main);//main
		
		ModelAndView mv = new ModelAndView("main/goodsList", "goodsListMap", goodsListMap);
		return mv;
	}

}// class
