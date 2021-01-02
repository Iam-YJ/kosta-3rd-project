package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Long> {

	//회원이 주문한 주문목록  모든 조회하기
	@Query("select orders from Orders orders where orders.userList.userNo =?1 and not orders.delState = '환불상품' order by orders.orderdate desc")
	List<Orders> selectOrdersByUserNo(Long userNo);
	
	//관리자가 신규주문목록을 확인할 수 있음. 배송상태로 확인
	@Query("select orders from Orders orders where orders.delState = '배송준비중'  order by orders.orderdate asc")
	List<Orders> selectNewOrders();
	
	//관리자가 배송중인 목록을 확인할 수 있음.
	@Query("select orders from Orders orders where orders.delState = '배송중' order by orders.orderdate asc")
	List<Orders> selectNowDelOrders();
	
	//관리자가 이전주문내역을 확인할 수 있음. 배송상태로 확인
	@Query("select orders from Orders orders where orders.delState = '배송완료' order by orders.orderdate asc")
	List<Orders> selectLastOrders();
	
	//주문번호로 유저 등급가져오기
	@Query("select orders from Orders orders where orders.orderNo=?1 ")  
	Orders selectOrders(Long orderNo); 
	
	//유저번호로 주문목록 가져오기
	List<Orders>findByUserListUserNo(Long userNo);

	//환불승인 시 주문상태 환불상품으로 변경
	@Query("update Orders o set o.delState=?1 where o.orderNo=?2")
	@Modifying
	void updateDeliveryState(String string,Long orderNo );
	
	//해당 유저의 환불상품 가져오기
	@Query("select o from Orders o where o.delState = '환불상품' and o.userList.userNo=?1")
	List<Orders> selectRefundOrders(Long userNo);	
	
	@Query(value = "select sum(realpay) from orders where user_No=?1 and del_state='배송완료'",nativeQuery = true)
	Integer selectUserPay(Long userNo);
	
}//class
