package kosta.pro.rgmall.service;

import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.pro.rgmall.controller.MailController;
import kosta.pro.rgmall.domain.Orders;
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
@RequiredArgsConstructor
@Transactional
public class DeliveryServiceImpl implements DeliveryService {

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
	
	/**
	 * 배송조회
	 * delstate가 '배송중'인 상품을 검색하여 List를 출력한다.
	 */
	@Override
	public List<Orders> selectAllDelivery() {
		List<Orders> ordersList = ordersRep.selectNowDelOrders();
		return ordersList;
	}

	/**
	 * 배송상태변경
	 */
	@Override
	public int updateDeliveryState(Long orderNo) {
		//주문상태 변경
		Orders dbOrders = ordersRep.findById(orderNo).orElse(null);
		if(dbOrders==null) {
			throw new RuntimeException("OrderNo오류로 배송완료 실패");
		}
		dbOrders.setDelState("배송완료");
		
		//유저 포인트 적립
		Long userNo=dbOrders.getUserList().getUserNo();
		Long gradeNo=dbOrders.getUserList().getUsergrade().getGradeNo();
		double point=0;
		if(gradeNo==1) {
			point=0.002 * dbOrders.getRealpay();
		}else if(gradeNo==2) {
			point=0.005 * dbOrders.getRealpay();
		}else {
			point=0.008 * dbOrders.getRealpay();
		}
		
		userListRep.addPoints((int)Math.round(point),userNo);
		
		
		//누적금액에 따른 자동 등업
		List<Orders> dbOrderList=ordersRep.findByUserListUserNo(userNo);
		int totalPay=0;
		for(Orders o : dbOrderList) {
			totalPay +=o.getRealpay();   
		}
		//System.out.println("totalPay                         " +totalPay);
		UserList userList =userListRep.findById(userNo).orElse(null);
		String grade=userGradeRep.findGrade(totalPay);
		//System.out.println("grade                      "+grade);
		//System.out.println("userList.getUsergrade().getGrade()           "+ userList.getUsergrade().getGrade());
		if(!userList.getUsergrade().getGrade().equals(grade)){
			userListRep.updateUserGrade((long)userGradeRep.findGradeNo(grade),userNo);
		}
		
		mailController.sendMail(userList.getEmail(),"안녕하세요 RPMALL 입니다.","고객님이 주문하신 상품이 배송완료 되었습니다");
		
		return 0;
	}

}
