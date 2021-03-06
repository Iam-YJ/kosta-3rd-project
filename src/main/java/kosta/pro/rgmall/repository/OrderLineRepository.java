package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.pro.rgmall.domain.OrderLine;

public interface OrderLineRepository extends JpaRepository<OrderLine, Long> {
	
	List<OrderLine> findByOrdersOrderNo(Long orderNo);

}//class
