package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.UserList;

public interface UserListRepository extends JpaRepository<UserList, Long> {

	List<UserList> findByUserId(String userid);
	
	@Query("select u from UserList u where u.userId=?1 and u.passWord=?2")
	UserList login(String userId, String userPwd);
	
	@Query("select u from UserList u where u.name=?1 and u.phone=?2 and u.email=?3")
	UserList findUserId(String name, String phone, String email);
	
	/**
	 * 카카오API 로그인시 나머지 정보 업데이트 위함
	 */
	@Query("update UserList u set u.name = ?1, u.userId=?2, u.passWord=?3,u.addr=?4, u.phone=?5  where u.email = ?6")
	@Modifying // dml 시에 없으면 안된다
	void updateUserKakao(String name, String userId, String passWord, String addr, String phone, String email);



}// class
