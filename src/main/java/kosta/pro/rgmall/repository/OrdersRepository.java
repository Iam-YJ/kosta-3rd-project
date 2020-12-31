package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Long> {

	//회원이 주문한 주문목록  모든 조회하기
	@Query("select orders from Orders orders where orders.userList.userNo =?1 order by orders.orderdate desc")
	List<Orders> selectOrdersByUserNo(Long userNo);
	
	//관리자가 신규주문목록을 확인할 수 있음. 배송상태로 확인
	@Query("select orders from Orders orders where orders.delState = '배송준비중' order by orders.orderdate asc")
	List<Orders> selectNewOrders();
	
	//관리자가 배송중인 목록을 확인할 수 있음.
	@Query("select orders from Orders orders where orders.delState = '배송중' order by orders.orderdate asc")
	List<Orders> selectNowDelOrders();
	
	//관리자가 이전주문내역을 확인할 수 있음. 배송상태로 확인
	@Query("select orders from Orders orders where orders.delState = '배송완료' order by orders.orderdate asc")
	List<Orders> selectLastOrders();
		
	
	//딜리버리맨 배송완료하기
	@Query("update Orders o set o.delState='배송완료' where o.orderNo=?1")
	@Modifying
	int updateDeliveryState(Long orderNo);
	
}//class
