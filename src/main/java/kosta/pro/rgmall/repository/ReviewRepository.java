package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Review;

public interface ReviewRepository extends JpaRepository<Review, Long> {
	//상품별 후기 보기
	@Query("select r from Review r where r.registerGoods.regNo=?1")
	List<Review> selectReivew(Long regNo);
	
	//userNo별 후기 보기
	@Query("select r from Review r where r.userList.userNo=?1")
	List<Review> selectReviewByUserNo(Long userNo);
}//class
