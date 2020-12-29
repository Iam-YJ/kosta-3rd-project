package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Refund;

public interface RefundRepository extends JpaRepository<Refund, Long> {

	//Admin 모든 신규 환불신청 항목 검색(날짜순)
	@Query("select refund from Refund refund where refund.refundState = '환불처리대기' order by refund.refundDate asc") 
	List<Refund> selectRefundAllNew();
	
	//환불신청을 하기위해 중복여부 체크
	@Query("select refund from Refund refund where refund.orders.orderNo =?1")
	Refund selectRefundByOrderNo(Long orderNo);
	
	//UserNo에 해당하는 모든 Refund 출력
	@Query("select refund from Refund refund where refund.userList.userNo =?1 order by refund.refundDate desc")
	List<Refund> selectRefundByUserNo(Long userNo);
	
}// class
