package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Admin;
import kosta.pro.rgmall.domain.Orders;
import kosta.pro.rgmall.domain.RegisterGoods;

public interface AdminRepository extends JpaRepository<Admin, Long> {
	//관리자 로그인
	@Query("select a from Admin a where a.adminId=?1 and a.password=?2")
	Admin adminLogin(String adminId, String password);
	
	//총매출
	@Query("select sum(o.realpay) from Orders o")
	int checkProfits();
	
	//일매출
	//@Query("select sum(o.realpay) from Orders o where=o.Orderdate=?1")
	//List<Orders> checkDayProfit(String orderdate);
}// class
