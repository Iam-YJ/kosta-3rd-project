package kosta.pro.rgmall.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.pro.rgmall.domain.RegisterGoods;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MainDAOImpl implements MainDAO {
	private final SqlSession session;
	//private final SqlSessionTemplate session;

	
	public List<RegisterGoods> selectAllGoods(int mainCategoryNo, int subCategoryNo, int sortNo){
		
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		
//		map.put("mainCategoryNo", mainCategoryNo);
//		map.put("subCategoryNo", subCategoryNo);
//		map.put("sortNo", sortNo);
//		
//		List<RegisterGoods> list = session.selectList("mainMapper.selectAllGoods");
//		
//		System.out.println(list);
//		
		return null;
	}
	
	
}// class
