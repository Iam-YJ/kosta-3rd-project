package kosta.pro.rgmall.service;

import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	
	@Override
	public List<Orders> selectAllDelivery() {
		List<Orders> listOrders = ordersRep.selectNewOrders();
		return listOrders;
	}

	@Override
	public int updateDeliveryState(Long orderNo) {
		//주문상태 변경
		ordersRep.updateDeliveryState(orderNo);
		
		
		//유저 포인트 적립
		Orders orders= ordersRep.selectOrders(orderNo);
		Long userNo=orders.getUserList().getUserNo();
		Long gradeNo=orders.getUserList().getUsergrade().getGradeNo();
		double point=0;
		if(gradeNo==1) {
			point=0.02*orders.getRealpay();
		}else if(gradeNo==2) {
			point=0.05*orders.getRealpay();
		}else {
			point=0.08*orders.getRealpay();
		}
		System.out.println("point======================"+Math.round(point));
		userListRep.addPoints((int)Math.round(point),userNo);
		
		
		//누적금액에 따른 자동 등업
		List<Orders> dbOrders=ordersRep.findByUserListUserNo(userNo);
		int totalPay=0;
		for(Orders o : dbOrders) {
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
		
		return 0;
	}

}
