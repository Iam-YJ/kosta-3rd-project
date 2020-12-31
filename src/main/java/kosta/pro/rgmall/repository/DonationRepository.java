package kosta.pro.rgmall.repository;




import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Donation;

public interface DonationRepository extends JpaRepository<Donation, Long> {
	
	Donation findByUserListUserNo(Long userNo);
	
	@Query("update Donation d set  d.donaPoint= d.donaPoint+?1 where d.userList.userNo=?2")
	@Modifying
	public void updateDonation( int dona, Long userNo);
	
	@Query("select d from Donation d order by d.donaPoint desc")
	List<Donation> selectDonaList();


}//class
