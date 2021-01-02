package kosta.pro.rgmall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.Cart;
import kosta.pro.rgmall.domain.CartList;
import kosta.pro.rgmall.domain.Donation;
import kosta.pro.rgmall.domain.GoodsAnswer;
import kosta.pro.rgmall.domain.GoodsQuestion;
import kosta.pro.rgmall.domain.Orders;
import kosta.pro.rgmall.domain.Refund;
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

	// 마이페이지 기본 폼 띄우기
	@RequestMapping("/myPage")
	public ModelAndView myPageMain(HttpServletRequest request) {
		String state = request.getParameter("state");
		ModelAndView mv = new ModelAndView("user/myPageForm");
		if (state != null) {
			mv.addObject("state", state);
		}

		return mv;
	}

	// 마이페이지 주문목록/배송 조회 폼
	@RequestMapping("/myPage/userOrderList")
	public ModelAndView userOrderList(HttpSession session) {

		UserList userList = (UserList) session.getAttribute("userList");
		List<Orders> orderList = userService.selectOrders(userList.getUserNo());

		return new ModelAndView("myPage/userOrderList", "orderList", orderList);
	}

	// 마이페이지 주문목록/배송 조회 - 주문취소
	@RequestMapping("/myPage/userOrderList/orderCancel/{orderNo}")
	public ModelAndView orderCancel(@PathVariable Long orderNo) {
		userService.deleteOrders(orderNo);

		return new ModelAndView("redirect:/user/myPage");
	}

	// 마이페이지 주문목록/배송 조회 - 환불신청폼
	@RequestMapping("/myPage/userOrderList/refundForm/{orderNo}")
	public ModelAndView refundForm(@PathVariable Long orderNo) {

		Orders orders = userService.findOrdersById(orderNo);

		return new ModelAndView("ETC/refundForm", "orders", orders);
	}

	// 마이페이지 주문목록/배송 조회 - 환불신청
	@ResponseBody
	@RequestMapping("/myPage/userOrderList/requestRefund/{orderNo}")
	public int requestRefund(HttpSession session, @PathVariable Long orderNo, String refundReason) {
		int result = 0;
		UserList userList = (UserList) session.getAttribute("userList");
		result = userService.insertRefund(orderNo, userList, refundReason);

		return result;
	}

	// 마이페이지 취소/환불내용 조회 폼
	@RequestMapping("/myPage/userOrderCancelList")
	public ModelAndView userOrderCancelList(HttpSession session) {
		UserList userList = (UserList) session.getAttribute("userList");
		List<Refund> refundList = userService.selectRefund(userList.getUserNo());

		return new ModelAndView("myPage/userOrderCancelList", "refundList", refundList);
	}

	// 마이페이지 상품문의내역 조회
	@RequestMapping("/myPage/userGoodsQuestionList")
	public ModelAndView userGoodsQuestionList(HttpSession session) {

		UserList userList = (UserList) session.getAttribute("userList");

		Long userNo = userList.getUserNo();

		List<GoodsQuestion> goodsQuestionList = userService.selectGoodsQuestion(userNo);

		ModelAndView mv = new ModelAndView();

		mv.addObject("goodsQuestionList", goodsQuestionList);

		mv.setViewName("myPage/userGoodsQuestionList");
		return mv;

	}

	// 마이페이지 구매후기 내역 조회
	@RequestMapping("/myPage/userGoodsReviewList")
	public ModelAndView myReview(HttpSession session) {
		UserList userList = (UserList) session.getAttribute("userList");
		Long userNo = userList.getUserNo();
		List<Review> review = userService.selectReview(userNo);
		return new ModelAndView("myPage/userGoodsReviewList", "review", review);
	}

	// 마이페이지 찜 목록 - 조회
	@RequestMapping("/myPage/userWishList")
	public ModelAndView userWishList(HttpSession session) {
		UserList userInfo = (UserList) session.getAttribute("userList");
		Long userNo = userInfo.getUserNo();
		List<WishList> wishList = userService.selectWishList(userNo);

		return new ModelAndView("myPage/userWishList", "wishList", wishList);
	}

	// 마이페이지 찜 목록 - 찜목록 삭제
	@RequestMapping("/deleteWishList")
	public String deleteWishList(HttpSession session, Long regNo, String state) {

		UserList userList = (UserList) session.getAttribute("userList");

		System.out.println(state);

		if (state == null) {
			WishList wishList = userService.selectWishNo(regNo);
			userService.deleteWishList(wishList.getWishNo());
		} else {
			userService.deleteWishListByUserNo(userList.getUserNo());
		}

		return "redirect:/user/myPage?state=3";
	}// deleteWishList

	/// 마이페이지 찜 목록 - 찜목록에서 장바구니 추가
	@RequestMapping("/insertcart")
	public String cart(HttpSession session, int qua, Long regNo) {
		UserList userInfo = (UserList) session.getAttribute("userList");
		Long userNo = userInfo.getUserNo();

		List<Cart> list = userService.selectCart(userNo);
		for (Cart c : list) {
			if (c.getRegisterGoods().getRegNo() == regNo) {
				userService.updateCart(regNo);
				if (qua == 0) {
					return "redirect:/user/wishList";
				} else {
					return "redirect:/main/goodsDetail/" + regNo;
				}
			}
		}

		Cart cart = new Cart();
		UserList userList = new UserList();
		userList.setUserNo(userNo);
		RegisterGoods registerGoods = new RegisterGoods();
		registerGoods.setRegNo(regNo);
		cart.setRegisterGoods(registerGoods);
		cart.setUserList(userList);
		if (qua == 0) {
			cart.setQuantity(1);
			userService.insertCart(cart);
			return "redirect:/user/wishList";
		} else {
			cart.setQuantity(qua);
			userService.insertCart(cart);
			return "redirect:/main/goodsDetail/" + regNo;
		}
	}// cart

	// 마이페이지 장바구니 목록 조회
	@RequestMapping("/myPage/userCartList")
	public ModelAndView userCartList(HttpSession session) {

		UserList userInfo = (UserList) session.getAttribute("userList");
		Long userNo = userInfo.getUserNo();
		List<Cart> cartList = userService.selectCart(userNo);

		return new ModelAndView("myPage/userCartList", "cartList", cartList);
	}

	// 마이페이지 장바구니 목록 조회 - 장바구니 변경
	@RequestMapping("/cartInfoChange")
	@ResponseBody
	public int cartInfoChange(String unitQuantitiy, String unitPrice, HttpSession session, Long regNo) {
		UserList userInfo = (UserList) session.getAttribute("userList");
		Long userNo = userInfo.getUserNo();
		List<Cart> list = userService.selectCart(userNo);
		for (Cart c : list) {
			if (c.getRegisterGoods().getRegNo() == regNo) {
				userService.updateCart2((Integer.parseInt(unitQuantitiy) - c.getQuantity()), regNo);
			}
		}

		return Integer.parseInt(unitQuantitiy) * Integer.parseInt(unitPrice);
	}// cartInfoChange

	// 마이페이지 장바구니 목록 조회 - 장바구니 삭제
	@RequestMapping("/deleteCartList")
	public String deleteCartList(Long regNo, HttpSession session) {
		UserList userInfo = (UserList) session.getAttribute("userList");
		Long userNo = userInfo.getUserNo();
		userService.deleteCart(userNo, regNo);
		return "redirect:/user/myPage?state=2";
	}

	// 마이페이지-개인정보확인/수정 - 개인정보 수정전 비밀번호 확인폼
	@RequestMapping("/myPage/passWordCheck")
	public ModelAndView userPassWordCheck() {
		return new ModelAndView("myPage/passWordCheck");
	}

	// 마이페이지-개인정보확인/수정 - 개인정보수정폼
	@RequestMapping("/myPage/updateUserListForm")
	public String updateUserListForm() {
		return "user/myPage/updateUserList";
	}// updateUserListForm

	// 마이페이지-개인정보확인/수정 - //개인정보수정
	@RequestMapping("/myPage/updateUserList")
	public String updateUserList(UserList userList, HttpSession session) {
		UserList sessionUser = (UserList) session.getAttribute("userList");
		userList.setUserNo(sessionUser.getUserNo());
		userService.updateUserList(userList);
		return "user/myPageForm";
	}// updateUserList

	

	// 포인트 기부폼
	@RequestMapping("myPage/userPointDonate")
	public ModelAndView donationForm(HttpSession session) {
		UserList userInfo = (UserList) session.getAttribute("userList");
		Long userNo = userInfo.getUserNo();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("myPage/donationForm");
		
		Donation dona=userService.selectMyDonation(userNo);
		
		if(dona==null) {
			Donation dona2= new Donation();
			dona2.setDonaPoint(0);
			mv.addObject("donaPoint", dona2.getDonaPoint());
		}else {
			mv.addObject("donaPoint", dona.getDonaPoint());
		}
		
		mv.addObject("donaList", userService.selectAllDonation());
		return mv;
	}// donationForm

	
	// 기부하기
	@RequestMapping("myPage/donation")
	public String donation(int dona, HttpSession session) {
		UserList userInfo = (UserList) session.getAttribute("userList");
		Long userNo = userInfo.getUserNo();
		UserList userList = new UserList();
		userList.setUserNo(userNo);
		Donation donation = new Donation();
		donation.setDonaPoint(dona);
		donation.setUserList(userList);
		System.out.println("33333333333333333333333333333333");
		System.out.println(donation);
		System.out.println(donation.getUserList());
		Donation dbdona=userService.selectMyDonation(userNo);
		if(dbdona==null) {
			userService.insertDonation(donation,userNo);
			//Donation dona2= new Donation();
			//dona2.setDonaPoint(0);
			
		}else {
			userService.updateDonation(userNo, dona);
		}
		//		if(userService.selectMyDonation(userNo)==null) {
		//		userService.insertDonation(donation,userNo);
		//	}else {
		//		userService.updateDonation(userNo, dona);
		//	}
		return "redirect:/user/myPage?state=7";
	}// donation
	
	/**
	 * 마이페이지 나의 등급보기
	 * */
	@RequestMapping("/myPage/userPointGradeList")
	public ModelAndView main(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UserList user = (UserList)session.getAttribute("userList");
		Long userNo = user.getUserNo();
		int myPay = userService.selectUserPay(userNo);
		UserList userList = userService.findByUserListbyUserNo(userNo); // 임의 회원 정보 넣음
		Long gradeNo = userList.getUsergrade().getGradeNo();
		if(gradeNo==3) {
			mv.addObject("aqPay","R.P MALL 의 로얄등급에 감사합니다");
		}else {
			UserGrade next = userService.selectNextGrade(gradeNo+1);
			int aqPay = next.getLowPrice()-myPay;
			mv.addObject("aqPay", aqPay);
		}
		List<UserGrade> userGradeList = userService.selectAllUserGrade();
		mv.setViewName("myPage/main");
		mv.addObject("myPay", myPay);
		mv.addObject("userList", userList);
		mv.addObject("userGradeList", userGradeList);

		return mv;
	}// main
	
	/**
	 * 회원 및 관리자의 로그아웃 기능
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main/index";
	}// logout

	/**
	 * 찜목록 추가기능
	 */
	@RequestMapping("insertwish")
	public String wish(Long regNo, HttpSession session) {
		System.out.println("33333333333333333333" + regNo);
		UserList userInfo = (UserList) session.getAttribute("userList");
		Long userNo = userInfo.getUserNo();
		List<WishList> list = userService.selectWishList(userNo);
		for (WishList w : list) {
			if (w.getRegisterGoods().getRegNo() == regNo) {
				return "redirect:/main/goodsDetail/" + regNo;
			}
		}
		UserList userList = new UserList();
		userList.setUserNo(userNo);
		RegisterGoods registerGoods = new RegisterGoods();
		registerGoods.setRegNo(regNo);
		WishList wishList = new WishList(null, userList, registerGoods);
		userService.insertWishList(wishList);
		return "redirect:/main/goodsDetail/" + regNo;
	}// wish

	// 찜목록 조회
	@RequestMapping("wishList")
	public ModelAndView wishList(HttpSession session) {
		UserList userInfo = (UserList) session.getAttribute("userList");
		Long userNo = userInfo.getUserNo();
		List<WishList> list = userService.selectWishList(userNo);
		return new ModelAndView("user/wishList", "list", list);
	}// wishList

	// 상품후기 등록폼(상품구매 후)
	@RequestMapping("/myPage/writeReviewForm/{regNo}")
	public ModelAndView writeReviewForm(@PathVariable Long regNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/myPage/writeReview");
		mv.addObject("regNo", regNo);
		return mv;
	}

	// 상품후기 등록
	@RequestMapping("/myPage/insertReview/{regNo}")
	public String inserReview(Review review, @PathVariable Long regNo, HttpSession session) {
		UserList userList = (UserList) session.getAttribute("userList");
		review.setUserList(userList);
		review.setRegisterGoods(mainService.goodsDetail(regNo));
		;
		userService.insertReview(review);
		return "redirect:/user/myPage?state=4";
	}

	// 후기 수정폼
	@RequestMapping("/myPage/updateReviewForm/{reviewNo}")
	public ModelAndView updateReviewForm(@PathVariable Long reviewNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/myPage/updateReviewForm");
		mv.addObject("reviewNo", reviewNo);
		return mv;
	}

	// 후기 수정
	@RequestMapping("/myPage/updateReview/{reviewNo}")
	public String updateReview(Review review, @PathVariable Long reviewNo) {
		review.setReviewNo(reviewNo);
		userService.updateReview(review);
		return "redirect:/user/myPage?state=4";
	}

	// 후기삭제
	@RequestMapping("/myPage/deleteReview/{reviewNo}")
	public String deleteReview(@PathVariable Long reviewNo) {
		userService.deleteReview(reviewNo);
		return "redirect:/user/myPage?state=4";
	}

	/**
	 * 바로구매하기버튼 누를시 주문창으로 이동하는 Controller 1. Cart에 현재 아이템의 정보를 DB에 저장한다. 2. 해당 카트에
	 * 대한 정보를 MAP에 저장한다.(Quantity)필요 3. RegNo를 이용하여 RegistGoods를 불러와 Map에 저장
	 */
	@RequestMapping("/instantBuy/{regNo}")
	public ModelAndView instantBuy(HttpSession session, @PathVariable Long regNo, int quantity) {
		UserList userList = (UserList) session.getAttribute("userList");
		UserList dbUserList = userService.findByUserListbyUserNo(userList.getUserNo());
		RegisterGoods registerGoods = mainService.goodsDetail(regNo);
		Cart dbCart = userService.insertCart(new Cart(null, quantity, userList, registerGoods));

		Map<Long, Object> buyMap = new HashMap<Long, Object>();

		buyMap.put(dbCart.getCartNo(), dbCart);
		int price = dbCart.getQuantity() * dbCart.getRegisterGoods().getPrice();

		ModelAndView mv = new ModelAndView("user/order");

		mv.addObject("userList", dbUserList);
		mv.addObject("buyMap", buyMap);
		mv.addObject("totalPrice", price);

		return mv;
	}

	@RequestMapping("/buyCartGoods")
	public ModelAndView buyCartGoods(HttpSession session) {
		UserList userList = (UserList) session.getAttribute("userList");
		UserList dbUserList = userService.findByUserListbyUserNo(userList.getUserNo());
		List<Cart> list = userService.selectCart(dbUserList.getUserNo());
		Map<Long, Object> buyMap = new HashMap<Long, Object>();

		int price = 0;
		for (Cart cart : list) {
			buyMap.put(cart.getCartNo(), cart);
			price += cart.getQuantity() * cart.getRegisterGoods().getPrice();
		}

		ModelAndView mv = new ModelAndView("user/order");

		mv.addObject("userList", dbUserList);
		mv.addObject("buyMap", buyMap);
		mv.addObject("totalPrice", price);

		return mv;
	}

	/**
	 * 상품 결제 폼열기- 계좌이체
	 */
	@RequestMapping("/payMethod/account")
	public void payAccount() {

	}

	/**
	 * 상품 결제 폼열기- 신용카드/체크카드
	 */
	@RequestMapping("/payMethod/card")
	public ModelAndView payCard(String shippingAddr, int totalPrice, int realPay, int usingPoints, CartList cartList) {

		ModelAndView mv = new ModelAndView("payMethod/payCard");

		mv.addObject("shippingAddr", shippingAddr);
		mv.addObject("totalPrice", totalPrice);
		mv.addObject("realPay", realPay);
		mv.addObject("usingPoints", usingPoints);
		mv.addObject("cartList", cartList.getCartList());

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
	public int payGoods(HttpSession session, String shippingAddr, int totalPrice, int realPay, int usingPoints,
			CartList cartList, Long payNo) {
		int result = 0;
		UserList userList = (UserList) session.getAttribute("userList");
		try {
			userService.payGoods(shippingAddr, totalPrice, realPay, usingPoints, cartList, payNo, userList.getUserNo());
		} catch (RuntimeException e) {
			System.out.println("error");
			result = 1;
		}

		System.out.println("리턴 : " + result);
		return result;
	}
	
	

}// class
