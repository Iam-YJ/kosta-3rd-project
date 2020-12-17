package kosta.pro.rgmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AdminDAOImpl implements AdminDAO {
	private final SqlSession session;
	//private final SqlSessionTemplate session;
	
}// class
