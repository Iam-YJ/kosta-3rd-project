package kosta.pro.rgmall.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		return adminRep.adminLogin(adminId, adminPwd);
	}

	@Override
	public int insertGoods(RegisterGoods registerGoods) {
		registerGoodsRep.save(registerGoods);
		return 0;
	}
	
	@Override
	public void insertNotice(Notice notice) {
		Notice not = noticeRep.save(notice);
		System.out.println("not = " + not);
		if(not == null) {
			throw new RuntimeException("내용이 존재하지 않습니다");
		}
	}
	
	@Override
	public Notice selectByNotice(Long noticeNo) {
		return noticeRep.findById(noticeNo).orElse(null);
	}
	
	@Override
	public void updateNotice(Notice notice) {
		Notice dbNotice = noticeRep.findById(notice.getNoticeNo()).orElse(null);
		if(dbNotice==null) {
			throw new RuntimeException("오류로 수정실패");
		}
		dbNotice.setTitle(notice.getTitle());
		dbNotice.setContent(notice.getContent());
	 }

	@Override
	public void deleteNotice(Long noticeNo) {
		Notice dbNotice = noticeRep.findById(noticeNo).orElse(null);
		if(dbNotice == null) {
			throw new RuntimeException("글번호 오류");
		}
		noticeRep.deleteById(noticeNo);
	}

	@Override
	public List<FAQ> selectAllFAQ() {
		return FAQRep.findAll();
	}
	
	@Override
	public Page<FAQ> selectAll(Pageable pageable) {
		return FAQRep.findAll(pageable);
	}
	
	@Override
	public void insertFAQ(FAQ faq) {
		if(FAQRep.save(faq)== null) {
			throw new RuntimeException("내용이 존재하지 않습니다");
		}
		FAQRep.save(faq);
	}

	@Override
	public void updateFAQ(FAQ faq) {
		
		System.out.println("===============================");
		System.out.println("faq =" + faq);
		
		System.out.println("===============================");
		FAQ dbFaq = FAQRep.findById(faq.getFaqNo()).orElse(null);
		System.out.println("dbFaq"+dbFaq);
//		
		if(dbFaq ==null) {
			throw new RuntimeException("FAQ번호 오류로 수정 실패");
		}
//		
		dbFaq.setQuestion(faq.getQuestion());
		dbFaq.setAnswer(faq.getAnswer());
//		
	}

	@Override
	public void deleteFAQ(FAQ faq) {
		FAQ dbFaq = FAQRep.findById(faq.getFaqNo()).orElse(null);
		if(dbFaq ==null) {
			throw new RuntimeException("FAQ번호 오류로 삭제 실패");
		}
		     
		FAQRep.deleteById(faq.getFaqNo());
	}
	
	@Override
	public FAQ selectByFaq(Long faqNo) {
		
		return FAQRep.findById(faqNo).orElse(null);
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

	/**
	 * 주문조회(신규/지난 주문조회) + 신규 주문조회(배송준비중만 보임)
	 * parameter의 0(지난주문조회)/1(신규주문조회)구분
	 * 이 항목의 경우 페이징 써야할수도 있음
	 */
	@Override
	public List<Orders> selectOrders(int parameter) {
		List<Orders> orderList = null;
		
		if(parameter == 0) {
			orderList = null;
		}else if(parameter == 1) {
			orderList = ordersRep.selectNewOrders();
		}
		
		return orderList;
	}

	
	/**
	 * 상품출고
	 * Orders 테이블의 Del_state가 배송중으로 변경
	 */
	@Override
	public int updateDelState(Long orderNo) {
		Orders orders = ordersRep.findById(orderNo).orElse(null);
		if(orders == null) {
			throw new RuntimeException("주문정보를 확인할 수 없습니다.");
		}
		orders.setDelState("배송중");
		
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
		mainCategoriesRep.save(mainCategories);
		return 1;
	}

	@Override
	public int insertSubCategory(SubCategories subCategories) {
		subCategoriesRep.save(subCategories);
		return 1;
	}

	@Override
	public int updateMainCategory(MainCategories mainCategories) {
		String mainCategoryName = mainCategories.getMainCategoryName();
		Long mainCategoryNo = mainCategories.getMainCategoryNo();
		return mainCategoriesRep.updateMainCategory(mainCategoryName, mainCategoryNo);
	}

	@Override
	public int updateSubCategory(SubCategories subCategories) {
		String subCategoryName = subCategories.getSubCategoryName();
		Long subCategoryNo = subCategories.getSubCategoryNo();
		return subCategoriesRep.updateMainCategory(subCategoryName, subCategoryNo);
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
		return userListRep.selectAllUser();
	}


}
