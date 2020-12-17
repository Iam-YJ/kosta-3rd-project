package kosta.pro.rgmall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ManiDAOImpl implements MainDAO {
	private final SqlSession session;
	// private final SqlSessionTemplate session;

}// class
