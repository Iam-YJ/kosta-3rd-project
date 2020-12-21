package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.RegisterGoods;

public interface RegisterGoodsRepository extends JpaRepository<RegisterGoods, Long> {

	
	/**
	 * 검색(글번호 or 제목)
	 */
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1")
	List<RegisterGoods> findAllWithMain(Long mainCategoryNo);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 and registerGoods.subCategories.subCategoryNo = ?2")
	List<RegisterGoods> findAllWithMainAndSub(Long mainCategoryNo, Long subCategoryNo);
	
	RegisterGoods findByRegNo(Long regNo);
}//class
