package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import kosta.pro.rgmall.domain.Donation;
import kosta.pro.rgmall.domain.UserList;

public interface UserListRepository extends JpaRepository<UserList, Long> {

	List<UserList> findByUserId(String userid);

	// 로그인
	@Query("select u from UserList u where u.userId=?1 and u.passWord=?2")
	UserList login(String userId, String userPwd);

	// 아이디찾기
	@Query("select u from UserList u where u.name=?1 and u.phone=?2 and u.email=?3")
	UserList findUserId(String name, String phone, String email);

	// 비밀번호찾기
	@Query("select u from UserList u where u.userId=?1 and u.name=?2 and u.phone=?3 and u.email=?4")
	UserList findUserPwd(String userId, String name, String phone, String email);

	// 비밀번호변경하기
	@Query("update UserList u set u.passWord=?1 where u.userNo=?2")
	@Modifying
	int updatePassWord(String passWord, Long userNo);

	@Query("select u from UserList u where u.userId=?1")
	UserList selectPointandGrade(String userId);

	// 회원 email로 회원정보 조회
	@Query("select u from UserList u where u.email=?1")
	List<UserList> findUserEmail(String email);

	// 카카오API 회원가입시 버그 수정 위함
	@Modifying
	@Transactional
	@Query("delete from UserList u where u.name=?1")
	void deleteByName(String name);

	/**
	 * 카카오API 로그인시 나머지 정보 업데이트 위함
	 */
	@Query("update UserList u set u.name = ?1, u.userId=?2, u.passWord=?3,u.addr=?4, u.phone=?5  where u.email = ?6")
	@Modifying // dml 시에 없으면 안된다
	void updateUserKakao(String name, String userId, String passWord, String addr, String phone, String email);

	// 개인정보수정
	@Query("update UserList u set u.passWord=?1,  u.addr=?2,  u.phone=?3,  u.email=?4 where u.userNo = ?5")
	@Modifying
	int updateUserList(String passWord, String addr, String phone, String email, Long userNo);
	
	//등급별 정렬
	@Query("select  u from UserList u order by u.usergrade.gradeNo desc")
	List<UserList> selectAllUser();
	
	//유저번호순 정렬
	@Query("select u from UserList u order by u.userNo desc")
	List<UserList> sortNoAllUser();
	
	//아이디 A-Z 정렬
	@Query("select u from UserList u order by u.userId desc")
	List<UserList> sortIdAllUser();

	@Query("select u from UserList u where u.userId=?1")
	UserList findByIdUser(String userId); 
	
	@Query("update UserList u set u.points= u.points+?1 where u.userNo=?2")
	@Modifying
	void addPoints(int point,Long userNo);

	@Query("update UserList u set u.usergrade.gradeNo=?1 where u.userNo = ?2")
	@Modifying
	void updateUserGrade(Long findGradeNo, Long userNo);
	
	  
	 
	 
}// class
