package kosta.pro.rgmall.service;

import java.util.List;

import kosta.pro.rgmall.domain.Cart;
import kosta.pro.rgmall.domain.Donation;
import kosta.pro.rgmall.domain.GoodsQuestion;
import kosta.pro.rgmall.domain.Orders;
import kosta.pro.rgmall.domain.Refund;
import kosta.pro.rgmall.domain.Review;
import kosta.pro.rgmall.domain.UserGrade;
import kosta.pro.rgmall.domain.UserList;
import kosta.pro.rgmall.domain.WishList;

public interface UserService {

	
	/**
	 * 개인정보 수정 
	 * */
	public int updateUserList(UserList userList);
	
	/**
	 * 주문목록/배송조회
	 * */
	public List<Orders> selectOrders(Long userNo);
	
	/**
	 * 환불 신청하기
	 * */
	public int insertRefund(Refund refund);
	
	/**
	 * 환불 내역조회
	 * */
	public List<Refund> selectRefund(Long userNo);
	
	/**
	 * 상품문의 등록하기
	 * */
	public int insertGoodsQuestion(GoodsQuestion goodsQuestion);
	
	/**
	 * 상품문의 조회하기
	 * */
	public List<GoodsQuestion> selectGoodsQuestion(Long userNo);
	
	/**
	 * 상품문의 수정하기
	 * */
	public int updateGoodsQuestion(GoodsQuestion goodsQuestion);
	
	/**
	 * 상품문의 삭제하기
	 * */
	public int deleteGoodsQuestion(Long qgoodsNo);
	
	/**
	 * 구매후기 등록하기
	 * */
	public int insertReview(Review review);
	
	/**
	 * 구매후기 조회하기
	 * */
	public int selectReview(Long userNo);
	
	/**
	 * 구매후기 수정하기
	 * */
	public int updateReview(Review review);
	
	/**
	 * 구매후기 삭제하기
	 * */
	public int deleteReview(Long reviewNo);
	
	/**
	 * 찜리스트 등록하기
	 * */
	public int insertWishList(WishList wishList);
	
	/**
	 * 찜리스트 조회하기
	 * */
	public List<WishList> selectWishList(Long userNo);
	
	/**
	 * 찜리스트 수정하기
	 * */
	public int updateWishList(WishList wishList);
	
	/**
	 * 찜리스트 삭제하기
	 * */
	public int deleteWishList(Long wishNo);
	
	
	/**
	 * 장바구니 등록하기
	 * */
	public int insertCart(Cart cart);

	/**
	 * 장바구니 조회하기
	 * */
	public List<Cart> selectCart(Long userNo);
	
	/**
	 * 장바구니 수정하기
	 * */
	public int updateCart(Cart cart);
	
	/**
	 * 장바구니 삭제하기
	 * */
	public int deleteCart(Long userNo);
	
	/**
	 * 포인트 조회하기
	 * 등급 조회하기
	 * */
	public UserList selectPointandGrade(String userId);
	
	/**
	 * 등급 전체 조회하기
	 */
	public List<UserGrade> selectAllUserGrade();
	
	/**
	 * 포인트 기부하기
	 * 도네이션 테이블의 기부 내역을 저장하고, userList 테이블에서 기부한만큼 포인트 차감
	 * */
	public int insertDonation(Donation donation);
	
	/**
	 * 누적기부 포인트 조회하기(내꺼보기)
	 * */
	public int selectMyDonation(Long userNo);

	/**
	 * 누적기부 포인트 조회하기 (전체보기)
	 * */
	public List<Donation> selectAllDonation();
	
	/**
	 * 결제하기 
	 * */
	public int insertPay(Cart cart);

	/**
	 * 로그인 API용 등급(일반만 가져옴)
	 */
	public UserGrade loginAPIGrade();
}
