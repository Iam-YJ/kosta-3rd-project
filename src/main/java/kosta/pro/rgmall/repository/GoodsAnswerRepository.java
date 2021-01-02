package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.GoodsAnswer;

public interface GoodsAnswerRepository extends JpaRepository<GoodsAnswer, Long> { 
	
	
	  @Query("select g from GoodsAnswer g where g.goodsQuestion.qgoodsNo=?1") 
	  List<GoodsAnswer> selectGoodsAnswer(Long qgoodsNo);

	 
	  @Query("update GoodsAnswer g set g.content=?1 where g.goodsQuestion.qgoodsNo=?2")
	  @Modifying
	  int updateGoodsAnswer(String content, Long qgoodsNo);
	  
	  @Query("delete from GoodsAnswer g where g.goodsQuestion.qgoodsNo=?1")
	  @Modifying
	  int deleteGoodsAnswer(Long qgoodsNo);
	 
	  @Query("delete from GoodsAnswer g where g.agoodsNo = ?1")
	  @Modifying
	  int deleteGoodsAnswerbyid(Long agoodsNo);
}//class
