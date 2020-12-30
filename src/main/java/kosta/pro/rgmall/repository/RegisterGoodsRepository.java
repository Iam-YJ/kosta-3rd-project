package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import kosta.pro.rgmall.domain.RegisterGoods;

public interface RegisterGoodsRepository extends JpaRepository<RegisterGoods, Long> {

	
	/**
	 * 검색(글번호 or 제목)
	 */
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1")
	Page<RegisterGoods> findAllWithMain(Long mainCategoryNo,Pageable pageable);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 and registerGoods.subCategories.subCategoryNo = ?2")
	Page<RegisterGoods> findAllWithMainAndSub(Long mainCategoryNo, Long subCategoryNo,Pageable pageable);
	
	RegisterGoods findByRegNo(Long regNo);

	@Query("select registerGoods from RegisterGoods registerGoods order by registerGoods.price asc")
	Page<RegisterGoods>findAllOrderByPrice(Pageable pageable);
	
	@Query("select registerGoods from RegisterGoods registerGoods order by registerGoods.sellcount desc")
	Page<RegisterGoods>findAllOrderBySell(Pageable pageable);
	
	@Query("select registerGoods from RegisterGoods registerGoods order by registerGoods.regDate desc")
	Page<RegisterGoods>findAllOrderByRegDate(Pageable pageable);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 order by registerGoods.price asc")
	Page<RegisterGoods> findAllWithMainOrderByPrice(Long mainCategoryNo,Pageable pageable);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 order by registerGoods.sellcount desc")
	Page<RegisterGoods> findAllWithMainOrderBySell(Long mainCategoryNo,Pageable pageable);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 order by registerGoods.regDate desc")
	Page<RegisterGoods> findAllWithMainOrderByRegDate(Long mainCategoryNo,Pageable pageable);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 and registerGoods.subCategories.subCategoryNo = ?2"
			+ " order by registerGoods.price asc")
	Page<RegisterGoods> findAllWithMainAndSubOrderByPrice(Long mainCategoryNo, Long subCategoryNo,Pageable pageable);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 and registerGoods.subCategories.subCategoryNo = ?2"
			+ " order by registerGoods.sellcount desc")
	Page<RegisterGoods> findAllWithMainAndSubOrderBySell(Long mainCategoryNo, Long subCategoryNo,Pageable pageable);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 and registerGoods.subCategories.subCategoryNo = ?2"
			+ " order by registerGoods.regDate desc")
	Page<RegisterGoods> findAllWithMainAndSubOrderByRegDate(Long mainCategoryNo, Long subCategoryNo,Pageable pageable);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.title like concat('%',:keyword,'%')")
	Page<RegisterGoods> searchGoods(@Param("keyword") String keyword,Pageable pageable);
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.ad=1")
	List<RegisterGoods> findAD();

	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.stock>=0 order by registerGoods.stock")
	List<RegisterGoods> findStock();
}//class
