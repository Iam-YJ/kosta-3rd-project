package kosta.pro.rgmall.dao;

import java.util.List;

import kosta.pro.rgmall.domain.RegisterGoods;

public interface MainDAO {

	public List<RegisterGoods> selectAllGoods(int mainCategoryNo, int subCategoryNo, int sortNo);
	
}
