package kosta.pro.rgmall.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.UserGrade;

public interface UserGradeRepository extends JpaRepository<UserGrade, Long> {
	
	@Query("select usergrade.grade from UserGrade usergrade where ?1 between lowPrice and highPrice")
	String findGrade(int totalPay);

	@Query("select usergrade.gradeNo from UserGrade usergrade where usergrade.grade=?1 ")
	int findGradeNo(String grade);
	
	 
}//class
