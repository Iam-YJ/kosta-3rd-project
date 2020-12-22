package kosta.pro.rgmall.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.pro.rgmall.domain.Cart;
import kosta.pro.rgmall.domain.Donation;
import kosta.pro.rgmall.domain.GoodsQuestion;
import kosta.pro.rgmall.domain.Orders;
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

	@Override
	public int updateUserList(UserList userList) {
		String passWord = userList.getPassWord();
		String email = userList.getEmail();
		String addr  = userList.getAddr();
		String phone = userList.getPhone();
		Long userNo = userList.getUserNo();
		return userListRep.updateUserList(passWord,addr,phone, email,userNo);
	}

	@Override
	public List<Orders> selectOrders(Long userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertRefund(Refund refund) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Refund> selectRefund(Long userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertGoodsQuestion(GoodsQuestion goodsQuestion) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<GoodsQuestion> selectGoodsQuestion(Long userNo) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectReview(Long userNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(Long reviewNo) {
		// TODO Auto-generated method stub
		return 0;
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

	@Override
	public int deleteWishList(Long wishNo) {
		wishListRep.deleteById(wishNo);
		return 0;
	}

	@Override
	public int insertCart(Cart cart) {
		cartRep.save(cart);
		return 0;
	}

	@Override
	public List<Cart> selectCart(Long userNo) {
		return cartRep.findByUserListUserNo(userNo);
	}

	@Override
	public int updateCart(Cart cart) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCart(Long userNo) {
		// TODO Auto-generated method stub
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
	public void insertDonation(Donation donation) {
		Donation dona=donationRep.save(donation);
//		if(dona==null) {
//			throw new RuntimeException("기부가 실패했습니다.");
//		}
	}
	
	@Override
	public void updateDonation(Long userNo, int dona ) {
		donationRep.updateDonation(dona, userNo);
	}
	
	@Override
	public Donation selectMyDonation(Long userNo) {
		Donation dona =donationRep.findByUserListUserNo(userNo);
//		if(dona==null) {
//			throw new RuntimeException("기부가 실패했습니다.");
//		}
		return dona;
	}

	@Override
	public List<Donation> selectAllDonation() {
		return donationRep.findAll();
	}

	@Override
	public int insertPay(Cart cart) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserGrade loginAPIGrade() {
		UserGrade userGradeResult = userGradeRep.findById((long) 4).orElse(null);
		return userGradeResult;
	}

	@Override
	public RegisterGoods selectGoods(Long regNo) {
		RegisterGoods registerGoods =registerGoodsRep.findByRegNo(regNo);
//		if(registerGoods==null) throw new RuntimeException("오류로 인해 상품이미지를 불러오지 못했습니다.");
		return registerGoods;
	}


}
