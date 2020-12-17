package kosta.pro.rgmall.service;

import java.util.List;


import org.springframework.boot.autoconfigure.kafka.KafkaProperties.Admin;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
public class AdminServiceImpl implements AdminService {

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
	public Admin adminLogin(String adminId, String adminPwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertGoods(RegisterGoods registerGoods) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFAQ(FAQ faq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateFAQ(FAQ faq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFAQ(FAQ faq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RegisterGoods> selectGoods(int State) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateGoods(RegisterGoods registerGoods) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAdGoods(Long regNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Orders> selectNewOrders(int parameter) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateDelState(Long orderNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Refund> selectRefundGoods() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int refundGoods(Long RefundNo, int refundState) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertMainCategory(MainCategories mainCategories) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSubCategory(SubCategories subCategories) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMainCategory(MainCategories mainCategories) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSubCategory(SubCategories subCategories) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<GoodsQuestion> selectGoodsQuestion() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertGoodsAnswer(GoodsAnswer goodsAnswer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteGoodsAnswer(Long agoodsNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Review> selectReview() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkProfit(String startDate, String endDate) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserList> searchAllUser(String grade, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
