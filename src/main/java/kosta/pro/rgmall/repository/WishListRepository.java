package kosta.pro.rgmall.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.WishList;

public interface WishListRepository extends JpaRepository<WishList, Long> {
	 List<WishList> findByUserListUserNo(Long userNo);
	 
	 WishList findByRegisterGoodsRegNo(Long RegNo);
	 
	 @Query("delete from WishList wishList where wishList.userList.userNo = ?1")
	 @Modifying
	 void deleteWishListByUserNo(Long userNo);

}//class
