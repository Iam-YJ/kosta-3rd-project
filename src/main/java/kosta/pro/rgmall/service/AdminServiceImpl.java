package kosta.pro.rgmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.pro.rgmall.controller.MailController;
import kosta.pro.rgmall.domain.Admin;
import kosta.pro.rgmall.domain.FAQ;
import kosta.pro.rgmall.domain.GoodsAnswer;
import kosta.pro.rgmall.domain.GoodsQuestion;
import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.Notice;
import kosta.pro.rgmall.domain.OrderLine;
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
	
	private final MailController mailController;

	@Override
	public Admin adminLogin(String adminId, String adminPwd) {
		return adminRep.adminLogin(adminId, adminPwd);
	}

	@Override
	public RegisterGoods insertGoods(RegisterGoods registerGoods) {
		RegisterGoods dbregisterGoods = registerGoodsRep.save(registerGoods);

		return dbregisterGoods;
	}

	@Override
	public RegisterGoods updateGoodsDetail(RegisterGoods registerGoods) {

		RegisterGoods dbRegisterGoods = registerGoodsRep.findById(registerGoods.getRegNo()).orElse(null);
		if(dbRegisterGoods == null) {
			throw new RuntimeException();
		}
		
		dbRegisterGoods.setAd(registerGoods.getAd());
	
		dbRegisterGoods.setArea(registerGoods.getArea());
		dbRegisterGoods.setDetail(registerGoods.getDetail());
		dbRegisterGoods.setMainCategories(registerGoods.getMainCategories());
		dbRegisterGoods.setMethod(registerGoods.getMethod());
		dbRegisterGoods.setName(registerGoods.getName());
		dbRegisterGoods.setOptions(registerGoods.getOptions());
		dbRegisterGoods.setPrice(registerGoods.getPrice());
		dbRegisterGoods.setStock(registerGoods.getStock());
		dbRegisterGoods.setSubCategories(registerGoods.getSubCategories());
		dbRegisterGoods.setTitle(registerGoods.getTitle());
		
		if(registerGoods.getThumbnailImg() != null ) {
			System.out.println(3);
			dbRegisterGoods.setThumbnailImg(registerGoods.getThumbnailImg());
		}
		
		if(registerGoods.getAdImg() != null ) {
			System.out.println(4);
			dbRegisterGoods.setAdImg(registerGoods.getAdImg());
		}
		
		return dbRegisterGoods;
	}
	
	
	
	@Override
	public void insertNotice(Notice notice) {
		Notice dbNotice = noticeRep.save(notice);
		if (dbNotice == null) {
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
		if (dbNotice == null) {
			throw new RuntimeException("오류로 수정실패");
		}
		dbNotice.setTitle(notice.getTitle());
		dbNotice.setContent(notice.getContent());
	}

	@Override
	public void deleteNotice(Long noticeNo) {
		Notice dbNotice = noticeRep.findById(noticeNo).orElse(null);
		if (dbNotice == null) {
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

	/**
	 * 고객센터 - FAQ - 등록하기
	 */
	@Override
	public void insertFAQ(FAQ faq) {
		
		FAQ dbFAQ = FAQRep.save(faq);
		if(dbFAQ == null) {
			throw new RuntimeException("FAQ 등록에 실패하였습니다.");
		}
		
	}

	/**
	 * 고객센터 - FAQ - 수정하기
	 */
	@Override
	public void updateFAQ(FAQ faq) {

		FAQ dbFAQ = FAQRep.findById(faq.getFaqNo()).orElse(null);
		if(dbFAQ == null) {
			throw new RuntimeException("FAQ번호 오류로 수정 실패");
		}
		
		dbFAQ.setQuestion(faq.getQuestion());
		dbFAQ.setAnswer(faq.getAnswer());
	}

	/**
	 * 고객센터 - FAQ - 삭제하기
	 */
	@Override
	public void deleteFAQ(FAQ faq) {
		FAQ dbFaq = FAQRep.findById(faq.getFaqNo()).orElse(null);
		if (dbFaq == null) {
			throw new RuntimeException("FAQ번호 오류로 삭제 실패");
		}
		
		FAQRep.deleteById(faq.getFaqNo());
	}

	@Override
	public FAQ selectByFaq(Long faqNo) {

		return FAQRep.findById(faqNo).orElse(null);
	}

	@Override
	public List<RegisterGoods> selectGoods(int state) {
		List<RegisterGoods> list = null;

		if (state == 0) {
			list = registerGoodsRep.findAll();
		} else if (state == 1) {
			list = registerGoodsRep.findAD();
		} else if (state == 2) {
			list = registerGoodsRep.findStock();
		}

		return list;
	}

	@Override
	public int updateGoods(RegisterGoods registerGoods) {
		RegisterGoods dbregisterGoods = registerGoodsRep.findById(registerGoods.getRegNo()).orElse(null);

		int plusStock = registerGoods.getStock(); // 추가할 재고량
		int dbStock = dbregisterGoods.getStock(); // 기존 재고

		int stock = plusStock + dbStock;

		if (dbregisterGoods == null) {
			throw new RuntimeException("오류");
		} else {
			dbregisterGoods.setStock(stock);
		}

		return 0;
	}

	@Override
	public void deleteAdGoods(Long regNo) {
		RegisterGoods dbRegisterGoods = registerGoodsRep.findById(regNo).orElse(null);
		if (dbRegisterGoods == null) {
			throw new RuntimeException("오류");
		}
		dbRegisterGoods.setAd(0);
	}

	/**
	 * 주문조회(신규/지난 주문조회) + 신규 주문조회(배송준비중만 보임) parameter의 0(지난주문조회)/1(신규주문조회)구분 이 항목의
	 * 경우 페이징 써야할수도 있음
	 */
	@Override
	public List<Orders> selectOrders(int parameter) {
		List<Orders> orderList = null;

		// 0은 지난 주문조회 1은 신규주문조회
		if (parameter == 0) {
			orderList = ordersRep.selectLastOrders();

		} else if (parameter == 1) {
			orderList = ordersRep.selectNewOrders();
		} else {
			orderList = ordersRep.selectNowDelOrders();
		}

		return orderList;
	}

	/**
	 * 상품출고 Orders 테이블의 Del_state가 배송중으로 변경
	 */
	@Override
	public int updateDelState(Long orderNo) {
		Orders orders = ordersRep.findById(orderNo).orElse(null);
		if (orders == null) {
			throw new RuntimeException("주문정보를 확인할 수 없습니다.");
		}
		orders.setDelState("배송중");
		
		Long userNo=orders.getUserList().getUserNo();
		UserList userList = userListRep.findById(userNo).orElse(null);
		mailController.sendMail(userList.getEmail(),"안녕하세요 RPMALL 입니다.","고객님이 주문하신 상품이"+orders.getAddr()+"로 지금 배송시작 되었습니다");

		return 0;
	}

	/**
	 * 환불신청상품 조회 관리자가 모든 환불신청목록을 조회할 떄 사용됨
	 */
	@Override
	public List<Refund> selectRefundGoods() {

		List<Refund> refundList = refundRep.selectRefundAllNew();
		return refundList;
	}

	/**
	 * 환불신청상품 환불처리 (환불 승인, 환불 거절 - update refundtable -> refundstate를 변경) 0일 때 환불승인
	 * 1일 때 환불거절
	 * 
	 * 더 추가될 수도 있음 if(refundState == 0){ 환불상태 order 날리고 재고량 고치고 잔액 포인트 예치금
	 * 
	 * }else { 환불상태 변경 - 메세지도 입력 }
	 */
	@Override
	public int refundGoods(Long RefundNo, String refundReply, int refundState) {

		Refund dbRefund = refundRep.findById(RefundNo).orElse(null);
		if (dbRefund == null) {
			throw new RuntimeException("환불신청 정보가 없습니다.");
		} else {

			if (refundState == 0) {
				// 환불상태 - 환불승인으로 변경
				dbRefund.setRefundState("환불승인");
//				재고량 고치고
				List<OrderLine> dborderLineList = dbRefund.getOrders().getList();
				for (OrderLine ol : dborderLineList) {
					RegisterGoods dbRegisterGoods = registerGoodsRep.findByRegNo(ol.getRegisterGoods().getRegNo());
					dbRegisterGoods.setStock(dbRegisterGoods.getStock() + ol.getQuntity());
				}

				//////////////////////////////////////////
				Refund refund = refundRep.findById(RefundNo).orElse(null);
				Long orderNo = refund.getOrders().getOrderNo();
				Long userNo = refund.getOrders().getUserList().getUserNo();
				Long gradeNo = refund.getOrders().getUserList().getUsergrade().getGradeNo();
				int realPay = refund.getOrders().getRealpay();
				double point = 0;
				if (gradeNo == 1) {
					point = -0.02 * realPay;
				} else if (gradeNo == 2) {
					point = -0.05 * realPay;
				} else {
					point = -0.08 * realPay;
				}

				// 포인트 차감
				userListRep.addPoints((int) Math.round(point), userNo);

				// 주문테이블 주문상태 환불상품로 변경
				ordersRep.updateDeliveryState("환불상품", orderNo);

				// 등급 재조정
				List<Orders> dbo = ordersRep.selectRefundOrders(userNo);
				int totalPay = 0;
				for (Orders o : dbo) {
					totalPay += o.getRealpay();
				}
				UserList userList = userListRep.findById(userNo).orElse(null);
				String grade = userGradeRep.findGrade(totalPay);
				int afterGradeNo = userGradeRep.findGradeNo(grade);
				// System.out.println("grade "+grade);
				// System.out.println("userList.getUsergrade().getGrade() "+
				// userList.getUsergrade().getGrade());
				if (gradeNo != afterGradeNo) {
					userListRep.updateUserGrade((long) userGradeRep.findGradeNo(grade), userNo);
				}
				
				//환불승인 답변 메일 보내기
				mailController.sendMail(userList.getEmail(),"안녕하세요 RPMALL 환불신청 답변입니다.","환불이 승인 되었습니다 빠른시일내 제품 반송 부탁드립니다.");

			} else if (refundState == 1) {
				// 환불거절
				dbRefund.setRefundReply(refundReply);
				dbRefund.setRefundState("환불거절");
				
				//환불거절 답변 메일 보내기
				Refund refund = refundRep.findById(RefundNo).orElse(null);
				Long userNo = refund.getOrders().getUserList().getUserNo();
				UserList userList = userListRep.findById(userNo).orElse(null);
				mailController.sendMail(userList.getEmail(),"안녕하세요 RPMALL 환불신청 답변입니다."," 죄송합니다 환불이 불가합니다. \n 사유:"+refundReply);
				
			}
		}

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

	/**
	 * 상품문의내역 등록
	 */
	@Override
	public void insertGoodsAnswer(GoodsAnswer goodsAnswer) {
		goodsAnswerRep.save(goodsAnswer);
	}

	/**
	 * 상품문의내역 수정
	 */
	@Override
	public void updateGoodsAnswer(GoodsAnswer goodsAnswer) {

		GoodsAnswer dbGoodsAnswer = goodsAnswerRep.findById(goodsAnswer.getAgoodsNo()).orElse(null);
		if (dbGoodsAnswer == null) {
			throw new RuntimeException("상품문의 답변 번호에 해당하는 답변이 없습니다.");
		}

		dbGoodsAnswer.setContent(goodsAnswer.getContent());
	}

	/**
	 * 상품문의내역 삭제
	 */
	@Override
	public int deleteGoodsAnswer(Long agoodsNo) {
		System.out.println(1);
		goodsAnswerRep.deleteGoodsAnswerbyid(agoodsNo);

		System.out.println(2);
		return 0;
	}

	@Override
	public List<Review> selectReview() {

		List<Review> reviewList = reviewRep.findAll();

		return reviewList;
	}

	@Override
	public List<String> checkProfit(String startDate, String endDate) {

		List<String> profit = adminRep.groupByYearAndMonth(startDate, endDate);
		
		for(String s : profit) {
			System.out.println(s);
		}
		return profit;
	}

	@Override
	public UserList searchById(String userId) {
		return userListRep.findByIdUser(userId);
	}

	/**
	 * admin 마이페이지 회원조회
	 */
	@Override
	public List<UserList> searchAllUser(int state) {
		List<UserList> userList = null;

		if (state == 0) {
			userList = userListRep.selectAllUser();
		} else if (state == 1) {
			userList = userListRep.sortNoAllUser();
		} else if (state == 2) {
			userList = userListRep.sortIdAllUser();
		}

		return userList;
	}

	@Override
	public void updateGoodsAnswer(Long agoodsNo, String refundReply) {
		GoodsAnswer goodsAnswer=goodsAnswerRep.findById(agoodsNo).orElse(null);
		goodsAnswer.setContent(refundReply);
		goodsAnswerRep.save(goodsAnswer);
	}

}
