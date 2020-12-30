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
	
	@Query("update Cart c set c.quantity=c.quantity+?1 where c.registerGoods.regNo=?2")
	@Modifying
	void updateCart2(int qua,Long regNo);
	
	//카트 중복여부 확인
	@Query("select cart from Cart cart where cart.userList.userNo = ?1 and cart.registerGoods.regNo =?2")
	Cart findCartByUserAndRegisterGoods(Long userNo, Long regNo);
	
	
}// class
