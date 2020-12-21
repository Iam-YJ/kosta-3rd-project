package kosta.pro.rgmall.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.MainCategories;

public interface MainCategoriesRepository extends JpaRepository<MainCategories, Long> {
	
	//메인카테고리수정하기
	@Query("update MainCategories m set m.mainCategoryName=?1 where m.mainCategoryNo=?2")
	@Modifying
	int updateMainCategory(String mainCategoryName, Long mainCategoryNo);
}//class
