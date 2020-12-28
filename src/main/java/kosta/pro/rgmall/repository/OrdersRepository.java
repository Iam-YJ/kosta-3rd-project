package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Long> {

	//회원이 주문한 주문목록  모든 조회하기
	@Query("select orders from Orders orders where orders.userList.userNo =?1 order by orders.orderdate desc")
	List<Orders> selectOrdersByUserNo(Long userNo);
	
	//관리자가 신규주문목록을 확인할 수 있음. 배송상태로 확인
	@Query("select orders from Orders orders where orders.delState = '배송준비중' order by orders.orderdate asc")
	List<Orders> selectNewOrders();
	
}//class
