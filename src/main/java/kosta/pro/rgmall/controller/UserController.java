package kosta.pro.rgmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.Donation;
import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.UserGrade;
import kosta.pro.rgmall.domain.UserList;
import kosta.pro.rgmall.domain.WishList;
import kosta.pro.rgmall.service.MainService;
import kosta.pro.rgmall.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;
	private final MainService mainService;
	
	//마이페이지 기본 폼 띄우기
	@RequestMapping("/myPage")
	public String myPageMain() {
		return "user/myPageForm";
	}
	
	//마이페이지 주문목록/배송 조회 폼
	@RequestMapping("/myPage/userOrderList")	
	public ModelAndView userOrderList() {
		return new ModelAndView("myPage/userOrderList");
	}
	
	//마이페이지 취소/환불내용 조회 폼
	@RequestMapping("/myPage/userOrderCancelList")	
	public ModelAndView userOrderCancelList() {
		return new ModelAndView("myPage/userOrderCancelList");
	}
	
	//마이페이지 상품문의내역 조회
	@RequestMapping("/myPage/userGoodsQuestionList")	
	public ModelAndView userGoodsQuestionList() {
		return new ModelAndView("myPage/userGoodsQuestionList");
	}
	
	//마이페이지 구매후기 내역 조회
	@RequestMapping("/myPage/userGoodsReviewList")	
	public ModelAndView userGoodsReviewList() {
		return new ModelAndView("myPage/userGoodsReviewList");
	}
	
	//마이페이지 찜 목록 조회
	@RequestMapping("/myPage/userWishList")	
	public ModelAndView userWishList() {
		return new ModelAndView("myPage/userWishList");
	}
	
	//마이페이지 장바구니 목록 조회
	@RequestMapping("/myPage/userCartList")	
	public ModelAndView userCartList() {
		return new ModelAndView("myPage/userCartList");
	}
	
	//개인정보확인/수정 - 개인정보 수정전 비밀번호 확인폼
	@RequestMapping("/myPage/passWordCheck")
	public ModelAndView userPassWordCheck() {
		return new ModelAndView("myPage/passWordCheck");
	}
	
	//포인트/등급 조회
	@RequestMapping("/myPage/userPointGradeList")	
	public ModelAndView userPointGradeList() {
		return new ModelAndView("myPage/userPointGradeList");
	}
	
	//포인트 기부
	@RequestMapping("/myPage/userPointDonate")	
	public ModelAndView userPointDonate(HttpSession session) {
		
		UserList userList = (UserList)session.getAttribute("userList");
		
		ModelAndView mv = new ModelAndView("myPage/donationForm");
		//mv.addObject("donaPoint", userService.selectMyDonation((long) 3).getDonaPoint());
		//mv.addObject("donaList", userService.selectAllDonation());
		
		return mv;
	}
	
	
	
	
	
	

		
	//개인정보수정폼
	@RequestMapping("/mypage/updateUserListForm")
	public String updateUserListForm() {
		return "user/myPage/updateUserList";
	}
		
	//개인정보수정
	@RequestMapping("/mypage/updateUserList")
	public String updateUserList(UserList userList,HttpSession session) {
		Long userNo = (Long)session.getAttribute("userNo");
		userList.setUserNo(userNo);
		userService.updateUserList(userList);
		return "user/myPage/main";
	}
	
	@RequestMapping("myPage/donationForm")
	public ModelAndView donationForm() {
		return null;
	}//donationForm
	
	@RequestMapping("myPage/donation")
	public String donation(int dona) {
		UserList userList = new UserList();
		userList.setUserNo((long)3);
		Donation donation =new Donation();
		donation.setDonaPoint(dona);
		donation.setUserList(userList);
		
		if(userService.selectMyDonation((long)3).getUserList().getUserNo()==(long)3) {
			userService.updateDonation((long)3, dona);
		}else {
			userService.insertDonation(donation);
		}
		return "redirect:/user/myPage/donationForm";
	}//donation
	
	@RequestMapping("/myPage/{userId}")
	public ModelAndView main(@PathVariable String userId) {
		System.out.println(userId);
		UserList userList = userService.selectPointandGrade(userId); //임의 회원 정보 넣음
		List<UserGrade> userGradeList = userService.selectAllUserGrade();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("myPage/main");
		mv.addObject("userList", userList);
		mv.addObject("userGradeList",userGradeList);
		return mv;
	}//main
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main/index";
	}
	
	@RequestMapping("wish")
	public String wish(Long regNo) {
		System.out.println(regNo);
		 List<WishList> list =userService.selectWishList((long)3);
		 for(WishList w : list) {
			if( w.getRegisterGoods().getRegNo()==regNo) {
				return "redirect:/main/goodsDetail/"+regNo;
			}
		 }
		UserList userList =new UserList(); 
		userList.setUserNo((long) 3);
		RegisterGoods registerGoods =new RegisterGoods();
		registerGoods.setRegNo(regNo);
		WishList wishList = new WishList(null, userList, registerGoods);
		userService.insertWishList(wishList);
		return "redirect:/main/goodsDetail/"+regNo;
	}//wish
	
	@RequestMapping("wishList")
	public ModelAndView wishList(Long userNo) {
		List<WishList> list=userService.selectWishList((long)3);
		Map<Integer, RegisterGoods> wishMap = new HashMap();
		int cnt=1;
		for(WishList w :list) {
			//w.getRegisterGoods().getRegNo();
			wishMap.put(cnt, userService.selectGoodsThumbnail(w.getRegisterGoods().getRegNo()));
			cnt++;
		}
		return new ModelAndView("/user/wishList","map",wishMap);
	}//wishList

	@RequestMapping("/cart")
	public void cart() {}
	
	
	
	
}//class


