package kosta.pro.rgmall.service;

import java.util.List;

import kosta.pro.rgmall.domain.Orders;

public interface DeliveryService {

	/**
	 * 배송조회
	 */
	public List<Orders> selectAllDelivery();
	
	/**
	 * 배송상태변경
	 */
	public int updateDeliveryState(Long orderNo);
	
	
}
