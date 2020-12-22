package kosta.pro.rgmall.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long> {
	//관리자 로그인
	@Query("select a from Admin a where a.adminId=?1 and a.password=?2")
	Admin adminLogin(String adminId, String password);
}// class
