package kosta.pro.rgmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.pro.rgmall.domain.Admin;
import kosta.pro.rgmall.domain.FAQ;
import kosta.pro.rgmall.domain.GoodsAnswer;
import kosta.pro.rgmall.domain.GoodsQuestion;
import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.Notice;
import kosta.pro.rgmall.domain.Orders;
import kosta.pro.rgmall.domain.Refund;
import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.Review;
import kosta.pro.rgmall.domain.SubCategories;
import kosta.pro.rgmall.domain.UserList;

public interface AdminService {

	/**
	 * 관리자 로그인
	 */
	public Admin adminLogin(String adminId, String adminPwd);
	
	/**
	 * 상품등록
	 */
	public RegisterGoods insertGoods(RegisterGoods registerGoods);
	
	/**
	 * 공지사항 등록
	 */
	public void insertNotice(Notice notice);
	
	/**
	 * 공지사항 수정
	 */
	public void updateNotice(Notice notice);
	
	/**
	 * 공지사항 번호검색
	 */
	public Notice selectByNotice(Long noticeNo);

	/**
	 * 공지사항 삭제
	 */
	public void deleteNotice(Long noticeNo);
	
	/**
	 * FAQ 조회
	 * */
	public List<FAQ> selectAllFAQ();
	
	/**
	 * FAQ 페이징처리
	 * */
	Page<FAQ> selectAll(Pageable pageable);
	
	/**
	 * FAQ등록
	 */
	public void insertFAQ(FAQ faq);
	
	/**
	 * FAQ수정
	 */
	public void updateFAQ(FAQ faq);
	
	/**
	 * FAQ삭제
	 */
	public void deleteFAQ(FAQ faq);
	
	/**
	 * FAQ 번호 검색
	 * */
	FAQ selectByFaq(Long faqNo);
	
	//////////////////////////////////마이페이지
	
	/**
	 * 판매상품 조회
	 * 동적쿼리를 이용(전체, 광고, 재고)
	 * state = 0, 전체조회
	 * state = 1, 광고조회를 위한 state
	 * state = 2, 재고조회를 위한 state
	 */
	public List<RegisterGoods> selectGoods(int state);
	
	/**
	 * 판매상품 조회 관리(수정)
	 * + 재고량수정도 이걸로 사용
	 */
	public int updateGoods(RegisterGoods registerGoods);

	/**
	 * 광고상품 삭제(게시글 삭제가 아니라 광고사용여부를 수정)
	 */
	public void deleteAdGoods(Long regNo);
	
	
	/**
	 * 주문조회(신규/지난 주문조회) + 신규 주문조회(배송준비중만 보임)
	 * parameter의 0(지난주문조회)/1(신규주문조회)구분
	 * 이 항목의 경우 페이징 써야할수도 있음
	 */
	public List<Orders> selectOrders(int parameter);
	
	/**
	 * 상품출고
	 * Orders 테이블의 Del_state가 배송중으로 변경
	 */
	public int updateDelState(Long orderNo);
	
	/**
	 * 환불신청상품 조회 
	 */
	public List<Refund> selectRefundGoods();
	
	/**
	 * 환불신청상품 환불처리 (환불 승인, 환불 거절 - update refundtable -> refundstate를 변경)
	 * 0일 때 환불승인
	 * 1일 때 환불거절
	 * 
	 * 더 추가될 수도 있음
	 * 	if(refundState == 0){
		환불상태
		order 날리고
		재고량 고치고
		잔액
		포인트
		예치금
		
		}else {
			환불상태 변경 - 메세지도 입력
		}
	 */
	public int refundGoods(Long RefundNo, String refundReply, int refundState);

	/**
	 * 메인 카테고리 항목 추가
	 */
	public int insertMainCategory(MainCategories mainCategories);
	
	/**
	 * 서브 카테고리 항목 추가(서브카테고리는 메인카테고리를 Controller에서 set으로 받아서 넘김)
	 */
	public int insertSubCategory(SubCategories subCategories);
	
	/**
	 * 메인 카테고리 항목 수정
	 */
	public int updateMainCategory(MainCategories mainCategories);
	
	/**
	 * 서브 카테고리 항목 수정(서브카테고리)
	 */
	public int updateSubCategory(SubCategories subCategories);
	
	/**
	 * 상품문의내역 조회
	 */
	public List<GoodsQuestion> selectGoodsQuestion();
	
	/**
	 * 상품문의내역 답변
	 */
	public void insertGoodsAnswer(GoodsAnswer goodsAnswer);
	
	/**
	 * 상품문의내역 수정
	 */
	public void updateGoodsAnswer(GoodsAnswer goodsAnswer);
	
	
	/**
	 * 상품문의내역 삭제
	 */
	public int deleteGoodsAnswer(Long agoodsNo);
	
	
	/**
	 * 상품평 조회
	 */
	public List<Review> selectReview();
	
	/**
	 * 매출조회(기간별 조회 - 동적쿼리)
	 * Orders의 realPay를 계산해서 가져오기
	 */
	public List<String> checkProfit(String startDate,String endDate); 
	
	//public List<Orders> checkDayProfit(String orderDate);
	/**
	 * 회원조회
	 * (전체조회, 등급별조회, 검색어-사용자이름 조회)
	 * state ==0 등급별조회
	 * state ==1 유저번호순 조회
	 * state ==2 아이디 A-Z 조회
	 */
	public List<UserList> searchAllUser(int state);
		
	public UserList searchById(String userId);

	

	
}
