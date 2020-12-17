package kosta.pro.rgmall.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.pro.rgmall.domain.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Long> {

}//class
