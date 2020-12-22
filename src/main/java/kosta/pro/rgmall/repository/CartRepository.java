package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.pro.rgmall.domain.Cart;

public interface CartRepository extends JpaRepository<Cart, Long> {
	List<Cart> findByUserListUserNo(Long userNo);
}// class
