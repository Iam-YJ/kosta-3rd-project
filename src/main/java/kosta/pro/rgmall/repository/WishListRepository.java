package kosta.pro.rgmall.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.pro.rgmall.domain.WishList;

public interface WishListRepository extends JpaRepository<WishList, Long> {
	 List<WishList> findByUserListUserNo(Long userNo);

}//class
