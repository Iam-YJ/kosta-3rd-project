package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import kosta.pro.rgmall.domain.GoodsQuestion;
import kosta.pro.rgmall.domain.UserList;

public interface GoodsQuestionRepository extends JpaRepository<GoodsQuestion, Long> {
	
	
	
	  @Query("select g from GoodsQuestion g where g.registerGoods.regNo=?1 order by g.regDate desc")
	  List<GoodsQuestion> selectGoodsQuestions(Long regNo);
	  
	  @Query("select g from GoodsQuestion g where g.userList.userNo=?1")
	  List<GoodsQuestion> selectGoodsQuestionsByUserNo(Long userNo);
	 
	  @Modifying
	  @Transactional 
	  @Query("update GoodsQuestion g set g.content=?1 where qgoodsNo=?2")
	  int updateGoodsQuestion(String content, Long qgoodsNo);
	  

	 
	 
	

}//class
