package kosta.pro.rgmall.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.pro.rgmall.domain.Cart;
import kosta.pro.rgmall.domain.CartList;
import kosta.pro.rgmall.domain.Donation;
import kosta.pro.rgmall.domain.GoodsQuestion;
import kosta.pro.rgmall.domain.OrderLine;
import kosta.pro.rgmall.domain.Orders;
import kosta.pro.rgmall.domain.Pay;
import kosta.pro.rgmall.domain.Refund;
import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.Review;
import kosta.pro.rgmall.domain.UserGrade;
import kosta.pro.rgmall.domain.UserList;
import kosta.pro.rgmall.domain.WishList;
import kosta.pro.rgmall.repository.AdminRepository;
import kosta.pro.rgmall.repository.CartRepository;
import kosta.pro.rgmall.repository.DonationRepository;
import kosta.pro.rgmall.repository.FAQRepository;
import kosta.pro.rgmall.repository.GoodsAnswerRepository;
import kosta.pro.rgmall.repository.GoodsQuestionRepository;
import kosta.pro.rgmall.repository.MainCategoriesRepository;
import kosta.pro.rgmall.repository.NoticeRepository;
import kosta.pro.rgmall.repository.OrderLineRepository;
import kosta.pro.rgmall.repository.OrdersRepository;
import kosta.pro.rgmall.repository.PayRepository;
import kosta.pro.rgmall.repository.RefundRepository;
import kosta.pro.rgmall.repository.RegisterGoodsRepository;
import kosta.pro.rgmall.repository.ReviewRepository;
import kosta.pro.rgmall.repository.SubCategoriesRepository;
import kosta.pro.rgmall.repository.UserGradeRepository;
import kosta.pro.rgmall.repository.UserListRepository;
import kosta.pro.rgmall.repository.WishListRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

	private final AdminRepository adminRep;
	private final CartRepository cartRep;
	private final DonationRepository donationRep;
	private final FAQRepository FAQRep;
	private final GoodsAnswerRepository goodsAnswerRep;
	private final GoodsQuestionRepository goodsQuestionRep;
	private final MainCategoriesRepository mainCategoriesRep;
	private final SubCategoriesRepository subCategoriesRep;
	private final NoticeRepository noticeRep;
	private final OrderLineRepository orderLineRep;
	private final OrdersRepository ordersRep;
	private final PayRepository payRep;
	private final RefundRepository refundRep;
	private final RegisterGoodsRepository registerGoodsRep;
	private final ReviewRepository reviewRep;
	private final UserGradeRepository userGradeRep;
	private final UserListRepository userListRep;
	private final WishListRepository wishListRep;

	/**
	 * userNo에 해당하는 User정보 받아오기
	 */
	@Override
	public UserList findByUserListbyUserNo(Long userNo) {
		UserList userList = userListRep.findById(userNo).orElse(null);
		return userList;
	}
	
	
	@Override
	public int updateUserList(UserList userList) {
		String passWord = userList.getPassWord();
		String email = userList.getEmail();
		String addr  = userList.getAddr();
		String phone = userList.getPhone();
		Long userNo = userList.getUserNo();
		return userListRep.updateUserList(passWord,addr,phone, email,userNo);
	}

	
	/**
	 * OrderNo에 해당하는 Order객체 찾기
	 */
	public Orders findOrdersById(Long orderNo) {
		
		Orders orders = ordersRep.findById(orderNo).orElse(null);
				
		return orders;
	}
	
	/**
	 * userNo Order찾기
	 */
	@Override
	public List<Orders> selectOrders(Long userNo) {
		List<Orders> orderList = ordersRep.selectOrdersByUserNo(userNo);
		return orderList;
	}

	/**
	 * 주문취소
	 */
	@Override
	public int deleteOrders(Long orderNo) {
		ordersRep.deleteById(orderNo);
		
		return 0;
	}
	
	/**
	 *  환불신청
	 */
	@Override
	public int insertRefund(Long orderNo, UserList userList, String refundReason) {
		//order넘버가 없으면 저장
		Refund dbRefund = refundRep.selectRefundByOrderNo(orderNo);
		Orders orders = ordersRep.findById(orderNo).orElse(null);
		int result = 0;
		
		if(dbRefund == null) {
			Refund refund = new Refund(null, refundReason, null, "환불처리대기", " ", userList, orders);
			refundRep.save(refund);
			result = 0;
		}else {
			result = 1;
		}
		
		return result;
	}

	/**
	 * userNo를 이용한 모든 환불내역 조회
	 * */
	@Override
	public List<Refund> selectRefund(Long userNo) {
		
		List<Refund> refundList = refundRep.selectRefundByUserNo(userNo);
			
		return refundList;
	}

	@Override
	public int insertGoodsQuestion(GoodsQuestion goodsQuestion) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<GoodsQuestion> selectGoodsQuestion(Long userNo) {
		List<GoodsQuestion> goodsQuestion =  goodsQuestionRep.selectGoodsQuestionsByUserNo(userNo);
		return goodsQuestion;
	}

	@Override
	public int updateGoodsQuestion(GoodsQuestion goodsQuestion) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteGoodsQuestion(Long qgoodsNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReview(Review review) {
		reviewRep.save(review);
		return 1;
	}

	@Override
	public List<Review> selectReview(Long userNo) {
		return reviewRep.selectReviewByUserNo(userNo);
	}

	@Override
	public int updateReview(Review review) {
		String content = review.getContent();
		Long reviewNo = review.getReviewNo();
		return reviewRep.updateReview(content, reviewNo);
	}

	@Override
	public int deleteReview(Long reviewNo) {
		return reviewRep.deleteReview(reviewNo);
	}

	@Override
	public int insertWishList(WishList wishList) {
		wishListRep.save(wishList);
		return 0;
	}

	@Override
	public List<WishList> selectWishList(Long userNo) {
		List<WishList> list=wishListRep.findByUserListUserNo(userNo);
//		if(list.size()==0)throw new RuntimeException("오류로인해 찜목록을 가져오지 못했습니다.");
		return list;
	}
	
	@Override
	public WishList selectWishNo(Long regNo) {
		return wishListRep.findByRegisterGoodsRegNo(regNo);
	}
	

	@Override
	public int updateWishList(WishList wishList) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 찜리스트 삭제하기(단일 항목)
	 * */
	@Override
	public int deleteWishList(Long wishNo) {
		wishListRep.deleteById(wishNo);
		return 0;
	}

	/**
	 * 유저넘버에 해당하는 모든 찜리스트 삭제하기
	 * */
	@Override
	public int deleteWishListByUserNo(Long userNo) {
		wishListRep.deleteWishListByUserNo(userNo);
		return 0;
	}
	
	
	@Override
	public Cart insertCart(Cart cart) {
		//카트가 중복이면 저장 X
		Cart dbCart = cartRep.findCartByUserAndRegisterGoods
				(cart.getUserList().getUserNo(), cart.getRegisterGoods().getRegNo());

		if(dbCart == null) {
			cartRep.save(cart);
			dbCart = cartRep.findCartByUserAndRegisterGoods
					(cart.getUserList().getUserNo(), cart.getRegisterGoods().getRegNo());
		}
		
		return dbCart;
	}

	@Override
	public List<Cart> selectCart(Long userNo) {
		return cartRep.findByUserListUserNo(userNo);
	}

	@Override
	public int updateCart(Long regNo) {
		cartRep.updateCart(regNo);
		return 0;
	}
	
	@Override
	public int updateCart2(int qua,Long regNo) {
		cartRep.updateCart2(qua,regNo);
		return 0;
	}

	@Override
	public int deleteCart(Long userNo,Long regNo) {
		List<Cart> list=selectCart(userNo);
		for(Cart c : list) {
			System.out.println(c);
			if(c.getRegisterGoods().getRegNo()==regNo) {
				cartRep.delete(c);
			}
		}
		return 0;
	}

	@Override
	public UserList selectPointandGrade(String userId) {
		UserList userList = userListRep.selectPointandGrade(userId);
		return userList;
	}
	
	@Override
	public List<UserGrade> selectAllUserGrade() {
		List<UserGrade> userGrade = userGradeRep.findAll();
		return userGrade;
		
	}

	@Override
	public void insertDonation(Donation donation,Long userNo) {
		System.out.println("=======================");
		donationRep.save(donation);
		userListRep.addPoints(-donation.getDonaPoint(), userNo);
	}
	
	@Override
	public void updateDonation(Long userNo, int dona ) {
		donationRep.updateDonation(dona, userNo);
		userListRep.addPoints(-dona, userNo);
	}
	
	@Override
	public Donation selectMyDonation(Long userNo) {
		Donation dona =donationRep.findByUserListUserNo(userNo);
		System.out.println("333333333333333333333333333333333"+dona);
		 return dona;
	}

	@Override
	public List<Donation> selectAllDonation() {
		return donationRep.selectDonaList();
	}

	@Override
	public int insertPay(Cart cart) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserGrade loginAPIGrade() {
		UserGrade userGradeResult = userGradeRep.findById((long) 1).orElse(null);
		return userGradeResult;
	}

	@Override
	public RegisterGoods selectGoods(Long regNo) {
		RegisterGoods registerGoods = registerGoodsRep.findByRegNo(regNo);
//		if(registerGoods==null) throw new RuntimeException("오류로 인해 상품이미지를 불러오지 못했습니다.");
		return registerGoods;
	}
	
	/**
	 * 상품결제하기
	 * 1. Orders DB저장
	 * 2. Orderline DB저장
	 * 3. 재고감소
	 * 4. 카트제거
	 * 5. 유저 포인트 추가+감소
	 * 6. 등급 비교 후 감가.
	 */
	@Override
	public int payGoods(String shippingAddr, int totalPrice, int realPay, 
			 int usingPoints, CartList cartList, Long payNo, Long userNo) throws RuntimeException {
		//각종 정보 불러오기(User, RegisterGoods, Cart, Pay);
		UserList dbUserList = userListRep.findById(userNo).orElse(null);
		Pay dbPay = payRep.findById(payNo).orElse(null);
		//Cart dbCart = cartRep.findById(cartNo).orElse(null);
		
		//1.Orders DB저장
		Orders orders = new Orders(null, shippingAddr, totalPrice, null, "배송준비중", realPay, dbUserList, dbPay);;
		ordersRep.save(orders);
		
		for(Cart cart : cartList.getCartList()) {
			//Cart에서 regNo를 불러와 RegisterGoodsdb불러오기;
			Cart dbcart = cartRep.findById(cart.getCartNo()).orElse(null);
			System.out.println(dbcart.getRegisterGoods().getRegNo());
			RegisterGoods dbRegisterGoods = registerGoodsRep.findById(dbcart.getRegisterGoods().getRegNo()).orElse(null);
			//OrderLine 생성
			OrderLine orderLine = new OrderLine(null, dbcart.getQuantity(), dbRegisterGoods.getPrice(), 
					dbcart.getQuantity()*dbRegisterGoods.getPrice(), orders, dbRegisterGoods); 
			//2. Orderline DB저장
			orderLineRep.save(orderLine);
			
			//3. 재고감소
			dbRegisterGoods.setStock(dbRegisterGoods.getStock()-dbcart.getQuantity());
			
			//4. 카트제거
			cartRep.delete(dbcart);
		}

		//5. 유저 포인트 감소(배송완료 후 포인트 추가)
		//if(dbUserList.getUsergrade())<--사용해야함
		
		dbUserList.setPoints(dbUserList.getPoints()-usingPoints);
		//6. 등급 비교 후 감가.
		return 0;
	}
}
