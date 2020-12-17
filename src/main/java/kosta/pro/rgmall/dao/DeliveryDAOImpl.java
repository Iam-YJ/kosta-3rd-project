package kosta.pro.rgmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DeliveryDAOImpl implements DeliveryDAO {
	private final SqlSession session;
	// private final SqlSessionTemplate session;
	
}// class
