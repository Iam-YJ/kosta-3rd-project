package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Cart;

public interface CartRepository extends JpaRepository<Cart, Long> {
	List<Cart> findByUserListUserNo(Long userNo);
	
	Cart findByRegisterGoodsRegNo(Long regNo);
	
	@Query("update Cart c set c.quantity=c.quantity+1 where c.registerGoods.regNo=?1")
	@Modifying
	void updateCart(Long regNo);
}// class
