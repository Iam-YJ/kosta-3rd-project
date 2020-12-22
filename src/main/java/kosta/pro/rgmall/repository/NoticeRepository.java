package kosta.pro.rgmall.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Notice;

public interface NoticeRepository extends JpaRepository<Notice, Long> {

	/**
	 * 조회수 증가 시키는 기능
	 */
//	@Query("update Notice b set b.readnum = b.readnum+1 where b.noticeNo=?1")
//	@Modifying
//	void readnumUpdate(Long noticeNo);

}//class
