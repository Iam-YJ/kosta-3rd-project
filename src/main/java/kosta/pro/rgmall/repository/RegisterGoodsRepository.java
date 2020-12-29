package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

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

	@Query("select registerGoods from RegisterGoods registerGoods order by registerGoods.price asc")
	List<RegisterGoods>findAllOrderByPrice();
	
	@Query("select registerGoods from RegisterGoods registerGoods order by registerGoods.sellcount desc")
	List<RegisterGoods>findAllOrderBySell();
	
	@Query("select registerGoods from RegisterGoods registerGoods order by registerGoods.regDate desc")
	List<RegisterGoods>findAllOrderByRegDate();
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 order by registerGoods.price asc")
	List<RegisterGoods> findAllWithMainOrderByPrice(Long mainCategoryNo);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 order by registerGoods.sellcount desc")
	List<RegisterGoods> findAllWithMainOrderBySell(Long mainCategoryNo);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 order by registerGoods.regDate desc")
	List<RegisterGoods> findAllWithMainOrderByRegDate(Long mainCategoryNo);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 and registerGoods.subCategories.subCategoryNo = ?2"
			+ " order by registerGoods.price asc")
	List<RegisterGoods> findAllWithMainAndSubOrderByPrice(Long mainCategoryNo, Long subCategoryNo);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 and registerGoods.subCategories.subCategoryNo = ?2"
			+ " order by registerGoods.sellcount desc")
	List<RegisterGoods> findAllWithMainAndSubOrderBySell(Long mainCategoryNo, Long subCategoryNo);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.mainCategories.mainCategoryNo = ?1 and registerGoods.subCategories.subCategoryNo = ?2"
			+ " order by registerGoods.regDate desc")
	List<RegisterGoods> findAllWithMainAndSubOrderByRegDate(Long mainCategoryNo, Long subCategoryNo);
	
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.title like concat('%',:keyword,'%')")
	List<RegisterGoods> searchGoods(@Param("keyword") String keyword);
	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.ad=1")
	List<RegisterGoods> findAD();

	@Query("select registerGoods from RegisterGoods registerGoods where registerGoods.stock>=0 order by registerGoods.stock")
	List<RegisterGoods> findStock();
}//class
