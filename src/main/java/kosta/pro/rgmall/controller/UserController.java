package kosta.pro.rgmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.Cart;
import kosta.pro.rgmall.domain.Donation;
import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.Review;
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
	}//updateUserListForm
		
	//개인정보수정
	@RequestMapping("/mypage/updateUserList")
	public String updateUserList(UserList userList,HttpSession session) {
		UserList sessionUser = (UserList)session.getAttribute("userList");
		userList.setUserNo(sessionUser.getUserNo());
		userService.updateUserList(userList);
		return "user/myPage/main";
	}//updateUserList
	
	//기부폼
	@RequestMapping("myPage/donationForm")
	public ModelAndView donationForm(HttpSession session) {
		UserList userInfo=(UserList) session.getAttribute("userList");
		Long userNo= userInfo.getUserNo();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/myPage/donationForm");
		mv.addObject("donaPoint", userService.selectMyDonation(userNo).getDonaPoint());
		mv.addObject("donaList", userService.selectAllDonation());
		return mv;
	}//donationForm
	
	//기부하기
	@RequestMapping("myPage/donation")
	public String donation(int dona, HttpSession session) {
		UserList userInfo=(UserList) session.getAttribute("userList");
		Long userNo= userInfo.getUserNo();
		UserList userList = new UserList();
		userList.setUserNo(userNo);
		Donation donation =new Donation();
		donation.setDonaPoint(dona);
		donation.setUserList(userList);
		if(userService.selectMyDonation(userNo).getUserList().getUserNo()==userNo) {
			userService.updateDonation(userNo, dona);
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
	}//logout
	
	//찜목록추가
	@RequestMapping("insertwish")
	public String wish(Long regNo, HttpSession session) {
		System.out.println("33333333333333333333"+regNo);
		UserList userInfo=(UserList) session.getAttribute("userList");
		Long userNo= userInfo.getUserNo();
		 List<WishList> list =userService.selectWishList(userNo);
		 for(WishList w : list) {
			if( w.getRegisterGoods().getRegNo()==regNo) {
				return "redirect:/main/goodsDetail/"+regNo;
			}
		 }
		UserList userList =new UserList(); 
		userList.setUserNo(userNo);
		RegisterGoods registerGoods =new RegisterGoods();
		registerGoods.setRegNo(regNo);
		WishList wishList = new WishList(null, userList, registerGoods);
		userService.insertWishList(wishList);
		return "redirect:/main/goodsDetail/"+regNo;
	}//wish
	
	//찜목록 조회
	@RequestMapping("wishList")
	public ModelAndView wishList(HttpSession session) {
		UserList userInfo=(UserList) session.getAttribute("userList");
		Long userNo= userInfo.getUserNo();
		List<WishList> list=userService.selectWishList(userNo);
		return new ModelAndView("user/wishList","list",list);
	}//wishList
	
	//찜목록 삭제
	@RequestMapping("/deleteWishList")
	public String deleteWishList(Long regNo,HttpSession session) {
		WishList whishList=userService.selectWishNo(regNo);
		userService.deleteWishList(whishList.getWishNo());
		return "redirect:/user/wishList" ;
	}//deleteWishList
	
	//장바구니 추가
	@RequestMapping("/insertcart")
	public String cart(HttpSession session,int qua, Long regNo) {
		UserList userInfo=(UserList) session.getAttribute("userList");
		Long userNo= userInfo.getUserNo();
		
		List<Cart> list =userService.selectCart(userNo);
		for(Cart c : list) {
			if(c.getRegisterGoods().getRegNo()==regNo) {
				userService.updateCart(regNo);
				if(qua==0) {
					return "redirect:/user/wishList" ;
				}else {
					return "redirect:/main/goodsDetail/"+regNo ;
				}
			}
		}
		
		Cart cart = new Cart();
		UserList userList= new UserList();
		userList.setUserNo(userNo);
		RegisterGoods registerGoods= new RegisterGoods();
		registerGoods.setRegNo(regNo);
		cart.setRegisterGoods(registerGoods);
		cart.setUserList(userList);
		if(qua==0) {
			cart.setQuantity(1);
			userService.insertCart(cart);
			return "redirect:/user/wishList" ;
		}else {
			cart.setQuantity(qua);
			userService.insertCart(cart);
			return "redirect:/main/goodsDetail/"+regNo ;
		}
	}//cart
	
	//장바구니 조회
	@RequestMapping("/cartList")
	public ModelAndView cartList(HttpSession session) {
		UserList userInfo=(UserList) session.getAttribute("userList");
		Long userNo= userInfo.getUserNo();
		List<Cart> list=userService.selectCart(userNo);
		for(Cart c : list) {
			System.out.println("333333333"+c+"============================");
		}
		return new ModelAndView("user/cart","list",list);
	}//cartList
	
	//장바구니 변경
	@RequestMapping("/cartInfoChange")
	@ResponseBody
	public int cartInfoChange(String unitQuantitiy, String unitPrice) {
		System.out.println(unitQuantitiy+"============unitQuantitiy==========");
		System.out.println(unitPrice+"===========unitPrice===========");
		System.out.println(Integer.parseInt(unitQuantitiy)+"======Integer.parseInt(unitQuantitiy)================");
		System.out.println(Integer.parseInt(unitPrice)+"==========Integer.parseInt(unitPrice)============");
		return Integer.parseInt(unitQuantitiy)*Integer.parseInt(unitPrice);
		
		//return 0;
	}//cartInfoChange
	
	//장바구니 삭제
	@RequestMapping("/deleteCartList")
	public String deleteCartList(Long regNo, HttpSession session) {
		UserList userInfo=(UserList) session.getAttribute("userList");
		Long userNo= userInfo.getUserNo();
		userService.deleteCart(userNo, regNo);
		return"redirect:/user/cartList";
	}
	
	@RequestMapping("/myPage/writeReviewForm")
	public String writeReviewForm() {
		return "user/myPage/writeReview";
	}
	
	@RequestMapping("/myPage/insertReview/{regNo}")
	public String inserReview(Review review,@PathVariable Long regNo) {
		userService.insertReview(review);
		return "redirect:/user/myPage/myReview";
	}
	
	@RequestMapping("/myPage/myReview")
	public ModelAndView myReview(HttpSession session) {
		UserList userList = (UserList)session.getAttribute("userList");
		Long userNo = userList.getUserNo();
		List<Review>review = userService.selectReview(userNo);
		return new ModelAndView("user/myPage/myReview","review",review);
	}
	
	@RequestMapping("/myPage/updateReviewForm")
	public String updateReviewForm() {
		return "user/myPage/updateReviewForm";
	}
	
	@RequestMapping("/myPage/updateReview/{regNo}")
	public String  updateReview(Review review, @PathVariable Long regNo) {
		review.setRegisterGoods(mainService.goodsDetail(regNo));
		userService.updateReview(review);
		return null;
	}
	
	@RequestMapping("/myPage/deleteReview/{reviewNo}")
	public String deleteReview(@PathVariable Long reviewNo) {
		userService.deleteReview(reviewNo);
		return "";
	}
	
}//class


