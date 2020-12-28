package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Cart;
import kosta.pro.rgmall.domain.Review;

public interface CartRepository extends JpaRepository<Cart, Long> {
	List<Cart> findByUserListUserNo(Long userNo);
	
	//카트 중복여부 확인
	@Query("select cart from Cart cart where cart.userList.userNo = ?1 and cart.registerGoods.regNo =?2")
	Cart findCartByUserAndRegisterGoods(Long userNo, Long regNo);
	
}// class
