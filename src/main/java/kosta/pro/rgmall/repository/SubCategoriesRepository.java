package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.SubCategories;

public interface SubCategoriesRepository extends JpaRepository<SubCategories, Long> {
	
	//서브카테고리 수정하기
	@Query("update SubCategories s set s.subCategoryName=?1 where s.subCategoryNo=?2")
	@Modifying
	int updateMainCategory(String subCategoryName, Long subCategoryNo);
	
//	@Query("select s from SubCategories s where b.mainCategory m =?1 ") 
//	List<SubCategories> selectSubCategories(Long no);
	
	
	List<SubCategories> findByMainCategoryMainCategoryNo(Long no);

}//class
