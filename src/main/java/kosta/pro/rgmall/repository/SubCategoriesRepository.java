package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.SubCategories;

public interface SubCategoriesRepository extends JpaRepository<SubCategories, Long> {
	
	
	
//	@Query("select s from SubCategories s where b.mainCategory m =?1 ") 
//	List<SubCategories> selectSubCategories(Long no);
	
	
	List<SubCategories> findByMainCategoryMainCategoryNo(Long no);

}//class
