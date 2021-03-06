package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.Review;

public interface ReviewRepository extends JpaRepository<Review, Long> {
	//상품별 후기 보기
	@Query("select r from Review r where r.registerGoods.regNo=?1")
	List<Review> selectReivew(Long regNo);
	
	//userNo별 후기 보기
	@Query("select r from Review r where r.userList.userNo=?1 order by r.regDate desc")
	List<Review> selectReviewByUserNo(Long userNo);
	
	//업데이트하기
	@Query("update Review r set r.content=?1 where r.reviewNo=?2")
	@Modifying
	int updateReview(String content,Long reviewNo);
	
	//삭제하기
	@Query("delete Review r where r.reviewNo=?1")
	@Modifying
	int deleteReview(Long reviewNo);
	
	//Header 최신 리뷰순
	@Query("select review from Review review order by review.regDate desc")
	List<Review> reviewMain();
	
}//class
