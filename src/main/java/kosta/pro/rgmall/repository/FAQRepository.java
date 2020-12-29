package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import kosta.pro.rgmall.domain.FAQ;

public interface FAQRepository extends JpaRepository<FAQ, Long> {
	
	
	//FAQ 검색
	@Query("select f from FAQ f where f.question like concat('%',:word,'%')")
	List<FAQ> findFAQByWord(@Param("word") String word);
	
}//class
