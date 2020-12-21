package kosta.pro.rgmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.Donation;
import kosta.pro.rgmall.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;
	
	@RequestMapping("myPage/donationForm")
	public ModelAndView donationForm(Long userNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/myPage/donationForm");
		mv.addObject("donaPoint", userService.selectMyDonation((long) 3));
		mv.addObject("donaList", userService.selectAllDonation());
		return mv;
	}//donationForm
	
	@RequestMapping("myPage/donation")
	public String donation(Donation donation) {
		System.out.println(donation+"===============================================");
		userService.insertDonation(donation);
		
		return null;
		
	}//donation
	
	

}//class
