package kosta.pro.rgmall.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kosta.pro.rgmall.domain.UserList;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserDAOImpl implements UserDAO {
	private final SqlSession session;
	// private final SqlSessionTemplate session;

}// class
