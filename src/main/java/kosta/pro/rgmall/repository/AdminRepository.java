package kosta.pro.rgmall.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long> {
	//관리자 로그인
	@Query("select a from Admin a where a.adminId=?1 and a.password=?2")
	Admin adminLogin(String adminId, String password);
	
	@Query("select sum(o.orderdate) from Orders o")
	int checkProfits();
	
	//일매출
	//@Query("select sum(o.realpay) from Orders o where=o.Orderdate=?1")
	//List<Orders> checkDayProfit(String orderdate);
	
	//년 - 월 그룹지어 매출액 가져오기
		@Query("select cast(to_char(o.orderdate, 'YYYY-MM-DD') as date), sum(o.realpay) from Orders o \r\n" + 
				"where (o.orderdate>='2021-01-01' and o.orderdate<'2021-12-31') \r\n" + 
				"group by to_char(o.orderdate, 'YYYY-MM-DD') order by cast(to_char(o.orderdate, 'YYYY-MM-DD') as date) ")
		List<String> groupByYearAndMonth(String startDate, String endDate);
}// class
