package kosta.pro.rgmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import kosta.pro.rgmall.domain.Cart;
import kosta.pro.rgmall.domain.Donation;
import kosta.pro.rgmall.domain.Orders;
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
	public ModelAndView userOrderList(HttpSession session) {
		
		UserList userList = (UserList)session.getAttribute("userList");
		List<Orders> orderList = userService.selectOrders(userList.getUserNo());
		
		return new ModelAndView("myPage/userOrderList","orderList",orderList);
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
	
	//마이페이지-개인정보확인/수정 - 개인정보 수정전 비밀번호 확인폼
	@RequestMapping("/myPage/passWordCheck")
	public ModelAndView userPassWordCheck() {
		return new ModelAndView("myPage/passWordCheck");
	}
	
	//마이페이지-개인정보확인/수정 - 개인정보수정폼
	@RequestMapping("/mypage/updateUserListForm")
	public String updateUserListForm() {
		return "user/myPage/updateUserList";
	}//updateUserListForm
	
	//마이페이지-개인정보확인/수정 - //개인정보수정
	@RequestMapping("/mypage/updateUserList")
	public String updateUserList(UserList userList,HttpSession session) {
		UserList sessionUser = (UserList)session.getAttribute("userList");
		userList.setUserNo(sessionUser.getUserNo());
		userService.updateUserList(userList);
		return "user/myPage/main";
	}//updateUserList
	
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
	
	/**
	 * 회원 및 관리자의 로그아웃 기능
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main/index";
	}//logout
	
	/**
	 * 찜목록 추가기능
	 */
	@RequestMapping("insertwish")
	public String wish(Long regNo, HttpSession session) {
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
	
	
	@RequestMapping("wishList")
	public ModelAndView wishList(HttpSession session) {
		UserList userInfo=(UserList) session.getAttribute("userList");
		Long userNo= userInfo.getUserNo();
		List<WishList> list=userService.selectWishList(userNo);
		return new ModelAndView("/user/wishList","list",list);
	}//wishList
	
	@RequestMapping("/deleteWishList")
	public String deleteWishList(Long regNo,HttpSession session) {
		WishList whishList=userService.selectWishNo(regNo);
		userService.deleteWishList(whishList.getWishNo());
		return "redirect:/user/wishList" ;
	}//deleteWishList
	

	/**
	 * 장바구니 추가기능
	 */
	@RequestMapping("/insertcart")
	public String cart(HttpSession session,int qua, Long regNo) {
		UserList userInfo=(UserList) session.getAttribute("userList");
		Long userNo= userInfo.getUserNo();
		Cart cart = new Cart();
		UserList userList= new UserList();
		userList.setUserNo(userNo);
		RegisterGoods registerGoods= new RegisterGoods();
		registerGoods.setRegNo(regNo);
		cart.setRegisterGoods(registerGoods);
		cart.setUserList(userList);
		cart.setQuantity(qua);
		userService.insertCart(cart);
		return "redirect:/main/goodsDetail/"+regNo ;
	}//cart
	
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
	
	@RequestMapping("/cartInfoChange")
	@ResponseBody
	public int cartInfoChange(String unitQuantitiy, String unitPrice) {
		System.out.println(unitQuantitiy+"============unitQuantitiy==========");
		System.out.println(unitPrice+"===========unitPrice===========");
		System.out.println(Integer.parseInt(unitQuantitiy)+"======Integer.parseInt(unitQuantitiy)================");
		System.out.println(Integer.parseInt(unitPrice)+"==========Integer.parseInt(unitPrice)============");
		//Integer.parseInt(unitQuantitiy)*Integer.parseInt(unitPrice);
		
		return 0;
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
	
	/**
	 * 바로구매하기버튼 누를시 주문창으로 이동하는 Controller
	 * 1. Cart에 현재 아이템의 정보를 DB에 저장한다.
	 * 2. 해당 카트에 대한 정보를 MAP에 저장한다.(Quantity)필요
	 * 3. RegNo를 이용하여 RegistGoods를 불러와 Map에 저장
	 */
	@RequestMapping("/instantBuy/{regNo}")
	public ModelAndView instantBuy(HttpSession session, @PathVariable Long regNo, int quantity) {
		
		UserList userList = (UserList)session.getAttribute("userList");
		RegisterGoods registerGoods = mainService.goodsDetail(regNo);
		Cart cart = new Cart(null, quantity, userList, registerGoods);
		userService.insertCart(cart);
		
		Map<String, Object> buyMap = new HashMap<String, Object>();
		buyMap.put("registerGoods", registerGoods);
		buyMap.put("cart", cart);
		
		return new ModelAndView("user/order","buyMap",buyMap);
	}
	
	/**
	 * 상품 결제 폼열기- 계좌이체 
	 */
	@RequestMapping("/payMethod/account")
	public void payAccount() {
		
	}
	
	/**
	 * 상품 결제  폼열기- 신용카드/체크카드
	 */
	@RequestMapping("/payMethod/card")
	public ModelAndView payCard(String shippingAddr, int totalPrice, int realPay, Long regNo, 
			int quantity, int unitPrice, int unitTotalPrice, int usingPoints, Long cartNo) {
		
		ModelAndView mv = new ModelAndView("payMethod/payCard");
		mv.addObject("shippingAddr", shippingAddr);
		mv.addObject("totalPrice", totalPrice);
		mv.addObject("realPay", realPay);
		mv.addObject("regNo", regNo);
		mv.addObject("quantity", quantity);
		mv.addObject("unitPrice", unitPrice);
		mv.addObject("unitTotalPrice", unitTotalPrice);
		mv.addObject("usingPoints", usingPoints);
		mv.addObject("cartNo", cartNo);
		
		return mv;
	}
	/**
	 * 상품 결제 폼열기 - 휴대폰 결제 방법
	 */
	@RequestMapping("/payMethod/phone")
	public void payPhone() {
		
	}
	/**
	 * 상품 결제\ 폼열기- 무통장 입금(가상계좌)
	 */
	@RequestMapping("/payMethod/virtualAccount")
	public void payVirtualAccount() {
		
	}
	
	/**
	 * 결제하기
	 */
	
	@RequestMapping("/payGoods")
	@ResponseBody
	public int payGoods(HttpSession session, String shippingAddr, int totalPrice, int realPay, Long regNo, 
			int quantity, int unitPrice, int unitTotalPrice, int usingPoints, Long cartNo, Long payNo) {
		int result = 0;
		UserList userList = (UserList)session.getAttribute("userList");
		try 
		{
			userService.payGoods(shippingAddr, totalPrice, realPay, regNo, quantity, unitPrice, unitTotalPrice, usingPoints, cartNo, payNo, userList.getUserNo());		
			System.out.println(3);
		} catch (RuntimeException e) {
			System.out.println("error");
			result = 1;
		}
		
		System.out.println("리턴 : " + result);
		return result;
	}
	
	
}//class


