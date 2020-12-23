package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import kosta.pro.rgmall.domain.GoodsAnswer;

public interface GoodsAnswerRepository extends JpaRepository<GoodsAnswer, Long> { 
	
	

	
	  @Query("select g from GoodsAnswer g where goodsQuestion.qgoodsNo=?1") 
	  List<GoodsAnswer> selectGoodsAnswer(Long qgoodsNo);

	  @Modifying
	  @Transactional 
	  @Query("update GoodsAnswer g set g.content=?1 where goodsQuestion.qgoodsNo=?2")
	  int updateGoodsAnswer(String content, Long qgoodsNo);
	  
	  @Modifying
	  @Transactional 
	  @Query("delete from GoodsAnswer g where goodsQuestion.qgoodsNo=?1")
	  int deleteGoodsAnswer(Long qgoodsNo);
	 
	
}//class
